ex02_distrib
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	
```
1> net_kernel:start([bar,shortnames]).
{ok,<0.137.0>}
(bar@tol)2>erlang:set_cookie(node(),cake).
true
(bar@tol)3>
```	

```
1> net_kernel:start([foo,shortnames]).
{ok,<0.122.0>}
(foo@tol)2>erlang:set_cookie(node(),cake).
(foo@tol)3>spawn('bar@tol', dist2,s,[]).
<12440.149.0>
(foo@tol)3>{server, 'bar@tol'} ! {hi, self()}.
{hi,<0.135.0>}
(foo@tol)3>receive Result -> Result end.
hi
```