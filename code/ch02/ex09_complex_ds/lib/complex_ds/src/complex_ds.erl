-module(complex_ds).

-export([]).
%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [
      {"Create Complex data types",  fun create/0}

     ].

create() ->

  .


-endif.	 