ex13_io_examples
=====

Create new project
----	
	$ rebar3 ex13_io_examples
	$ cd ex13_io_examples
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib io_examples
	$ cd boolean
	$ mkdir test
	$ cd ../..
	
	# all commands in one string
	$ rebar3 new umbrella ex13_io_examples && cd ex13_io_examples && rm -R apps && mkdir lib && cd lib && rebar3 new lib io_examples && cd ..

Build
-----
	$ rebar3 compile

Run EUnit
-----
	$ rebar3 eunit -v --app io_examples

Run shell
-----

	$ rebar3 shell --apps io_examples
	> r3:do(compile). % recompile after source code editing 
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
