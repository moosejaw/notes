## Exclusive locks

Exclusive locks represent an exclusive hold over a value. i.e., nobody else can read the value. (Exclusive privileges.)

If anybody tries to use a value (that is, read *or* write,) on which an exclusive lock exists, they will get an error.

## Shared locks

A shared lock means that anybody can *use* the lock but it **cannot be edited by someone else.**

If somebody attempts to write to a value on which a shared lock exists, they will get an error.

## Why locks?

Locks were introduced to DBMSs to achieve **consistency** - one of the aspects of ACID.