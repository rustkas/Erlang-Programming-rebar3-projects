-module(records).

-export([birthday1/1, birthday2/1]).
-export([get_name_first/1, get_name_surname/1]).

-record(person, {name,age,phone}).
-record(name, {first, surname}).

birthday1(P) ->
	P#person{age = P#person.age + 1}.
	
birthday2(#person{age=Age} = P) ->
	P#person{age=Age+1}.

get_name_first(P) ->
	First = (P#person.name)#name.first,
	First.
	
get_name_surname(P) ->
	Surname = (P#person.name)#name.surname,
	Surname.