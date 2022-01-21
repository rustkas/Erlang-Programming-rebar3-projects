ex14_recurssion
=====

An OTP application

Create new project
----	
Create ex14_recurssion
----	
	# all commands in one string

    $ rebar3 new umbrella ex14_recurssion && cd ex14_recurssion && rm -R apps && mkdir lib && cd lib && rebar3 new lib recurssion && cd ..

Run shell
-----
	$ rebar3 shell --apps recurssion
	> r3:do(compile). % recompile after source code editing 
	$ rebar3 auto --apps recurssion
	> recurssion:bump([]).
	
	$ werl +pc unicode
	> code:add_path

```
recurssion:bump([]).
recurssion:bump([1,1]).
recurssion:bump([1,2,3]).

recurssion:average([]).
recurssion:average(lists:seq(1,10)).

recurssion:even([]).
recurssion:even(lists:seq(1,10)).

recurssion:member(9, lists:seq(1,10)).

recurssion:member(friday, [monday, tuesday, wednesday, thursday, friday]).
recurssion:member(sunday, [monday, tuesday, wednesday, thursday, friday]).

```