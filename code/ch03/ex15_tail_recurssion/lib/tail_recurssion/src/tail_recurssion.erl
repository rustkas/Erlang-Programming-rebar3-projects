-module(tail_recurssion).

-export([sum/1, bump/1, merge/2, average/1]).
-export([sum2/1]).

sum(L) -> sum_acc(L, 0).

sum_acc([],Sum) -> Sum;
sum_acc([Head | Tail],Sum) -> sum_acc(Tail, Head + Sum).

sum2(Boundary) -> sum_acc2(1, Boundary, 0).

sum_acc2(Index, Boundary, Sum) when Index =< Boundary ->
	sum_acc2(Index+1, Boundary, Sum+Index);
sum_acc2(_Index, _Boundary, Sum) -> Sum.	

bump(List) -> bump_acc(List, []).

bump_acc([], AccList) -> reverce(AccList);
bump_acc([Head | Tail], AccList) -> bump_acc(Tail, [Head + 1 | AccList]).

reverce(List) -> reverce_acc(List, []).

reverce_acc([], AccList) -> AccList;
reverce_acc([Head | Tail], AccList) -> reverce_acc(Tail, [Head | AccList]).

merge(Xs,Ys) ->
	lists:reverse(mergeL(Xs,Ys,[])).
	
mergeL([X|Xs],Ys,Zs) ->
	mergeR(Xs,Ys,[X|Zs]);
mergeL([],[],Zs) ->
	Zs.
	
mergeR(Xs,[Y|Ys],Zs) ->
	mergeL(Xs,Ys,[Y|Zs]);
mergeR([],[],Zs) ->
	Zs.

average(List) -> average_acc(List, 0, 0).

average_acc([], Sum, Length) -> Sum/Length;
average_acc([Head | Tail], Sum, Length) -> average_acc(Tail, Head + Sum, 1 + Length).
	