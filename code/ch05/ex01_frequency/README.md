ex01_frequency
=====
rebar3 new lib ex01_frequency && cd ex01_frequency && rm -R src && mkdir lib && cd lib && rebar3 new lib frequency && cd ..

An OTP library

Build
-----

	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 

```
1> c(frequency).
{ok,frequency}
2> frequency:start().
true
3> client_frequency:allocate().
{ok,10}
4> frequency:allocate().
{ok,11}
5> client_frequency:allocate().
{ok,12}
6> client_frequency:allocate().
{ok,13}
7> client_frequency:allocate().
{ok,14}
8> client_frequency:allocate().
{ok,15}
9> client_frequency:allocate().
{error,no_frequency}
10> client_frequency:deallocate(11).
ok
11> client_frequency:allocate().
{ok,11}
12> client_frequency:stop().
ok
```