-module(io_format).

-export([print/0]).

print() ->
	List = [2,3,math:pi()],
	io:format("~n~p~n", [List]),
	
	Sum = lists:sum(List),
	io:format("~n~p~n", [Sum]),
	
	io:format("hello, world!~n",[]),
	
	io:format("the sum of ~w is ~w.~n", [[2,3,4], lists:sum([2,3,4])]),
	 
	io:format("the sum of ~w is ~w.~n", [List,Sum]),
	
	io:format("the sum of ~W is ~w.~n", [List,3,Sum]),
	
	io:format("the sum of ~W is ~f.~n", [List,3,Sum]),
	
	io:format("the sum of ~W is ~.2f.~n", [List,3,Sum]),
	
	io:format("~40p~n", [{apply, io, format, ["the sum of ~W is ~.2f.~n", [[2,3,math:pi()],3,lists:sum([2,3,math:pi()])]]}]),
	
	io:format("~w~n", [{apply, io, format, ["the sum of ~W is ~.2f.~n", [[2,3,math:pi()],3,lists:sum([2,3,math:pi()])]]}]),
	
	List2 = [72,101,108,108,111,32,87,111,114],
	
	io:format("~p~n",[List]),
	io:format("~w~n",[List])
	.