#databases #indexes 
It is possible to avoid blocking production database systems when creating indexes in certain database engines, such as PostgreSQL.

```sql
CREATE INDEX CONCURRENTLY <name> ON tbl(vals);
```