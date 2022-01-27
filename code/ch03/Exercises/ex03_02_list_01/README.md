ex03_02_list_01
=====

Exercise 3-2: Creating Lists
=====

Write a function that returns a list of the format `[1,2,..,N-1,N]`.

Example:

erlang:```
create(3) ⇒ [1,2,3].
```

## An OTP application

Create new project

---- 
 # all commands in one string
 $ rebar3 new umbrella ex03_02_list_01 && cd ex03_02_list_01 && rm -R apps && mkdir lib && cd lib && rebar3 new lib list && cd ..

Run shell
-----

 $ rebar3 shell --apps list
 > r3:do(compile). % recompile after source code editing 
 
 
 $ werl +pc unicode
 > code:add_path

### Run EUnit

-----
 $ rebar3 eunit -m list_test

 $ rebar3 as test shell
#### EUnit tests

```
list:create(3) ⇒ [1,2,3].
[] =:= list:create(0).
[1] =:= list:create(1).
[1,2] =:= list:create(2).
[1,2,3] =:= list:create(3).
```

### Property based testing

rebar.config
-----

```
{erl_opts, [debug_info]}.
{deps, []}.

%% the plugin itself
{project_plugins, [rebar3_proper]}.

{profiles,
    [{test, [
        {erl_opts, [nowarn_export_all]},
        {deps, [proper]}
    ]}
]}.
```

Get dependencies
-----

    rebar3 get-deps

Get PropEr help
-----

    rebar3 help proper

Create new propety via PropEr
-----

    rebar3 new proper list
 
PropEr test
-----

   rebar3 proper

PropEr test (make 10_000 tests)
----- 

    rebar3 proper -n 10000
