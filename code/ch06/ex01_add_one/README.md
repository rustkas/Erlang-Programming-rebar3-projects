ex01_add_one
=====

An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 compile && rebar3 shell

```
1> self().
<0.29.0>
2> add_one:start().
true
3> add_one:request(1).
2
4> add_one:request(one).
=ERROR REPORT==== 21-Jul-2008::16:29:38 ===
Error in process <0.37.0> with exit value: {badarith,[{add_one,loop,0}]}
** exception exit: badarith
in function add_one:loop/0
5> self().
<0.40.0>
```

```
1> process_flag(trap_exit, true).
false
2> add_one:start().
true
3> add_one:request(one).
=ERROR REPORT==== 21-Jul-2008::16:44:32 ===
Error in process <0.37.0> with exit value: {badarith,[{add_one,loop,0}]}
timeout
4> flush().
Shell got {'EXIT',<0.37.0>,{badarith,[{add_one,loop,0}]}}
ok
```