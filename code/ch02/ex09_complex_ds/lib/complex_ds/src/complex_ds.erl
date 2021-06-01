-module(complex_ds).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Create Complex data types", fun create/0},
     {"Name the variables with their data types", fun readability/0}].

create() ->
    List =
        [{person,
          "Joe",
          "Armstrong",
          [{shoeSize, 42},
           {pets, [{cat, "Zorro"}, {cat, "Daisy"}]},
           {children, [{"Thomas", 21}, {"Claire", 17}]}]},
         {person,
          "Mike",
          "Williams",
          [{shoeSize, 41}, {likes, ['boats', 'wine']}]}],
    List.  % ?debugFmt("~n~p~n", [List])

readability() ->
    JoeAttributeList =
        [{shoeSize, 42},
         {pets, [{cat, "Zorro"}, {cat, "Daisy"}]},
         {children, [{"Thomas", 21}, {"Claire", 17}]}],
    JoeTuple = {person, "Joe", "Armstrong", JoeAttributeList},
    % ?debugFmt("~n~p~n", [JoeTuple]),
    MikeAttributeList = [{shoeSize, 41}, {likes, ['boats', 'wine']}],
    MikeTuple = {person, "Mike", "Williams", MikeAttributeList},
    People = [JoeTuple, MikeTuple],
    People.

.
-endif.
