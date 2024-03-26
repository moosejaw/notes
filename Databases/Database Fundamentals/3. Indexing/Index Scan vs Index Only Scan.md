#databases #indexes #index_scan #index_only_scan #query_optimisation #postgresql

Index-only scans are an ideal scan type in queries. An index-only scan is a search where **all the data** was retrieved from the index. I.e., the DB engine did not have to access something else, e.g., the heap.

An index scan is where an index is used in searching but another data structure was accessed in order to complete it.

### Combining Databases Indexes for Better Performance
In indexes in PostgreSQL, columns on the left-hand side are preferable for scanning.

For example:
```sql
CREATE INDEX ON tbl(a, b);
```

1. ```SELECT c FROM tbl WHERE a = val;``` will use the above index because **`a` is on the left-hand side**.
2. `SELECT c from tbl WHERE b = val;` will use a slow scan, e.g., a parallel seq scan.

Composite indexes are not ideal for `OR` queries.

### How Database Optimisers Decide to Use Indexes
If using an `AND` query across two discrete indexes, if one index returns **many** results, and another returns **few**, the optimiser may use the large index for part of the search, but then use a table scan.

This is because the optimiser deemed it not worthwhile to build a b-tree of the "few" index, as this is **expensive.**

The planner knows if an index will return many or few rows because of **stats.** These stats are kept on tables and indexes.

For example, in PostgreSQL, `index_tup_read` records how many tuples (rows) are returned as a result of an index scan.

> [!NOTE] 
> Sometimes, outdated stats can cause slow scans to be picked. You should manually rebuild stats if you think this is the case. You can use `ANALYZE` to rebuild stats.