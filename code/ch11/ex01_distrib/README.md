ex01_distrib
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
	$ rebar3 compile
	$ erl -sname foo
	(foo@tol) 1> code:add_pathz("_build/default/lib/distrib/ebin").
	true
	(foo@tol)2> spawn('bsr@tol', dist, t, [self()]).
	<8955.90.0>
	(foo@tol)3> flush().
	Shell got bsr@tol
	ok
```	

```
{frequency, foo@tol} ! Message
```
	
	
```
	$ rebar3 compile
	$ erl -sname bsr
	> code:add_pathz("_build/default/lib/distrib/ebin").
	true
	> distrib:t(self()).
```	


```
1> erlang:is_alive().
false
2> net_kernel:start([foo,shortnames]).
{ok,<0.137.0>}
(foo@tol)3> erlang:is_alive().
true
(foo@tol)4> node().
'foo@tol'
(foo@tol)5> net_kernel:stop().
ok
6> erlang:is_alive().
false
7> erlang:set_cookie(node(),cake).
true
8> net_adm:ping('bar@tol').
pang
8> net_adm:ping('bsr@tol').
pong
9> erlang:set_cookie(node(),fish).
```

```
8> net_adm:ping('foo@tol').
```