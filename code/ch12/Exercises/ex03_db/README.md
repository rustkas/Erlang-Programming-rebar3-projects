ex03_db
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing
	
```
>application:start(db).
ok
2> whereis(my_db_gen).
<0.141.0>
3> whereis(my_db_sup).
<0.141.0>
3>application:stop(db).
=INFO REPORT==== 22-Feb-2022::18:50:55.172000 ===
    application: db
    exited: stopped
    type: temporary

ok
```	