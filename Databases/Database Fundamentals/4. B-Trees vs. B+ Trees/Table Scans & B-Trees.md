#databases #indexes #table_scan #b-tree

##### Table Scan
If we consider a database 'table' like a book, a table scan can be thought of as 'reading the book' from cover to cover until we find what we're looking for, **page-by-page**. It is expensive and undesirable.

Some database engines do attempt to optimise table scans as much as possible, for example by employing concurrency in its scans.

Many books contain **indexes** which act as a means of finding specific information quickly, as an index will direct the reader directly to the page containing the information.

##### B-Trees
A b-tree is a data structure designed for fast traversal.

A b-tree contains *nodes*. In a b-tree of `m` degree, some nodes can have up to `m` child nodes. A node will have up to `m-1` elements.

Each element has a key and a value. The value, in database terms, is usually a data pointer to the referenced row. The pointer can point to the primary key of the row, or to the entire row (tuple). In practice, nodes materialise as pages on disk.

When a node would have < `m-1` elements, the node has to be split, and nearby nodes re-constructed. This is expensive to do, especially in large indexes.