#databases #b-tree #bplustree

B+trees are exactly like b-trees but only store keys in internal nodes. Values are only stores in the leaf, or end, nodes. This means there is overall a smaller node size, which is better for IO.

Leaf nodes are 'linked' to each other, so when you find a key, you can find all values before and after the key. This makes them much more optimal for range queries.

It is common in b+trees for internal nodes to fit in memory for fast traversal. Leaf nodes can live in data files in the heap.