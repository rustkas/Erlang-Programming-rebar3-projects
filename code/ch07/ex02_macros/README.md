ex02_macros
=====
```
rebar3 new lib ex02_macros && cd ex02_macros && rm -R src && mkdir lib && cd lib && rebar3 new lib macros && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile &&  rebar3 shell
	> r3:do(compile).

```
macros:just_timeout().
macros:double(2).

macros:print("Hello, Erlang!~n",[]).
macros:test1().

macros:predined_values().

ifdef_macros:print("Hello~n",[]).

ifdef_macros:print().

c(ifdef_macros,[{u,debug}]).
c(ifdef_macros,['E']).
c(ifdef_macros,['P']).
c(ifdef_macros,['P',{u,debug}]).
c(ifdef_macros,['E',{u,debug}]).

```