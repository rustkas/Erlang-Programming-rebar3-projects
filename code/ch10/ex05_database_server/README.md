ex05_database_server
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 


```
1> c(usr).
{ok,usr}
2> rr("lib/database_server/src/usr.hrl").
[usr]
3> usr:start().
ok
4> usr:add_usr(700000000, 0, prepay).
ok
5> usr:set_service(0, data, true).
ok
6> usr:lookup_id(0).
{ok,#usr{msisdn = 700000000,id = 0,status = enabled,
plan = prepay,
services = [data]}}
7> usr:set_status(0, disabled).
ok
8> usr:service_flag(700000000,lbs).
{error,disabled}
9> usr:stop().
ok
```
