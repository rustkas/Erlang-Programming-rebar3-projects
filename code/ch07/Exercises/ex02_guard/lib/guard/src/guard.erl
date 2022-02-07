-module(guard).

-export([foobar/1,foobar2/1]).
-include("person.hrl").

foobar(P) when P#person.name == "Joe" ->
	io:format("Hi, Joe!~n").
	
foobar2(P) when is_record(P,person), P#person.name == "Joe" ->
	io:format("Hi, person Joe!~n").	