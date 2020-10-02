%%%-------------------------------------------------------------------
%% @doc simple_cowboy public API
%% @end
%%%-------------------------------------------------------------------

-module(simple_cowboy_app).
-behaviour(application).

-export([start/2, stop/1]).

%=============================
% API
%=============================
start(_StartType, _StartArgs) ->
    {ok, _} = application:ensure_all_started(cowboy),

    Dispatch = cowboy_router:compile(
        [
            {'_', [
                {"/root", root_handler, []},
                {"/[:page_name]", hello_world_handler, []}
            ]}
        ]),

    {ok, _} = cowboy:start_http(my_http_listener, 100, [{port, 8080}], [{env, [{dispatch, Dispatch}]}]).

stop(_State) ->
    ok.