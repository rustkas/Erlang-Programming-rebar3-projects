ex03_db
=====
```
rebar3 new lib ex03_db && cd ex03_db && rm -R src && mkdir lib && cd lib && rebar3 new lib db && cd ..
```
An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> Db = db:new().
[]
2> rr(db).
[data]
3> Db1 = db:write("Francesco", "London", Db).
[#data{key = "Francesco",data = "London"}]
4> Db2 = db:write("Lelle", "Stockholm", Db1).
[#data{key = "Lelle",data = "Stockholm"},
 #data{key = "Francesco",data = "London"}]
5> db:read("Francesco", Db2).
{ok,"London"}
6> Db3 = db:write("Joern", "Stockholm", Db2).
[#data{key = "Joern",data = "Stockholm"},
 #data{key = "Lelle",data = "Stockholm"},
 #data{key = "Francesco",data = "London"}]
7> db:read("Ola", Db3).
{error,instance}
8> db:match("Stockholm", Db3).
["Joern","Lelle"]
9> Db4 = db:delete("Lelle", Db3).
[#data{key = "Joern",data = "Stockholm"},
 #data{key = "Francesco",data = "London"}]
10> db:match("Stockholm", Db4).
["Joern"]
11>Db5 = db:delete("Francesco", Db3).
[#data{key = "Joern",data = "Stockholm"},
 #data{key = "Lelle",data = "Stockholm"}]
12> Db6 = db:destroy(Db5).
ok
```

### Run EUnit

-----
 $ rebar3 eunit -m db_test