ex02_otp_sup2
=====

```
rebar3 new lib ex02_otp_sup2 && cd ex02_otp_sup2 && rm -R src && mkdir lib && cd lib && rebar3 new lib otp_sup && cd ..
```

I change restart type from `permanent` to `transient`.

```
1> {Id, {Module, Function, Arguments}, Restart, Shutdown, Type, ModuleList} = {usr, {usr, start_link, []}, transient, 2000, worker, [usr, usr_db]}.
{usr,{usr,start_link,[]},transient,2000,worker,[usr,usr_db]}
2> UsrChild = {Id, {Module, Function, Arguments}, Restart, Shutdown, Type, ModuleList}.
{usr,{usr,start_link,[]},transient,2000,worker,[usr,usr_db]}
3> ChildSpecifications = [UsrChild].
[{usr,{usr,start_link,[]},
      transient,2000,worker,
      [usr,usr_db]}]
4> supervisor:check_childspecs(ChildSpecifications).
ok
5>
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
usr_sup:module_info().

1> usr_sup:start_link().
{ok,<0.143.0>}
2> whereis(usr).
<0.144.0>
3> exit(whereis(usr), kill).
true
4> =SUPERVISOR REPORT==== 21-Feb-2022::10:40:49.048000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.144.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,transient},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]
4> whereis(usr).
<0.153.0>
5> usr:lookup_id(0).
{error,instance}
6> exit(whereis(usr), kill).
true
6> =SUPERVISOR REPORT==== 21-Feb-2022::10:42:12.336000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.153.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,transient},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]
...
15> =SUPERVISOR REPORT==== 21-Feb-2022::10:43:02.585000 ===
    supervisor: {local,usr_sup}
    errorContext: shutdown
    reason: reached_max_restart_intensity
    offender: [{pid,<0.171.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,transient},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]

15> 15> 15> ** exception error: shutdown
15> exit(whereis(usr), kill).
** exception error: bad argument
     in function  exit/2
        called as exit(undefined,kill)
        *** argument 1: not a pid


% Restart again and again
10> exit(whereis(usr_sup), kill).
** exception exit: killed
11> exit(whereis(usr), kill).
** exception error: bad argument
     in function  exit/2
        called as exit(undefined,kill)
        *** argument 1: not a pid
12>
```

```
1> usr_sup:start_link().
{ok,<0.137.0>}
2> whereis(usr).
<0.138.0>
3> exit(whereis(usr), kill).
=SUPERVISOR REPORT==== 21-Feb-2022::10:52:56.648000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.138.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,transient},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]

true
```