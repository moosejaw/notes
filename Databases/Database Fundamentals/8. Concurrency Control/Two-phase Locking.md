# Two-phase locking

Two-phase locking is the idea of acquiring and releasing database locks in phases. Acquiring is phase one, and releasing is phase two. Once you have released, you cannot acquire.

## Double-booking problem

Two-phase locking is a common solution to the double-booking problem. Imagine a cinema where you can book seats, and two users are attempting to book the same seats at the same time. This would cause an issue with locks. (This can happen if you're *updating* the row simultaneously as opposed to inserting into it.)

Ideally, the first person who paid is entitled to the seat, and the second person should be rejected.

## Example of introducing a stuck lock

Create two transactions.

Transaction 1:

```sql
BEGIN TRANSACTION;
SELECT * FROM seats WHERE id = 14 FOR UPDATE;
```

Transaction 2:

```sql
BEGIN TRANSACTION;
SELECT * FROM seats WHERE id = 14 FOR UPDATE;
```

Assuming transaction 1 was first, it should not be stuck. You can then perform the update in transaction 1 and commit:

```sql
UPDATE seats SET is_booked = 1, name = 'hussein' WHERE id = 4;
COMMIT;
```

Then, transaction 2 will resolve and no longer be stuck, however it will return the data committed from transaction 1 in the result of the `SELECT` statement. The application should then error out because of this.

