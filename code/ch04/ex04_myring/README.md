ex04_myring
=====

```
rebar3 new lib ex04_myring && cd ex04_myring && rm -R src && mkdir lib && cd lib && rebar3 new lib myring && cd ..
```

An OTP library

Build
-----

	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 
	
```
timer:tc(myring, start, [1]).
{Millisec/10,ok} = timer:tc(myring, start, [1]).
fun({Millisec,ok}) ->  Millisec div ceil(math:pow(10,6)) end.
(fun({Millisec,ok}) ->  Millisec div ceil(math:pow(10,6)) end).
fun(N) -> 
		{Millisec,ok} = timer:tc(myring, start, [N]),
		X = math:log10(N),
		Millisec div ceil(math:pow(10,X))
		end(1000000).
```	