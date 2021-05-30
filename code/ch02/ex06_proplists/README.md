An OTP application

Create new project
----	
Create erlang_simple_string
----	
	$ rebar3 ex06_proplists
	$ cd ex06_proplists
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib proplists_examples
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex06_proplists && cd ex06_proplists && rm -R apps && mkdir lib && cd lib && rebar3 new lib proplists_examples && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app proplists_examples
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
