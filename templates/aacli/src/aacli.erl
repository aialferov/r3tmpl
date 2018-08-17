-module('{{name}}').

-export([
    main/1
]).

-define(Usage,
    "Usage: {{name}} <Command>~n"
    "~n"
    "Commands~n"
    "       run [Args]  Run~n"
    "       help        Print this message~n"
    "       version     Print version~n"
    "~n"
).

-define(Version, "Version ~s (git-~s)~n").

main(Args) ->
    application:ensure_all_started(?MODULE),
    case Args of
        ["run"|RunArgs] -> run(RunArgs);
        ["help"] -> show_usage();
        ["version"] -> show_version();
        Args -> show_usage()
    end.

run(_Args) -> io:format("Done.~n").

show_usage() ->
    io:format(?Usage).

show_version() ->
    {ok, Vsn} = application:get_key(?MODULE, vsn),
    {ok, GitSha} = application:get_env(?MODULE, git_sha),
    io:format(?Version, [Vsn, GitSha]).
