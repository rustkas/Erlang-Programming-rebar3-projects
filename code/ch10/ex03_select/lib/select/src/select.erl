-module(select).

-export([init/0,ms/0,ms2/0,select/1]).

-include_lib("stdlib/include/ms_transform.hrl").

init() ->
	ets:new(my_ets, [named_table]),
	ets:insert(my_ets, [
		{1, "Bob", 25, male},
		{2, "Helen", 17, female},
		{3, "Bill", 28, male},
		{4, "Kate", 22, female},
		{5, "Ivan", 14, male}
		]), 
		ok.

ms() ->
	ets:fun2ms(fun({Id, Name,Age, Gender})
					when Age >= 17 andalso Gender =:= male ->
						[Id,Name]
				end).

ms2() ->
	ets:fun2ms(fun({_Id, _Name, Age, Gender}=User)
					when Age >= 17 andalso Gender =:= male ->
						User
				end).

select(MS) ->
	ets:select(my_ets, MS).