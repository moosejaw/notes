#databases #pages #query_optimisation

### Pages
Pages are a fixed-size memory or disk location of many bytes.

Rows are stored and read in logical pages, (8KB in Postgres, 16KB in MySQL).

| Row ID | ID   | Name |
|--------|------|------|
| 1001   | 1    | abc  |
| 1002   | 2    | def  |
| 2000   | 1000 | xyz  |
Assuming each page holds 3 rows,
1001 rows => 1001 / 3
=> 333 pages.

The two major factors that affect query speed are:
* number of pages accessed
* how many IOs are performed.

### IO
IO is a read request to disk.

It fetches one page or more, but not generally individual rows. The extra rows in the page are 'free'.

It is expensive to deserialise the bytes and discard additional columns.

We always want to **minimise the number of IOs**.

### Heap
The heap is a data structure where the table is stored with all its pages one after the other. **The heap is where all the actual data is stored.**

Due to the volume of data on the heap, traversing it is **expensive**.

Indexes tell us what part of the heap to read - i.e., what page to read. Think of the heap as an encyclopaedia book, and indexes as actual indexes at the end of the book.

### Indexes
Indexes are another data structure containing pointers to the heap. Once you find the value of an index, you then access the heap at the page referenced.

You should index **only** what you need to search for.  Indexes are stored as pages, so it costs IO to access its entries.

The smaller the index, the more parts of the index can fit in memory, and therefore make it faster to search. b-trees are a popular data structure for indexes.

### Notes
* Sometimes the heap table can be organised around a **single index**.
	* This is known as a **clustered index**. The `PRIMARY KEY` is usually a clustered index.
	* This is not the case in Postgres, it only has secondary indexes and all indexes point directly to the row ID on the heap.