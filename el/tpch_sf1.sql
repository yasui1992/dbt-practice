ATTACH 'db/raw.duckdb' AS db;

INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

CREATE OR REPLACE TABLE db.customer AS SELECT * FROM customer;
CREATE OR REPLACE TABLE db.lineitem AS SELECT * FROM lineitem;
CREATE OR REPLACE TABLE db.nation AS SELECT * FROM nation;
CREATE OR REPLACE TABLE db.orders AS SELECT * FROM orders;
CREATE OR REPLACE TABLE db.part AS SELECT * FROM part;
CREATE OR REPLACE TABLE db.partsupp AS SELECT * FROM partsupp;
CREATE OR REPLACE TABLE db.region AS SELECT * FROM region;
CREATE OR REPLACE TABLE db.supplier AS SELECT * FROM supplier;
