#databases #pagination #concurrency_control

Pagination with the `OFFSET` used in queries is generally a bad idea.

A common use case for pagination is when a developer is creating an API that returns data in **pages**, i.e., chunks of data, in each response.

By design, `OFFSET` means it will fetch **all the rows up to the offset number and discard them**, therefore as the `OFFSET` number grows, the more work the database is doing, which can be extremely expensive.

`OFFSET` can also read multiple rows twice. If you `OFFSET 100`, and someone inserts data into a row before the `100`, that data will be included in the result from the `OFFSET 100` query.

> [!NOTE] 
> Remember, the query planner will always show the number of rows that were iterated. If you use a high `OFFSET` number, the query planner will show a high number of rows hit.

### Better Pagination

The ideal way to perform pagination is to use a `WHERE` clause effectively.

Assuming you have a table with sequential IDs, if you wanted to get page 10 (where the page size is also 10), that would mean we want every row between ID 90 and 100. So this is a valid approach:

```sql
SELECT row FROM tbl WHERE id > 90 ORDER BY id LIMIT 10;
```

In this approach, the number of rows hit will **only** be the number used in the `LIMIT`.