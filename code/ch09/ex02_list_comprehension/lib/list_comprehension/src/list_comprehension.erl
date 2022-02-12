-module(list_comprehension).

-export([map/2, filter/2, append/1]).
-export([perms/1, splits/1, insert/3]).
-export([perms2/1]).
-export([qsort/1]).


map(F,Xs) -> [ F(X) || X <-Xs ].
filter(P,Xs) -> [ X || X <-Xs, P(X) ].
append(Xss) -> [ X || Xs <- Xss, X <- Xs ].

perms([]) ->
	[[]];

perms([X|Xs]) ->
	[ insert(X,As,Bs) || Ps <- perms(Xs), {As,Bs} <- splits(Ps) ].

splits([]) ->
	[{[],[]}];
splits([X|Xs] = Ys) ->
	[ {[],Ys} | [ { [X|As] , Bs} || {As,Bs} <- splits(Xs) ] ].

insert(X,As,Bs) when is_list(As),is_list(Bs) ->
	lists:append([As,[X],Bs]).
	
perms2([]) -> [[]];
perms2(L)  -> [[H|T] || H <- L, T <- perms2(L -- [H])].

qsort([]) -> [];
qsort([X|Xs]) ->
	qsort([Y || Y <- Xs, Y =< X]) ++ [X] ++ qsort([Y || Y <- Xs, Y > X]).