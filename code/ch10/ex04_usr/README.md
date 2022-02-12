ex04_usr
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> c(usr_db).
{ok,usr_db}
2> usr_db:create_tables("UsrTabFile").
{ok,usrDisk}
3> ets:info(usrIndex).
[{memory,308},{owner,<0.29.0>},{name,usrIndex},{size,0},{node,nonode@nohost},
{named_table,true},{type,set},{keypos,1},{protection,protected}]
4> ets:info(usrRam).
[{memory,308},{owner,<0.29.0>},{name,usrRam},{size,0},{node,nonode@nohost},
{named_table,true},{type,set},{keypos,2},{protection,protected}]
5> dets:info(usrDisk).
[{type,set},{keypos,2},{size,0},{file_size,5432},{filename,"UsrTabFile"}]
6> usr_db:close_tables().
ok
7> dets:info(usrDisk).
undefined
8> ets:info(usrRam).
undefined
9> ets:info(usrIndex).
undefined
```

```
1> c(usr_db).
{ok,usr_db}
2> rr("lib/usr/src/usr.hrl").
[usr]
3> usr_db:create_tables("UsrTabFile").
{ok,usrDisk}
4> usr_db:lookup_id(1).
{error,instance}
4> Seq = lists:seq(1,100000).
[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,
23,24,25,26,27,28,29|...]
5> Add = fun(Id) -> usr_db:add_usr(#usr{msisdn = 700000000 + Id,
id = Id,
plan = prepay,
services = [data, sms, lbs]})
end.
#Fun<erl_eval.6.13229925>
6> lists:foreach(Add, Seq).
ok
7> ets:info(usrRam).
[{memory,2214643}, {owner,<0.29.0>}, {name,usrRam}, {size,100000},
{node,nonode@nohost}, {named_table,true}, {type,set}, {keypos,2},
{protection,protected}]
8> {ok, UsrRec} = usr_db:lookup_msisdn(700000001).
{ok,#usr{msisdn = 700000001,id = 1,status = enabled,
plan = prepay,
services = [data,sms,lbs]}}
9> usr_db:update_usr(UsrRec#usr{services = [data, sms], status = disabled}).
ok
10> usr_db:lookup_msisdn(700000001).
{ok,#usr{msisdn = 700000001,id = 1,status = disabled,
plan = prepay,
services = [data,sms]}}
```

```
11> exit(self(), kill).
** exception exit: killed
12> usr_db:lookup_msisdn(700000001).
** exception error: bad argument
in function ets:lookup/2
called as ets:lookup(usrRam,700000001)
in call from usr_db:lookup_msisdn/1
13> usr_db:create_tables("UsrTabFile").
{ok,usrDisk}
14> usr_db:lookup_msisdn(700000001).
{error,instance}
15> dets:lookup(usrDisk, 700000001).
[#usr{msisdn = 700000001,id = 1,status = disabled,
plan = prepay,
services = [data,sms]}]
```

```
16> c(usr_db).
{ok,usr_db}
17> usr_db:restore_backup().
[]
18> usr_db:lookup_msisdn(700000001).
{ok,#usr{msisdn = 700000001,id = 1,status = disabled,
plan = prepay,
services = [data,sms]}}
19> usr_db:lookup_id(1).
{ok,#usr{msisdn = 700000001,id = 1,status = disabled,
plan = prepay,
services = [data,sms]}}
```

```
20> c(usr_db).
{ok,usr_db}
21> usr_db:delete_disabled().
ok
22> ets:info(usrRam).
[{memory,2214621}, {owner,<0.182.0>}, {name,usrRam}, {size,99999},
{node,nonode@nohost}, {named_table,true}, {type,set}, {keypos,2},
{protection,protected}]
```