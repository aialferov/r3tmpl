-module({{name}}_test).

-include_lib("eunit/include/eunit.hrl").

-define(M, {{name}}).

{{name}}_test() ->
    ?assertEqual(ok, ?M:{{name}}()).
