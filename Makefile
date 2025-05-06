build-app:
	@docker build \
	--platform linux/x86_64 \
	--target app-final \
	-t dbt-practice-app \
	.


build-app-docs:
	@docker build \
	--platform linux/x86_64 \
	--target app-docs-final \
	-t dbt-practice-app-docs \
	.


build-duckdb:
	@docker build \
	--platform linux/x86_64 \
	--target duckdb-final \
	-t dbt-practice-duckdb \
	.


run-app:
	@docker run \
	--name dbt-practice-app \
	--rm \
	dbt-practice-app


run-app-docs:
	@docker run \
	--name dbt-practice-app-docs \
	--rm \
	-p 8000:8000 \
	-d \
	dbt-practice-app-docs


run-duckdb:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./db:/app/db \
	-it \
	dbt-practice-duckdb


run-el:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./db:/app/db \
	-i \
	dbt-practice-duckdb \
	duckdb -c ".read el/tpch_sf1.sql"

up-app: build-app run-app
up-app-docs: build-app-docs run-app-docs
up-duckdb: build-duckdb run-duckdb
up-el: build-duckdb run-el
