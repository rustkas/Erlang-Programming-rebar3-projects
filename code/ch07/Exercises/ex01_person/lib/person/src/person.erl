-module(person).

-export([get_name_first/1, get_name_surname/1]).

-include("person.hrl").

-export([test_person1/0,test_person2/0,test_person3/0]).

get_name_first(P) ->
	First = (P#person.name)#name.first,
	First.
	
get_name_surname(P) ->
	Surname = (P#person.name)#name.surname,
	Surname.
	
test_person1() ->
	P =  #person{name="Joe", age=21, phone="999-999"},
	io:format("~p~n",[P]).	
	
test_person2() ->	
	P = #person{name = #name{first = "Robert", surname = "Virding"},age = 37, phone = "999-999"},
	io:format("~p~n",[P]).
	
test_person3() ->	
	P = #person{name = #name{first = "Robert", surname = "Virding"},age = 37, phone = "999-999", 
		address = #address{country="Russia", city="Kaliningrad", street="Emeljanowa", house_number=49, flat_number=35}},
	io:format("~p~n",[P]).	