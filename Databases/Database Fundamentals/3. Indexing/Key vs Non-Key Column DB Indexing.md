#databases #indexes 

Non-key indexes exist in PostgreSQL.

A non-key column index is where you **create an index with columns to include in the index, but not search on.**

If you create an index like this:
* Column: `grade` (key)
* Column: `id` (non-key)
You can query on `grade` to return `id`, and the DB won't have to access the table at all.

This can have major performance benefits.

### Shared Hits
"Shared hits" in a query plan means that the OS cache was hit.

Example SQL for an index with a non-key:

```sql
CREATE INDEX name ON tbl(cols) INCLUDE non_key_cols;
```