#databases #cursors #query_optimisation

Most client applications do actually employ cursors by default when connecting to databases. However, these cursors are managed directly by the client application.

Server-side cursors are cursors set on the database itself. The client application has to be aware of these cursors and access them explicitly.

##### Querying with Client-Side Cursor

Python example:

```python
import psycopg2

conn = psycopg2.connect(...)
cursor = conn.cursor()
cursor.execute("query")
result = cursor.fetchmany(50)  # | cursor.fetchall() , etc.
cursor.close()
conn.close()
```

The above example shows a cursor that exists in the client application.

##### Querying with Server-Side Cursor

In the above example, giving the cursor a name will ensure that it becomes a server-side cursor:

```python
import psycopg2

conn = psycopg2.connect(...)
cursor = conn.cursor("cursor_name")
cursor.execute("query")
result = cursor.fetchmany(50)  # | cursor.fetchall() , etc.
cursor.close()
conn.close()
```

With a server-side cursor, fetching a large query is significantly faster than fetching with a client-side cursor.

This is because the client-side cursor is essentially 'pre-fetching' everything in the `execute` statement and keeping it in memory. However, by keeping the cursor on the server, the results are stored on the server and data is only returned with each call to `fetch`.


> [!NOTE]
> This does not necessarily mean that server-side cursors are the best in every scenario!

