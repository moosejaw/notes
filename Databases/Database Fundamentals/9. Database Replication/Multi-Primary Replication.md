#databases #replication 

Multi-primary replication refers to the concept of having multiple primary nodes that accept writes/DDLs.

There are one or more backup/follower nodes that receive those writes from the primary nodes. **This introduces the possibility of conflicts.**

Most database systems prefer having just one primary node, as this removes the need to introduce conflict management.