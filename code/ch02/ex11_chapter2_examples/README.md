ex11_chapter2_examples
=====

Create new project

----	
	$ rebar3 ex11_chapter2_examples
	$ cd ex11_chapter2_examples
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib chapter2
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex11_chapter2_examples && cd ex11_chapter2_examples && rm -R apps && mkdir lib && cd lib && rebar3 new lib chapter2 && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app chapter2
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
