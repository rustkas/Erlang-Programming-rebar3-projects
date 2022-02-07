ex02_guard
=====
```
rebar3 new lib ex02_guard && cd ex02_guard && rm -R src && mkdir lib && cd lib && rebar3 new lib guard && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
rr(guard).
P =  #person{name="Joe", age=21, phone="999-999"}.
guard:foobar(P).
guard:foobar2(P).
```	
