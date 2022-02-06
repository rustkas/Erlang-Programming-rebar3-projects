ex02_add_two
=====

An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing. Sometimes is not helpping. Just restart.

```
1> add_two:start().
{ok, <0.119.0>}
2> add_two:request(6).
8
3> add_two:request(six).
{error,{badarith,[{add_two,loop,0}]}}
=ERROR REPORT==== 24-Aug-2008::18:59:30 ===
Error in process <0.36.0> with exit value: {badarith,[{add_two,loop,0}]}
```