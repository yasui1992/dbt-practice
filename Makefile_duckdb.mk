# makefile_duckdb.mk

build-duckdb:
	@docker build \
	--platform linux/x86_64 \
	--target duckdb-final \
	-t dbt-practice-duckdb \
	.

run-duckdb-cli:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/data \
	-it \
	dbt-practice-duckdb \
	/tmp/data/mart/dbt.duckdb

run-duckdb-el:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/data \
	-i \
	dbt-practice-duckdb \
	-c ".read el/tpch_sf1.sql"

run-duckdb-init-db:
	@rm -f ./data/mart/dbt.duckdb
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/data \
	-i \
	dbt-practice-duckdb \
	-c ".open /tmp/data/mart/dbt.duckdb"

up-duckdb-cli: build-duckdb run-duckdb-cli
up-duckdb-el: build-duckdb run-duckdb-el
up-duckdb-init-db: build-duckdb run-duckdb-init-db
