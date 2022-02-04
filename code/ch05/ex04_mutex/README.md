ex04_mutex
=====

An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
mutex:start().
mutex:wait().
mutex:signal().

whereis(mutex).
<0.139.0>
mutex:stop().
whereis(mutex).
undefined

```

```
mutex:start().

whereis(mutex).
<0.139.0>

mutex:stop().
whereis(mutex).
undefined
```

```
mutex:start().
whereis(mutex).
<0.142.0>

mutex:wait().

mutex:stop().
whereis(mutex).
<0.142.0>

mutex:signal().
whereis(mutex).
<0.142.0>

```

Note that if you launch `stop` then `signal` after `signal` mail box read old messages and get `stop`. 
That is why the mutex has stopped.
```

```