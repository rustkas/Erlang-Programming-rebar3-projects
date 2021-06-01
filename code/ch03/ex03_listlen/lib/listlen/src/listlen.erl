-module(listlen).

-export([listlen_tail/1, listlen2_tail/1]).

% Calculating the length of a list.

listlen_tail([]) -> 0;
listlen_tail(Xs) -> listlen_tail(Xs, 0).

listlen_tail([], Length) -> Length;
listlen_tail([_ | Xs], Length) ->
    listlen_tail(Xs, Length + 1).

% Defining an index function using a case expression.

listlen2_tail(List) ->
    listlen2_tail(List, 0).

listlen2_tail(List, Length) -> 
    case List of
        [] -> Length;
        [_ | Xs] -> listlen2_tail(Xs, Length + 1)
    end.

