ex03_03_format
=====

Exercise 3-3:  Side Effects
=====

Write a function that prints out the integers between 1 and N.

Hint: use `io:format("Number:~p~n",[N]).`

Write a function that prints out the even integers between `1` and `N`.

Hint: use guards.

## An OTP application

Create new project

---- 
 # all commands in one string
 $ rebar3 new umbrella ex03_03_format && cd ex03_03_format && rm -R apps && mkdir lib && cd lib && rebar3 new lib format && cd ..

Run shell
-----

 $ rebar3 shell --apps list
 > r3:do(compile). % recompile after source code editing 
 
 
 $ werl +pc unicode
 > code:add_path

```
format:print_integers(0).
format:print_integers(1).
format:print_integers(10).


format:print_even_integers(0).
```


### Run EUnit

-----
 $ rebar3 eunit -m print_integers_test
 $ rebar3 eunit -m print_integers_test -v
 
 $ rebar3 eunit -m print_even_integers_test

 $ rebar3 as test shell

### Property based testing

rebar.config
-----

```
{erl_opts, [debug_info]}.
{deps, []}.


{profiles,
    [{test, [
        {erl_opts, [nowarn_export_all]}
        
    ]}
]}.
```

