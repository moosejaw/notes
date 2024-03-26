#databases #query_optimisation 

In a row store, we dedicate area on disk (i.e., heap space) where the actual data sits. Ordering is **not** enforced by default.

A primary key introduces **clustering** to a table which enforces an **order** of rows. There is a cost associated with maintaining order.


> [!NOTE] 
> Primary keys are clustered indexes.

However, primary keys (clustered indexes) provide great speed in **range queries.**

Secondary keys (indexes) do not enforce order on a table. However, the data structure itself (the index) is ordered.