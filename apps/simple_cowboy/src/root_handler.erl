
-module(root_handler).

-export([init/3, handle/2, terminate/3]).

%=============================
% API
%=============================
init(_Type, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
    {Method, Req2} = cowboy_req:method(Req),
    {Code, Result} = handle_request(Method),
	{ok, Req3} = cowboy_req:reply(Code, [{<<"content-type">>, <<"text/plain">>}], Result, Req2),
	{ok, Req3, State}.

terminate(_Reason, _Req, _State) ->
	ok.

%=============================
% Internal Functions
%=============================
handle_request(<<"GET">>) ->
    {200, <<"This is the root page!">>};
handle_request(_) ->
    {500, <<"Unsupported Method!">>}.