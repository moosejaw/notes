# Solving the double booking problem

> [!NOTE]
> There are some notes regarding the double booking problem in file ./3_two_phase_locking.md.

If possible, you should create the row before you put the main contents of data into it. For the cinema problem, you should have a database ready that represents all the seats in your cinema. However, this is not always possible.

You should always `SELECT FOR UPDATE` the row you plan to edit so that the lock is created.

```sql
SELECT rows FROM table FOR UPDATE (with UPDATE | INSERT);
```

The user initiating the transaction that did not occur first will then be 'stuck' in order to not initiate a race condition. The application (client) should be designed to deal with the problem.

Anecdotally, some websites will mark the seat as reserved for person \#1 even if they have not yet actually paid for their seat.
