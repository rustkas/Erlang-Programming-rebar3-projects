-module(demo_tests).
% compile options
-compile([strong_validation, verbose, warn_missing_spec]).
% Run function while module is loaded
-on_load(print_info/0).


print_info()->
  io:fwrite("Hello, demo test!~n").

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
      {"Check double function",  fun double/0},
      {"Check module information",  fun info/0}
     ].

double() ->
  ?assertEqual(2, demo:double(1)),
  ?assertEqual(4, demo:double(2)),
  ?assertEqual(6, demo:double(3)),
  ?assertEqual(2.2, demo:double(1.1)).

info() ->
  ModuleInfo = demo:module_info(),
  % ?debugFmt("~n~p~n", [ModuleInfo]),
  ?assert(is_list(ModuleInfo)).

-endif.	 