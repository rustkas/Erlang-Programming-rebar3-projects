ex04_rel
=====

An OTP library

Build
-----

	$ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing
	
```
7> systools:make_script("usr", [local]).
ok
8> ls().
usr-1.0
usr.boot
usr.rel
usr.script
usrDb
```	

systools:make_script("usr").

systools:make_tar("usr").

tar tf usr.tar
Start release:
=========
```
erl –boot usr
```

application:loaded_applications().