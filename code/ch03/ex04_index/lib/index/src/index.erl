-module(index).

-export([value_of_case/2, value_of_inner_case/2]).

% Get value by list index using a case expression.

value_of_case(Index, List) ->
    value_of_case({Index, List}).

value_of_case(Tuple) ->
    case Tuple of
        {0, [Item | _]} -> Item;
        {N, [_ | Xs]} when N > 0 -> value_of_case(N - 1, Xs)
    end.

% Get value by list index using nested case expressions.

value_of_inner_case(Index, List) ->
    case Index of
        0 -> case List of [Z | _] -> Z end;
        N when N > 0 ->
            case List of
                [_ | Zs] -> value_of_inner_case(N - 1, Zs)
            end
    end.
