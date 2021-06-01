-module(chapter2_tests).

-export([]).
%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
      {"Check area function", fun area/0},
      {"Check flatten function", fun flatten/0},
      {"Check factorial function", fun factorial/0}
     ].

area() ->
    % ?debugFmt("~n~p~n", [float_to_list(chapter2:area({circle, 2}),[{decimals, 2}])]),
    ?assertEqual(4, chapter2:area({square, 2})),
    ?assertEqual(4, chapter2:area2({square, 2})),
    ?assertEqual(math:pi()*2*2, chapter2:area({circle, 2})),
    ?assertEqual(math:pi()*2*2, chapter2:area2({circle, 2})),
    ?assert(chapter2:area({triangle,1,1,1}) > 0.0),
    ?assert(chapter2:area2({triangle,1,1,1}) > 0.0),
    ?assertEqual({error, invalid_object}, chapter2:area({pentagon,1,1,1,1,1})),
    ?assertEqual({error, invalid_object}, chapter2:area2({pentagon,1,1,1,1,1})),

    % convert long float value to a string and reduce the fractional part to a certain value
    FloatAsString = float_to_list(chapter2:area({circle, 2}),[{decimals, 2}]),
    % ?debugFmt("~n~p~n", [FloatAsString]),
    StringAsFloat = string:to_float(FloatAsString),
    % ?debugFmt("~n~p~n", [StringAsFloat])
    ?assertEqual({12.57,[]}, StringAsFloat),

    % using custom functions to achive the some result in a simple, light way
    ?assertEqual(12.57, sstr:to_float(sstr:float_to_list(chapter2:area({circle, 2}), 2))).


flatten()->
    ?assertEqual(square, chapter2:flatten(cube)),
    ?assertEqual(circle, chapter2:flatten(sphere)),
    ?assertEqual({error, unknown_shape}, chapter2:flatten(parallelogram)),
    ?assertEqual({error, unknown_shape}, chapter2:flatten(cone)).

factorial()->
    % ?debugFmt("~n~p~n", [chapter2:factorial(4)]),
    ?assertEqual(1, chapter2:factorial(1)),
    ?assertEqual(1, chapter2:factorial2(1)),
    ?assertEqual(2, chapter2:factorial(2)),
    ?assertEqual(2, chapter2:factorial2(2)),
    ?assertEqual(6, chapter2:factorial(3)),
    ?assertEqual(6, chapter2:factorial2(3)),
    ?assertEqual(24, chapter2:factorial(4)),
    ?assertEqual(24, chapter2:factorial2(4)).

-endif.	 