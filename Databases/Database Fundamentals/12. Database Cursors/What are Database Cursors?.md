#databases #cursors 

Further reading:
* https://www.postgresql.org/docs/current/sql-declare.html


It is generally bad practice to work with large sets of data in a database. If you perform a large query on a large table, it puts the database under high load, which is often unnecessary. There are additional considerations as well, such as latency introduced by a large amount of data going over the wire in a client application.

**Cursors** aim to solve this problem. A cursor is sort of like telling a database to *not give you the full set of results* straight away from your query. It can be thought of as a placeholder which you can come back to.

Cursors work inside of transactions, and must be declared.

```sql
BEGIN TRANSACTION;

DECLARE <cursor_name> CURSOR FOR <your_query>;
```

Rows are returned from a cursor via the `FETCH` keyword. Running:

```sql
FETCH <cursor_name>;
```

Will return a single row from the cursor. Running `FETCH <cursor_name>` again will return the second row from the cursor.

There are some other things you can do, such as `FETCH last` which will return the last entry in the cursor. Sometimes the database can employ an efficient method of fetching the last row (and making the statement run quickly/cheaply), but sometimes it does not, and is forced to iterate through the cursor rows instead.


> [!NOTE]
> In PostgreSQL, there are various types of fetches you can perform, including fetching rows backwards (i.e., previous rows in the cursor).
> See: https://www.postgresql.org/docs/current/sql-fetch.html


##### Pros of Cursors

* In a client application, cursors are very memory-efficient as it enables the client to directly manage the amount of data it is dealing with.

* Cursors are structurally similar to a stream, so cursors are a very good method of bundling database data into streams. The streams can be sought (i.e. move forwards & backwards), and closed/cancelled etc.

* Cursors are one method of performing pagination.

##### Cons of Cursors

* Cursors are stateful. A cursor is a resource held in memory in the database, plus a corresponding transaction. If you had made another request to another server on another process, the other server is unaware of the cursor on the other server. This makes horizontal scaling very difficult.

> [!NOTE]
> You can, however, incorporate some features into a client application to make the client aware of the server **and** transaction it must connect to in order to use the cursor.

* Iterating through a large cursor can mean that transactions can run for a long time. Long running transactions are bad, as they hold up other, internal database processes. For example, the database cannot rebuild indexes if there is a transaction in use on the table.