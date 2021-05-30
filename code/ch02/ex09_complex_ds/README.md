ex09_complex_ds
=====

Create erlang_simple_string
----	
	$ rebar3 ex09_complex_ds
	$ cd ex09_complex_ds
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib complex_ds
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex09_complex_ds && cd ex09_complex_ds && rm -R apps && mkdir lib && cd lib && rebar3 new lib complex_ds && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app complex_ds
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
