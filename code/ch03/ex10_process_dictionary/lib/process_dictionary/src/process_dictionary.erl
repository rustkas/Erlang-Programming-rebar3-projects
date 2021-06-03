-module(process_dictionary).

-export([]).% More info about Process dictionary is here
            % http://erlang.org/doc/reference_manual/processes.html#process-dictionary
            %
            % Each process has its own process dictionary.
            % List of function to work with:

% http://erlang.org/doc/man/erlang.html#put-2
% put(Key, Value)

% http://erlang.org/doc/man/erlang.html#get-0
% get(Key)

% http://erlang.org/doc/man/erlang.html#get-1
% get()

% http://erlang.org/doc/man/erlang.html#get_keys-0
% get_keys()

% http://erlang.org/doc/man/erlang.html#get_keys-0
% get_keys(Value)

% http://erlang.org/doc/man/erlang.html#erase-0
% erase()

% http://erlang.org/doc/man/erlang.html#erase-1
% erase(Key)

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"get all items", fun get_examples/0},
     {"put item", fun put_examples/0},
     {"get_keys()", fun get_keys_examples/0},
     {"get_keys(Value)", fun get_keys_value_examples/0},
     {"get_keys(Value)", fun get_keys_value_examples2/0},
     {"erase(Key)", fun erase_examples/0},
     {"Where process dictionary is used?",
      fun where_process_dictionary_is_used/0}].

get_examples() ->
    % ?debugFmt("~n~p~n", [get()]),
    ?assertEqual([], (get())),
    ok.

put_examples() ->
    % ?debugFmt("~n~p~n", [put(name, walrus)]),
    % ?debugFmt("~n~p~n", [get()]),
    ?assertEqual([], (get())),
    ?assertEqual(undefined, (put(name, walrus))),
    ?assertEqual([{name, walrus}], (get())),
    ?assertEqual(walrus, (put(name, carpenter))),
    ?assertEqual([{name, carpenter}], (get())),
    ?assertEqual(carpenter, (get(name))),
    ?assertEqual([{name, carpenter}], (erase())),
    ?assertEqual([], (get())),
    ok.

get_keys_examples() ->
    ?assertEqual([], (get())),
    ?assertEqual(undefined, (put(dog, {animal, 1}))),
    ?assertEqual(undefined, (put(cow, {animal, 2}))),
    ?assertEqual(undefined, (put(lamb, {animal, 3}))),
    [fun (Value) ->
             %  ?debugFmt("~n~p~n", [Value]),
             ?assert((lists:any(fun (Elem) -> Elem == Value end,
                                [dog, cow, lamb])))
     end(Item)
     || Item <- get_keys()],
    ?assert((lists:any(fun (Elem) -> Elem == dog end,
                       get_keys()))),
    erase(),
    ?assertEqual([], (get())),
    ok.

get_keys_value_examples() ->
    case length(get()) > 0 of
        true -> erase();
        false -> ?assertEqual([], (get()))
    end,
    ?assertEqual(undefined, (put(dog, {animal, 1}))),
    ?assertEqual(undefined, (put(cow, {animal, 2}))),
    ?assertEqual(undefined, (put(lamb, {animal, 3}))),
    ?assertEqual(undefined, (put(lamb2, {animal, 3}))),
    Keys = get_keys({animal, 3}),
    [fun (Value) ->
             %  ?debugFmt("~n~p~n", [Value]),
             ?assert((lists:any(fun (Elem) -> Elem == Value end,
                                [lamb, lamb2])))
     end(Item)
     || Item <- Keys],
    erase(),
    ?assertEqual([], (get())),
    ok.

get_keys_value_examples2() ->
    ?assertEqual([], (get())),
    put(mary, {1, 2}),
    put(had, {1, 2}),
    put(a, {1, 2}),
    put(little, {1, 2}),
    put(dog, {1, 3}),
    put(lamb, {1, 2}),
    List = [mary, had, a, little, lamb],
    Keys = get_keys({1, 2}),
    [fun (Value) ->
             %  ?debugFmt("~n~p~n", [Value]),
             ?assert((lists:any(fun (Elem) -> Elem == Value end,
                                List)))
     end(Item)
     || Item <- Keys],
    erase(),
    ?assertEqual([], (get())),
    ok.

erase_examples() ->
    ?assertEqual([], (get())),
    put(key1, {merry, lambs, are, playing}),
    ?assertEqual({merry, lambs, are, playing},
                 (erase(key1))),
    ?assertEqual(undefined, (erase(key1))),
    erase(),
    ?assertEqual([], (get())),
    ok.

where_process_dictionary_is_used() ->
    ProcessDictionary1 = getProcessDictionary(),
    % ?debugFmt("~n~p~n", [ProcessDictionary1]),
    ?assertEqual([], ProcessDictionary1),
    put(dog, {animal, 1}),
    put(cow, {animal, 2}),
    put(lamb, {animal, 3}),
    ProcessDictionary2 = getProcessDictionary(),
    % ?debugFmt("~n~p~n", [ProcessDictionary2]),
    Item1 = lists:keyfind(dog, 1, ProcessDictionary2),
    % ?debugFmt("~n~p~n", [ProcessDictionary2]),
    ?assertEqual({dog, {animal, 1}}, Item1),
    Item2 = lists:keyfind(cow, 1, ProcessDictionary2),
    ?assertEqual({cow, {animal, 2}}, Item2),
    Item3 = lists:keyfind(lamb, 1, ProcessDictionary2),
    ?assertEqual({lamb, {animal, 3}}, Item3),
    erase(),
    ?assertEqual([], (get())),
    ProcessDictionary1 = getProcessDictionary(),
    ?assertEqual([], ProcessDictionary1),
    ok.

%% Util functions

getProcessDictionary() ->
    ProcessInfo = process_info(self()),
    % ?debugFmt("~n~p~n", [ProcessInfo]),
    {dictionary, ProcessDictionary} =
        lists:keyfind(dictionary, 1, ProcessInfo),
    ProcessDictionary.

-endif.
