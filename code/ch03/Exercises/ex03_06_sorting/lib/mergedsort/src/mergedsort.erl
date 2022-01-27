-module(mergedsort).

-export([sort/1]).

sort([]) -> [];
sort([Head]) -> [Head];
sort(List) when length(List) rem 2 =:= 0 -> 
 ListsSize = length(List) div 2,
 {LeftList, NewList} = splitLists(List, ListsSize, []),
  merge(sort(LeftList), sort(NewList));
sort([Head|Tail]) -> 
 ListsSize = length(Tail) div 2,
 {LeftList, NewList} = splitLists(Tail, ListsSize, [Head]),
 merge(sort(LeftList), sort(NewList)).

splitLists(List, 0, LeftList) -> {LeftList, List};
splitLists([Head | Tail], ListsSize, LeftList) ->	
	splitLists(Tail, ListsSize-1, LeftList ++ [Head]).


merge([], RightList) -> RightList;
merge(LeftList, []) -> LeftList;
merge(LeftList, RightList) -> 
 [HeadLeft | TailLeft] = LeftList,
 [HeadRight | TailRight] = RightList,
 case HeadLeft < HeadRight of
  true -> [HeadLeft | merge(TailLeft, RightList)];
  false  -> [HeadRight | merge(LeftList, TailRight)]
 end.
  