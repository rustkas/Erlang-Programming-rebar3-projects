-module(lists_examples).

-export([]).
%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
{timeout, 20,
    [
      {"Generate list, tupels",  fun generate/0},
      {"Try to use any types of data for making a list",  fun is_it_list/0},
      {"Book's examples", fun examples/0},
      {"Creating lists", fun list_building/0},
      {"Creating irregular lists", fun irregular_lists/0},
      {"lists' functions", fun lists_functions/0},
      {"Additional lists' operations", fun lists_operations/0}
    ]}.

generate() ->

% BigNumber = 100000000000000000000000000000000000000000000000000000000000000000000000 * 100000000000000000000000000000000000000000000000000000000000000000000000,
% ?debugFmt("~n~p~n",[list_to_tuple(lists:seq(1, 20))]),
% lists:duplicate(BigNumber, ok)
% lists:duplicate(100, ok)
% lists:seq(1, BigNumber),

    ?assertEqual([ok,ok,ok,ok,ok,ok,ok,ok,ok,ok], lists:duplicate(10, ok)),

    ?assertEqual([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], lists:seq(1, 20)),
    ?assertEqual({1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}, list_to_tuple(lists:seq(1, 20))).

is_it_list() ->
    ?assert(is_list([true, false])),
    ?assert(is_list([$a, $b])),
    ?assert(is_list([{a, $a}, {b, $b}])),
    ?assert(is_list([true, false, $a, $b, {a, $a}, {b, $b}, []])).

examples() ->
  % ?debugFmt("~n~p~n",[[72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]]),
  ?assert(is_list([january, february, march])),
  ?assert(is_list([a, [b, [c, d, e], f], g])),
  ?assert(is_list([])),
  ?assert(is_list([{person, 'Joe', 'Armstrong'}, {person, 'Robert', 'Virding'}, 
    {person, 'Mike', 'Williams'}])),

  ?assertEqual(65, $A),
  ?assertEqual(97, $A + 32),
  ?assertEqual(97, $a),
  ?assertEqual("ABC", [65, 66, 67]),
  ?assertEqual("Cat", [67, $A+32,$A+51]),

  ?assert(is_list([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100])),
  ?assert(is_list([$H, $e, $l, $l, $o, $ , $W, $o, $r, $l, $d])),
  
  ?assertEqual("Hello World",
     [72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]),
  ?assertEqual([$H, $e, $l, $l, $o, $ , $W, $o, $r, $l, $d],
     "Hello World"),
  ?assertEqual([$H, $e, $l, $l, $o, $ , $W, $o, $r, $l, $d],
     [72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]),

  ?assertEqual("", []).

list_building() ->
  [Head | Tail] = [1,2,3],
  ?assertEqual([Head | Tail], [1,2,3]),
  ?assertEqual(1, Head),
  ?assertEqual([2,3], Tail),

  ?assertEqual([Head | Tail], [1, 2 |[3]]),
  ?assertEqual([Head | Tail], [1 |[2,3]]),
  ?assertEqual([Head | Tail], [1 |[2 | [3]]]),
  ?assertEqual([Head | Tail], [1 |[2 | [3 | []]]]),

  ?assertEqual([one, two, three, four], [one, two, three, four | []]),
  ?assertEqual([one, two, three, four], [one, two | [three, four]]),
  ?assertEqual([one, two, three, four], [one, two | [three | [four | []]]]),
  ?assertEqual([one, two, three, four], [one | [two | [three | [four | []]]]]).

irregular_lists() ->
  List1 = [[1,2] | 3],
  [Head | Tail] = List1,

  ?assertEqual([1, 2], Head),
  ?assertEqual(3, Tail),
  % ?debugFmt("~n~p~n", [Tail]).

  List2 = [ 1, 2 | foo],
  [Head2 | Tail2] = List2,
  ?assertEqual(1, Head2),
  ?assertEqual( [2 | foo], Tail2).

lists_functions() ->
  ?assertEqual(3, lists:max([1,2,3])),
  ?assertEqual([3,2,1], lists:reverse([1,2,3])),
  ?assertEqual([1,2,3], lists:sort([2,1,3])),
  ?assertEqual({[3,4], [10,7,9]}, lists:split(2, [3,4,10,7,9])),
  ?assertEqual(33, lists:sum([3,4,10,7,9])),
  ?assertEqual([{1,5},{2,6},{3,7}], lists:zip([1,2,3],[5,6,7])),
  ?assertEqual([1,3,2,4,2], lists:delete(2, [1,2,3,2,4,2])),
  ?assertEqual(3, lists:last([1,2,3])),
  ?assertEqual(false, lists:member(5,[1,24])),
  ?assert(lists:member(24,[1,24])),
  ?assertEqual(4, lists:nth(2,[3,4,10,7,9])),
  ?assertEqual(3, erlang:length([1,2,3])),
  ?assertEqual(3, length([1,2,3])),
  ?assertEqual([1,2,3,a,b,4,5,6], lists:append([[1, 2, 3], [a, b], [4, 5, 6]])),
  ?assertEqual("Hello Concurrent World", string:join(["Hello ", "Concurrent " | ["World"]], "")).

lists_operations() ->
  ?assertEqual([monday, tuesday, wednesday], [monday, tuesday, wednesday]),
  ?assertEqual([1,2,3], [1 | [2 | [3 | []]]]),
  ?assertEqual([a, mixed, "list", {width,4}, 'data types'], ['a', 'mixed', "list", {width,4}, 'data types']),
  ?assertEqual(lists:seq(1,6), [1,2,3] ++ [4,5,6]),
  ?assertEqual([1,2,3,4], [1,2,2,3,4,4] -- [2,4]),
  ?assertEqual("A long string I have split across several lines", "A long string I have split " "across several lines"),
  ?assertEqual([1], [1,1] -- [1]),
  ?assertEqual([2,3], [1,2,3,4] -- [1,4]),
  ?assertEqual([2], [1,2] -- [1,1,3]),
  ?assertEqual([1,2], [1,2,3] -- [1,3] -- [1,2]),
  ?assertEqual([], ([1,2,3] -- [1,3]) -- [1,2]),
  ?assertEqual([1,2,3,4], [1 | [2,3,4]]),
  ?assertEqual([1,2,3,4], [1] ++ [2,3,4]).

-endif.	 