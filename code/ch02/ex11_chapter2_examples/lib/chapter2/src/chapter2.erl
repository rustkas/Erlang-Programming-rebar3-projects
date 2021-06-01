%% Code from 
%%   Erlang Programming
%%   Francecso Cesarini and Simon Thompson
%%   O'Reilly, 2008
%%   http://oreilly.com/catalog/9780596518189/
%%   http://www.erlangprogramming.org/
%%   (c) Francesco Cesarini and Simon Thompson

%% Chapter 2

-module(chapter2).
-export([area/1,area2/1,flatten/1,factorial/1, factorial2/1]).

-import(math, [sqrt/1]).

% To calculate the area of a shape (section 2.12)

area({square, Side}) ->
  Side * Side ;
area({circle, Radius}) ->
  math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
  S = (A + B + C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C));
area(_Other) ->
  {error, invalid_object}.

% Variant of area using the  sqrt/1 imported from the math module.

area2({square, Side}) ->
  Side * Side ;
area2({circle, Radius}) ->
  math:pi() * Radius * Radius;
area2({triangle, A, B, C}) ->
  S = (A + B + C)/2,
  sqrt(S*(S-A)*(S-B)*(S-C));
area2(_Other) ->
  {error, invalid_object}.

% To flatten a 3D object into a 2D object.


flatten(cube)   -> square;
flatten(sphere) -> circle;
flatten(_Other)  -> {error, unknown_shape}.

% The factorial function.

factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) ->
  N * factorial(N-1).

% tail recursion implementation

factorial2(0) -> 1;
factorial2(1) -> 1;
factorial2(N) ->
  factorial2(N, 1).

factorial2(0, Result) -> Result;
factorial2(N, Result) -> factorial2(N-1, N * Result).
