INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

COPY (SELECT * FROM customer) TO '/tmp/dbt/data/lake/customer.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM lineitem) TO '/tmp/dbt/data/lake/lineitem.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM nation) TO '/tmp/dbt/data/lake/nation.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM orders) TO '/tmp/dbt/data/lake/orders.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM part) TO '/tmp/dbt/data/lake/part.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM partsupp) TO '/tmp/dbt/data/lake/partsupp.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM region) TO '/tmp/dbt/data/lake/region.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM supplier) TO '/tmp/dbt/data/lake/supplier.parquet' (FORMAT PARQUET);
