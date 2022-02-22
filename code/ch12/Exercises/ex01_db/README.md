ex01_db
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> my_db_gen:start().
ok
2> my_db_gen:write(foo, bar).
ok
3> my_db_gen:read(baz).
{error, instance}
4> my_db_gen:read(foo).
{ok, bar}
5> my_db_gen:match(bar).
[foo]

```