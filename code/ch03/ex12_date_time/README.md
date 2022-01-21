ex12_date_time
=====

Create new project
----	
	$ rebar3 ex12_date_time
	$ cd ex12_date_time
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib meta_programming
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex12_date_time && cd ex12_date_time && rm -R apps && mkdir lib && cd lib && rebar3 new lib date_time && cd ..

Build
-----
	$ rebar3 compile

Run EUnit
-----
	$ rebar3 eunit -v --app date_time
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc

