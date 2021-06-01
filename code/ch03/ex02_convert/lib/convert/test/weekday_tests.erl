-module(weekday_tests).

-export([week_day/1, week_day_ru/1]).



week_day(DayId) ->
    case DayId of
        1 -> "Monday";
        2 -> "Tuesday";
        3 -> "Wednesday";
        4 -> "Thursday";
        5 -> "Friday";
        6 -> "Saturday";
        7 -> "Sunday"
    end.

week_day_ru(DayId) ->
    case DayId of
        1 -> "Понедельник";
        2 -> "Вторник";
        3 -> "Среда";
        4 -> "Четверг";
        5 -> "Пятница";
        6 -> "Суббота";
        7 -> "Воскресенье"
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Check convert", fun convert/0},
     {"Right input", fun right_input/0},
     {"Wrong input", fun wrong_input/0}].

convert() ->
    ?assertEqual(1, (chapter3:convert(monday))),
    ?assertEqual(2, (chapter3:convert(tuesday))),
    ?assertEqual(3, (chapter3:convert(wednesday))),
    ?assertEqual(4, (chapter3:convert(thursday))),
    ?assertEqual(5, (chapter3:convert(friday))),
    ?assertEqual(6, (chapter3:convert(saturday))),
    ?assertEqual(7, (chapter3:convert(sunday))),
    ?assertEqual({error, unknown_day},
                 (convert:convert(ok))).

right_input() ->
    WeekId1 = convert:convert(monday),
    ?assertEqual("Monday", (weekday:week_day(WeekId1))),
    ?assertEqual("Понедельник",
                 (weekday:week_day_ru(WeekId1))).

wrong_input() ->
    WeekId1 = 2021,
    ?assertException(error, {case_clause, _},
                     (weekday:week_day(WeekId1))),
    ?assertException(error, {case_clause, _},
                     (weekday:week_day_ru(WeekId1))),
    WeekId2 = {day, 361},
    ?assertException(error, {case_clause, _},
                     (weekday:week_day(WeekId2))),
    ?assertException(error, {case_clause, _},
                     (weekday:week_day_ru(WeekId2))).

-endif.
