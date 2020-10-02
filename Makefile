clean:
	-rm -rf _build

ct:
	rebar3 ct

eunit:
	rebar3 eunit

shell:
	rebar3 shell