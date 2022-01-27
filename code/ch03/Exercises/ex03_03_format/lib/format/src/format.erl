-module(format).

-export([print_integers/1, print_even_integers/1]).

print_integers(N) when is_integer(N), N >= 1 ->
	List = lists:seq(1,N),
	io:format("Number:~p~n",[List]).

print_even_integers(N) when is_integer(N), N >= 1 ->
	List = [X || X <- lists:seq(1,N), X rem 2 =:= 0],
	io:format("Number:~p~n",[List]).