
-module(hello_world_handler).

-export([init/3, handle/2, terminate/3]).

%=============================
% API
%=============================
init(_Type, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{ok, Req3} = cowboy_req:reply(200, [{<<"content-type">>, <<"text/plain">>}], <<"Hello world!">>, Req),
	{ok, Req3, State}.

terminate(_Reason, _Req, _State) ->
	ok.