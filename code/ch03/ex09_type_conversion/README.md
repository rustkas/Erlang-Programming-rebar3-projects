ex09_type_conversion
=====

An OTP application

Create new project
----	
	$ rebar3 ex09_type_conversion
	$ cd ex09_type_conversion
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib type_conversion
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex09_type_conversion && cd ex09_type_conversion && rm -R apps && mkdir lib && cd lib && rebar3 new lib type_conversion && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app type_conversion
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

