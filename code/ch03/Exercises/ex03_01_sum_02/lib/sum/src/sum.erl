-module(sum).

-export([sum/2]).

sum(N,M) when is_integer(N), is_integer(M), N =< M ->
  sum2_acc(N,M,0).

sum2_acc(N,M,Sum) when N > M -> Sum;
sum2_acc(N,M,Sum) -> sum2_acc(N+1, M, N+Sum).
