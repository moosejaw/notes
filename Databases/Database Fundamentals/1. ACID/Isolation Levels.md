#databases #acid #isolation #isolation_levels #read_uncommitted #serializable #read_committed #repeatable_read #snapshot

Each DBMS implements isolation levels differently. There are two-broad definitions of a DBMS's approach to isolation levels:

* **Pessimistic**: => the DBMS will utilise locks wherever possible, e.g., table locks, page locks, etc.
* **Optimistic:** => the DBMS generally avoids locks, and will fail the transaction if the desired isolation is broken.

### `READ UNCOMMITTED`

| Phenomena            | Prevented? |
| -------------------- | ---------- |
| Dirty Reads          | ❌          |
| Lost Updates         | ❌          |
| Non-Repeatable Reads | ❌          |
| Phantom Reads        | ❌          |

`READ UNCOMMITTED` performs no isolation whatsoever. Any changes, committed or not, from outside the transaction can leak into a `READ UNCOMMITTED` transaction.

> [!NOTE] 
> `READ UNCOMMITTED` is only supported by SQL Server.

### `READ COMMITTED`
| Phenomena            | Prevented? |
| -------------------- | ---------- |
| Dirty Reads          | ✅          |
| Lost Updates         | ❌          |
| Non-Repeatable Reads | ❌          |
| Phantom Reads        | ❌          |
`READ COMMITTED` ensures the query only sees **committed** changes by other transactions.

This is usually the standard isolation level used by most database engines when an isolation level is not specified.

### `REPEATABLE READ`
| Phenomena            | Prevented? |
| -------------------- | ---------- |
| Dirty Reads          | ✅          |
| Lost Updates         | ✅          |
| Non-Repeatable Reads | ✅          |
| Phantom Reads        | ❌          |
`REPEATABLE READ` ensures that when the query reads a row, that row will remain unchanged whilst the transaction is running.

It was designed specifically to solve **non-repeatable reads.**

### `SNAPSHOT`
| Phenomena            | Prevented? |
| -------------------- | ---------- |
| Dirty Reads          | ✅          |
| Lost Updates         | ✅          |
| Non-Repeatable Reads | ✅          |
| Phantom Reads        | ✅          |
`SNAPSHOT` ensures that each query in a transaction only sees changes that have been committed up to the start of the transaction.

### `SERIALIZABLE`
| Phenomena            | Prevented? |
| -------------------- | ---------- |
| Dirty Reads          | ✅          |
| Lost Updates         | ✅          |
| Non-Repeatable Reads | ✅          |
| Phantom Reads        | ✅          |
`SERIALIZABLE` ensures that **all** transactions on the database are run in series, effectively **disabling any concurrency**.

> [!IMPORTANT] 
> `SERIALIZABLE` is guaranteed to cause no read phenomena whatsoever, but is an extremely heavy-handed approach that should only be used in certain cases.

