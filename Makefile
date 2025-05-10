.PHONY: \
	build-dbt \
	build-duckdb \
	run-dbt-debug \
	run-duckdb-cli \
	run-duckdb-el \
	up-dbt-debug \
	up-duckdb-cli \
	up-duckdb-el


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

run-duckdb-cli:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/dbt/data \
	-it \
	dbt-practice-duckdb

run-duckdb-el:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/dbt/data \
	-i \
	dbt-practice-duckdb \
	-c ".read el/tpch_sf1.sql"

up-dbt-debug: build-dbt run-dbt-debug
up-duckdb-cli: build-duckdb run-duckdb-cli
up-duckdb-el: build-duckdb run-duckdb-el
