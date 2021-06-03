ex10_process_dictionary
=====

An OTP application "Process Dictionary"

Create new project
----	
	$ rebar3 ex10_process_dictionary
	$ cd ex10_process_dictionary
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib process_dictionary
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex10_process_dictionary && cd ex10_process_dictionary && rm -R apps && mkdir lib && cd lib && rebar3 new lib process_dictionary && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app process_dictionary
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
