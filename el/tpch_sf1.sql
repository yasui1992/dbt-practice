INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

COPY (SELECT * FROM customer) TO '/tmp/data/lake/customer.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM lineitem) TO '/tmp/data/lake/lineitem.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM nation) TO '/tmp/data/lake/nation.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM orders) TO '/tmp/data/lake/orders.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM part) TO '/tmp/data/lake/part.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM partsupp) TO '/tmp/data/lake/partsupp.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM region) TO '/tmp/data/lake/region.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM supplier) TO '/tmp/data/lake/supplier.parquet' (FORMAT PARQUET);
