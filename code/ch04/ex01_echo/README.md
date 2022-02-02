ex01_echo
=====
$ rebar3 new lib ex01_echo && rm -R src && cd ex01_echo && mkdir lib && cd lib && rebar3 new lib echo && cd ..


An OTP library

Build
-----

    $ rebar3 shell
	> echo:go().
	
