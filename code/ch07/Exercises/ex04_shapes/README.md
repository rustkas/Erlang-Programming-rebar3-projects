ex04_shapes
=====

An OTP library

Build
-----

    $ rebar3 compile && rebar3 shell
	> r3:do(compile). % recompile after source code editing 

```
1> rr(shapes).
[circle,rectangle]
1>shapes:perimeter(#circle{radius=1}).
6.28
2>shapes:perimeter(#rectangle{width=1,length=1}).
4.0
3>shapes:area(#circle{radius=1}).
3.14
4>shapes:area(#rectangle{width=1,length=1}).
1.0
4>rr(shapes).
5>shapes:perimeter(#triangle{sideA=1,sideB=1,sideC=1}).
3.0
4>shapes:area(#triangle{sideA=1,sideB=1,sideC=1}).
0.43
```