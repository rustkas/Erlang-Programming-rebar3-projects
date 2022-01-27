-module(print_integers_test).

-import(format,[print_integers/1]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


check_input_test () -> 
	?assertError(function_clause, print_integers(0)),
	?assertError(function_clause, print_integers(-1)).
	
print_integers_test_() ->
	[{"Number:[1]\n", fun () -> 
			print_integers(1),
			?assertEqual("Number:[1]\n", ?capturedOutput)
			end},
		
	{"Number:[1,2]\n", fun () -> 
			print_integers(2),
			?assertEqual("Number:[1,2]\n", ?capturedOutput)
			end},
	{"Number:[1,2,3]\n",fun () -> 
			print_integers(3),
			?assertEqual("Number:[1,2,3]\n", ?capturedOutput)
			end}]
			.

print_integers2_test_() ->
	[fun () -> 
			print_integers(1),
			?assertEqual("Number:[1]\n", ?capturedOutput)
			end,
		
	fun () -> 
			print_integers(2),
			?assertEqual("Number:[1,2]\n", ?capturedOutput)
			end,
	fun () -> 
			print_integers(3),
			?assertEqual("Number:[1,2,3]\n", ?capturedOutput)
			end]
			.



-endif.
