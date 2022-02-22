ex03_otp_app
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
