Exercise 3-1: Evaluating Expressions
=====

Write a function sum/1 which, given a positive integer N, will return the sum of all the
integers between 1 and N.
Example:

`sum(5) ⇒ 15.`

Write a function `sum/2` which, given two integers `N` and `M`, where `N =< M`, will return
the sum of the interval between `N` and `M`. 

If `N > M`, you want your process to terminate abnormally.

Example:
```
sum(1,3) ⇒ 6.
sum(6,6) ⇒ 6.
```

## An OTP application

Create new project

----	
	# all commands in one string
	$ rebar3 new umbrella ex03_01_sum_01 && cd ex03_01_sum_01 && rm -R apps && mkdir lib && cd lib && rebar3 new lib sum && cd ..


Run shell
-----
	$ rebar3 shell --apps sum
	> r3:do(compile). % recompile after source code editing 
	
	
	$ werl +pc unicode
	> code:add_path

Run EUnit
-----
	$ rebar3 eunit -v --app sum
	rebar3 eunit -m sum_test

```
sum:sum1(5) == 15.
sum:sum2(5) == 15.
```

### Property based testing

rebar.config
-----

```
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
    $ rebar3 get-deps


Get PropEr help
-----
    $ rebar3 help proper


Create new propety via PropEr
-----
    $ rebar3 new proper sum
	

PropEr test
-----
    $ rebar3 proper


PropEr test (make 10_000 tests)
-----	
	$ rebar3 proper -n 10000
