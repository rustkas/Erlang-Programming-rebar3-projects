-module(atoms).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check varities of atoms", fun atom_variations/0}].

atom_variations() ->
    ?assertEqual(ok, ok),
    ?assert((ok =:= ok)),
    ?assert((k1 =:= k1)),
    ?assert((k2 =:= k2)),
    ?assert((k3 =:= k3)),
    ?assert((k4 =:= k4)),
    ?assert((k5 =:= k5)),
    ?assert((k6 =:= k6)),
    ?assert((k7 =:= k7)),
    ?assert((k8 =:= k8)),
    ?assert((k9 =:= k9)),
    ?assert((k@ =:= k@)),
    % full stop is not valid (.)
    % ?assert(k. =:= 'k.')
    ?assert((k_ =:= k_)),
    ?assertEqual([january,
                  fooBar,
                  alfa21,
                  start_with_lower_case,
                  node@ramone,
                  true,
                  false],
                 ['january',
                  'fooBar',
                  'alfa21',
                  'start_with_lower_case',
                  'node@ramone',
                  'true',
                  'false']),
    ?assert((is_list(['January',
                      'a space',
                      'Anything inside quotes{}#@ \n\n',
                      'node@ramone.erlang-consulting.com']))),
    ?assert((abc =:= 'abc')),
    ?assert((abc_123_CDE =:= 'abc_123_CDE')),
    ?assert(('using spaces' =:= 'using spaces')),
    ?assert((lowercaseQuote =:= 'lowercaseQuote')),
    ?assert(('\n\n' =:= '\n\n')),
    ?assert(('1
2
3\n4' =:= '1\n2\n3\n4')),
    ?assert(is_atom('funny characters in quotes: !"£$%^&*()-=')),
    ?assert(is_atom('1+2+3')),
    ?assert(is_atom('missing a full stop.')).

-endif.
