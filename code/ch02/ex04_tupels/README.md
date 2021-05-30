An OTP application

Create new project
----	
Create ex04_tupels
----	
	$ rebar3 ex04_tupels
	$ cd ex04_tupels
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib tupels
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex04_tupels && cd ex04_tupels && rm -R apps && mkdir lib && cd lib && rebar3 new lib tupels && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app tupels
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc