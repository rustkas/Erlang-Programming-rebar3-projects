ex11_meta_programming
=====

An OTP application

Create new project
----	
	$ rebar3 ex11_meta_programming
	$ cd ex11_meta_programming
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib meta_programming
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex11_meta_programming && cd ex11_meta_programming && rm -R apps && mkdir lib && cd lib && rebar3 new lib type_conversion && cd type_conversion && mkdir test && cd ../.. 
	$ rebar3 new umbrella ex11_meta_programming && cd ex11_meta_programming && rm -R apps && mkdir lib && cd lib && rebar3 new lib meta_programming && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app meta_programming
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

