ex01_echo
=====

An OTP library

```
rebar3 new lib ex01_echo && cd ex01_echo && rm -R src && mkdir lib && cd lib && rebar3 new lib echo && cd ..
```

An OTP library

Build
-----

	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 
	
```
echo:start().
whereis(echo).
echo:print("Hello").
echo:stop().
whereis(echo).
```	