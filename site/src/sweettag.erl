-module(sweettag).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl"). %% bring in our custom element
-compile(export_all).

main() ->
    #template{file="site/templates/bare.html"}.

body() ->
    #panel{body=[
        #h2{text="Are you ready for the awesome?!"},
        #h1{text="I said: ARE YOU READY FOR THE AWESOME?!"},
        #br{},
        #br{},
        #b{text="BOOM BABY, THIS IS THE AWESOME!"}
    ]}.
