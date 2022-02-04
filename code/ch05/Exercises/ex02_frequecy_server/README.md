ex02_frequecy_server
=====
```
rebar3 new lib ex02_frequecy_server && cd ex02_frequecy_server && rm -R src && mkdir lib && cd lib && rebar3 new lib frequecy_server && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile
	$ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing. Sometimes is not helpping. Just restart.

```
1> frequency:start().
true
2> client_frequency:allocate().
{ok,910}
3> client_frequency:stop().
{error,[910]}
4> client_frequency:deallocate(910).
ok
5> client_frequency:stop().
ok
6> client_frequency:allocate().
** exception error: bad argument
7> frequency:start().
true
8> client_frequency:allocate_some(3).
{ok,[910,911,912]}
9> client_frequency:deallocate(910).
ok
10> client_frequency:deallocate(911).
ok
11> client_frequency:deallocate(912).
ok
12> client_frequency:stop().
ok
13> q().

```

```
whereis(frequency).
client_frequency:frequency().
```