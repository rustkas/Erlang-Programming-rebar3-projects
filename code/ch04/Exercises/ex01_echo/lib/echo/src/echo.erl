-module(echo).

-export([start/0,print/1,stop/0]).
-export([loop/0]).

start() ->
	Pid = spawn(echo, loop, []),
	register(echo, Pid),
	ok.

print(Term) ->
	echo ! Term,
	ok.

stop() ->
	echo ! stop,
ok.

loop() ->
   receive
     stop ->
       true;
     Msg ->
        io:format("~p~n",[Msg]),
		
        loop()
   end.
