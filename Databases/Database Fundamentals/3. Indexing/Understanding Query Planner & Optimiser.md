#databases #indexes #query_optimisation 

`SELECT *` will perform a `seq scan` - which is a table scan.

Costs usually have **2 numbers**.
1. The first number is how many milliseconds it took to retrieve the first page. It describes the cost of **setting up** that portion of the query, e.g. `LIMIT`, `ORDER BY` and aggregates.
2. The second number is the total amount of time in milliseconds the query planner **thinks the query will take**.

The "rows" number is the number of rows the query planner thinks will be accessed.
"Width" is the sum of bytes in the row.

A query such as:
```sql
EXPLAIN SELECT * FROM tbl ORDER BY unindexed_col;
```

Will incur a large cost for both numbers. "Merge" queries may be planned which incurs extra cost when merging the result of the parallelised scans.