-module(pattern_matching).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Pattern matching examples", fun simple_examples/0},
     {"Tuples", fun tuples/0},
     {"Int variable", fun int_variable/0},
     {"Bad match", fun examples2/0},
     {"Complex data", fun complex_data/0}].

simple_examples() ->
    Double = 1.3,
    Double = Double,
    {Double, 34} = {Double, 34},
    Tuple = {Double, 34},
    [true, Double, 23, {Double, Treble}] = [true,
                                            Double,
                                            23,
                                            Tuple],
    Treble = 34,
    34 = Treble,
    Sum1 = 1 + 2,
    Sum = 3,
    Sum1 = Sum,
    3 = Sum1,
    3 = Sum,
    List = [1, 2, 3, 4],
    [Head | Tail] = List,
    Head = 1,
    Tail = [2, 3, 4],
    ?assertException(error, {badmatch, _},
                     ([Head | Tail] = [1])),
    [Head | Tail] = List,
    [Head1 | Tail1] = [1],
    ?assertEqual(1, Head1),
    ?assertEqual([], Tail1).

tuples() ->
    {Element, Element, _} = {1, 1, 2},
    ?assertEqual(1, Element),
    ?assertEqual(Element, Element),
    _ = Element,
    {person, Name, SurName} = {person,
                               "Jan-Henry",
                               "Nystrom"},
    {person, "Jan-Henry", "Nystrom"} = {person,
                                        Name,
                                        SurName},
    ?assertException(error, {badmatch, _},
                     ([1, 2, 3] = [1, 2, 3, 4])).

int_variable() ->
    Int = 1,
    Int = 1 + 0,
    2 = Int + 1,
    % Compiling failed:
    % Int + 1 = 2,
    ?assertException(error, {badmatch, _}, (Int = Int + 1)).

examples2() ->
    ?assertException(error, {badmatch, _},
                     ({_A, _A, _B} = {abc, def, 123})),
    ?assertException(error, {badmatch, _},
                     ([_A, _B, _C, _D] = [1, 2, 3])),
    [_A, _B, _C | D] = [1, 2, 3],
    ?assertEqual([], D),
    [A, B | C] = [1, 2, 3, 4, 5, 6, 7],
    ?assertEqual(1, A),
    ?assertEqual(2, B),
    ?assertEqual([3, 4, 5, 6, 7], C),
    ?assertException(error, {badmatch, _},
                     ([_H | _T] = [])).

complex_data() ->
    {A, _, [B | _], {B}} = {abc, 23, [22, 23], {22}},
    ?assertEqual(abc, A),
    ?assertEqual(22, B),
    Var = {person, "Francesco", "Cesarini"},
    ?assertEqual({person, "Francesco", "Cesarini"}, Var),
    {person, Name, Surname} = Var,
    ?assertEqual({person, "Francesco", "Cesarini"},
                 {person, Name, Surname}),
    
    % marked (start with '_') variable can be used
    _A = 1,
    ?assertEqual(1, _A),
    
    {A, _, [B | _], {B}} = {abc, 21, [22, 25], {22}},

    {A, _int, [B|_], {B}} = {abc, 23, [22,23], {22}}
    .

-endif.
