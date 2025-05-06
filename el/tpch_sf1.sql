INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

COPY (SELECT * FROM customer) TO 'data/lake/customer.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM lineitem) TO 'data/lake/lineitem.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM nation) TO 'data/lake/nation.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM orders) TO 'data/lake/orders.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM part) TO 'data/lake/part.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM partsupp) TO 'data/lake/partsupp.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM region) TO 'data/lake/region.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM supplier) TO 'data/lake/supplier.parquet' (FORMAT PARQUET);
