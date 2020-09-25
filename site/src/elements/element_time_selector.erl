-module(element_time_selector).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([reflect/0, render_element/1, format_time/1]).

reflect() -> record_info(fields, time_selector).

render_element(Rec = #time_selector{start=Start,
                                    finish=Finish, increment=Inc, value=Value}) ->
    Times = lists:seq(Start, Finish, Inc),
    Options = [format_time_option(T) || T <- Times],
    #dropdown{
       options=Options,
       value=Value,
       class=Rec#time_selector.class,
       style=Rec#time_selector.style,
       title=Rec#time_selector.title,
       data_fields=Rec#time_selector.data_fields
      }.

format_time_option(Time) ->
    TimeStr = format_time(Time),
    #option{text=TimeStr, value=wf:to_list(Time)}.

format_time(Time) ->
    Hour = Time div 60,
    Minute = Time rem 60,
    wf:f("~2..0w:~2..0w", [Hour, Minute]).
