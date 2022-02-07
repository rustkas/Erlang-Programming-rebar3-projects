-module(db_test).

%%
%% Tests
%%
-ifdef(TEST).
-include("db.hrl").
-include_lib("eunit/include/eunit.hrl").


new_test() ->
	?assertEqual([], db:new()).
	
destroy_test() ->
	Db = db:new(),
	?assertEqual(ok, db:destroy(Db)).

write_test() ->
	Db = db:new(),
	Db1 = db:write("Francesco", "London", Db),
	?assertEqual([#data{key = "Francesco",data = "London"}], Db1).
	
read_test() ->
	Db = db:new(),
	Db1 = db:write("Francesco", "London", Db),
	Db2 = db:write("Lelle", "Stockholm", Db1),
	?assertEqual({ok,"London"}, db:read("Francesco", Db2)),
	Db3 = db:write("Joern", "Stockholm", Db2),
	?assertEqual({error,instance}, db:read("Ola", Db3)).
	
match_test() ->
	Db = db:new(),
	Db1 = db:write("Francesco", "London", Db),
	Db2 = db:write("Lelle", "Stockholm", Db1),
	Db3 = db:write("Joern", "Stockholm", Db2),
	?assertEqual(["Joern", "Lelle"], db:match("Stockholm", Db3)).

delete_test() ->
	Db = db:new(),
	Db1 = db:write("Francesco", "London", Db),
	Db2 = db:write("Lelle", "Stockholm", Db1),
	Db3 = db:write("Joern", "Stockholm", Db2),
	?assertEqual([#data{key = "Joern",data = "Stockholm"},
		#data{key = "Francesco",data = "London"}], db:delete("Lelle", Db3)).

-endif.
