ex01_database_server
=====

An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing. Sometimes is not helpping. Just restart.

Check start
```
1>my_db:start().
ok
2>whereis(my_db).
<0.142.0>
3>my_db ! {self,stop}.
{self,stop}
4>my_db ! {self(),stop}.
{<0.135.0>,stop}
5>whereis(my_db).
undefined
```

Check stop
```
1>my_db:start().
ok
2>whereis(my_db).
<0.142.0>
3>my_db:stop().
ok
4>whereis(my_db).
undefined
```

Check write
```
1>my_db:start().
ok
2>my_db:write(francesco, london).
ok
3>my_db:db().
[{francesco,london}]
4>my_db:write(lelle, stockholm).
ok
5>my_db:db().
[{lelle,stockholm},{francesco,london}]
6>my_db:write(joern, stockholm).
ok
7>my_db:db().
[{joern,stockholm},{lelle,stockholm},{francesco,london}]
8>my_db:stop().
ok
9>whereis(my_db).
undefined
```

Check delete
```
1>my_db:start().
ok
2>my_db:write(francesco, london).
ok
3>my_db:write(lelle, stockholm).
ok
4>my_db:write(joern, stockholm).
ok
5>my_db:db().
[{joern,stockholm},{lelle,stockholm},{francesco,london}]
6>my_db:delete(francesco).
ok
7>my_db:db().
[{joern,stockholm},{lelle,stockholm}]
8>my_db:delete(joern).
ok
9>my_db:db().
[{lelle,stockholm}]
8>my_db:delete(francesco).
ok
10>my_db:db().
[{lelle,stockholm}]
11>my_db:delete(lelle).
ok
12>my_db:db().
[]
13>my_db:stop().
ok
14>whereis(my_db).
undefined
```

Check read
```
1>my_db:start().
ok
2>my_db:write(francesco, london).
ok
3>my_db:read(francesco).
{ok, london}
4>my_db:read(joern).
{error,instance}
5>my_db:stop().
ok
6>whereis(my_db).
undefined
```

Check match
```
1>my_db:start().
ok
2>my_db:write(francesco, london).
ok
3>my_db:write(joern, stockholm).
ok
4>my_db:write(joern, stockholm).
ok
5>my_db:match(stockholm).
[joern,joern]
6>my_db:stop().
ok
7>whereis(my_db).
undefined
```

Final test
```
1> my_db:start().
ok
2> my_db:write(foo, bar).
ok
3> my_db:read(baz).
{error, instance}
4> my_db:read(foo).
{ok, bar}
5> my_db:match(bar).
[foo]
6> my_db:stop().
ok
7>whereis(my_db).
undefined
8>q().

```