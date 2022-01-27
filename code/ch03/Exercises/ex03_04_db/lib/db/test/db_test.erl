-module(db_test).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


new_test() ->
	?assertEqual([], db:new()).
	
destroy_test() ->
	Db = db:new(),
	?assertEqual(ok, db:destroy(Db)).

write_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	?assertEqual([{francesco,london}], Db1).
	
read_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),
	?assertEqual({ok,london}, db:read(francesco, Db2)),
	Db3 = db:write(joern, stockholm, Db2),
	?assertEqual({error,instance}, db:read(ola, Db3)).
	
match_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),
	Db3 = db:write(joern, stockholm, Db2),
	?assertEqual([joern,lelle], db:match(stockholm, Db3)).

delete_test() ->
	Db = db:new(),
	Db1 = db:write(francesco, london, Db),
	Db2 = db:write(lelle, stockholm, Db1),
	Db3 = db:write(joern, stockholm, Db2),
	?assertEqual([{joern,stockholm},{francesco,london}], db:delete(lelle, Db3)).

-endif.
