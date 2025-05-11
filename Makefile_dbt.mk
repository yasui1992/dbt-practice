build-dbt:
	@docker build \
	--platform linux/x86_64 \
	--target dbt-final \
	-t dbt-practice-dbt \
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

up-dbt-debug: build-dbt run-dbt-debug
up-dbt-run: build-dbt run-dbt-run
up-dbt-test: build-dbt run-dbt-test
up-dbt-docs: \
	build-dbt \
	run-dbt-docs-generate \
	run-dbt-docs-serve
