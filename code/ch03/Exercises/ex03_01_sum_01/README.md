ex03_01_sum_01
=====

An OTP application

Create new project
----	
Create ex14_recurssion
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

An OTP library

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