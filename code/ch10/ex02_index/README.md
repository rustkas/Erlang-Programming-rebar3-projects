ex02_index
=====

```
rebar3 new lib ex02_index && cd ex02_index && rm -R src && mkdir lib && cd lib && rebar3 new lib index && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	
```
>index:index("LICENSE").
ok
> ets:info(indexTable).
[{id,#Ref<0.4195263859.1589772289.100126>},
 {decentralized_counters,false},
 {read_concurrency,false},
 {write_concurrency,false},
 {compressed,false},
 {memory,22059},
 {owner,<0.138.0>},
 {heir,none},
 {name,indexTable},
 {size,901},
 {node,nonode@nohost},
 {named_table,true},
 {type,ordered_set},
 {keypos,1},
 {protection,protected}]
 
> First = ets:first(indexTable).
{"appears",2}
4> Second = ets:next(indexTable,First).
{"consecutive",3}
5> Third = ets:next(indexTable,Second).

6> Last = ets:last(indexTable).
{"words",3}
7> ets:next(indexTable,Last).
'$end_of_table'
> ets:delete(indexTable).
```	

```
> index:index("LICENSE").
ok
> ets:delete(indexTable).
```