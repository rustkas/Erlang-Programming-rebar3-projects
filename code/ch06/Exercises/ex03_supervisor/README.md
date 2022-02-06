ex03_supervisor
=====
```
rebar3 new lib ex03_supervisor && cd ex03_supervisor && rm -R src && mkdir lib && cd lib && rebar3 new lib supervisor && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell


Check working with Type (permanent, transient)	
```
1> supervisor:start_link(my_supervisor, [{add_two, start, [],transient}]).
ok
2> whereis(add_two).
<0.125.0>
3> exit(whereis(add_two), normal).
true
4> add_two:request(100).
102

5> exit(whereis(add_two), kill).
true

5> whereis(add_two).
<0.128.0>
6> supervisor:stop(my_supervisor).
ok
7> whereis(add_two).
undefined
8> whereis(my_supervisor).
undefined
```
