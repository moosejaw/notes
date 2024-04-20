#databases #cursors

* A client-side cursor ensures that the load is handed to the client application, which *can be a good thing!*

* A server-side cursor ensures that the load is handed to the server. Which, like client-side cursors, *can be a good thing*.

* You will have to manage server-side cursors effectively. **They should be used sparingly**,** and the cursors must never be leaked. You should always ensure that you are closing server-side cursors.

* Server-side cursors are difficult to manage in a web environment as it is difficult to know when server-side cursors should be cleaned up.