#databases #acid #atomic #transactions

One of the 4 ACID properties. It refers to the idea that something is 'atomic' which means that it exists as a whole - it cannot be split or separated.

When the term atomicity was coined, atoms could not be split (which is not the case nowadays).

> [!NOTE]
> In database terms, it means that **all** queries in a given transaction **must succeed.** Otherwise, the transaction should fail **as a whole.**

* If one query fails for any reason, the transaction should `ROLLBACK`.
* If the DB went down prior to a commit, all successful queries in the transaction should `ROLLBACK`.

## Transactions in disk vs. memory

Some database engines keep transaction queries in **memory** which makes for fast transaction queries, (as data is operated on in-memory), but slow commits (as the data in memory must be flushed to disk).

Others write transaction queries to disk, which makes for slower queries but faster commits/persistence to disk.