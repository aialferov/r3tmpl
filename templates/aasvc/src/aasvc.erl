-module('{{name}}').

-export([
    main/1
]).

-define(Usage,
    "Usage: {{name}} <Command>~n"
    "~n"
    "Commands~n"
    "       run         Run~n"
    "       help        Print this message~n"
    "       version     Print version~n"
    "~n"
).

-define(ConsoleUsage,
    "h|help         Print this message~n"
    "q|quit|exit    Shutdown the service and exit the console~n"
).

-define(Greeting,
    "Welcome to the {{name}} service console!~n"
    "~n"
    "Console usage:~n"
    ?ConsoleUsage
).
-define(Farewell, "Bye.~n").

-define(Prompt, "{{name}}> ").

-define(Version, "Version ~s (git-~s)~n").

main(Args) ->
    application:ensure_all_started(?MODULE),
    case Args of
        ["run"] -> run();
        ["help"] -> show_usage();
        ["version"] -> show_version();
        Args -> show_usage()
    end.

run() ->
    cpf_node:start(?MODULE),
    console(),
    cpf_node:stop().

console() ->
    io:format(?Greeting),
    console_loop(),
    io:format(?Farewell).

console_loop() ->
    case read_input(?Prompt) of
        eof -> eof;

        Command when Command == "q";
                     Command == "quit";
                     Command == "exit" -> ok;

        Command when Command == "h";
                     Command == "help" -> io:format(?ConsoleUsage),
                                          console_loop();

        _Command -> console_loop()
    end.
    
read_input(Prompt) ->
    case io:get_line(Prompt) of
        eof -> eof;
        Data -> string:trim(Data, both, "\n")
    end.

show_usage() ->
    io:format(?Usage).

show_version() ->
    {ok, Vsn} = application:get_key(?MODULE, vsn),
    {ok, GitSha} = application:get_env(?MODULE, git_sha),
    io:format(?Version, [Vsn, GitSha]).
