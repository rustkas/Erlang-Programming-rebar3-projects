-module(proplists_examples).

-export([]).
	
%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
      {"Create new property list",  fun create/0},
      {"Compact a property list",  fun compact/0},
      {"Make tupes by unfold", fun unfold/0},
      {"Get data from the proplist", fun get_data/0}

     ].

create() ->
  Property1 = proplists:property(x, {1.0,0.0}),
  %   ?debugFmt("~n~p~n", [Property1])
  Property2 = proplists:property(x, {1.10,0.20}),
  Property3 = proplists:property(x, {41.10,50.20}),

  ?assertEqual({x, {1.0,0.0}}, Property1),
  ?assertEqual({x, {1.10,0.20}}, Property2),
  ?assertEqual({x, {41.10,50.20}}, Property3),

  PropertyMin1 = proplists:property(Property1),
  %   ?debugFmt("~n~p~n", [PropertyMin1]),
  ?assertEqual(Property1, PropertyMin1),
  ?assertEqual(Property2, proplists:property(Property2)),
  ?assertEqual(Property3, proplists:property(Property3)),
  ?assertEqual(x, proplists:property({x,true})),
  ?assertEqual({x, false}, proplists:property({x, false}))
%   ?debugFmt("~n~p~n", [proplists:property({x,true})]),
%   ?debugFmt("~n~p~n", [proplists:property({x,false})]),
  .

compact() ->
  Property1 = proplists:property(x, {1.0,0.0}),
  Property2 = proplists:property(x, {1.10,0.20}),
  Property3 = proplists:property(x, {41.10,50.20}),
  ProperyList = [Property1, Property2, Property3],
  Compact1 = proplists:compact(ProperyList),
%   ?debugFmt("~n~p~n", [Compact1])
  ?assertEqual(ProperyList, Compact1),
  ProperyList2 = [{x,true}] ++ ProperyList,
  Compact2 = proplists:compact(ProperyList2),   
  ?assertEqual([x] ++ ProperyList, Compact2)
%   ?debugFmt("~n~p~n", [Compact2])
.

unfold() ->
  List = [x,y,z],
  Result = proplists:unfold(List),
%   ?debugFmt("~n~p~n", [Result])
  ?assertEqual([{x,true},{y,true},{z,true}], Result)
.

get_data() ->
  Property1 = proplists:property(x, {1.0,0.0}),
  Property2 = proplists:property(x, {1.10,0.20}),
  Property3 = proplists:property(x, {41.10,50.20}),
  ProperyList = [Property1, Property2, Property3],
  Keys = proplists:get_keys(ProperyList),
%   ?debugFmt("~n~p~n", [Keys]),
  ?assertEqual([x], Keys),

  Value = proplists:get_value(x, ProperyList),
%   ?debugFmt("~n~p~n", [Value]),
  ?assertEqual({1.0,0.0}, Value),
  Value2 = proplists:get_value(y, ProperyList),
  ?assertEqual(undefined, Value2),
  Value3 = proplists:get_value(y, ProperyList, {0.0,0.0}),
  ?assertEqual({0.0,0.0}, Value3),

  AllValues = proplists:get_all_values(x, ProperyList),
%   ?debugFmt("~n~p~n", [AllValues]),
  ?assertEqual([{1.0,0.0},{1.1,0.2},{41.1,50.2}], AllValues),

  BooValue1 = proplists:get_bool(x,ProperyList),
%   ?debugFmt("~n~p~n", [BooValue1]),
  ?assertEqual(false, BooValue1),
  
  BoolPoropList1 = [{x, false}, {y, false},{z, false}],
%   ?debugFmt("~n~p~n", [proplists:get_bool(x,BoolPoropList1)]),

  ?assertEqual(false, proplists:get_bool(x,BoolPoropList1)),
  ?assertEqual(false, proplists:get_bool(y,BoolPoropList1)),
  ?assertEqual(false, proplists:get_bool(z,BoolPoropList1)),

  BoolPoropList2 = [{x, false}, {y, true},{z, true}],
  ?assertEqual(false, proplists:get_bool(x,BoolPoropList2)),
  ?assertEqual(true, proplists:get_bool(y,BoolPoropList2)),
  ?assertEqual(true, proplists:get_bool(z,BoolPoropList2)),
  ?assertEqual(false, proplists:get_bool(k,BoolPoropList2)),

%   ?debugFmt("~n~p~n", [proplists:expand([{coordinates, [x,y,z]}], [coordinates])]),
  ?assertEqual([x,y,z], proplists:expand([{coordinates, [x,y,z]}], [coordinates])),

  ?assertEqual([], proplists:delete(x, ProperyList))

.

-endif.	 