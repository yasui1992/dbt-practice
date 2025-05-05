ATTACH 'db/raw.duckdb' AS db;

INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

CREATE TABLE db.customer AS SELECT * FROM customer;
CREATE TABLE db.lineitem AS SELECT * FROM lineitem;
CREATE TABLE db.nation AS SELECT * FROM nation;
CREATE TABLE db.orders AS SELECT * FROM orders;
CREATE TABLE db.part AS SELECT * FROM part;
CREATE TABLE db.partsupp AS SELECT * FROM partsupp;
CREATE TABLE db.region AS SELECT * FROM region;
CREATE TABLE db.supplier AS SELECT * FROM supplier;
