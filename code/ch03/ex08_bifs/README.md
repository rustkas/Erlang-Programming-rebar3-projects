ex08_bifs
=====

An OTP application

Create new project
----	
	$ rebar3 ex08_bifs
	$ cd ex08_bifs
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib bifs
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex08_bifs && cd ex08_bifs && rm -R apps && mkdir lib && cd lib && rebar3 new lib bifs && cd bifs && mkdir test && cd ../.. 


Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app bifs
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
