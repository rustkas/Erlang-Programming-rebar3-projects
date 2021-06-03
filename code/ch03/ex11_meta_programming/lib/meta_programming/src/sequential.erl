-module(sequential).

-export([listlen/1]).

% Calculating the length of a list.

listlen([])     -> 0;
listlen([_|Xs]) -> 1 + listlen(Xs).