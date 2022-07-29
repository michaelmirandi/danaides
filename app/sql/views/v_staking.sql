create view v_staking as
	with 
	ergopad as (
		select
			box_id
			, height
			, (assets->'d71693c49a84fbbecd4908c94813b46514b18b67a99952dc1e6e4791556de413')::bigint as amount
			, (assets->'1028de73d018f0c9a374b71555c5b8f1390994f2f41633e7b9d68f77735782ee')::int as proxy
			, registers->'R4' as penalty
			, trim(leading '0e20' from registers->'R5') as stakekey_token_id
			, t.decimals
		from utxos u
			join tokens t on t.token_id = 'd71693c49a84fbbecd4908c94813b46514b18b67a99952dc1e6e4791556de413'
		where ergo_tree = '1017040004000e200549ea3374a36b7a22a803766af732e61798463c3332c5f6d86c8ab9195eed59040204000400040204020400040005020402040204060400040204040e2005cde13424a7972fbcd0b43fccbb5e501b1f75302175178fc86d8f243f3f312504020402010001010100d802d601b2a4730000d6028cb2db6308720173010001959372027302d80bd603b2a5dc0c1aa402a7730300d604e4c672030411d605e4c6a70411d606db63087203d607b27206730400d608db6308a7d609b27208730500d60ab27206730600d60bb27208730700d60c8c720b02d60de4c672010411d19683090193c17203c1a793c27203c2a793b272047308009ab27205730900730a93e4c67203050ee4c6a7050e93b27204730b00b27205730c00938c7207018c720901938c7207028c720902938c720a018c720b01938c720a029a720c9d9cb2720d730d00720cb2720d730e00d801d603b2a4730f009593c57203c5a7d801d604b2a5731000d1ed93720273119593c27204c2a7d801d605c67204050e95e67205ed93e47205e4c6a7050e938cb2db6308b2a573120073130001e4c67203050e73147315d17316'
	)
	, paideia as (
		select
			box_id
			, height
			, (assets->'1fd6e032e8476c4aa54c18c1a308dce83940e8f4a28f576440513ed7326ad489')::bigint as amount
			, (assets->'245957934c20285ada547aa8f2c8e6f7637be86a1985b3e4c36e4e1ad8ce97ab')::int as proxy
			, registers->'R4' as penalty
			, trim(leading '0e20' from registers->'R5') as stakekey_token_id
			, t.decimals
		from utxos u
			join tokens t on t.token_id = '1fd6e032e8476c4aa54c18c1a308dce83940e8f4a28f576440513ed7326ad489'
		where ergo_tree = '101f040004000e2012bbef36eaa5e61b64d519196a1e8ebea360f18aba9b02d2a21b16f26208960f040204000400040001000e20b682ad9e8c56c5a0ba7fe2d3d9b2fbd40af989e8870628f4a03ae1022d36f0910402040004000402040204000400050204020402040604000100040404020402010001010100040201000100d807d601b2a4730000d6028cb2db6308720173010001d6039372027302d604e4c6a70411d605e4c6a7050ed60695ef7203ed93c5b2a4730300c5a78fb2e4c6b2a57304000411730500b2e4c6720104117306007307d6079372027308d1ecec957203d80ad608b2a5dc0c1aa402a7730900d609e4c672080411d60adb63087208d60bb2720a730a00d60cdb6308a7d60db2720c730b00d60eb2720a730c00d60fb2720c730d00d6107e8c720f0206d611e4c6720104119683090193c17208c1a793c27208c2a793b27209730e009ab27204730f00731093e4c67208050e720593b27209731100b27204731200938c720b018c720d01938c720b028c720d02938c720e018c720f01937e8c720e02069a72109d9c7eb272117313000672107eb27211731400067315957206d801d608b2a5731600ed72079593c27208c2a7d801d609c67208050e95e67209ed93e472097205938cb2db6308b2a57317007318000172057319731a731b9595efec7206720393c5b2a4731c00c5a7731d7207731e'
	), egio as (
		select
			box_id
			, height
			, (assets->'00b1e236b60b95c2c6f8007a9d89bc460fc9e78f98b09faec9449007b40bccf3')::bigint as amount
			, (assets->'012d649686deeef606d253146bec0cf623f9b84574fbfa0fd0d1091393923613')::int as proxy
			, registers->'R4' as penalty
			, trim(leading '0e20' from registers->'R5') as stakekey_token_id
			, t.decimals
		from utxos u
			join tokens t on t.token_id = '00b1e236b60b95c2c6f8007a9d89bc460fc9e78f98b09faec9449007b40bccf3'
		where ergo_tree = '101b0400040004020e20097fd281c99588269d672e1b686bf6bcdce04102e183b2242f6634d93869fc0a04020e200e4202196f6030ab1986e39012dc95ea10f034b13d90a70c0b1f86d986106ff6040204000400040204000400050204020402040604000100040004000400040401000402040201010100d809d601b2a4730000d6028cb2db6308720173010001d603e4c6a70411d604e4c6a7050ed605db6308a7d606b27205730200d6077e8c72060206d6089372027303d60993c5b2a4730400c5a7d1ecec959372027305d807d60ab2a5dc0c1aa402a7730600d60be4c6720a0411d60cdb6308720ad60db2720c730700d60eb27205730800d60fb2720c730900d610e4c6720104119683090193c1720ac1a793c2720ac2a793b2720b730a009ab27203730b00730c93b2720b730d00b27203730e0093e4c6720a050e7204938c720d018c720e01938c720d028c720e02938c720f018c720601937e8c720f02069a72079d9c7eb27210730f000672077eb272107310000673119596830301720872098fb2e4c6b2a57312000411731300b2e4c672010411731400d801d60ab2a57315009593c2720ac2a7d801d60bc6720a050e9683020195e6720b93e4720b72047316938cb2db6308b2a57317007318000172047319731a9683020172087209'
		-- egio (original, disabled)
		-- where ergo_tree = '1017040004000e20a8d633dee705ff90e3181013381455353dac2d91366952209ac6b3f9cdcc23e9040204000400040204020400040005020402040204060400040204040e20f419099a27aaa5f6f7d109d8773b1862e8d1857b44aa7d86395940d41eb5380604020402010001010100d802d601b2a4730000d6028cb2db6308720173010001959372027302d80bd603b2a5dc0c1aa402a7730300d604e4c672030411d605e4c6a70411d606db63087203d607b27206730400d608db6308a7d609b27208730500d60ab27206730600d60bb27208730700d60c8c720b02d60de4c672010411d19683090193c17203c1a793c27203c2a793b272047308009ab27205730900730a93e4c67203050ee4c6a7050e93b27204730b00b27205730c00938c7207018c720901938c7207028c720902938c720a018c720b01938c720a029a720c9d9cb2720d730d00720cb2720d730e00d801d603b2a4730f009593c57203c5a7d801d604b2a5731000d1ed93720273119593c27204c2a7d801d605c67204050e95e67205ed93e47205e4c6a7050e938cb2db6308b2a573120073130001e4c67203050e73147315d17316'
	)
	, a as (
		select 
			address
			, id
			, (each(assets)).key::varchar(64) as token_id
			, (each(assets)).value::bigint as amount
		from utxos
		-- where address = '9hMa8bqVq31HYaCqbufEbWZFURFrHhxuHui3w1dmAtFCF1r4LZm'
	)
	-- ergopad
	select
		a.address
		, a.token_id
		, u.box_id
		, u.stakekey_token_id
		, u.amount/power(10, u.decimals) as amount
		, u.penalty
	from ergopad u
		join a on a.token_id = u.stakekey_token_id
	where proxy = 1

	-- paideia
	union all
	select
		a.address
		, a.token_id
		, u.box_id
		, u.stakekey_token_id
		, u.amount/power(10, u.decimals) as amount
		, u.penalty
	from paideia u
		join a on a.token_id = u.stakekey_token_id
	where proxy = 1

    -- egio
	union all
	select
		a.address
		, a.token_id
		, u.box_id
		, u.stakekey_token_id
		, u.amount/power(10, u.decimals) as amount
		, u.penalty
	from egio u
		join a on a.token_id = u.stakekey_token_id
	where proxy = 1