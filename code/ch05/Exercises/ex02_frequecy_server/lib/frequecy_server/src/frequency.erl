-module(frequency).
-export([start/0, allocate/2, deallocate/2]).
-export([init/0]).

%% These are the start functions used to create and
%% initialize the server.
start() ->
	register(frequency, spawn(frequency, init, [])).

init() ->
	Frequencies = {get_frequencies(), []},
	loop(Frequencies).

% Hard Coded
get_frequencies() -> [910,911,912,913,914,915].

%% The Main Loop
loop(Frequencies) ->
	receive
		{request, Pid, allocate} ->
			{NewFrequencies, Reply} = allocate(Frequencies, Pid),
			reply(Pid, Reply),
			loop(NewFrequencies);
		{request, Pid, {allocate, N}} ->	
			{NewFrequencies, Reply} = allocate(Frequencies, Pid, N),
			reply(Pid, Reply),
			loop(NewFrequencies);
		{request, Pid , {deallocate, Freq}} ->
			NewFrequencies = deallocate(Frequencies, Freq),
			reply(Pid, ok),
			loop(NewFrequencies);
		{request, Pid, stop} ->
			%io:format("Frequencies = ~p~n",[Frequencies]),
			case Frequencies of
				{_Free, []} ->
					reply(Pid, ok);
				{_Free, Allocated} -> 
					reply(Pid, {error, proplists:get_keys(Allocated)}),
					loop(Frequencies)
			end;	
		{request, Pid, frequencies} ->
			reply(Pid, Frequencies),
			loop(Frequencies);
		_ -> {error, badarg}	
	end.

reply(Pid, Reply) ->
	Pid ! {reply, Reply}.
	
%% The Internal Help Functions used to allocate and
%% deallocate frequencies.

allocate({[], Allocated}, _Pid) ->
	{{[], Allocated}, {error, no_frequency}};
allocate({[Freq|Free], Allocated}, Pid) ->
	{{Free, Allocated ++ [{Freq, Pid}]}, {ok, Freq}}.
	
deallocate({Free, Allocated}, Freq) ->
	NewAllocated = lists:keydelete(Freq, 1, Allocated),
	{[Freq|Free], NewAllocated}.
	
allocate(Frequencies, Pid, N) ->
	allocate(Frequencies, Pid, N,[]).

allocate({[], Allocated}, _Pid, _N,[]) ->
	{{[], Allocated}, {error, no_frequency}};
allocate(Frequencies, _Pid,0,Acc) ->
	{Frequencies, {ok, Acc}};
allocate({[], Allocated}, _Pid, _N, Acc) ->
	{{[], Allocated}, {ok, Acc}};
allocate({[Freq|Free], Allocated}, Pid, N, Acc) ->	
	allocate({Free, Allocated ++ [{Freq, Pid}]}, Pid, N-1, Acc ++ [Freq]).
	