#databases #acid #consistency #foreign_keys #referential_integrity #eventual_consistency #replication_over_time
Some databases tend to sacrifice consistency in favour of speed.

Consistency generally represents two main things:

* **Consistency of data**
* **Consistency of reads**

### Consistency in Data

Consistency in data is always defined by the user (i.e., the DBA). It generally refers to the **referential integrity** of the database, such as **foreign keys** across multiple tables.
### Consistency in Reads

As an example, assume two transactions:

1. 
```sql
UPDATE x WHERE ...
```

2. 
```sql
SELECT * FROM x WHERE ...
```

Assuming 1. runs first, then 2. immediately afterward, then 2. should return the **updated** record.

This idea refers to **replication**, i.e., replicating data between primary and secondary instances.

Databases are often prone to suffering from **eventual consistency** which refers to a delay in consistency. For example, updating an entire database system that is split into shards may take a while to propagate fully.

> [!NOTE] 
> In this instance, eventual consistency is also known as **replication over time.**
