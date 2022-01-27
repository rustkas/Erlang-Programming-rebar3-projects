-module(prop_sum).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_sum() ->
	 ?FORALL({N,M}, input_integers(),
		 begin
		 	lists:sum(lists:seq(N,M)) =:= sum:sum(N,M) 
		 end).

 %%%%%%%%%%%%%%%%%%
 %%% Generators %%%
 %%%%%%%%%%%%%%%%%%
 input_integers() -> 
    ?SUCHTHAT({N,M}, {pos_integer(),pos_integer()}, M > N).