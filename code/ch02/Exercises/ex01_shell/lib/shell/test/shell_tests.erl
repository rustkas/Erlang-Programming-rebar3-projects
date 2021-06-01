-module(shell_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Erlang expressions", fun excercise_a/0},
     {"Assigning through pattern matching",
      fun excercise_b/0},
     {"Recursive list definitions", fun excercise_c/0},
     {"Flow of execution through pattern matching",
      fun excercise_d/0},
     {"Extracting values in composite data "
      "types through pattern matching",
      fun excercise_e/0},
     {"Additional research", fun excercise_e1/0}].

excercise_a() ->
    ?assertEqual(2, (1 + 1)),
    ?assertEqual([1, 2, 3], [1, 2, 3]).

excercise_b() ->
    A = 1,
    B = 2,
    ?assertEqual(3, (A + B)),
    ?assertException(error, {badmatch, _}, (A = A + 1)).

excercise_c() ->
    A = 1,
    L = [A, 2, 3],
    ?assertEqual([1, 2, 3], L),
    ?assertNotEqual((lists:reverse(L)), [[3, 2] | 1]),
    [H | T] = L,
    ?assertEqual(1, H),
    ?assertEqual([2, 3], T).

excercise_d() ->
    B = 2,
    2 = B,
    C = B,
    B = C,
    ?assertEqual(6, (B + C + 2)).

excercise_e() ->
    Person = {person, "Mike", "Wiliams", [1, 2, 3, 4]},
    ?assertEqual({person, "Mike", "Wiliams", [1, 2, 3, 4]},
                 Person),
    ?assertException(error, {badmatch, _},
                     ([{person, Name, Surname, Phone},
                       {person, Name, Surname, Phone}] =
                          person)),
    ?assertException(error, {badmatch, _},
                     ([{person, Name, Surname, Phone},
                       {person, Name, Surname, Phone}] =
                          [{developer, "Mike", "Wiliams", [1, 2, 3, 4]},
                           {developer, "Mike", "Wiliams", [1, 2, 3, 4]}])),
    ?assertException(error, {badmatch, _},
                     ([{person, Name, Surname, Phone},
                       {person, Name, Surname, Phone}] =
                          [{developer, "Nick", "Wiliams", [1, 2, 3, 4]},
                           {developer, "Nick", "Wiliams", [1, 2, 3, 4]}])),
    ?assertException(error, {badmatch, _},
                     ([{person, Name, Surname, Phone},
                       {person, Name, Surname, Phone}] =
                          [{developer, "Nick", "Miller", [1, 2, 3, 4]},
                           {developer, "Nick", "Miller", [1, 2, 3, 4]}])),
    ?assertException(error, {badmatch, _},
                     ([{person, Name, Surname, Phone},
                       {person, Name, Surname, Phone}] =
                          [{developer, "Nick", "Miller", {car, 2021}},
                           {developer, "Nick", "Miller", {car, 2021}}])),
    ?assertException(error, {badmatch, _},
                     ([{Name, person, Surname, Phone},
                       {Name, person, Surname, Phone}] =
                          [{"Nick", developer, "Miller", {car, 2021}},
                           {"Nick", developer, "Miller", {car, 2021}}])),
    ?assertException(error, {badmatch, _},
                     ([{Name, Surname, person, Phone},
                       {Name, Surname, person, Phone}] =
                          [{"Nick", "Miller", developer, {car, 2021}},
                           {"Nick", "Miller", developer, {car, 2021}}])),
    ?assertException(error, {badmatch, _},
                     ({Name, Name, Surname, Surname, Phone, Phone, person} =
                          {"Nick",
                           "Nick",
                           "Miller",
                           "Miller",
                           {car, 2021},
                           {car, 2021},
                           developer})),
    {person, Name, Surname, Phone} = Person,
    ?assertEqual("Mike", Name),
    ?assertEqual("Wiliams", Surname),
    ?assertEqual([1, 2, 3, 4], Phone).

excercise_e1() ->
    Person1 = {person, "Mike", "Wiliams", [1, 2, 3, 4]},
    ?assertEqual(([{person, Name, Surname, Phone},
                   {person, Name, Surname, Phone}] =
                      [Person1, Person1]),
                 (lists:duplicate(2, Person1))),
    Person2 = {person, "Nick", "Tomson", [4, 5, 3, 4]},
    ?assertEqual(([{person, Name, Surname, Phone},
                   {person, Name, Surname, Phone}] =
                      [Person2, Person2]),
                 (lists:duplicate(2, Person2))),
    Person3 = {person, "Eric", "Righner", [4, 8, 3, 4]},
    ?assertEqual(([{person, Name, Surname, Phone},
                   {person, Name, Surname, Phone}] =
                      [Person3, Person3]),
                 (lists:duplicate(2, Person3))).

-endif.
