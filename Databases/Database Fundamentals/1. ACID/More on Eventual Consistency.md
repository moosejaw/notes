#databases #eventual_consistency #consistency #acid #sharding

**Consistency** is one of the components of ACID. **Eventual Consistency** is a more recent term that applies to both relational and NoSQL database engines.

When referring to consistency in reads, it states that **if a value is updated in a transaction, a new transaction should immediately reflect the result of that previous transaction.**

This is not always the case, as **replicated** databases (e.g, a cluster with read & read/write nodes) **eventually** update themselves with the new values.

It is up to application developers to decide their tolerance for eventual consistency. Likewise it is up to application developers to mitigate potential problems with eventual consistency.