-module(functions).

-export([doubleAll/1, revAll/1]).
-export([map/2, double/1]).
-export([evens/1, palins/1, is_palin/1, filter/2]).
-export([doubleAll2/1, palins2/1]).
-export([foreach/2]).
-export([times/1]).
-export([sendTo/1]).
-export([bar/0, foo/0]).
-export([next/1]).


doubleAll([]) ->
	[];
doubleAll([X|Xs]) ->
	[X*2 | doubleAll(Xs)].
	
revAll([]) -> [];
revAll([X|Xs]) ->
	revAll(Xs) ++ [X].
	
map(_F,[]) ->
	[];
map(F,[X|Xs]) ->
	[F(X) | map(F,Xs)].
	
double(X) -> X*2.	

evens([]) ->
	[];
evens([X|Xs]) ->
	case 0 =:= X rem 2 of
		true ->
			[X | evens(Xs)];
		false -> 
			evens(Xs)
	end.
	
palins([]) ->
	[];
palins([X|Xs]) ->	
	case is_palin(X) of
		true ->
			[X | palins(Xs)];
		false ->
			palins(Xs)
	end.

is_palin(X) ->
	X =:= revAll(X).

filter(_P, []) ->
	[];
filter(P, [X|Xs]) ->
	case P(X) of
		true ->
			[X | filter(P, Xs)];
		false -> 
			filter(P, Xs)
	end.

doubleAll2(Xs) ->
	map(fun(X) -> X*2 end, Xs).

palins2(Xs) ->
	filter(fun is_palin/1, Xs).	
	
foreach(_F, []) ->
	ok;
foreach(F, [X|Xs]) ->
	F(X),
	foreach(F,Xs).
	
times(X) ->
	fun(Y) -> X*Y end.

sendTo(Pid) ->
	fun(X) ->
		Pid ! X
	end.
	
foo() ->
	X = 2,
	Bump = fun(X1) -> X1+1 end,
	X + Bump(10).

bar() ->
	X = 3,
	Add = fun(Y) -> X + Y end,
	Add(10).

next(Seq) ->
	fun() -> [Seq | next(Seq+1)] end.