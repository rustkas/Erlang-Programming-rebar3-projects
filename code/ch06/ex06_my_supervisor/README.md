ex06_my_supervisor
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	
```
1> my_supervisor:start_link(my_supervisor, [{add_two, start, []}]).
ok
2> whereis(add_two).
<0.125.0>
3> exit(whereis(add_two), kill).
true
4> add_two:request(100).
102
5> whereis(add_two).
<0.128.0>
6> my_supervisor:stop(my_supervisor).
ok
7> whereis(add_two).
undefined
8> whereis(my_supervisor).
undefined
```
