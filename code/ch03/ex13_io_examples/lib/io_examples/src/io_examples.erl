-module(io_examples).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Book's examples implementation. io:get_line/1",
      fun book_example_1/0}].

book_example_1() ->
    InputString = "lkdsjfljasdkjflkajsdf.\n",
    spawn(fun () ->
                  % Bytes = unicode:characters_to_binary(InputString),
                  % ?assertEqual(ok, (file:write(standard_io, Bytes))),
                  % ?assertEqual(ok, io:write(standard_io, InputString)),
                  % ?assertCmd("echo " ++ InputString)
                  ok
          end),
    io:write(standard_io, InputString),
    timer:sleep(timer:seconds(1)),
    ?debugFmt("~n~p~n", [?capturedOutput]),
    % ?assertCmd("echo ddddddddd"),
    % ?assertCmdOutput("ddddddddd\n", "echo ddddddddd"),
    % ?cmd("echo ddddddddd"),
    % timer:sleep(timer:seconds(1) div 5),
    % timer:sleep(timer:seconds(1)),
    % Result = unicode:characters_to_list(?capturedOutput),
    % ?assertEqual(InputString, Result),
    % ?debugFmt("~n~p~n", [?capturedOutput]),
    % String = io:get_line("gissa line>"),
    % ?assertEqual(InputString, String),
    % ?debugFmt("~n~p~n", [io:getopts(standard_io)]),
    ok.

% Emulate console actions:
% io:get_line("gissa line>").
% gissa line>lkdsjfljasdkjflkajsdf.
% "lkdsjfljasdkjflkajsdf.\n"

-endif.
