%% Include the automatically generated plugins directory
-include("plugins.hrl").

%% Include any application-specific custom elements, actions, or validators below
-record(b, {?ELEMENT_BASE(element_b), text="", html_encode=true}).

-record(time_selector, {?ELEMENT_BASE(element_time_selector),
                        start=0, finish=1440, increment=60, value, tag}).
