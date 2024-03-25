This occurs when one or more processes are fighting for the same locked resources. It leads to an infinite state where both processes are awaiting the lock to be released.

Most databases are able to catch deadlocks and fail the transaction when this happens.

The transaction to fail is the last one to enter the deadlock.
