# Introduction to ACID

ACID is an acronym, and stands for the following.

- **A**tomicity
- **C**onsistency
- **I**solation
- **D**urability

These are the four main pillars for successfully interacting with databases.

**Transactions** are also an important concept to understand and relate closely to ACID principles.

## What is a transaction?

> [!NOTE]
> A transaction is a collection of queries, treated as **one unit of work.**

It is difficult to often achieve your desired result in one query, so transactions are used to group them together, whilst treating them as one unit of work.

### Transaction lifecycle

* Always started with a `BEGIN TRANSACTION;` call.
* Persisted with `COMMIT;`.
* Reverted with `ROLLBACK;`.
* Any error will always result in a `ROLLBACK`. A database that crashes during a transaction will know to `ROLLBACK` once it restarts.

> [!NOTE]
> Even if you do not explicitly call `BEGIN TRANSACTION` and `COMMIT`, submitting a query to database will **always happen inside a transaction.** The transaction beginning and ending is just done for you.


