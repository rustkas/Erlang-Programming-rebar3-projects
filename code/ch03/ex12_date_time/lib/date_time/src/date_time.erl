-module(date_time).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

date_time_now_test_() ->
    [{"date", fun date_examples/0},
     {"time", fun time_examples/0},
     {"now", fun now_example/0}].

% time_unit() =
%     integer() >= 1 |
%     second | millisecond | microsecond | nanosecond | native |
%     perf_counter |
%     deprecated_time_unit()
system_time_test_() ->
    [{"Retrieve Erlang System Time", fun empty/0},
     {"1/PartsPerSecond",
      fun current_system_time_parts_per_second/0},
     {"time_unit() = second",
      fun current_system_time_second/0},
     {"time_unit() = millisecond",
      fun current_system_time_millisecond/0},
     {"time_unit() = microsecond",
      fun current_system_time_microsecond/0},
     {"time_unit() = nanosecond",
      fun current_system_time_nanosecond/0},
     {"time_unit() = native",
      fun current_system_time_native/0},
     {"time_unit() = perf_counter",
      fun current_system_time_perf_counter/0}].

time_diffrence_test_() ->
    [{"Measure Elapsed Time", fun empty/0},
     {"native", fun calculate_time_diff_native/0}].

time_order_test_() ->
    [{"Determine Order of Events", fun empty/0},
     {"Create strictly monotonically ordered "
      "integers",
      fun create_strictly_monotonically_ordered_integers/0},
     {"Determine Order of Events with Time "
      "of the Event",
      fun determine_order/0},
     {"Create a Unique Name", fun create_unique_name/0},
     {"Seed Random Number Generation with a "
      "Unique Value",
      fun random_number_generation/0},
      {"Show system info", fun show_system_info/0}
      ].

empty() -> ok.

date_examples() ->
    {Year, Month, Day} = date(),
    [Year, Month, Day] = tuple_to_list(date()),
    % ?debugFmt("~n~p~n", [[Day, Month, Year]]),
    ok.

time_examples() ->
    {Hour, Minute, Second} = time(),
    [Hour, Minute, Second] = tuple_to_list(time()),
    % ?debugFmt("~n~p~n", [[Hour, Minute, Second]]),
    ok.

% http://erlang.org/doc/man/erlang.html#now-0
% Note that - "This function 'now' is deprecated. Do not use it."
now_example() ->
    Timestamp = now(),
    Timestamp_new_api = erlang:timestamp(),
    % ?debugFmt("~n~p~n", [Timestamp]),
    {MegaSecs, Secs, MicroSecs} = Timestamp,
    ?assert((MegaSecs >= 0)),
    ?assert((Secs >= 0)),
    ?assert((MicroSecs >= 0)),
    ?assertEqual(Timestamp, Timestamp_new_api),
    ok.

current_system_time_parts_per_second() ->
    % 1/PartsPerSecond
    PartsPerSecond = erlang:system_time(1),
    PartsPerSecond,
    % ?assertEqual(PartsPerSecond*2+1, erlang:system_time(2)),
    ok.

current_system_time_second() ->
    % Note to length of the time data
    % seconds = 1622868405
    %
    % ?debugFmt("~n~p~n", [erlang:system_time(second)]),
    %
    % ?debugFmt("Start: ~n~p~n", [erlang:system_time(second)]),
    % timer:sleep(timer:seconds(1)),
    % ?debugFmt("End: ~n~p~n", [erlang:system_time(second)]),
    StartTime = erlang:system_time(second),
    timer:sleep(timer:seconds(1)),
    EndTime = erlang:system_time(second),
    ?assertEqual(1, (EndTime - StartTime)),
    ok.

current_system_time_millisecond() ->
    % Pay attention to the length of the resulting value
    % seconds      = 1622868438
    % milliseconds = 1622871603747
    %
    % ?debugFmt("~n~p~n", [erlang:system_time(millisecond)]),
    %
    % ?debugFmt("Start: ~n~p~n", [erlang:system_time(millisecond)]),
    % timer:sleep(timer:seconds(1)),
    % ?debugFmt("End: ~n~p~n", [erlang:system_time(millisecond)]),
    %
    % start = 1622873336774
    % end   = 1622873337788
    %
    StartTime = erlang:system_time(millisecond),
    timer:sleep(timer:seconds(1)),
    EndTime = erlang:system_time(millisecond),
    ?assert((1000 =< EndTime - StartTime)),
    ok.

current_system_time_microsecond() ->
    % Pay attention to the length of the resulting value
    % seconds      = 1622868438
    % milliseconds = 1622871603747
    % microsecond  = 1622875448103000
    %
    % ?debugFmt("~n~p~n", [erlang:system_time(microsecond)]),
    %
    % start = 1622875904962000
    % end   = 1622875905976000
    %
    % ?debugFmt("Start: ~n~p~n", [erlang:system_time(microsecond)]),
    % timer:sleep(timer:seconds(1)),
    % ?debugFmt("End: ~n~p~n", [erlang:system_time(microsecond)]),
    %
    StartTime = erlang:system_time(microsecond),
    timer:sleep(timer:seconds(1)),
    EndTime = erlang:system_time(microsecond),
    ?assert((1000_000 =< EndTime - StartTime)),
    ok.

current_system_time_nanosecond() ->
    % Pay attention to the length of the resulting value
    % seconds      = 1622868438
    % milliseconds = 1622871603747
    % microsecond  = 1622875448103000
    % nanosecond   = 1622876775927000000
    %
    % ?debugFmt("~n~p~n", [erlang:system_time(nanosecond)]),
    %
    % start = 1622877222239000000
    % end   = 1622877223253000000
    %
    % ?debugFmt("Start: ~n~p~n",
    %           [erlang:system_time(nanosecond)]),
    % timer:sleep(timer:seconds(1)),
    % ?debugFmt("End: ~n~p~n",
    %           [erlang:system_time(nanosecond)]),
    %
    StartTime = erlang:system_time(nanosecond),
    timer:sleep(timer:seconds(1)),
    EndTime = erlang:system_time(nanosecond),
    % ?debugFmt("~n~p~n", [EndTime - StartTime]),
    ?assert((1000_000_000 =< EndTime - StartTime)),
    ok.

current_system_time_native() ->
    ?assertError(badarg, (erlang:system_time(native))),
    %
    % the result equals the number of whole native time units per second.
    % ?debugFmt("~n~p~n", [erlang:convert_time_unit(1, second, native)]),
    %
    % 1024000
    ok.

current_system_time_perf_counter() ->
    % a performance counter is very fast and high resolution timestamp
    % ?debugFmt("Perf counter = ~n~p~n",
    %      [erlang:system_time(perf_counter)]),
    % 1622881755093000000
    % 1622877223253000000
    % It is look like erlang:system_time(nanosecond)
    ok.

calculate_time_diff_native() ->
    StartTime = erlang:monotonic_time(),
    timer:sleep(timer:seconds(1)),
    EndTime = erlang:monotonic_time(),
    Time = EndTime - StartTime,
    From = native,
    To = second,
    Result = erlang:convert_time_unit(Time, From, To),
    ?assertEqual(0, (erlang:system_info(start_time))),
    ?assertEqual(1, Result),
    ok.

create_strictly_monotonically_ordered_integers() ->
    Value1 = erlang:unique_integer([monotonic]),
    Value2 = erlang:unique_integer([monotonic]),
    ?assertNotEqual(Value1, Value2),
    ?assert((Value1 < Value2)),
    ok.

determine_order() ->
    Time1 = erlang:monotonic_time(),
    UMI1 = erlang:unique_integer([monotonic]),
    EventTag1 = {Time1, UMI1},
    Time2 = erlang:monotonic_time(),
    UMI2 = erlang:unique_integer([monotonic]),
    EventTag2 = {Time2, UMI2},
    ?assert((EventTag1 < EventTag2)),
    ok.

create_unique_name() ->
    PositiveValue1 = erlang:unique_integer([positive]),
    PositiveValue2 = erlang:unique_integer([positive]),
    ?assert((PositiveValue1 > 0)),
    ?assert((PositiveValue2 > 0)),
    ?assert((PositiveValue1 < PositiveValue2)),
    ok.

random_number_generation() ->
    RadomValue = erlang:monotonic_time() +
                     erlang:time_offset()
                     + erlang:unique_integer([positive]),
    % ?debugFmt("~n~p~n", [RadomValue]),
    ok.
show_system_info()->
    StartTime = erlang:system_info(start_time),
    StartTime,
    % ?debugFmt("~n~p~n", [StartTime]),

    EndTime = erlang:system_info(end_time),
    EndTime,
    % ?debugFmt("~n~p~n", [EndTime]),

    OsMonotonicTimeSource = erlang:system_info(os_monotonic_time_source),
    OsMonotonicTimeSource,
    % ?debugFmt("~n~p~n", [OsMonotonicTimeSource]),

    OsSystemTimeSource = erlang:system_info(os_system_time_source),
    OsSystemTimeSource,
    % ?debugFmt("~n~p~n", [OsSystemTimeSource]),

  ok.


-endif.
