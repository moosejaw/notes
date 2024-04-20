#databases #replication 

* **Synchronous Replication**
	* When a write is issued to the primary node, the client has to wait until the data is propagated to all nodes, i.e., the primary node and all its replicas (standby nodes).
	* The 'waiting' in sync/async terms is known as 'blocking'.
	* This removes 'eventual consistency.'

* **Asynchronous Replication**
	* A write transaction is considered successful if written to the **primary** node, and the writes are propagated to the standby nodes.
	* This method is how most database systems handle replication.