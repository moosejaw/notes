#databases #replication #postgresql 

* PostgreSQL version: 13
* Further reading: 
	* https://www.postgresql.org/docs/current/auth-pg-hba-conf.html
	* https://www.postgresql.org/docs/current/runtime-config-replication.html

Suppose you are creating a cluster from scratch. **Ensure all nodes are stopped.**

You should ensure the content of all nodes is the same. You can use `pg_basebackup` to do so, or if you have access to the database's system files, you can just copy them all to each node manually.

Then, in your primary/writer node, you want to edit the `pg_hba.conf` file.

You should add a block for each node you want to replicate:

```text
host replication <user> all md5 
```

`user` refers to a database user in your cluster. It is good practice that this user is **not** the default `postgres` user.

Then, you should edit the `postgres.conf` file in the standby nodes:

There will be a section, commented out, called `primary_conninfo`. Find it, uncomment it and update it to show the following:

```text
primary_conninfo = 'application_name=<name> host=<primary_node_hostname> port=<primary_node_port> user=<user>' password=<user_password>
```

Where:
* `<name>` is an arbitrary name that is **unique** per mode.
* `<primary_node_hostname>` is the hostname (or IP?) of the primary node.
* `<primary_node>` is the port of the primary node on which Postgres is running.
* `<user>` is the replication user - same as in the above section.
* `<user_password>` is the password of the replication user.

##### Synchronous Replication example

In each standby node, in the same folder as `postgres.conf`, you must create a blank file called `standby.signal`.

In the primary node, edit its `postgres.conf` file. There is a section called `synchronous_standby_names` which can be edited to include the standby nodes.

```text
synchronous_standby_names = '<first|any> <number> (<application_names>)'
```

This describes how replication is performed.  For example, using `first 1` means that any clients will be unblocked as soon as the committed data is written to the `first` of `1` of the standby nodes.

Using `any` describes a quorum-based replication - for example, `any 3` will block until the committed data is written to any 3 of the standby nodes.

> [!NOTE]
> In synchronous replication, another option called `synchronous_replication` is set to `on` by default and shouldn't need to be edited.

You can now **start each node**. In the logs, when the primary nodes starts, you should see a log like this:

```text
LOG: standby "<application_name>" is now a synchronous standby with priority <x>
```
