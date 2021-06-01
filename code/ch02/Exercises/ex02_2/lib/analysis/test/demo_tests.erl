-module(demo_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").
-import(demo, [double/1]).

all_my_test_() ->

    [
     {"Try to run demo:times(3,5)",  fun try_to_run1/0},
     {"Try to run double(6)",  fun try_to_run2/0}
     ].

try_to_run1() ->
    ?assertError(undef, demo:times(3,5)).

try_to_run2() ->

    % without import function "dobule/1" - compilation eror
    % ?assertError(undef, double(6)).

   ?assertEqual(12, double(6)).

-endif.	 