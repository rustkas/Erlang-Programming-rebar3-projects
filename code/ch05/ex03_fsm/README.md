ex03_fsm
=====

An OTP library

Build
-----
	$ rebar3 compile
	$ rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	> 
    
```
fsm:start().
fsm ! {1, incoming}.
fsm ! {1, off_hook}.
```	
