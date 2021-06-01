# ex02_3
=====
Create new project
----	
	$ rebar3 ex02_3
	$ cd ex02_3
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib boolean
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex02_3 && cd ex02_3 && rm -R apps && mkdir lib && cd lib && rebar3 new lib boolean && cd boolean && mkdir test && cd ../.. 

## An OTP application


Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app boolean
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
	