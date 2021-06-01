ex10_pattern_matching
=====

Create new project
----	
Create erlang_simple_string
----	
	$ rebar3 ex10_pattern_matching
	$ cd ex10_pattern_matching
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib pattern_matching
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex10_pattern_matching && cd ex10_pattern_matching && rm -R apps && mkdir lib && cd lib && rebar3 new lib pattern_matching && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app pattern_matching
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
