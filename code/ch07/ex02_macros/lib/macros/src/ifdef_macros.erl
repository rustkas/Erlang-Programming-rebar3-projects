-module(ifdef_macros).
-export([print/0,print/2]).

-ifdef(debug).
	-define(DBG(_Str, _Args), io:format(_Str, _Args)).
-else.
	-define(DBG(_Str, _Args), ok).	
-endif.

print(_Str,_Args) -> ?DBG(_Str, _Args).

print() -> ?DBG("~p:call(~p) called~n",[?MODULE, "Request"]).