-module(member).

-export([find_item/2]).

find_item(List, Item) ->
    case lists:member(Item, List) of
        true -> ok;
        false -> {error, unkonwn_element}
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"How to use 'case of' examples", fun examples/0},
     {"Get return value of'case of'", fun get_example/0}].

examples() ->
    List = [bee, foo, too, coo],
    Result = member:find_item(List, foo),
    ?assertEqual(ok, Result),
    Result = member:find_item(List, bee),
    ?assertEqual(ok, Result),
    Result = member:find_item(List, too),
    ?assertEqual(ok, Result),
    Result = member:find_item(List, too),
    ?assertEqual(ok, Result),
    ?assertNotEqual(Result, (member:find_item(List, ok))),
    ?assertEqual({error, unkonwn_element},
                 (member:find_item(List, ok))).

get_example() ->
    List = [bee, foo, too, coo],
    Item1 = bee,
    Result1 = case lists:member(Item1, List) of
                  true -> ok;
                  false -> {error, unkonwn_element}
              end,
    ?assertEqual(ok, Result1),
    Item2 = foo,
    Result2 = case lists:member(Item2, List) of
                  true -> ok;
                  false -> {error, unkonwn_element}
              end,
    ?assertEqual(ok, Result2),
    Item3 = too,
    Result3 = case lists:member(Item3, List) of
                  true -> ok;
                  false -> {error, unkonwn_element}
              end,
    ?assertEqual(ok, Result3),
    Item4 = coo,
    Result4 = case lists:member(Item4, List) of
                  true -> ok;
                  false -> {error, unkonwn_element}
              end,
    ?assertEqual(ok, Result4),
    Item5 = re,
    Result5 = case lists:member(Item5, List) of
                  true -> ok;
                  false -> {error, unkonwn_element}
              end,
    ?assertEqual({error, unkonwn_element}, Result5).

-endif.
