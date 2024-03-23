#databases #connection_pooling


> [!QUOTE]
> Connection pooling is a pattern of creating a pool of available connections, usually TCP, and allowing multiple clients to share in this pool of connections.

It is extremely useful when connection creation and destruction is expensive (which is usually the case), and it is also useful when the database server only supports a limited number of connections. Pooling eases the raw number of connections used.

It is generally an **anti-pattern** in API design that for each call made to an API endpoint (that handles data in the database), that API endpoint creates a **new connection** to the database.


> [!NOTE] 
> Connection pools are typically supported in libraries that provide a DBAPI. Connection pools in code should generally be a **singleton**.

Two parameters exist in connection pools called `max` and `timeout`. `max` refers to the maximum number of clients allowed to use the pool, and `timeout` often has two kinds - `connectionTimeout` and `idleTimeout`.

`connectionTimeout` refers to the timeout threshold of when a **client attempts to get a connection from the pool, but the `max` number has been hit.** A client will wait for a connection pool to have a free slot if the pool is at max capacity.

`idleTimeout` refers to the timeout threshold of when a **client has a connection to the pool, but has not performed any interactions with the database.**

Connection pools remove the overhead of establishing a brand new connection each time code (which hits the database) is executed.

