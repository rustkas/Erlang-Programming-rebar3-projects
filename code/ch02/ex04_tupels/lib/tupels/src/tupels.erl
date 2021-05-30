-module(tupels).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Demonstration what tupels is", fun demonstration/0},
     {"Using tupels BIFs - Built In Functions "
      "(BIFs)",
      fun tuple_bifs/0},
     {"Additional tuple functions", fun tuple_functions/0}].

demonstration() ->
    List = [{123, bcd},
            {123, def, abc},
            {abc, {def, 123}, ghi},
            {},
            {person, 'Joe', 'Armstrong'},
            {person, 'Mike', 'Williams'}],
    % check that all elements of the list (List) is a tuple
    % result of list generation is empty list because logical operator 'not' is used
    % to reverse correct checking
    ?assertEqual([], [X || X <- List, not is_tuple(X)]),
    ?assertEqual(List, [X || X <- List, is_tuple(X)]).

tuple_bifs() ->
    Tuple = {abc, {def, 123}, ghi},
    ?assertEqual(3, (tuple_size(Tuple))),
    ?assertEqual({def, 123}, (element(2, Tuple))),
    Tuple1 = setelement(2, Tuple, def),
    ?assertEqual({abc, def, ghi}, Tuple1),
    Tuple2 = setelement(3, Tuple1, def),
    ?assertEqual({abc, def, def}, Tuple2),
    Tuple3 = setelement(1, Tuple2, def),
    ?assertEqual({def, def, def}, Tuple3),
    ?assert(({1, 2} < {1, 3})),
    ?assertEqual(false, ({2, 3} < {2, 3})),
    ?assertEqual(false, ({1, 2} == {2, 3})),
    ?assert(({1, 2} == {1, 2})),
    ?assert(({1, 2} == {1.0, 2})),
    ?assert(({1, 2} == {1.0, 2.0})),
    ?assert(({1, 2} =:= {1, 2})),
    ?assert(({1, 2} =/= {1.0, 2})).

tuple_functions() ->
    ?assertEqual({[]}, (erlang:make_tuple(1, []))),
    ?assertEqual({[2], [2]}, (erlang:make_tuple(2, [2]))),
    ?assertEqual({[], aa, [], [], zz},
                 (erlang:make_tuple(5,
                                    [],
                                    [{2, ignored}, {5, zz}, {2, aa}]))),
    ?assertEqual({undefined, aa, undefined, undefined, zz},
                 (erlang:make_tuple(5,
                                    undefined,
                                    [{2, ignored}, {5, zz}, {2, aa}]))),
    ?assertEqual({share, ['Ericsson_B', 163]},
                 (list_to_tuple([share, ['Ericsson_B', 163]]))),
    ?assertEqual([share, {'Ericsson_B', 163}],
                 (tuple_to_list({share, {'Ericsson_B', 163}}))),
    ?assertEqual([{'First Name', 'Arnold'},
                  {'Middle Name', 'Alois'},
                  {'Last Name', 'Schwarzenegger'}],
                 (lists:zipwith(fun (X, Y) -> {X, Y} end,
                                ['First Name', 'Middle Name', 'Last Name'],
                                ['Arnold', 'Alois', 'Schwarzenegger']))),
    ?assertEqual([1, 2],
                 (lists:filtermap(fun (X) ->
                                          case X rem 2 of
                                              0 -> {true, X div 2};
                                              _ -> false
                                          end
                                  end,
                                  [1, 2, 3, 4, 5]))),
    TupleList = [{x, {1.0, 1.0}},
                 {y, {2.0, 2.0}},
                 {z, {3.0, 3.0}}],
    ?assertEqual([{x, {1.0, 1.0}}, {y, {2.0, 2.0}}],
                 (lists:keydelete(z, 1, TupleList))),
    ?assertEqual({x, {1.0, 1.0}},
                 (lists:keyfind(x, 1, TupleList))),
    ?assertEqual([{name, "Евгения", 22},
                  {name, "Lizzie", 20},
                  {name, "Lydia", 15}],
                 (lists:keymap(fun (Atom) -> atom_to_list(Atom) end,
                               2,
                               [{name, 'Евгения', 22},
                                {name, 'Lizzie', 20},
                                {name, 'Lydia', 15}]))),
    ?assert((lists:keymember(x, 1, TupleList))),
    ?assertEqual(TupleList,
                 (lists:keymerge(1,
                                 [{x, {1.0, 1.0}}, {y, {2.0, 2.0}}],
                                 [{z, {3.0, 3.0}}]))),
    ?assertEqual([{x, {323.5, 673.78903}},
                  {y, {2.0, 2.0}},
                  {z, {3.0, 3.0}}],
                 (lists:keyreplace(x,
                                   1,
                                   TupleList,
                                   {x, {323.5, 673.78903}}))),
    ?assertEqual(false, (lists:keysearch(k, 1, TupleList))),
    ?assertEqual({value, {x, {1.0, 1.0}}},
                 (lists:keysearch(x, 1, TupleList))),
    ?assertEqual(TupleList, (lists:keysort(1, TupleList))),
    ?assertEqual([{x, {323.5, 673.78903}},
                  {y, {2.0, 2.0}},
                  {z, {3.0, 3.0}}],
                 (lists:keystore(x,
                                 1,
                                 TupleList,
                                 {x, {323.5, 673.78903}}))),
    ?assertEqual([{undefined, {323.5, 673.78903}},
                  {y, {2.0, 2.0}},
                  {z, {3.0, 3.0}}],
                 (lists:keystore(x,
                                 1,
                                 TupleList,
                                 {undefined, {323.5, 673.78903}}))),
    ?assertEqual([{x, {1.0, 1.0}},
                  {y, {2.0, 2.0}},
                  {z, {3.0, 3.0}},
                  {x, {323.5, 673.78903}}],
                 (lists:keystore('_',
                                 1,
                                 TupleList,
                                 {x, {323.5, 673.78903}}))),
    ?assertEqual({value,
                  {x, {1.0, 1.0}},
                  [{y, {2.0, 2.0}}, {z, {3.0, 3.0}}]},
                 (lists:keytake(x, 1, TupleList))),
    ?assertEqual(TupleList,
                 (lists:ukeymerge(1,
                                  TupleList,
                                  [{x, {17.0, 1.0}},
                                   {y, {20.0, 2.0}},
                                   {z, {38.0, 3.0}}]))),
    ?assertEqual([{r, {3.0, 3.0}} | TupleList],
                 (lists:umerge([TupleList,
                                TupleList,
                                [{r, {3.0, 3.0}}]]))),
    ?assertEqual({[x, y, z],
                  [{17.0, 1.0}, {20.0, 2.0}, {38.0, 3.0}],
                  [{17.0, 1.0}, {20.0, 2.0}, {38.0, 3.0}]},
                 (lists:unzip3([{x, {17.0, 1.0}, {17.0, 1.0}},
                                {y, {20.0, 2.0}, {20.0, 2.0}},
                                {z, {38.0, 3.0}, {38.0, 3.0}}]))).

-endif.
