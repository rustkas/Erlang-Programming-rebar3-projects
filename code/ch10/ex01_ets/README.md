ex01_ets
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> TabId = ets:new(myTable, []).
#Ref<0.242259042.1148321793.117472>
2> ets:info(TabId).
[{id,#Ref<0.242259042.1148321793.117472>},
 {decentralized_counters,false},
 {read_concurrency,false},
 {write_concurrency,false},
 {compressed,false},
 {memory,309},
 {owner,<0.135.0>},
 {heir,none},
 {name,myTable},
 {size,0},
 {node,nonode@nohost},
 {named_table,false},
 {type,set},
 {keypos,1},
 {protection,protected}]
3> ets:delete(TabId).
true


1> TabId = ets:new(myTable, []).
#Ref<0.242259042.1148321793.117516>
2> ets:info(TabId).
[{memory,301},
{owner,<0.31.0>},
{name,myTable},
{size,0},
{node,nonode@nohost},
{named_table,false},
{type,set},
{keypos,1},
{protection,protected}]

3> ets:insert(TabId,{alison,sweden}).
true
4> ets:lookup(TabId,alison).
[{alison,sweden}]

5> ets:insert(TabId,{alison,italy}).
true
6> ets:lookup(TabId,alison).
[{alison,italy}]

7> ets:delete(TabId).
true
8> TabId2 = ets:new(myTable,[bag]).
#Ref<0.242259042.1148321793.118040>
9> ets:insert(TabId2,{alison,sweden}).
true
10> ets:insert(TabId2,{alison,italy}).
true
11> ets:lookup(TabId2,alison).
[{alison,sweden},{alison,italy}]

12> ets:insert(TabId2,{alison,italy}).
true
13> ets:lookup(TabId2,alison).
[{alison,sweden},{alison,italy}]
14> ets:delete(TabId2).
true

15> TabId3 = ets:new(myTable,[duplicate_bag]).
#Ref<0.242259042.1148321793.118062>
16> ets:insert(TabId3,{alison,sweden}).
true
17> ets:insert(TabId3,{alison,italy}).
true
18> ets:insert(TabId3,{alison,italy}).
true
19> ets:lookup(TabId3,alison).
[{alison,sweden},{alison,italy},{alison,italy}]
20> ets:delete(TabId3).
true
2> ets:info(TabId3).
```