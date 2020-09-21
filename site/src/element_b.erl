-module(element_b).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([reflect/0, render_element/1]).

reflect() -> record_info(fields, b).

render_element(Rec = #b{text=Text, html_encode=Encode}) ->
    Body = wf:html_encode(Text, Encode),
    wf_tags:emit_tag(b, Body, [
        {class, Rec#b.class},
        {title, Rec#b.title},
        {style, Rec#b.style},
        {data_fields, Rec#b.data_fields}
    ]).
