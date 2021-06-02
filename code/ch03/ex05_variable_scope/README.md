ex05_variable_scope
=====

An OTP application

Create new project
----	
	$ rebar3 ex05_variable_scope
	$ cd ex05_variable_scope
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib variable_scope
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex05_variable_scope && cd ex05_variable_scope && rm -R apps && mkdir lib && cd lib && rebar3 new lib variable_scope && cd variable_scope && mkdir test && cd ../.. 

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app variable_scope
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
