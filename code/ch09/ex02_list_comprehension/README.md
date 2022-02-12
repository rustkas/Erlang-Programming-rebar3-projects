ex02_list_comprehension
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	>

```
1> [X+1 || X <- [1,2,3]].
[2,3,4]
2> [X || X <- [1,2,3], 0 =:= X rem 2].
2
3> [X+1 || X <- [1,2,3], 0 =:= X rem 2].
```

```
1> Database = [ {francesco, harryPotter}, {simon, jamesBond}, {marcus, jamesBond}, {francesco, daVinciCode} ].
[{francesco,harryPotter},
 {simon,jamesBond},
 {marcus,jamesBond},
 {francesco,daVinciCode}]
2> [Person || {Person,_} <- Database].
[francesco,simon,marcus,francesco]
3> [Book || {Person,Book} <- Database, Person == francesco].
[harryPotter,daVinciCode]
4> [Book || {francesco,Book} <- Database].
[harryPotter,daVinciCode]
5> [Person || {Person,daVinciCode} <- Database].
[francesco]
6> [Book || {Person,Book} <- Database, Person /= marcus].
[harryPotter,jamesBond,daVinciCode]
7> [Person || {Person,Book} <- Database, Person /= marcus].
[francesco,simon,francesco]
8> [{Book, [Person || {Person,B} <- Database, Book==B ]} || {_,Book} <- Database].
[{harryPotter,[francesco]},
{jamesBond,[simon,marcus]},
{jamesBond,[simon,marcus]},
{daVinciCode,[francesco]}]
9> [{Book,[ Person || {Person,Book} <- Database ]} || {_,Book} <- Database].
[{harryPotter,[francesco,simon,marcus,francesco]},
{jamesBond,[francesco,simon,marcus,francesco]},
{jamesBond,[francesco,simon,marcus,francesco]},
{daVinciCode,[francesco,simon,marcus,francesco]}]
```

```
10> [ {X,Y} || X <- lists:seq(1,3), Y <- lists:seq(X,3) ].
[{1,1},{1,2},{1,3},{2,2},{2,3},{3,3}]
11> [ {X,Y} || X <- lists:seq(1,4), X rem 2 == 0, Y <- lists:seq(X,4) ].
[{2,2},{2,3},{2,4},{4,4}]
12> [ {X,Y} || X <- lists:seq(1,4), X rem 2 == 0, Y <- lists:seq(X,4), X+Y>4 ].
[{2,3},{2,4},{4,4}]
```

```
>list_comprehension:map(fun(X)-> X+2 end, [1,2,3]).
[3,4,5]
>list_comprehension:filter(fun(X)-> 0 =:= X rem 2 end, [1,2,3,4]).
[2,4]
>list_comprehension:append([[1, 2, 3], [a, b], [4, 5, 6]]).
[1,2,3,a,b,4,5,6]
```

```
list_comprehension:perms([1,2,3]).
list_comprehension:insert(1,[2],[3]).
list_comprehension:splits([2,3]).

list_comprehension:perms2([1,2,3]).
list_comprehension:module_info().

list_comprehension:qsort([6,4,5,0,7,9,1,2,3]).
[0,1,2,3,4,5,6,7,9]
```