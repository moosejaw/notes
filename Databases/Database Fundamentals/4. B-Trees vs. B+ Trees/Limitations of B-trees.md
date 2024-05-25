#databases #b-tree 

##### Limitations
* Elements in all node store both the key and the value. Therefore, internal nodes take up more space on disk, and require more IO to access. For example, if your primary key is a sizeable data type such as a string, your nodes will span more pages.

 * B-trees are generally not great for *range queries* because of random access - i.e., accessing irrelevant nodes. 
  ![[tree_ex.png]] For example, in this tree, finding 4-9 would traverse a massive proportion of the tree whilst hitting irrelevant data, e.g. (10, 11), which is not optimal IO.