-module(client_frequency).
-export([stop/0, allocate/0, deallocate/1]).


%% The client Functions
stop() -> call(stop).

allocate() -> call(allocate).

deallocate(Freq) -> call({deallocate, Freq}).

%% We hide all message passing and the message
%% protocol in a functional interface.
call(Message) ->
	frequency ! {request, self(), Message},
	receive
		{reply, Reply} -> Reply
	end.