-module(variable_scope).

-export([scope1/1,
         scope2/1,
         scope3/1,
         scope4/1,
         scope5/1,
         scope6/1]).

-export([unsafe/1, safe/1, preferred/1]).

-export([check_if_01/1,
         check_if_02/1,
         check_x/1,
         check_any/1]).

-export([calculate_rem_if/1, calculate_rem_case/1]).

% Produce badmatch error

scope1(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            Value2 = 1,
            Value3 = 3;
        [Head | Tail] ->
            Value1 = 0,
            Value2 = Head,
            Value3 = hd(Tail)
    end,
    % Variable2 was init in 'case'
    Value2 = 10,
    % Variable3 was init in 'case'
    Value3 = 100,
    Value1 + Value2 + Value3.

% Using variables exported from 'case'

scope2(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            Value2 = 1,
            Value3 = 3;
        [Head | Tail] ->
            Value1 = 0,
            Value2 = Head,
            Value3 = hd(Tail)
    end,
    Value1 + Value2 + Value3.

% Using variables exported from 'case'
% excluse variable by '_' prefix

scope3(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            _Value2 = 1,
            Value3 = 3;
        [Head | Tail] ->
            Value1 = 0,
            _Value2 = Head,
            % hd can get wrong input
            Value3 = hd(Tail)
    end,
    Value3.

% Using variables exported from 'case'
% Guard casee clause

scope4(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            _Value2 = 1,
            Value3 = 3;
        [Head | Tail] when length(Tail) > 0 ->
            Value1 = 0,
            _Value2 = Head,
            Value3 = hd(Tail)
    end,
    Value3.

scope5(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            Value2 = 1,
            Value3 = 3;
        % If Head and Tail initialiad here and used again in anywhere
        % compile raise an error
        % [Head | Tail] when length(Tail) > 0 ->
        [Head1 | Tail1] when length(Tail1) > 0 ->
            Value1 = 0,
            Value2 = Head1,
            Value3 = hd(Tail1)
    end,
    case List of
        [] ->
            % Value2 exproted from previous 'case'
            Value2 = 1,
            Value2 = 1 + 0,
            Value4 = 0,
            Value5 = 1,
            Value6 = 3;
        % [Head | Tail] when length(Tail) > 0 ->
        [Head2 | Tail2] when length(Tail2) > 0 ->
            Value4 = 0,
            Value5 = Head2,
            Value6 = hd(Tail2)
    end,
    Value1 + Value2 + Value3 + Value4 + Value5 + Value6.

% If variable initialised in peticular case only, it can not be used after export.
% Compoler raise an erors
% - "variable 'Value2' unsafe in 'case'"
% - "variable 'Value3' unsafe in 'case'"
% - "variable 'Value4' unsafe in 'case'"
% - "variable 'Value5' unsafe in 'case'"
% Variable6 initialised in all 'case' blocks. That is way it can be used after export from 'case'.
scope6(List) ->
    Value1 = 0,
    case List of
        [] ->
            Value1 = 0,
            % use pattern matching twice to stab compiler wroning
            % about unused variable
            Value2 = 1,
            Value2 = 1,
            Value3 = 3,
            Value3 = 3,
            Value6 = 0;
        [Head1 | Tail1] when length(Tail1) > 0 ->
            Value1 = 0,
            Value4 = Head1,
            Value4 = Head1,
            Value5 = hd(Tail1),
            Value5 = hd(Tail1),
            Value6 = 0
    end,
    Value1
        % + Value2 + Value3 + Value4 + Value5
        +
        Value6.

% "as is" function is not compiled (with returning 'Y'variable)
unsafe(X) ->
    case X of
        one ->
            Y = true,
            Y = true;
        _ ->
            Z = two,
            Z = two
    end,
    % Y.
    X.

safe(X) when is_number(X); is_float(X) ->
    case X of
        one -> Y = 12;
        _ -> Y = 196
    end,
    X + Y.

preferred(X) when is_number(X); is_float(X) ->
    Y = case X of
            one -> 12;
            _ -> 196
        end,
    X + Y.

-record(ok, {}).

% http://erlang.org/doc/reference_manual/expressions.html#guard-expressions

check_if_01(X) ->
    Result = if is_atom(X) -> ok;
                is_binary(X) -> <<1, 2, 3, 4, 5, 6, 7, 8, 9, 10>>;
                is_bitstring(X) -> <<"ok">>;
                is_boolean(X) -> true;
                is_float(X) -> 0.0;
                is_function(X) -> true;
                is_function(X, 1) -> true;
                is_integer(X) -> 0;
                is_list(X) -> [];
                is_map(X) -> true;
                is_number(X) -> true;
                is_pid(X) -> true;
                is_port(X) -> true;
                is_record(X, ok) -> true;
                is_record(X, ok, 2) -> true;
                is_reference(X) -> true;
                is_tuple(X) -> true
             end,
    Result.

check_if_02(X) ->
    Result = if is_number(X) and not is_float(X) -> number;
                true -> true
             end,
    Result.

check_x(X) when is_number(X) ->
    Result = if X < 1 -> smaller;
                X > 1 -> greater;
                X == 1 -> equal
             end,
    Result.

check_any(X) ->
    Result = if is_number(X) ->
                    if X < 1 -> smaller;
                       X > 1 -> greater;
                       true -> equal
                    end;
                true -> equal
             end,
    Result.

calculate_rem_if(X) ->
    Result = if is_number(X) ->
                    if X rem 2 == 1 -> odd;
                       X rem 2 == 0 -> even
                    end;
                true -> undefined
             end,
    Result.

calculate_rem_case(X) ->
    Result = if is_number(X) ->
                    case X rem 2 of
                        1 -> odd;
                        0 -> even
                    end;
                true -> undefined
             end,
    Result.
