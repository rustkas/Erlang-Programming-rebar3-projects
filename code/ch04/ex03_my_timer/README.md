ex02_my_timer
=====
rebar3 new lib ex02_my_timer && cd ex02_my_timer && rm -R src && mkdir lib && cd lib && rebar3 new lib my_timer && cd ..

An OTP library

Build
-----

	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 
	
```
timer:tc(myring, start, [1]).
```	