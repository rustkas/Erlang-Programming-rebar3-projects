ex06_guards
=====

An OTP application

Create new project
----	
	$ rebar3 ex06_guards
	$ cd ex06_guards
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib guards
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex06_guards && cd ex06_guards && rm -R apps && mkdir lib && cd lib && rebar3 new lib guards && cd guards && mkdir test && cd ../.. 

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app guards
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

