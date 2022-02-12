ex02_modtest2
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> c(modtest2).
{ok,modtest2}
2> modtest2:main().
true
3> modtest2:do(99).
101
```

```
4> c(modtest2).
{ok,modtest2}
5> modtest2:do(99).
101
```

```
6> c(modtest2).
{ok,modtest2}
7> modtest2:do(99).
99
```

```
```