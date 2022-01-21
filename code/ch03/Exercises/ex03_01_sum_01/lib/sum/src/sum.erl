%%% Напишите функцию sum/1, которая по данному положительному целому числу
%%% N возвращает сумму всех чисел от 1 до N.
%%% Пример:
%%% sum(5) => 15
-module(sum).

-export([sum1/1,sum2/1]).

% using lists module
sum1(1) -> 1;
sum1(Number) when is_integer(Number), Number > 0 -> lists:sum(lists:seq(1,Number)).

% tail reccursion
sum2(1) -> 1;
sum2(Number) when is_integer(Number), Number > 0 -> sum2_acc(Number,0).

sum2_acc(0,Sum) -> Sum;
sum2_acc(Number,Sum) -> sum2_acc(Number-1,Number+Sum).