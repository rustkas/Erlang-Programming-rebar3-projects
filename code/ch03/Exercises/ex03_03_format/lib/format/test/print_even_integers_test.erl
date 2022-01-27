-module(print_even_integers_test).

-import(format,[print_even_integers/1]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

print_even_integers_test_() ->
	[fun () -> 
			print_even_integers(1),
			?assertEqual("Number:[]\n", ?capturedOutput)
			end,
		
	fun () -> 
			print_even_integers(2),
			?assertEqual("Number:[2]\n", ?capturedOutput)
			end,
	fun () -> 
			print_even_integers(3),
			?assertEqual("Number:[2]\n", ?capturedOutput)
			end,
	fun () -> 
			print_even_integers(10),
			?assertEqual("Number:[2,4,6,8,10]\n", ?capturedOutput)
			end]
			.



-endif.
