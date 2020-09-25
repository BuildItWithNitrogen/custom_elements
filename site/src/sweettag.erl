-module(sweettag).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl"). %% bring in our custom element
-compile(export_all).

main() ->
    #template{file="site/templates/bare.html"}.

body() ->
    #panel{body=[
        #h1{text="Pick a time during the business day"},
        #time_selector{tag=time, start=480, finish=1020, increment=30}
    ]}.

time_selector_event(Tag, FormattedTime) ->
    Msg = io_lib:format("You picked: ~s with tag ~p",
                        [FormattedTime, Tag]),
    wf:wire(#alert{text=Msg}).
