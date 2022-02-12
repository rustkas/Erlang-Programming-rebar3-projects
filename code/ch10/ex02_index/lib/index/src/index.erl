-module(index).

-export([index/1]).

%-define(Punctuation,"(\\ |\\,|\\.|\\;|\\:|\\t|\\n|\\(|\\))+").
-define(Punctuation,"[ \\,\\.\\;\\:\\t\\n\\(\\)]+").

index(File) ->
	ets:new(indexTable, [ordered_set, named_table]),
	processFile(File),
	prettyIndex().

processFile(File) ->
	{ok,IoDevice} = file:open(File,[read]),
	processLines(IoDevice,1).
	
processLines(IoDevice,N) ->
	case io:get_line(IoDevice,"") of
		eof ->
			ok;
		Line ->
			processLine(Line,N),
			processLines(IoDevice,N+1)
	end.
	
processLine(Line,N) ->
	Words = re:split(Line,?Punctuation,[{return,list}]),
	processWords(Words,N).

processWords([],_N) -> ok;
processWords([Word|Rest],N) ->
	case length(Word) > 3 of
		true ->
			Normalise = string:to_lower(Word),
			ets:insert(indexTable,{{Normalise , N}});
		false -> ok
	end,
	processWords(Rest,N).

prettyIndex() ->
	case ets:first(indexTable) of
		'$end_of_table' ->
			ok;
		{Word, N} ->
			IndexEntry = {Word, [N]},
			First = {Word, N},
			prettyIndexNext(First,IndexEntry)
	end.

prettyIndexNext(Entry,{Word, Lines}=IndexEntry) ->
  Next = ets:next(indexTable,Entry),
  case Next of
    '$end_of_table' ->
      prettyEntry(IndexEntry);
    {NextWord, M}  ->
      if
        NextWord == Word ->
          prettyIndexNext(Next,{Word, [M|Lines]});
        true ->
          prettyEntry(IndexEntry),
          prettyIndexNext(Next,{NextWord, [M]})
      end
  end.

prettyEntry({NextWord, M}) ->
    io:format("~-20s~w.~n",[NextWord, M]).