An OTP application

Create new project
----	
Create ex03_booleans
----	
	$ rebar3 ex03_booleans
	$ cd ex03_booleans
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib booleans
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex03_booleans && cd ex03_booleans && rm -R apps && mkdir lib && cd lib && rebar3 new lib booleans && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app booleans
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
	