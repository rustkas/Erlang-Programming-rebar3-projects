ex04_index
=====

An OTP application

Build
Create new project
----	
	$ rebar3 ex04_index
	$ cd ex04_index
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib index
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex04_index && cd ex04_index && rm -R apps && mkdir lib && cd lib && rebar3 new lib index && cd index && mkdir test && cd ../.. 

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app index
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
