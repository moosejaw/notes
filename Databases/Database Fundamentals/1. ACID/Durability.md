#databases #acid #durability #wal #asynchronous_snapshot #os_cache #fsync

Durability is the process of persisting writes to a **durable** storage system. It refers to the ability to persist writes in the event of a system crash.


> [!QUOTE]
> "Changes made by committed transactions must be persisted in a durable, non-volatile storage."

### Durability Techniques

###### WAL (Write-Ahead Log)
The WAL is a **ledger** of data changes, representing the **deltas** of the data.

Writes are sent to the WAL and immediately flushed to disk.

Writing data to disk is generally **expensive**. Database engines often persist a smaller, **compressed** version of the data changes. This is the WAL.

##### Asynchronous Snapshot
Asynchronous snapshot keeps everything in memory as the database writes, but asynchronously snapshots everything to disk.

##### Append-Only Files
Another mechanism of tracking data changes.

### OS Cache

A write request typically goes to the OS cache, to batch the request, then flush, for performance reasons.

This can mean that the OS can report to the DB that the write was "successful", even if the data was only written to the cache.

A crash in this case would **lose** the data, as the DB would also believe the data was persisted successfully, but in reality, it was still in the OS cache.


> [!NOTE]
> `fsync` is a command which forces writes to be flushed to disk, however, `fsync` can slow down commits, as it adds overhead.


