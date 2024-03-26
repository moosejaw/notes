#databases #indexes #query_optimisation #bitmap_index_scan #index_scan #table_scan

Sometimes sequential scans (seq scan) are used over index scans if the planner determines it is more expensive to perform the index scan.

A bitmap scan is used when a query predicate is indexed, but the planner adds an optimisation step for queries that would otherwise constantly access the heap.

The bitmap is where all the bits are **set to 1 for each page that satisfies the predicate**.
This way, the query executor knows exactly where in the heap to gather/fetch the data.

A recheck will filter out data from retrieved pages that don't satisfy the predicate.

Bitmap scans can scan multiple indexes, and their results, `AND` this still returns a reference to all heap pages to fetch. This is called a Bitmap AND scan.