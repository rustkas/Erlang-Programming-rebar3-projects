An OTP application

Create new project
----	
Create ex02_atoms
----	
	$ rebar3 ex02_atoms
	$ cd ex02_atoms
	$ rm -R apps
	$ mkdir lib
	$ cd lib
	$ rebar3 new lib atoms
	$ cd ..
	
	# all commands in one string
	$ rebar3 new umbrella ex02_atoms && cd ex02_atoms && rm -R apps && mkdir lib && cd lib && rebar3 new lib atoms && cd ..

Build
-----
	$ rebar3 compile

Run
-----
	$ rebar3 eunit -v --app atoms
	
Format
-----
	$ rebar3 format

Generate documentation
-----
	$ rebar3 edoc
	
	