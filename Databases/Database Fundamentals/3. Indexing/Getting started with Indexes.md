#databases #indexes

An index is a data structure that describes locations of data in a table. Indexes are stored in **pages.**

There are two main types of indexes:
* b-tree
* LSM (log-structured merge tree)

In Postgres, `EXPLAIN ANALYZE` runs queries and explains how they were performed.

In a query plan, any query that uses `parallel seq scan` or `table scan` is not ideal and happens when your query predicate is based on non-indexed columns.

`LIKE` predicates are also not ideal in queries as there is a cost assoicated with filtering each row once it is retrieved from the heap.

`Bitmap heap scan` is known as an index scan, and is a more ideal method of searching. Likewise for `Bitmap index scan`.