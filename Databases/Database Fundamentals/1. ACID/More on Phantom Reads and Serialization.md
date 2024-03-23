#acid #databases #phantom_reads #repeatable_read #serializable #isolation_levels 

A **phantom read** is an undesirable read phenomenon.

It occurs when another transaction inserts a row that appears when querying data in your own, separate transaction.

In most database engines, setting the isolation level to `SERIALIZABLE` will fix the problem, as it ensures that anything read must not depend on data in other, currently running, transactions.

> [!NOTE]
> PostgreSQL is the only database engine that prevents phantom reads by using the `REPEATABLE READ` isolation level.

### More on `SERIALIZABLE` Isolation

As the name suggests, `SERIALIZABLE` forces transactions to run in **series** in order to succeed.

In `SERIALIZABLE` mode, a commit will **fail** if dependent data has changed in another transaction.

This is a major downside of using `SERIALIZABLE` as much of the database concurrency is lost.

An example of a PostgreSQL error statement:

```
could not serialize access due to read/write dependencies among transactions
```