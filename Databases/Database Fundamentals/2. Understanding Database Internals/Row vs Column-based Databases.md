#databases 

### Row-based
##### Summary
* Optimal for read and write heavy databases.
* Compression on the data is inefficient.
* Aggregation on the data is inefficient.
* Queries are efficient when selecting multiple columns.
##### Info
Tables are stored as rows on disk. A single block IO read fetches multiple rows and **ALL** their columns.

More IOs are required to find a particular row, **but** once the row is found, you get all rows in the page, plus all the **columns** for free.

Row-based databases generally perform worse on queries that touch a large number of rows but only a single column, e.g.:

```sql
SELECT SUM(salary) FROM employees;
```

### Column-based
##### Summary
* Slower writes.
* Good compression of data.
* Efficient aggregation.
* Inefficient queries with multiple columns.
##### Info
Tables are stored as columns first on disk. A single IO read fetches multiple columns across all matching rows.

Less IOs are required for **more** values of a single column. Multiple columns require more IOs.

