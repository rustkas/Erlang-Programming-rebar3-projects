ex02_db
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> my_db_sup:start_link().
{ok,<0.137.0>}
2> whereis(my_db_gen).
<0.138.0>
3> exit(whereis(my_db_gen), kill).
=SUPERVISOR REPORT==== 22-Feb-2022::18:24:46.447000 ===
    supervisor: {local,my_db_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.154.0>},
               {id,db},
               {mfargs,{my_db_gen,start_link,[]}},
               {restart_type,temporary},
               {significant,false},
               {shutdown,brutal_kill},
               {child_type,worker}]

true
6> whereis(my_db_gen).
undefined
```