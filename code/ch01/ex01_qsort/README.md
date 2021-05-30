An OTP application

Create new project
----	
Create ex01_qsort
----	
	$ rebar3 ex01_qsort
	$ cd ex01_qsort
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib qsort
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex01_qsort && cd ex01_qsort && rm -R apps && mkdir lib && cd lib && rebar3 new lib qsort && cd ..

Build
-----
	$ rebar3 compile

Test
-----
	$ rebar3 eunit -v --app qsort
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc