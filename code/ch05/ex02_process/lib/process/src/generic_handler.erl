-module(generic_handler).

-export([initialize/1]).
-export([handle_msg/2,terminate/1,reply/2]).

init(Data) ->
	loop(initialize(Data)).

loop(State) ->
	receive
		{request, From, Msg} ->
			{Reply,NewState} = handle_msg(Msg, State),
			reply(From, Reply),
			loop(NewState);
		{stop, From} ->
			reply(From, terminate(State))
	end.

initialize(Data) -> init(Data).

handle_msg(_Msg, _State) -> ok.

terminate(_State) -> ok.

reply(To, Msg) ->
	To ! {reply, Msg}.


