ex03_04_db
=====

Exercise 3-4: Database Handling Using Lists
=====

Write a module `db.erl` that creates a database and is able to store, retrieve, and delete
elements in it. The `destroy/1` function will delete the database. Considering that Erlang
has garbage collection, you do not need to do anything. We are including the destroy
function to make the interface consistent. You may not use the lists library module,
and you have to implement all the recursive functions yourself.

Hint: use lists and tuples as your main data structures. When testing your program,
remember that Erlang variables are single-assignment:

Interface:

```
db:new() ⇒ Db.
db:destroy(Db) ⇒ ok.
db:write(Key, Element, Db) ⇒ NewDb.
db:delete(Key, Db) ⇒ NewDb.
db:read(Key, Db) ⇒{ok, Element} | {error, instance}.
db:match(Element, Db) ⇒ [Key1, ..., KeyN].
```

Example:

```
1> c(db).
{ok,db}
2> Db = db:new().
[]
3> Db1 = db:write(francesco, london, Db).
[{francesco,london}]
4> Db2 = db:write(lelle, stockholm, Db1).
[{lelle,stockholm},{francesco,london}]
5> db:read(francesco, Db2).
{ok,london}
6> Db3 = db:write(joern, stockholm, Db2).
[{joern,stockholm},{lelle,stockholm},{francesco,london}]
7> db:read(ola, Db3).
{error,instance}
8> db:match(stockholm, Db3).
[joern,lelle]
9> Db4 = db:delete(lelle, Db3).
[{joern,stockholm},{francesco,london}]
10> db:match(stockholm, Db4).
[joern]
11>

Db4 = db:delete(francesco, Db3).
```

## An OTP application

Create new project

---- 
 # all commands in one string
 $ rebar3 new umbrella ex03_04_db && cd ex03_04_db && rm -R apps && mkdir lib && cd lib && rebar3 new lib db && cd ..


Run shell
-----

 $ rebar3 shell
 > r3:do(compile). % recompile after source code editing 
 
### Run EUnit

-----
 $ rebar3 eunit -m db_test
 