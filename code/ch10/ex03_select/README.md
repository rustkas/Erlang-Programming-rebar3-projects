ex03_select
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 


```
1> select:init().
ok
2> ets:tab2list(my_ets).
[{4,"Kate",22,female},
 {1,"Bob",25,male},
 {3,"Bill",28,male},
 {2,"Helen",17,female},
 {5,"Ivan",14,male}]
 
5> MS = select:ms().
[{{'$1','$2','$3','$4'},
  [{'andalso',{'>=','$3',17},{'=:=','$4',male}}],
  [['$1','$2']]}]
6> select:select(MS).
[[1,"Bob"],[3,"Bill"]]

% Get all tuple
MS2 = [{{'$1','$2','$3','$4'}, [], [['$_']]}].
10> MS3 = select:ms2().
[{{'$1','$2','$3','$4'},
  [{'andalso',{'>=','$3',17},{'=:=','$4',male}}],
  ['$_']}]
11> select:select(MS3).
[{1,"Bob",25,male},{3,"Bill",28,male}]
MS4 = [{{'$1','$2','$3','$4'}, [], ['$_']}].
select:select(MS4).
```