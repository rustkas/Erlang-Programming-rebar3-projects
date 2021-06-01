ex03_listlen
=====

An OTP application

Create new project
----	
	$ rebar3 ex03_listlen
	$ cd ex03_listlen
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib listlen
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex03_listlen && cd ex03_listlen && rm -R apps && mkdir lib && cd lib && rebar3 new lib listlen && cd listlen && mkdir test && cd ../.. 

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app listlen
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
