#databases #acid #read_phenomena #isolation #dirty_reads #non_repeatable_reads #phantom_reads #lost_updates
# Isolation

Isolation is another ACID property.

> [!NOTE]
> Isolation refers to a DB's ability to perform transactions **in isolation**, thereby achieving concurrency.

Every single *modern* database uses isolation as it supports concurrent transactions.

However, **it is possible that concurrent connections running separate transactions can impact one another, if data is committed whilst another transaction is running.**

This is referred to as **read phenomena.**

## Read phenomena types

### 1. Dirty reads

* Refers to when a transaction reads something that another transaction has committed.
* This is usually the most undesirable read phenomena as it causes data to be unreliable.

### 2. Non-repeatable reads

* When a transaction reads something multiple times but the value changes within the same transaction.

### 3. Phantom reads

* When a transaction reads something that does not yet exist.

### 4. Lost updates

* When a transaction reads something that has been removed by another transaction, mid-transaction.

## Isolation levels

* ✅ - means phenomena cannot occur.
* ❌ - means phenomena can still occur.


#### Prevents phenomena
