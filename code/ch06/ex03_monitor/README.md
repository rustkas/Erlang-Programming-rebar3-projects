ex03_monitor
=====
```
rebar3 new lib ex03_monitor && cd ex03_monitor && rm -R src && mkdir lib && cd lib && rebar3 new lib monitor && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing. Sometimes is not helpping. Just restart.	

```
1> Pid = spawn(crash, no_function, []).
=ERROR REPORT==== 21-Jul-2008::15:32:02 ===
Error in process <0.32.0> with exit value: {undef,[{crash,no_function,[]}]}
<0.32.0>
2> Reference = erlang:monitor(process, Pid).
#Ref<0.0.0.31>
3> receive
{'DOWN',Reference,process,Pid,Reason} -> Reason
end.
noproc
4> link(Pid).
** exception error: no such process or port
in function link/1
called as link(<0.32.0>)
```

```
1> add_three:start().
{ok, <0.119.0>}
2> add_three:request(6).
8
3> add_three:request(six).
{error,{badarith,[{add_two,loop,0}]}}
=ERROR REPORT==== 24-Aug-2008::18:59:30 ===
Error in process <0.36.0> with exit value: {badarith,[{add_two,loop,0}]}
4> add_three:check_messages().
```

Send exit
```
1> add_three:start().
{ok,<0.243.0>,#Ref<0.4153908448.3946577921.840>}
2> whereis(add_three).
<0.243.0>
3> add_three:send_exit().
Error. Pid = <0.243.0>. Reason = ok
4> whereis(add_three).
undefined
```

Fake Restart
```
1> self().
<0.143.0>
2> {ok, Pid, Reference} = add_three:start().
{ok,<0.274.0>,#Ref<0.4153908448.3946577921.1505>}
3> add_three:restart().
Error. Pid = <0.145.0>. Reason = ok
4> self().
<0.143.0>
5> whereis(add_three).
<0.274.0>
6> add_three:send_exit().
Error. Pid = <0.243.0>. Reason = ok
7> whereis(add_three).
undefined
8> 
```

Fake Restart. Change `Reason` to 'normal'.
```
1> self().
<0.143.0>
2> {ok, Pid, Reference} = add_three:start().
{ok,<0.274.0>,#Ref<0.4153908448.3946577921.1505>}
3> add_three:restart().
Error. Pid = <0.145.0>. Reason = normal
4> self().
<0.143.0>
5> whereis(add_three).
<0.274.0>
6> add_three:send_exit().
Error. Pid = <0.243.0>. Reason = normal
7> whereis(add_three).
undefined
8> 
```