-module(compare).

-export([create_new_record/3]).
-record(person, {name, phone, address}).


create_new_record(Name, Phone, Address) ->
  #person{phone=Phone, name=Name, address=Address}.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [
      {"Compare numbers", fun compare_numbers/0},
      {"Compare types", fun compare_types/0},
      {"Boo's examples", fun examples/0} ].

compare_numbers() -> 
  ?assert(2 + 2 == 4),
  ?assertEqual(false, 2 + 2 == 5),
  ?assert(2 + 2 /= 5),
  ?assertEqual(false, one == 1),
  ?assert(one == one),
  ?assert(1 == 1.0),
  ?assertEqual(false, 1 /= 1.0),
  ?assertEqual(false, 1 =:= 1.0),
  ?assertEqual(false, 1 =/= 1),
  ?assert(1 =/= 1.0),
  ?assert(1 < 2.0),
  ?assert(1 =< 2.0),
  ?assertEqual(false, 1 > 2.0),
  ?assertEqual(false, 1 >= 2.0).

% Checking the order of elements of different types
% number (float, integer) < atom < reference < fun < port < pid < record < tuple < map < list < string < binary (bitstring - subtype of binary)
compare_types() -> 
  Integer = 1,
  Float = 1.0,
  Atom = ok,
  Reference = make_ref(),
  Function = fun (X) -> X + 1 end,
  [Port | _] = erlang:ports(),
  Pid = self(),
  Tuple = {ok, 1.0,1.0,1.0,1.0,1.0,1.0,1.0},
  List = [Integer, Float, Atom, Reference],
  String = "Эрланг",
  BitString = <<"erlang">>,
  Map = #{a => "value_one", b => "value_two"},
  Binary = <<10,20>>,

  ?assert(is_binary(Binary)),

  Person = create_new_record("Robert", [0,8,2,3,4,3,1,2], "A street"),

  BigList = [Integer, Float, Atom, Reference, Function, Port, Pid, Tuple, List, String, BitString, Map, Person, Binary],
  % ?debugFmt("~n List size = ~p~n", [length(BigList)]),
  ReversedList = lists:reverse(BigList),
  SortResult = lists:sort(ReversedList),
  % ?debugFmt("~n~p~n", [SortResult]),
  
  ListItem1 = lists:nth(1, SortResult),
  if is_float(ListItem1) -> 
        ?assertEqual(Float, ListItem1);
     is_integer(ListItem1) ->
        ?assertEqual(Integer, ListItem1)
  end,    
  
  ListItem2 = lists:nth(2, SortResult),
  if is_float(ListItem2) -> 
        ?assertEqual(Float, ListItem2);
     is_integer(ListItem2) ->
        ?assertEqual(Integer, ListItem2)
  end,
  
  ?assert(is_atom(lists:nth(3, SortResult))),
  ?assertEqual(Atom, lists:nth(3, SortResult)),

  ?assert(is_reference(lists:nth(4, SortResult))),
  ?assertEqual(Reference, lists:nth(4, SortResult)),

  ?assert(is_function(lists:nth(5, SortResult))),
  ?assertEqual(Function, lists:nth(5, SortResult)),
  
  ?assert(is_port(lists:nth(6, SortResult))),
  ?assertEqual(Port, lists:nth(6, SortResult)),

  ?assert(is_pid(lists:nth(7, SortResult))),
  ?assertEqual(Pid, lists:nth(7, SortResult)),
  
  ?assert(is_tuple(lists:nth(8, SortResult))),
  ?assertEqual(Person, lists:nth(8, SortResult)),

  ?assert(is_tuple(lists:nth(9, SortResult))),
  ?assertEqual(Tuple, lists:nth(9, SortResult)),

  ?assert(is_map(lists:nth(10, SortResult))),
  ?assertEqual(Map, lists:nth(10, SortResult)),

  ?assert(is_list(lists:nth(11, SortResult))),
  ?assertEqual(List, lists:nth(11, SortResult)),

  ?assert(is_list(lists:nth(12, SortResult))),
  ?assertEqual(String, lists:nth(12, SortResult)),
  ?assertEqual("эрланг", string:lowercase(String)),
  ?assertEqual("ЭРЛАНГ", string:uppercase(String)),

  ?assert(is_binary(lists:nth(13, SortResult))),
  ?assertEqual(Binary, lists:nth(13, SortResult)),

  ?assert(is_bitstring(lists:nth(14, SortResult))),
  ?assertEqual(BitString, lists:nth(14, SortResult)),
  ?assertEqual("erlang", unicode:characters_to_list(BitString)),
  ?assertEqual(erlang, erlang:list_to_atom("erlang")).


examples() ->
  ?assertEqual(false, [boo, hoo] < [adder, zebra, bee]),
  ?assert([boo, hoo] < [boo, hoo, adder, zebra, bee]),

  ?assert({boo, hoo} < {adder, zebra, bee}),
  ?assert({boo, hoo} < {boo, hoo, adder, zebra, bee}),
  ?assertEqual(false, {boo, hoo, bee} < {adder, zebra, bee}),

  ?assert(1.0 == 1),
  ?assertEqual(false, 1.0 =:= 1),
  ?assert({1, 2} < [1, 2]),
  ?assert(1 =< 1.2),
  ?assert(1 =/= 1.0),
  ?assertEqual(false, (1 < 2) < 3),
  ?assert((1 > 2) == false).

-endif.
