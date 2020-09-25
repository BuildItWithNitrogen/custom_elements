-module(element_time_selector).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([reflect/0, render_element/1, format_time/1, event/1]).

reflect() -> record_info(fields, time_selector).

render_element(Rec = #time_selector{start=Start,
                                    finish=Finish, increment=Inc, value=Value, tag=Tag}) ->
    Times = lists:seq(Start, Finish, Inc),
    Options = [format_time_option(T) || T <- Times],
    ID = wf:temp_id(),
    #dropdown{
       options=Options,
       value=Value,
       id=ID,
       postback={Tag, ID},
       delegate=?MODULE,
       class=Rec#time_selector.class,
       style=Rec#time_selector.style,
       title=Rec#time_selector.title,
       data_fields=Rec#time_selector.data_fields
      }.


event({Tag, ID}) ->
    Time = wf:to_integer(wf:q(ID)),
    FormattedTime = format_time(Time),
    Page = wf:page_module(),
    Page:time_selector_event(Tag, FormattedTime).


format_time_option(Time) ->
    TimeStr = format_time(Time),
    #option{text=TimeStr, value=wf:to_list(Time)}.

format_time(Time) ->
    Hour = Time div 60,
    Minute = Time rem 60,
    wf:f("~2..0w:~2..0w", [Hour, Minute]).
