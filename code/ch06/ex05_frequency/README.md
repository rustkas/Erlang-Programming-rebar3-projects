ex05_frequency
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	
```
1> frequency:start().
true
2> frequency:allocate().
{ok,10}
3> exit(self(), kill).
** exception exit: killed
4> frequency:allocate().
{ok,10}
```
