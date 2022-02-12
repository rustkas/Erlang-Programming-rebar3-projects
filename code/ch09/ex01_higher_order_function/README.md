ex01_higher_order_function
=====
```
rebar3 new lib ex01_higher_order_function && cd ex01_higher_order_function && rm -R src && mkdir lib && cd lib && rebar3 new lib functions && cd ..
> r3:do(compile).
> functions:module_info().
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> Bump = fun(Int) when is_integer(Int) -> Int + 1 end.
#Fun<erl_eval.44.65746770>
2> Bump(10).
11
3> (fun(Int) when is_integer(Int) -> Int + 1 end)(10).
11
4> functions:doubleAll([1,2,3,4]).
[2,4,6,8]
5> functions:revAll([1,2,3,4]).
[4,3,2,1]
6> (fun DoubleAll([]) -> []; DoubleAll([X|Xs]) -> [X*2 | DoubleAll(Xs)] end)([1,2,3,4]).
[2,4,6,8]
7> (fun RevAll([]) -> []; RevAll([X|Xs]) -> RevAll(Xs) ++ [X] end)([1,2,3,4]).
[4,3,2,1]
8> functions:map(fun functions:double/1, [1,2,3,4]).
[2,4,6,8]
9> functions:map(fun(X) -> X*2 end, [1,2,3,4]).
[2,4,6,8]
10> functions:evens([1,2,3,4]).
[2,4]
11> functions:palins([[2,2],[1,2,3],[1,2,1]]).
[[2,2],[1,2,1]]
12> functions:filter(fun functions:is_palin/1, [[2,2],[1,2,3],[1,2,1]]).
[[2,2],[1,2,1]]
13> functions:palins2([[2,2],[1,2,3],[1,2,1]]).
[[2,2],[1,2,1]]
14> functions:doubleAll2([1,2,3,4]).
[2,4,6,8]
15> (fun(X) -> io:format("Element ~p~n", [X]) end)("Hello").
Element "Hello"
16> functions:foreach(fun(X) -> io:format("Element ~p~n", [X]) end, [2,3,4]).
Element 2
Element 3
Element 4
ok
17> functions:foreach(fun(X) -> self() ! X end, [2,3,4]).
ok
19> flush().
Shell got 2
Shell got 3
Shell got 4
ok
```

```
1> Times = functions:times(3).
#Fun<functions.2.91438517>
2> Times(2).
6
3> functions:times(3)(2).
* 1:19: syntax error before: '('
4> (functions:times(3))(2).
6
functions:doubleAll(functions:map(functions:times(2),[1,2,3,4])).
5> [2,8,12,16]
Fun = functions:sendTo(self()).

functions:map(Fun,[1,2,3,4]).
[1,2,3,4]
29> flush().
Shell got 1
Shell got 2
Shell got 3
Shell got 4
ok
30> Pid = spawn(fun() -> ok).
```

```
functions:bar().
functions:foo().
```

```
> Bump = fun(X) -> X+1 end.
#Fun<erl_eval.44.65746770>
> lists:map(Bump, [1,2,3,4,5]).
[2,3,4,5,6]
> NonNegative = fun(X) -> case X < 0 of true -> false; false -> true end end.
#Fun<erl_eval.44.65746770>
> lists:filter(NonNegative, [-2,-1,0,1,2]).
[0,1,2]
> lists:all(NonNegative, [0,1,2,3,4,5]).
true
> lists:all(NonNegative, [-1,0,1]).
false
> Sum = fun(Element, Accumulator) -> Element + Accumulator end.
#Fun<erl_eval.43.65746770>
> lists:foldl(Sum, 0, [1,2,3,4,5,6,7].
```

```
> SeqFun0 = functions:next(0).
#Fun<functions.4.61320832>
> [Seq1|SeqFun1] = SeqFun0().
[0|#Fun<functions.4.61320832>]
> [Seq2|SeqFun2] = SeqFun1().
[1|#Fun<functions.4.61320832>]
> [Seq3|SeqFun3] = SeqFun2().
```

Usefull link - https://stackoverflow.com/questions/867418/how-do-you-write-a-fun-thats-recursive-in-erlang

