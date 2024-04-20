#databases #replication #eventual_consistency #horizontal_scaling

Primary/standby replication is where there is one master (aka. master, writer) node, that accepts writes/DDLs.

There are multiple 'standby' nodes that receive the writes from the primary node. This means that there are no conflicts regarding writes between nodes - as only one node accepts writes.

In primary/standby replication, if you read against the primary node, you are guaranteed to get the latest version of the data. You can read against standby nodes, but they are not guaranteed to have the latest data, as the propagation of data takes time - i.e, it is *eventually consistent.*

A benefit of reading from the standby nodes is that it reduces load on the primary node.

Primary-standby replication is a method of *horizontal scaling.*