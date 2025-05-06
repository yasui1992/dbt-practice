build-app:
	@docker build \
	--platform linux/x86_64 \
	--target app-final \
	-t dbt-practice-app \
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


run-duckdb:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/app/data \
	-it \
	dbt-practice-duckdb


run-el:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/app/data \
	-i \
	dbt-practice-duckdb \
	duckdb -c ".read el/tpch_sf1.sql"

up-app: build-app run-app
up-duckdb: build-duckdb run-duckdb
up-el: build-duckdb run-el
