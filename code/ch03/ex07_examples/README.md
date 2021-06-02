ex07_examples
=====

An OTP application

Create new project
----	
	$ rebar3 ex07_examples
	$ cd ex07_examples
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib examples
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex07_examples && cd ex07_examples && rm -R apps && mkdir lib && cd lib && rebar3 new lib examples && cd examples && mkdir test && cd ../.. 

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app examples
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

