An OTP application

Create new project
----	
Create ex05_lists_examples
----	
	$ rebar3 ex05_lists_examples
	$ cd ex05_lists_examples
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib lists_examples
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex05_lists_examples && cd ex05_lists_examples && rm -R apps && mkdir lib && cd lib && rebar3 new lib lists_examples && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app lists_examples
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
	