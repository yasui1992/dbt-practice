INSTALL tpch;
LOAD tpch;
CALL dbgen(sf = 1);

COPY (SELECT * FROM customer) TO 'data/raw/customer.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM lineitem) TO 'data/raw/lineitem.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM nation) TO 'data/raw/nation.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM orders) TO 'data/raw/orders.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM part) TO 'data/raw/part.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM partsupp) TO 'data/raw/partsupp.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM region) TO 'data/raw/region.parquet' (FORMAT PARQUET);
COPY (SELECT * FROM supplier) TO 'data/raw/supplier.parquet' (FORMAT PARQUET);
