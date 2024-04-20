#databases #replication 

##### Pros

* Replication enables horizontal scaling on reads. It can help to evenly distribute load throughout each node in a cluster.

* If you have an application used by users around the globe, you can place standby nodes in different regions, which ensures that you can keep your application and your data close together.

##### Cons

* Replication is eventually consistent. Written data will not immediately appear in standby nodes.

* If using synchronous replication, writes can be very slow, as client applications will block until the replication conditions are satisfied.

* Replication can be complex to implement, especially with multiple primary nodes. With multiple primary nodes, you would have to handle conflict resolution.