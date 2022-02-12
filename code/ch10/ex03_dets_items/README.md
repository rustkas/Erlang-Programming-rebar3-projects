ex03_dets_items
=====

An OTP library

Build
-----

    $ rebar3 shell

```
1> dets:open_file(food, [{type, bag}, {file, "food"}]).
{ok,food}
2> dets:insert(food, {italy, spaghetti}).
ok
3> dets:insert(food, {sweden, meatballs}).
ok
4> dets:lookup(food, china).
[]
5> dets:insert(food, {italy, pizza}).
ok
6> NotItalian = ets:fun2ms(fun({Loc, Food}) when Loc /= italy -> Food end).
[{{'$1','$2'},[{'/=','$1',italy}],['$2']}]
7> dets:select(food, NotItalian).
[meatballs]
8> dets:close(food).
ok
9> {ok, Ref} = dets:open_file("food").
{ok,#Ref<0.1425283156.761266178.176128>}
10> dets:lookup(Ref, italy).
[{italy,spaghetti},{italy,pizza}]
11> dets:info(Ref).
[{type,bag},
{keypos,1},
{size,3},
{file_size,5936},
{filename,"/Users/Francesco/food"}]
12> dets:lookup(food, italy).
** exception error: bad argument
in function dets:lookup/2
called as dets:lookup(food,italy)
13> dets:info(Ref).
undefined
```