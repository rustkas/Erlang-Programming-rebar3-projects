-module(client_frequency).
-export([stop/0, allocate/0, deallocate/1,allocate_some/1]).
-export([frequency/0]).

%% The client Functions
stop() -> call(stop).

allocate() -> call(allocate).

allocate_some(N) when N =< 3 -> call({allocate, N}).

deallocate(Freq) -> call({deallocate, Freq}).

frequency() -> call(frequencies).


%% We hide all message passing and the message
%% protocol in a functional interface.
call(Message) ->
	frequency ! {request, self(), Message},
	receive
		{reply, Reply} -> Reply
	end.