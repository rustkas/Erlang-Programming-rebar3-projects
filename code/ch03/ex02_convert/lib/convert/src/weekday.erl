-module(weekday).

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
