ex15_tail_recurssion
=====

An OTP application

Create new project
----	
Create ex14_recurssion
----	
	# all commands in one string
	$ rebar3 new umbrella ex15_tail_recurssion && cd ex15_tail_recurssion && rm -R apps && mkdir lib && cd lib && rebar3 new lib tail_recurssion && cd ..

Run shell
-----
	$ rebar3 shell --apps tail_recurssion
	> r3:do(compile). % recompile after source code editing 
	
	
	$ werl +pc unicode
	> code:add_path

```
tail_recurssion:sum([]).
tail_recurssion:sum(lists:seq(1,10)).
tail_recurssion:bump(lists:seq(1,10)).
tail_recurssion:merge([a,b,c,d,e,f,g,h,i,j,k],lists:seq(1,10)).

lists:map(fun(Elem)-> list_to_atom([Elem]) end, lists:seq($a,$k)).

```	

```
test:factorial(-1).
test:test1(0).
test:test2(0).
```

```
1> N=45.
45
2> {N,M}={23,45}.
** exception error: no match of right hand side value {23,45}
{1,two,3, Four} = {1,two,3}.

```

```
lists:keysearch(1,1,[{1,2},{2,4}]).
lists:keysearch(3,1,[{1,2},{2,4}]).

{Value,Tuple} = lists:keysearch(1,1,[{1,2},{2,4}]).
{Value,Tuple} = lists:keysearch(3,1,[{1,2},{2,4}]).
```

```
length(helloworld).
test:hello().
1+a.

```

```
1> X=2.
2
2> try (X=3) of
2> Val -> {normal, Val}
2> catch
2> _:_ -> 43
2> end.

3> try (X=3) of
3> Val -> {normal, Val}
3> catch
3> error:_ -> 43
3> end.

4> try (X=3) of
4> Val -> {normal, Val}
4> catch
4> error:Error -> {error,Error}
4> end.
{error,{badmatch,3}}

5> try (throw(non_normal_return)) of
5> Val -> {normal, Val}
5> catch
5> throw:Error -> {throw, Error}
5> end.
{throw,non_normal_return}
```

```
exception:return_error(-1).
exception:return_error(0).
exception:return_error(1).

exception:try_return(-1).
exception:try_return(0).
exception:try_return(1).

exception:try_wildcard(-1).
exception:try_wildcard(0).
exception:try_wildcard(1).

exception:try_return2(-1).
exception:try_return2(0).
exception:try_return2(1).

```

```
		list_to_integer("one").
catch 	list_to_integer("one").

catch 1/0.
X = catch 1/0.
X = (catch 1/0).
```

```
		my_math:add(1,1).
		my_math:add(one,1).
		my_math:add(ok,ok).
catch 	my_math:add(one,1).
```

```
exception:return(-1).
exception:return(0).
exception:return(1).

catch exit({badarith, [{exception, return_error, 1}, {erl_eval, do_apply, 5}, {shell, exprs, 6}, {shell, eval_exprs, 6},{shell, eval_loop, 3}]}).
```