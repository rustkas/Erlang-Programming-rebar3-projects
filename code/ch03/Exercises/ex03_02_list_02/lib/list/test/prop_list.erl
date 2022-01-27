-module(prop_list).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_create() ->
    ?FORALL(ListLength, pos_integer(),
        begin
            lists:reverse(lists:seq(1,ListLength)) =:= list:reverse_create(ListLength)
        end).
