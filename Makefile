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
	-v ./dbt_tmp/target:/tmp/dbt/target \
	-v ./data:/tmp/data \
	dbt-practice-dbt \
	run

run-dbt-test:
	@docker run \
	--name dbt-practice-dbt \
	--rm \
	-v ./dbt_tmp/target:/tmp/dbt/target \
	-v ./data:/tmp/data \
	dbt-practice-dbt \
	test

run-dbt-docs-generate:
	@docker run \
	--name dbt-practice-dbt \
	--rm \
	-v ./dbt_tmp/target:/tmp/dbt/target \
	-v ./data:/tmp/data \
	dbt-practice-dbt \
	docs generate

run-dbt-docs-serve:
	@docker run \
	--name dbt-practice-dbt \
	--rm \
	-v ./dbt_tmp/target:/tmp/dbt/target \
	-v ./data:/tmp/data \
	-p 8080:8080 \
	dbt-practice-dbt \
	docs serve --host 0.0.0.0 --port 8080

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


up-dbt-debug: build-dbt run-dbt-debug
up-dbt-run: build-dbt run-dbt-run
up-dbt-test: build-dbt run-dbt-test
up-dbt-docs: \
	build-dbt \
	run-dbt-docs-generate \
	run-dbt-docs-serve
up-duckdb-cli: build-duckdb run-duckdb-cli
up-duckdb-el: build-duckdb run-duckdb-el
up-duckdb-init-db: build-duckdb run-duckdb-init-db
