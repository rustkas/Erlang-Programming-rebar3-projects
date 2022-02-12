-module(modtest2).

-export([main/0,loop/0,a/1,do/1]).

main() ->
	register(foo,spawn(modtest2,loop,[])).

loop() ->
	receive
		{Sender, N} ->
			% Sender ! a(N)
			Sender ! modtest2:a(N)
	end,
	io:put_chars("boo!/n"),
	%loop().
	modtest2:loop().

do(M) ->
	foo ! {self(),M},
	receive Y -> Y
	end.

%a(N) -> N + 2.
a(N) -> N.