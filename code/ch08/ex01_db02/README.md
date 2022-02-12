ex01_db
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	
```
1> c(db).
{ok,db}
2> Db = db:new().
{dict,0,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]}}}
3> Db1 = db:write(francesco, san_francisco, Db).
{dict,1,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],
[[francesco|san_francisco]]}}}
4> Db2 = db:write(alison, london, Db1).
{dict,2,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],
[[alison|london]],
[[francesco|san_francisco]]}}}
5> db:read(francesco, Db2).
** exception error: no case clause matching san_francisco
in function db:read/2
6> dict:fetch(francesco, Db2).
san_francisco
```	

```
1> db:module_info().
{dict,0,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]}}}
2> Db1 = db:write(francesco, san_francisco, Db).
{dict,1,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],
[[francesco|san_francisco]]}}}
3> Db2 = db:write(alison, london, Db1).
{dict,2,16,16,8,80,48,
{[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]},
{{[],[],[],[],[],[],[],[],[],[],[],[],[],[],
[[alison|london]],
[[francesco|san_francisco]]}}}
4> db:read(francesco, Db2).
{ok,san_francisco}
5> db:module_info(attributes).
[{vsn,[1.1]}]
```