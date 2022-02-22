ex01_otp
=====

```
rebar3 new lib ex01_otp && cd ex01_otp && rm -R src && mkdir lib && cd lib && rebar3 new lib otp && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	
```
1> c(usr).
/Users/Francesco/otp/usr.erl:11: Warning: undefined callback
function code_change/3 (behaviour 'gen_server')
/Users/Francesco/otp/usr.erl:11: Warning: undefined callback
function handle_info/2 (behaviour 'gen_server')
{ok,usr_db}
2> c(usr_db).
{ok,usr_db}
3> rr("lib/otp/src/usr.hrl").
[usr]
4> usr:start_link().
{ok,<0.86.0>}
5> usr:add_usr(700000000, 0, prepay).
ok
6> usr:set_service(0, data, true).
ok
7> usr:lookup_id(0).
{ok,#usr{msisdn = 700000000,id = 0,status = enabled, plan = prepay, services = [data]}}
8> usr:set_status(0, disabled).
ok
9> usr:service_flag(700000000,lbs).
{error,disabled}
10> usr:stop().
ok
```	

```
11> {ok, Pid} = usr:start_link().
{ok,<0.119.0>}
12> Pid ! hello.
hello
```

```
** Undefined handle_info in usr
** Unhandled message: hello
```