%% Code from 
%%   Erlang Programming
%%   Francecso Cesarini and Simon Thompson
%%   O'Reilly, 2008
%%   http://oreilly.com/catalog/9780596518189/
%%   http://www.erlangprogramming.org/
%%   (c) Francesco Cesarini and Simon Thompson

-module(echo).
-export([go/0, loop/0]).

go() ->
  Pid = spawn(echo, loop, []),
  register(echo, Pid),
  echo ! {self(), hello},
  receive
    {Pid, Msg1} ->
      io:format("Main PID get message: ~w form PID = ~w~n",[Msg1,Pid])
  end,
  
  % Make some preparations
  
  link(Pid),
  process_flag(trap_exit, true), % Make the current process a system process.
  
  echo ! stop,
  receive
    Msg2 ->
      io:format("Main PID get last message: ~w form PID = ~w~n",[Msg2,Pid])
  end,
  
  unlink(Pid),
  process_flag(trap_exit, false),
  %unregister(echo),
  whereis(echo).


loop() ->
  receive
    {From, Msg} ->
      From ! {self(), Msg},
	  io:format("Child PID: ~w~n",[Msg]),
      loop();
    stop ->
	  io:format("Child PID get: ~w~n",[stop]),
      true
  end.

