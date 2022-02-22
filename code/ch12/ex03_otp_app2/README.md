ex03_otp_app2
=====


An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing
	
```
>application:start(usr).
ok
2> whereis(usr).
<0.141.0>
3>application:stop(usr).
=INFO REPORT==== 21-Feb-2022::21:06:53.656000 ===
    application: usr
    exited: stopped
    type: temporary

ok
```	

```

0> application:load(usr).
1> code:add_path("usr-1.0/ebin").
true
2> application:start(usr).
ok
3> application:start(usr).
{error,{already_started,usr}}
4> usr:lookup_id(10).
{error,instance}
5> application:get_env(usr, dets_name).
{ok,"usrDb"}
6> application:stop(usr).
=INFO REPORT==== 27-Jan-2009::22:14:33 ===
application: usr
exited: stopped
type: temporary
ok
6> whereis(usr_sup).
undefined

>  application:get_all_env().
```