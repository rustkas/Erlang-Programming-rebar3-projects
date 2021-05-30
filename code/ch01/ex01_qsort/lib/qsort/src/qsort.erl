-module(qsort).

-export([qsort/1]).

qsort([]) -> [];
qsort([X | Xs]) ->
    qsort([Y || Y <- Xs, Y =< X]) ++
        [X] ++ qsort([Y || Y <- Xs, Y > X]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"empty", fun qsort_0/0},
     {"list of numbers", fun qsort_1/0},
     {"list of zeros", fun qsort_2/0},
     {"list of terms", fun qsort_3/0}].

qsort_0() -> ?assertEqual([], (qsort([]))).

% 10, 4, 2, 14, 67, 2, 11, 33, 1, 15

qsort_1() ->
    % ?debugFmt("~n~p~n",[qsort([10, 4, 2, 14, 67, 2, 11, 33, 1, 15])])
    ?assertEqual([1, 2, 2, 4, 10, 11, 14, 15, 33, 67],
                 (qsort([10, 4, 2, 14, 67, 2, 11, 33, 1, 15]))).

qsort_2() ->
    % ?debugFmt("~n~p~n",[qsort([0.0, 0])])
    ?assertEqual([0, 0.0], (qsort([0.0, 0]))).

qsort_3() ->
    % ?debugFmt("~n~p~n",
    %           [qsort([$0, [$H, $e, $l, $l, $o, $\s, $W, $o, $r, $l, $d],
    %                   {123, bed},
    %                   ok,
    %                   0.0,
    %                   0])]).
    ?assertEqual([0,
                  0.0,
                  48,
                  ok,
                  {123, bed},
                  "Hello World"],
                 (qsort([$0,
                         [$H, $e, $l, $l, $o, $\s, $W, $o, $r, $l, $d],
                         {123, bed},
                         ok,
                         0.0,
                         0]))).

-endif.
