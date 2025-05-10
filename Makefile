.PHONY: \
	build-dbt \
	build-duckdb \
	run-dbt-debug \
	run-duckdb-cli \
	run-duckdb-el \
	run-duckdb-init-db \
	up-dbt-debug \
	up-duckdb-cli \
	up-duckdb-el \
	up-duckdb-init-db


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
	-v ./data:/tmp/data \
	dbt-practice-dbt \
	debug

run-dbt-run:
	@docker run \
	--name dbt-practice-dbt \
	--rm \
	-v ./data:/tmp/data \
	dbt-practice-dbt \
	run

run-duckdb-cli:
	@docker run \
	--name dbt-practice-duckdb \
	--rm \
	-v ./data:/tmp/data \
	-it \
	dbt-practice-duckdb

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


up-dbt-debug: build-dbt run-dbt-debug
up-dbt-run: build-dbt run-dbt-run
up-duckdb-cli: build-duckdb run-duckdb-cli
up-duckdb-el: build-duckdb run-duckdb-el
up-duckdb-init-db: build-duckdb run-duckdb-init-db
