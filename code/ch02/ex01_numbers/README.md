An OTP application

Create new project
----	
Create ex01_numbers
----	
	$ rebar3 ex01_numbers
	$ cd ex01_numbers
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib numbers
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex01_numbers && cd ex01_numbers && rm -R apps && mkdir lib && cd lib && rebar3 new lib numbers && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app numbers
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
