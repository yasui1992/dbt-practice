.PHONY: build-dbt build-duckdb run-dbt-debug run-duckdb run-el up-dbt-debug up-duckdb up-el


build-dbt:
	@docker build \
	--platform linux/x86_64 \
	--target dbt-final \
	-t dbt-practice-dbt \
	.

build-duckdb:
	@docker build \
	--platform linux/x86_64 \
	--target duckdb-final \
	-t dbt-practice-duckdb \
	.

run-dbt-debug:
	@docker run \
	--name dbt-practice-dbt \
	--rm \
	dbt-practice-dbt \
	debug

run-duckdb:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/dbt/data \
	-it \
	dbt-practice-duckdb

run-el:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/dbt/data \
	-i \
	dbt-practice-duckdb \
	-c ".read el/tpch_sf1.sql"

up-dbt-debug: build-dbt run-dbt-debug
up-duckdb: build-duckdb run-duckdb
up-el: build-duckdb run-el
