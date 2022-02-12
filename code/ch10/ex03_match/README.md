ex03_match
=====
```
rebar3 new lib ex03_match && cd ex03_match && rm -R src && mkdir lib && cd lib && rebar3 new lib match && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> ets:new(countries, [bag,named_table]).
countries
2> ets:insert(countries,{yves,france,cook}).
true
3> ets:insert(countries,{sean,ireland,bartender}).
true
4> ets:insert(countries,{marco,italy,cook}).
true
5> ets:insert(countries,{chris,ireland,tester}).
true
6> ets:match(countries,{'$1',ireland,'_'}).
[[sean],[chris]]
7> ets:match(countries,{'$1','$0',cook}).
[[france,yves],[italy,marco]]
```

```
ets:new(countries, [bag,named_table]).
2> ets:insert(countries,[{yves,france,cook},{sean,ireland,bartender},{marco,italy,cook},{chris,ireland,tester}]).
ets:tab2list(countries).
```

```
6> T = ets:new(my_table, []).
#Ref<0.1688745061.3008233473.146948>
7> ets:insert(T, [{1, "Bob", male},{2, "Helen", female},{3, "Bill", male},{4, "Kate", female}]).
true
8> ets:tab2list(T).
[{4,"Kate",female},
 {1,"Bob",male},
 {3,"Bill",male},
 {2,"Helen",female}]
ets:match(T, {'$1', '$2', male}). 
ets:match(T, {'$0', '$1', male}). 
ets:match(T, {'$2', '$3', male}). 

ets:match(T, {'$1', '$0', male}). 
ets:match(T, {'$3', '$2', male}). 
ets:match(T, {male}). 


ets:match(T, {'$1', '$2', female}). 
ets:match(T, {'$0', '$1', female}). 
ets:match(T, {'$0', '$2', female}). 
ets:match(T, {'$2', '$1', '_'}). 
ets:match(T, {'$1','$2', '$3'}). 
ets:match_object(T, {'$1', '$2', male}).
ets:match_object(T, {'_', '_', male}).
ets:match_delete(T, {'_', '_', male}).
ets:tab2list(T).
```

```
ets:new(countries, [bag,named_table]).
2> ets:insert(countries,[{yves,france,cook},{sean,ireland,bartender},{marco,italy,cook},{chris,ireland,tester}]).
4> ets:tab2list(countries).
[{sean,ireland,bartender},
 {marco,italy,cook},
 {yves,france,cook},
 {chris,ireland,tester}]
 
 ets:insert(countries,{cook,france,cook}).
 ets:insert(countries,{cook,ireland,cook}).
```

```
7> ets:match(countries,{'$1',ireland,'$2'}).
[[sean,bartender],[chris,tester]]
7> ets:match(countries,{'$1',ireland,'_'}).
[[sean],[chris]]
8> ets:match(countries,{'$2',ireland,'_'}).
[[sean],[chris]]
???
9> ets:match(countries,{'_',ireland,'_'}).
???
10> ets:match(countries,{'$2',cook,'_'}).
???
11> ets:match(countries,{'$0','$1',cook}).
???
12> ets:match(countries,{'$0','$0',cook}).
???
ets:match(countries,{'$0',ireland,'$0'}).
```

```
13> ets:match_object(countries,{'_',ireland,'_'}).
[{sean,ireland,bartender},{chris,ireland,tester}]
14> NewTab = ets:match_delete(countries,{'_',ireland,'_'}).
NewTab = ets:match_delete(countries,{'cook','_','_'}).
true
15> ets:match_object(countries,{'_',ireland,'_'}).
[]
```

```
16> ets:select(countries, [{{'$1','$2','$3'},[{'/=','$3',cook}],[['$2','$1']]}]).
[[ireland,sean],[ireland,chris]]
f(MS).
17> MS = ets:fun2ms(fun({Name,Country,Job}) when Job =/= cook -> [Country,Name] end).
[{{'$1','$2','$3'},[{'/=','$3',cook}],[['$2','$1']]}]
18> ets:select(countries, MS).
[[ireland,sean],[ireland,chris]]

18> ets:select(countries, ets:fun2ms(fun({Name,Country,Job}) when Job =/= cook -> [Country,Name] end)).
```

```
ets:tab2file(countries, "countries.txt").
ok
ets:delete(countries).
f(List).
37> List = ets:file2tab("countries.txt",[{verify,true}]).
{ok,countries}
38> ets:info(countries).
[{id,#Ref<0.81111474.2061107202.235561>},
 {decentralized_counters,false},
 {read_concurrency,false},
 {write_concurrency,false},
 {compressed,false},
 {memory,341},
 {owner,<0.208.0>},
 {heir,none},
 {name,countries},
 {size,4},
 {node,nonode@nohost},
 {named_table,true},
 {type,bag},
 {keypos,1},
 {protection,protected}]
ets:delete_all_objects(countries).
ets:insert(countries, List).
```