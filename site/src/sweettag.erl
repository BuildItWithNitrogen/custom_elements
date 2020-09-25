-module(sweettag).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl"). %% bring in our custom element
-compile(export_all).

main() ->
    #template{file="site/templates/bare.html"}.

body() ->
    #panel{body=[
        #h1{text="Pick a time during the business day"},
        #time_selector{id=time, start=480, finish=1020, increment=30},
        #button{text="I've decided", postback=select_time}
    ]}.

event(select_time) ->
    Time = wf:to_integer(wf:q(time)),
    FormattedTime = element_time_selector:format_time(Time),
    wf:wire(#alert{text=["You picked: ", FormattedTime]}).
