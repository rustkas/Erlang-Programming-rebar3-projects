-module(macros).

-export([just_timeout/0,double/1]).
-export([tsFun/2]).
-export([print/2]).
-export([test1/0]).
-export([predined_values/0]).

-define(TIMEOUT, 1000).

-define(FUNC,X).
-define(TION,+X).

-define(Multiple(X,Y),X rem Y == 0).

%-define(DBG(_Str, _Args), ok).
-define(DBG(Str, Args), io:format(Str, Args)).

-define(VALUE(Call), io:format("~p = ~p~n", [??Call,Call])).

double(X) -> ?FUNC?TION.

just_timeout() ->
	receive 
	after  ?TIMEOUT -> ok
	end.
	
tsFun(Z,M) when ?Multiple(Z,M) -> true;
tsFun(Z,M)                     -> Z == M.

print(Str,Args) -> ?DBG(Str, Args).

test1() -> ?VALUE(length([1,2,3])).

predined_values() -> io:format("~p, ~p, ~p, ~p, ~p~n",[?MODULE,?MODULE_STRING,?FILE,?LINE,?MACHINE]).