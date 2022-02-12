ex03_records
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> rd(capital, {name, country, pop}).
capital
2> ets:new(countries, [named_table, {keypos, #capital.name}]).
countries
3> ets:insert(countries, #capital{name="Budapest", country="Hungary", pop=2400000}).
true
4> ets:insert(countries, #capital{name="Pretoria", country="South Africa", pop=2400000}).
true
5> ets:insert(countries, #capital{name="Rome", country="Italy", pop=5500000}).
true
6> ets:lookup(countries, "Pretoria").
[#capital{name = "Pretoria",country = "South Africa", pop = 2400000}]
7> ets:match(countries, #capital{name='$1',country='$2', _='_'}).
[["Rome","Italy"],
["Budapest","Hungary"],
["Pretoria","South Africa"]]
8> ets:match_object(countries, #capital{country="Italy", _='_'}).
[#capital{name = "Rome",country = "Italy",
pop = 5500000}]
9> MS = ets:fun2ms(fun(#capital{pop=P, name=N}) when P < 5000000 -> N end).
[{#capital{name = '$1',country = '_',pop = '$2'},
[{'<','$2',5000000}],
['$1']}]
10> ets:select(countries, MS).
["Budapest","Pretoria"]
```