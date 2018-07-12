-module({{name}}_test).

-include_lib("eunit/include/eunit.hrl").

-define(M, {{name}}).

main_test() ->
    ?assertEqual(ok, ?M:main([])).
