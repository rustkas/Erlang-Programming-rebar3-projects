ex02_otp_sup
=====
```
rebar3 new lib ex02_otp_sup && cd ex02_otp_sup && rm -R src && mkdir lib && cd lib && rebar3 new lib otp_sup && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
usr_sup:module_info().

1> usr_sup:start_link().
{ok,<0.138.0>}
2> whereis(usr).
<0.139.0>
3> exit(whereis(usr), kill).
true
4> =SUPERVISOR REPORT==== 21-Feb-2022::10:06:05.504000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.139.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,permanent},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]
4> whereis(usr).
<0.149.0>
5> usr:lookup_id(0).
{error,instance}
6> exit(whereis(usr), kill).
true
6> =SUPERVISOR REPORT==== 21-Feb-2022::10:09:09.184000 ===
    supervisor: {local,usr_sup}
    errorContext: child_terminated
    reason: killed
    offender: [{pid,<0.149.0>},
               {id,usr},
               {mfargs,{usr,start_link,[]}},
               {restart_type,permanent},
               {significant,false},
               {shutdown,2000},
               {child_type,worker}]
...
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