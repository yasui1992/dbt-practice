build:
	@docker build \
	--platform linux/x86_64 \
	--target final \
	-t dbt-practice \
	.

run:
	@docker run \
	--name dbt-practice \
	--rm \
	dbt-practice

up: build run
