ex03_binaries
=====
```
rebar3 new lib ex03_binaries && cd ex03_binaries && rm -R src && mkdir lib && cd lib && rebar3 new lib binaries && cd ..
```

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 
	>

```
1> Bin1 = term_to_binary({test,12,true,[1,2,3]}).
<<131,104,4,100,0,4,116,101,115,116,97,12,100,0,4,116,114,
117,101,107,0,3,1,2,3>>
2> Term1 = binary_to_term(Bin1).
{test,12,true,[1,2,3]}
3> Bin2 = term_to_binary({cat,dog}).
<<131,104,2,100,0,3,99,97,116,100,0,3,100,111,103>>
4> Bin3 = list_to_binary([Bin1, Bin2]).
<<131,104,4,100,0,4,116,101,115,116,97,12,100,0,4,116,114,
117,101,107,0,3,1,2,3,131,104,2,100,...>>
5> Term2 = binary_to_term(Bin3).
{test,12,true,[1,2,3]}
6> {Bin4,Bin5} = split_binary(Bin3,25).
{<<131,104,4,100,0,4,116,101,115,116,97,12,100,0,4,116,
114,117,101,107,0,3,1,2,3>>,
<<131,104,2,100,0,3,99,97,116,100,0,3,100,111,103>>}
7> Term4 = binary_to_term(Bin5).
{cat,dog}
8> is_binary(Term4).
false
9> is_binary(Bin4).
true
```

```
Bin1 = <<1,2,3>>.
```