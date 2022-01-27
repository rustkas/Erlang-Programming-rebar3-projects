-module(prop_list).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_create() ->
    ?FORALL(ListLength, pos_integer(),
        begin
            lists:seq(1,ListLength) =:= list:create(ListLength)
        end).
