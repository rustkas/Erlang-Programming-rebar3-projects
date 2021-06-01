-module(shapes_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
     {"Run shapes:area/1",  fun area/0}
     ].

area()->
    % ?debugFmt("~n~p~n", [float_to_list(shapes:area({circle, 2}),[{decimals, 2}])]),
    ?assertEqual(4, shapes:area({square, 2})),
    ?assertEqual(math:pi()*2*2, shapes:area({circle, 2})),
    ?assert(shapes:area({triangle,1,1,1}) > 0.0),
    ?assertEqual({error, invalid_object}, shapes:area({pentagon,1,1,1,1,1})),
    

    % convert long float value to a string and reduce the fractional part to a certain value
    FloatAsString = float_to_list(shapes:area({circle, 2}),[{decimals, 2}]),
    % ?debugFmt("~n~p~n", [FloatAsString]),
    StringAsFloat = string:to_float(FloatAsString),
    % ?debugFmt("~n~p~n", [StringAsFloat])
    ?assertEqual({12.57,[]}, StringAsFloat),

    % using custom functions to achive the some result in a simple, light way
    ?assertEqual(12.57, sstr:to_float(sstr:float_to_list(shapes:area({circle, 2}), 2))).
-endif.	 