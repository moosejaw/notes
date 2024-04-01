#databases #bloom_filters #indexes #query_optimisation 

Bloom Filters are a data structure used to help determine an element's membership of a set. In this data structure, **false positives are possible, but false negatives are not.**

Therefore, a Bloom Filter's most practical purpose is to ensure an element is **definitely not** in something.

### Inside Bloom Filters

A Bloom Filter is an array of *m* bits, all set to 0.
*k* hash functions run against incoming values. The hash functions resolve to an index inside the array.

If the hash functions match an incoming value with an index in the bit array, the bit is set to 1.

When querying a BF, the key is hashed by *k* hash functions. If any output bit is a 0, we are certain the element is not in the BF.

### Practical Uses

A Bloom Filter can be used to prevent unnecessary database queries. If there is a chance of a false positive, the database is queried. But in general, this can be avoided if the query element does not exist in the database.