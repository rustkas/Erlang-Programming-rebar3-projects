-module(recurssion).

-export([bump/1, average/1, even/1, member/2]).

bump([]) -> [];
bump([Head | Tail]) -> [Head + 1| bump(Tail)].

average([]) -> 0;
average(List) -> sum(List) / len(List).

sum([]) -> 0;
sum([Head|Tail]) -> Head + sum(Tail).

len([]) -> 0;
len([_|Tail]) -> 1 + len(Tail).


even([]) -> [];
even([Head | Tail]) when Head rem 2 == 0 -> [Head | even(Tail)];
even([_Head | Tail]) -> even(Tail).

member(_, []) -> false;
member(Head, [Head|_Tail]) -> true;
member(Member, [_|Tail]) -> member(Member,Tail).


