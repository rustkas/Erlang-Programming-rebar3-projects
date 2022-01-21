-module(booleans).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
      {"Simple examples",  fun examples/0},
      {"erlang:is_boolean",  fun is_boolean_examples/0},
      {"Compare == /= =< >= =:= =/=",  fun compare_0/0},
      {"Check 'and' operator",  fun and_examples/0},
      {"Check 'or' operator",  fun or_examples/0},
      {"Check 'andalso' operator",  fun andalso_examples/0},
      {"Check 'orelse' operator",  fun orelse_examples/0},
      {"Check 'xor' operator",  fun xor_examples/0},
      {"Check 'not' operator",  fun not_examples/0},
      {"Check boolean axioms",  fun boolean_axioms/0},
      {"Check consequences of axioms", fun consequences_of_axioms/0},
      {"Try to use math operation with boolean values", fun try_math/0}
      
     ].

examples() ->
  ?assertEqual(false, 1 == 2),
  ?assertEqual(true, 1 < 2),
  ?assert(1 < 2),
  ?assertEqual(false, a > z),
  ?assert(less < more),
  
  ?assertEqual(false, not((1 < 3) and (2 == 2))),
  ?assertEqual(false, not((1 < 3) or (2 == 2))),
  ?assertEqual(true, not((1 < 3) xor (2 == 2))),

%*
  ?assertEqual(false, not (1 < 3) andalso (2/0 == 2)),
  ?assertEqual(true, not (1 > 3) orelse (2/0 == 2))

  .

compare_0() ->
% == /= =< >= =:= =/=
?assertEqual(true, 1 == 1.0),
?assertEqual(true, 100 == 100.0),
?assertEqual(false, 1 =:= 1.0),
?assertEqual(false, 100 =:= 100.0),

?assertEqual(true, 1 /= 2),
?assertEqual(true, 2 /= 1),

?assertEqual(true, 0 =< 2),
?assertEqual(true, 10 >= 2),

?assert(1 =/= 1.0),
?assert(100 =/= 100.0).

is_boolean_examples() ->
?assertEqual(false, is_boolean(2+2)),
?assertEqual(false, is_boolean(2-2)),
?assertEqual(false, is_boolean(2/2)),
?assertEqual(false, is_boolean(2 div 2)),
?assertEqual(false, is_boolean(2 rem 2)),
?assertEqual(false, is_boolean(+2)),
?assertEqual(false, is_boolean(-2)),

?assertEqual(true, is_boolean(true)),
?assertEqual(true, is_boolean(false)),

?assertEqual(true, is_boolean(1 == 1.0)),
?assertEqual(true, is_boolean(100 == 100.0)),
?assertEqual(true, is_boolean(1 =:= 1.0)),
?assertEqual(true, is_boolean(100 =:= 100.0)),

?assertEqual(true, is_boolean(1 /= 2)),
?assertEqual(true, is_boolean(2 /= 1)),

?assertEqual(true, is_boolean(0 =< 2)),
?assertEqual(true, is_boolean(10 >= 2)),

?assertEqual(true, is_boolean(1 =/= 1.0)),
?assertEqual(true, is_boolean(100 =/= 100.0)).

% true if left side is true and right is true
and_examples() ->

?assertEqual(true, (2+2 == 4) and (3+3 == 6)),
?assertEqual(false, (2+2 /= 4) and (3+3 == 6)),
?assertEqual(false, (2+2 == 4) and (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) and (3+3 /= 6)).

% true if left side is true or right is true
or_examples() ->

?assertEqual(true, (2+2 == 4) or (3+3 == 6)),
?assertEqual(true, (2+2 /= 4) or (3+3 == 6)),
?assertEqual(true, (2+2 == 4) or (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) or (3+3 /= 6)).

andalso_examples() ->

?assertEqual(true, (2+2 == 4) andalso (3+3 == 6)),
?assertEqual(false, (2+2 /= 4) andalso (3+3 == 6)),
?assertEqual(false, (2+2 == 4) andalso (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) andalso (3+3 /= 6)),


?assertEqual(false, (2+2 == 4) andalso (3+3 == 6) andalso (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) and (3+3 == 6) andalso (3/0 == 6)),
?assertEqual(false, (2+2 /= 4) andalso (3+3 == 6) andalso (3/0 == 6)).

orelse_examples() ->

?assertEqual(true, (2+2 == 4) orelse (3+3 == 6)),
?assertEqual(true, (2+2 /= 4) orelse (3+3 == 6)),
?assertEqual(true, (2+2 == 4) orelse (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) orelse (3+3 /= 6)),

?assertEqual(true, (2+2 == 4) orelse (3+3 == 6) orelse (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) orelse (3+3 /= 6) orelse (3+3 /= 6)),
?assertEqual(true, (2+2 /= 4) or (3+3 /= 6) orelse (3+3 == 6) orelse (3/0 == 6)),
?assertEqual(true, (2+2 /= 4) orelse (3+3 /= 6) orelse (3+3 == 6) orelse (3/0 == 6)).

xor_examples() ->
?assertEqual(false, (2+2 == 4) xor (3+3 == 6)),
?assertEqual(true, (2+2 /= 4) xor (3+3 == 6)),
?assertEqual(true, (2+2 == 4) xor (3+3 /= 6)),
?assertEqual(false, (2+2 /= 4) xor (3+3 /= 6)),

?assertEqual(false, (2+2 == 4) xor (3+3 == 6) xor (3+3 /= 6)),
?assertEqual(true, (2+2 == 4) xor (3+3 == 6) xor (3+3 == 6)).

not_examples() ->
    ?assertEqual(true, not (2+2 /= 4)),
    ?assertEqual(false, not (2+2 == 4)).

boolean_axioms() ->
    A = true,
    B = false,
    C = true,

% A1
    % A ∪ B = B ∪ A
    ?assertEqual(A and B, B and A),
    % A ∩ B = B ∩ A
    ?assertEqual(A or B, B or A),

% A2
    % (A ∪ B) ∪ B = (A ∪ B) ∪ C
    ?assertEqual((A and B) and B, (A and B) and C),
    % A ∩ (B ∩ C) = (A ∩ B) ∩ C
    ?assertEqual(A or (B or C), (A or B) or C),

% A3
    % (A ∩ B) ∪ B = B
    ?assertEqual((A or B) and B, B),
    % (A ∪ B) ∩ B = B
    ?assertEqual((A and B) or B, B),

% A4
    % A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
    ?assertEqual(A or (B and C), (A or B) and (A or C)),
    % A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
    ?assertEqual(A and (B or C), (A and B) or (A and C)),

% A5
    % (A ∩ -A) ∪ B = B
    ?assertEqual((A or not A) and B, B),

    % (A ∪ -A) ∩ B = B
    ?assertEqual((A and not A) or B, B).

consequences_of_axioms() ->
	A = true,
	B = not A,    

	%(1)
	% A ∪ A = A
	?assertEqual(A and A, A),
	?assertEqual(B and B, B),
	% A ∩ A = A
	?assertEqual(A or A, A),
	?assertEqual(B or B, B),

	% A = A ∪ (A ∩ B) = (A ∪ A) ∩ (A ∪ B) = 
	% (A ∩ (A ∪ B)) ∪ (A ∩ (A ∪ B)) = A ∪ A
	?assert(
	% syntax error    
	% A == A and (A or B) == (A and A) or (A and B)
	% Use () to divide logical temp values
	(((A == A and (A or B)) == (A and A) or (A and B)) == (A or (A and B)) and (A or (A and B))) == A and A
	),

	% A = A ∩ (A ∪ B) = (A ∩ A) ∪ (A ∩ B) = 
	% (A ∪ (A ∩ B)) ∩ (A ∪ (A ∩ B)) = A ∩ A
	?assert(
	(((A == A or (A and B)) == (A or A) and (A or B)) == (A and (A or B)) or (A and (A or B))) == A or A
	).

try_math() ->
   A = true,
   ?assertError(badarith,-1 * A),
   ?assertError(badarith,-A).

-endif.