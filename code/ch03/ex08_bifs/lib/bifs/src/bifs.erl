%% coding: utf-8
-module(bifs).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"returns the hash of the Term in the "
      "specified range",
      fun hash/0},
     {"Check atom_to_list function",
      fun check_atom_to_list/0},
     {"Check atom_to_list function", fun display/0},
     {"Check some of BIFs", fun bifs/0},
     {"Check some of BIFs", fun bifs2/0}
     ].

hash() ->
    % ?debugFmt("~n~p~n", [erlang:phash2(ok,100)]),
    %   erlang:phash2(ok),
    ?assertEqual(1883, (erlang:phash2(ok))),
    ?assertEqual(83, (erlang:phash2(ok, 100))),
    ok.

check_atom_to_list() ->
    ?assertEqual("ok", (atom_to_list(ok))),
    ok.

display() ->
    % erlang:display(ok),
    ok.

bifs() ->
    List = [1, 2, 3],
    ?assertEqual(1, (hd(List))),
    ?assertEqual([2, 3], (tl(List))),
    ?assertEqual(3, (length(List))),
    Tuple = {ok, true},
    ?assertEqual(2, (tuple_size(Tuple))),
    ?assertEqual(true, (element(2,Tuple))),
    ?assertEqual({ok,false}, (setelement(2,Tuple,false))),
    ?assertEqual({one, two, three}, erlang:append_element({one, two}, three)),
    ok.

bifs2() ->
    List = [one, two, three,four,five],
    ?assertEqual(one, (hd(List))),
    ?assertEqual([two, three,four,five], (tl(List))),
    ?assertEqual(two, hd(tl(List))),
    Tuple = {1,2,3,4,5},
    ?assertEqual(5, (tuple_size(Tuple))),
    ?assertEqual(2, (element(2,Tuple))),
    ?assertEqual({1,2,three,4,5}, (setelement(3,Tuple,three))),
    ?assertEqual({1,2,3,4,5,6}, erlang:append_element(Tuple, 6)),
    ok.



-endif.
