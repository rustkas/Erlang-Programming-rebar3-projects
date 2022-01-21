
## An OTP application

Create new project
----	
	$ rebar3 new umbrella ex01_numbers && cd basic && rm -R apps && mkdir lib && cd lib && rebar3 new lib numbers && cd ..

	
	
Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app numbers
	
Format
-----
	$ rebar3 format

