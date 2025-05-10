FROM python:3.12-slim AS python-base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_SYSTEM_PYTHON=true \
    UV_PROJECT_ENVIRONMENT=/app/.venv/ \
    UV_CACHE_DIR=/tmp/.cache/uv \
    PATH=/app/.venv/bin:/opt/duckdb/bin:${PATH}


FROM python-base AS python-nonroot
ARG USERNAME=nonroot
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${USERNAME} \
 && useradd -ms /bin/sh -u ${UID} -g ${GID} ${USERNAME}
USER ${USERNAME}


FROM python-base AS duckdb-builder
ARG DUCKDB_VERSION=1.2.2

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update \
 && apt-get install -y --no-install-recommends \
    curl

RUN mkdir -p /opt/duckdb/bin \
 && DUCKDB_CLI_DIST_URL="https://github.com/duckdb/duckdb/releases/download/v${DUCKDB_VERSION}/duckdb_cli-linux-amd64.gz" \
 && curl -L ${DUCKDB_CLI_DIST_URL} | zcat > /opt/duckdb/bin/duckdb \
 && chmod +x /opt/duckdb/bin/duckdb


FROM python-base AS app-builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Require Git for dbt operations
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update \
 && apt-get install -y --no-install-recommends \
    git

RUN --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=cache,target=${UV_CACHE_DIR},sharing=locked \
    uv sync --frozen

COPY . /app


FROM python-nonroot AS dbt-final
COPY --from=app-builder /usr/bin/git /usr/bin/git
COPY --from=app-builder /usr/bin/uv /usr/bin/uvx /usr/bin/
COPY --from=app-builder --chown=${UID}:${GID} /app /app

WORKDIR /app/dbt
ENTRYPOINT [ "dbt" ]


FROM python-nonroot AS duckdb-final
COPY --from=duckdb-builder /opt/duckdb /opt/duckdb
COPY --from=app-builder --chown=${UID}:${GID} /app /app

WORKDIR /app
ENTRYPOINT [ "duckdb" ]
