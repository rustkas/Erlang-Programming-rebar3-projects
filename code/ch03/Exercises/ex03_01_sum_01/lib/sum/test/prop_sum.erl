-module(prop_sum).
-include_lib("proper/include/proper.hrl").

%%%%%%%%%%%%%%%%%%
%%% Properties %%%
%%%%%%%%%%%%%%%%%%
prop_sum1_test() ->
	 ?FORALL(Number, pos_integer(),
		 begin
		 	sum:sum2(Number) =:= lists:sum(lists:seq(1,Number))
			 
		 end).

