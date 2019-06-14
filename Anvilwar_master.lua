--[[ Script compilado às 00h52 (UTC) 14/06/2019 e atualizado às 17h16 (UTC) 14/06/2019. ]]--
--[[ Como as pessoas não estão jogando os submodos e devido a decadência recorrente do Transformice, todos os submodos do #anvilwar foram removidos e apenas a sala #anvilwar original foi mantida. No entanto, a sala está livre para outros colocarem seus submodos, se necessário. Abraços, Spectra ]]--

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
for _,f in next,{"tt","rv"} do
	system.disableChatCommandDisplay(f)
end
data={}
maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495501","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421"}
game={loop=0,red_cap="",blue_cap="",selected_map="",blue_players={},red_players={},current_mode="",play_time=15,timeouts_red=3,red_count=0,blue_count=0,timeouts_blue=3,random_count=0,mices_on_room=0,remain=0,red_list={},blue_list={},actual_turn="",actual_player="",game_time=0,game_alpha=1,game_seconds=0,anvil_power=5,kills_count=0}
players_table={}
lang = {}
lang.en = {
	player_not_found = "Player not found or you don't have points to revive this player.",
	enter = "Enter",
	timeout_request = "requested a timeout.",
	capitain = "You are the capitain of your team.<br><br>You can revive a dead ally from your team using the !rv [name] command and transfer your points to other player using !tt [name]. <br>Check the help for other informations about the capitains.",
	turn = "It's your turn to play. Use the CTRL and SHIFT keys to change the anvil power and SPACEBAR to throw the anvil.",
	welcome_bar = "Welcome to the new #anvilwar! Developed and remaked by Gus_grav#7473.<",
	no_mices = "Is needed at least 3 mices on room to play #anvilwar.",
	choose_teams = "It's time to choose the teams!",
	get_ready = "Get ready! The match will start on a few seconds!",
	oh_no = "Oh no!",
	team_kill = "killed a player from your team:",
	suicide = "The following player committed suicide:",
	randomising = "Please wait, randomising map...",
	time_up = "Time is up! Other player will throw the anvil.",
	victory_red_1 = "Victory of the <b>RED</b> team!<br>The next match will start on a few seconds...",
	victory_blue_1 = "Victory of the <b>BLUE</b> team!<br>The next match will start on a few seconds...",
	draw_game = "<b>DRAW!</b><br>The next match will start on a few seconds...",
	join_red = "You joined the RED team.",
	join_blue = "You joined the BLUE team."
}
lang.br = {
	player_not_found = "Jogador não encontrado ou você não possui pontos para isso.",
	enter = "Entrar",
	timeout_request = "pediu tempo.",
	capitain = "Você é o capitão de sua equipe.<br><br>Você pode reviver aliados mortos de sua equipe usando o comando !rv [nome] e transferir seus pontos para outro jogador usando !tt [nome]. <br>Cheque a ajuda para mais informações sobre capitães.",
	turn = "É a sua vez de jogar. Use as teclas CTRL e SHIFT para alterar a potência da bigorna e a BARRA DE ESPAÇO para atirar.",
	welcome_bar = "Bem-vindo ao novo #anvilwar. Desenvolvido por Gus_grav#7473 e traduzido por Spectra_phantom#6089.<",
	no_mices = "São necessários pelo menos 3 ratos na sala para jogar #anvilwar.",
	choose_teams = "É hora de escolher os times!",
	get_ready = "Se prepare! A partida vai começar em instantes!",
	oh_no = "Oh não!",
	team_kill = "matou um companheiro de equipe:",
	suicide = "O seguinte jogador cometeu suicídio:",
	randomising = "Aguarde, estamos sorteando os mapas.",
	time_up = "Tempo esgotado! Outro jogador será escolhido para atirar.",
	victory_red_1 = "Vitória do time <b>VERMELHO</b>!<br>A próxima partida vai começar em instantes...",
	victory_blue_1 = "Vitória do time <b>AZUL</b>!<br>A próxima partida vai começar em instantes...",
	draw_game = "<b>EMPATE!</b><br>A próxima partida vai começar em instantes...",
	join_red = "Você entrou no time VERMELHO.",
	join_blue = "Você entrou no time AZUL."
}
if tfm.get.room.community == "br" then
	text = lang.br
else
	text = lang.en
end
function displayLobbyText(text)
	ui.addTextArea(11,"<p align='center'><font face='Bahnscrift SemiLight,Segoe UI,Arial'><font size='20'>"..text.."",nil,260,74,280,78,0,0,1,true)
end
function displayLargeLobbyText(text)
	ui.addTextArea(12,"<p align='center'><font face='Bahnscrift SemiLight,Segoe UI,Arial'><font size='20'>"..text.."",nil,160,174,480,78,0,0,1,true)
end
function eventChatCommand(name,message)
	if name == game.red_cap or name == game.blue_cap then
		if message:sub(0,2) == "rv" then
			if game_seconds > 30 then
				if data[message:sub(4)] and tfm.get.room.playerList[name].score >= 30 then
					local revived=message:sub(4)
					tfm.exec.respawnPlayer(revived)
					if data[revived].team == "blue" then
						tfm.exec.movePlayer(revived,1000,186)
						game.blue_count=game.blue_count+1
					elseif data[revived].team == "red" then
						tfm.exec.movePlayer(revived,600,186)
						game.red_count=game.red_count+1
					end
					tfm.exec.setPlayerScore(name,-30,true)
				else
					tfm.exec.chatMessage(text.player_not_found)
				end
			end
		end
		if message:sub(0,2) == "tt" then
			if data[message:sub(4)] and tfm.get.room.playerList[name].score >= 1 then
				local scored=message:sub(4)
				local points=tfm.get.room.playerList[name].score
				tfm.exec.setPlayerScore(scored,tfm.get.room.playerList[scored].score+points,false)
				tfm.exec.setPlayerScore(name,0,false)
				tfm.exec.chatMessage("Success!")
			else
				tfm.exec.chatMessage(text.player_not_found)
			end
		end
	end
end
function eventNewPlayer(name)
	for i=16,90 do
		tfm.exec.bindKeyboard(name,i,true)
	end
	system.bindMouse(name)
	game.mices_on_room=game.mices_on_room+1
	if not data[name] then
		table.insert(players_table,name)
		data[name]={wins=0,matchs=0,kills=0,team="",killed=-2,max_ks=0,multi_kills=0,gpoints=0,experience=0,req_exp=10,powerups={}}
	end
	if game.current_mode == "team_choose" then
		ui.addTextArea(15,"<a href='event:enter_red'><p align='center'><font size='14'>"..text.enter.."",name,120,260,80,24,0x010101,0x010101,1.0,true)
		ui.addTextArea(16,"<a href='event:enter_blue'><p align='center'><font size='14'>"..text.enter.."",name,600,260,80,24,0x010101,0x010101,1.0,true)
		tfm.exec.respawnPlayer(name)
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventKeyboard(name,id,down,x,y)
	if id == 32 then
		if game.current_mode == "play" and name == game.actual_player then
			game.loop=0
			if data[game.actual_player].team == "red" then
				tfm.exec.addShamanObject(10,x+30,y-40,0,game.anvil_power*1.72,-7.7,false)
			elseif data[game.actual_player].team == "blue" then
				tfm.exec.addShamanObject(10,x-30,y-40,0,game.anvil_power*-1.72,-7.7,false)
			end
			game.current_mode="count_kills"
			tfm.exec.setGameTime(15)
		end
	end
	if id == 17 then
		if game.current_mode == "play" and name == game.actual_player then
			game.anvil_power=game.anvil_power-1
			if game.anvil_power < 1 then
				game.anvil_power=1
			end
			tfm.exec.chatMessage("Anvil power: "..game.anvil_power.."",name)
		end
	end
	if id == 19 then
		if game.current_mode == "play" then
			if name == game.red_cap or name == game.blue_cap then
				if data[name].team == "red" and game.timeouts_red > 0 then
					game.current_mode="paused"
					tfm.exec.chatMessage(""..name.." "..text.timeout_request.."")
					game.timeouts_red=game.timeouts_red-1
				end
				if data[name].team == "blue" and game.timeouts_blue > 0 then
					game.current_mode="paused"
					tfm.exec.chatMessage(""..name.." "..text.timeout_request.."")
					game.timeouts_blue=game.timeouts_blue-1
				end
			end
		end
	end
	if id == 16 then
		if game.current_mode == "play" and name == game.actual_player then
			game.anvil_power=game.anvil_power+1
			if game.anvil_power > 20 then
				game.anvil_power=20
			end
			tfm.exec.chatMessage("Anvil power: "..game.anvil_power.."",name)
		end
	end
end
function chooseCapitains()
	game.red_cap=game.red_list[math.random(#game.red_list)]
	game.blue_cap=game.blue_list[math.random(#game.blue_list)]
	tfm.exec.chatMessage(text.capitain,game.red_cap)
	tfm.exec.chatMessage(text.capitain,game.blue_cap)
	tfm.exec.setNameColor(game.red_cap,0xff0000)
	tfm.exec.setNameColor(game.blue_cap,0xff)
end
function sortPlayersTurn()
	game.kills_count=0
	if game.current_mode == "play" then
		tfm.exec.setGameTime(15)
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y-20,1,-1,0,0,nil)
				if name == game.red_cap or name == game.blue_cap then
					tfm.exec.setPlayerScore(name,1,true)
					tfm.exec.displayParticle(15,player.x,player.y-40,1,-1,0,0,nil)
				end
			end
		end
		if game.actual_turn == "red" then
			game.actual_turn="blue"
		else
			game.actual_turn="red"
		end
		if game.actual_turn == "blue" then
			game.actual_player=game.blue_list[math.random(#game.blue_list)]
			tfm.exec.chatMessage(text.turn,game.actual_player)
		elseif game.actual_turn == "red" then
			game.actual_player=game.red_list[math.random(#game.red_list)]
			tfm.exec.chatMessage(text.turn,game.actual_player)
		end
		game.play_time=15
	end
end
function removePanel()
	for i=30,37 do
		ui.removeTextArea(i)
	end
end
function resetGame()
	removePanel()
	game={loop=0,red_cap="",blue_cap="",selected_map="",blue_players={},red_players={},current_mode="",play_time=15,timeouts_red=3,red_count=0,blue_count=0,timeouts_blue=3,random_count=0,mices_on_room=0,remain=0,red_list={},blue_list={},actual_turn="",actual_player="",game_time=0,game_alpha=1,game_seconds=0,anvil_power=5,kills_count=0}
	tfm.exec.newGame("@7607195")
	for i=10,20 do
		ui.removeTextArea(i)
	end
	ui.setMapName(text.welcome_bar)
	game.mices_on_room=0
	for name,player in pairs(tfm.get.room.playerList) do
		tfm.exec.setPlayerScore(name,0,false)
		game.mices_on_room=game.mices_on_room+1
		tfm.exec.setNameColor(name,0xd7d7e6)
		data[name].team=""
	end
	if game.mices_on_room < 2 then
		game.current_mode="wait_mices"
		displayLobbyText("Oops!")
		tfm.exec.setGameTime(10)
		displayLargeLobbyText(text.no_mices)
	else
		game.current_mode="team_choose"
		tfm.exec.setGameTime(40)
		displayLobbyText(text.choose_teams)
		ui.addTextArea(13,"",nil,6,270,310,70,0xff0000,0xff0000,0.67,true)
		ui.addTextArea(14,"",nil,484,270,310,70,0xff,0xff,0.67,true)
		for name,player in pairs(tfm.get.room.playerList) do
			ui.addTextArea(15,"<a href='event:enter_red'><p align='center'><font size='14'>"..text.enter.."",name,120,260,80,24,0x010101,0x010101,1.0,true)
			ui.addTextArea(16,"<a href='event:enter_blue'><p align='center'><font size='14'>"..text.enter.."",name,600,260,80,24,0x010101,0x010101,1.0,true)
		end
	end
end
function eventPlayerLeft(name)
	game.mices_on_room=game.mices_on_room-1
	if data[name].team == "red" then
		game.red_list={}
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead and data[name].team == "red" then
				table.insert(game.red_list,name)
				if game.current_mode == "waiting_start" then
					game.red_count=game.red_count-1
				end
			end
		end
	elseif data[name].team == "blue" then
		game.blue_list={}
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead and data[name].team == "blue" then
				table.insert(game.blue_list,name)
				if game.current_mode == "waiting_start" then
					game.blue_count=game.blue_count-1
				end
			end
		end
	end
end
function eventNewGame()
	if game.current_mode == "random2" then
		for name,player in pairs(tfm.get.room.playerList) do
			game.current_mode="waiting_start"
			if data[name].team == "red" then
				tfm.exec.movePlayer(name,600,186)
				table.insert(game.red_list,name)
			elseif data[name].team == "blue" then
				tfm.exec.movePlayer(name,1000,186)
				table.insert(game.blue_list,name)
			else
				tfm.exec.killPlayer(name)
			end
		end
		tfm.exec.setGameTime(27)
		ui.setMapName("#anvilwar version RTM II 20207.001 - UNDER CONSTRUCTION!!<")
		tfm.exec.chatMessage(text.get_ready)
	end
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Como os jogadores não estão mais utilizando os submodos, todos eles foram removidos e apenas a sala #anvilwar original foi mantida.")
	end
end
function eventPlayerDied(name)
	if game.current_mode == "waiting_start" then
		if data[name].team == "red" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,186)
		elseif data[name].team == "blue" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,186)
		end
	end
	if game.current_mode == "play" or game.current_mode == "count_kills" then
		tfm.exec.setPlayerScore(name,-1,false)
		if data[name].team == "red" then
			game.red_count=game.red_count-1
			game.red_list={}
			for name,player in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[name].isDead and data[name].team == "red" then
					table.insert(game.red_list,name)
				end
			end
			game.kills_count=game.kills_count+1
			tfm.exec.setPlayerScore(game.actual_player,game.kills_count,true)
			tfm.exec.displayParticle(15,tfm.get.room.playerList[game.actual_player].x,tfm.get.room.playerList[game.actual_player].y-20,1,-1,0,0,nil)
		elseif data[name].team == "blue" then
			game.blue_count=game.blue_count-1
			game.blue_list={}
			for name,player in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[name].isDead and data[name].team == "blue" then
					table.insert(game.blue_list,name)
				end
			end
			game.kills_count=game.kills_count+1
			tfm.exec.setPlayerScore(game.actual_player,game.kills_count,true)
			tfm.exec.displayParticle(15,tfm.get.room.playerList[game.actual_player].x,tfm.get.room.playerList[game.actual_player].y-20,1,-1,0,0,nil)
		end
		game.loop=game.loop-0.5
		if data[game.actual_player].team == data[name].team then
			tfm.exec.setPlayerScore(game.actual_player,-3,true)
			tfm.exec.chatMessage("<J>"..text.oh_no.." "..game.actual_player.." "..text.team_kill.." <b>"..name.."</b>.")
		end
		if name == game.actual_player then
			tfm.exec.setPlayerScore(name,-5,false)
			tfm.exec.chatMessage(""..text.suicide.." "..game.actual_player.."")
		end
	end
end
function scorePanel(alpha)
	local minutos=math.floor(game_seconds/60)
	local segundos=math.floor(game_seconds-(minutos*60))
	if segundos >= 10 then
		ui.addTextArea(30,"<font face='MingLiU-ExtB'><p align='center'><font size='28'>⏱ <b>"..minutos..":"..segundos.."</b>",nil,340,25,120,30,0x010101,0x010101,alpha,true)
	else
		ui.addTextArea(30,"<font face='MingLiU-ExtB'><p align='center'><font size='28'>⏱ <b>"..minutos..":0"..segundos.."</b>",nil,340,25,120,30,0x010101,0x010101,alpha,true)
	end
	if game_seconds < 30 and game_seconds > 2 then
		ui.addTextArea(37,"",nil,340,62,(game_seconds/game_time)*120,1,0xff0000,0x010101,alpha,true)
	elseif game_seconds >= 30 then
		ui.addTextArea(37,"",nil,340,62,(game_seconds/game_time)*120,1,0x00ff00,0x010101,alpha,true)
	else
		ui.removeTextArea(37)
	end
	ui.addTextArea(31,"<font face='MingLiU-ExtB'><p align='left'><font size='16'><font color='#ff0000'>⚔ <b>"..game.red_count.."</b>",nil,272,25,60,22,0x320000,0x010101,alpha,true)
	ui.addTextArea(32,"<font face='MingLiU-ExtB'><p align='right'><font size='16'><font color='#50ff'><b>"..game.blue_count.."</b> <font color='#ff'>⚔",nil,468,25,60,22,0x32,0x010101,alpha,true)
	ui.addTextArea(33,"<font face='MingLiU-ExtB'><p align='left'><font size='16'><font color='#ff2400'>⏳ x<b>"..game.timeouts_red.."</b>",nil,220,25,44,18,0x240000,0x010101,alpha,true)
	ui.addTextArea(34,"<font face='MingLiU-ExtB'><p align='right'><font size='16'><font color='#24ff'>x<b>"..game.timeouts_blue.."</b> ⏳",nil,536,25,44,18,0x24,0x010101,alpha,true)
	if tfm.get.room.playerList[game.red_cap].isDead == false then
		ui.addTextArea(35,"<font face='MingLiU-ExtB'><p align='left'><font size='18'><font color='#ff1200'>♚",nil,192,25,20,16,0x240000,0x010101,alpha,true)
	else
		ui.addTextArea(35,"<font face='MingLiU-ExtB'><p align='left'><font size='18'><font color='#ff1200'> ",nil,192,25,20,16,0x240000,0x010101,alpha,true)
	end
	if tfm.get.room.playerList[game.blue_cap].isDead == false then
		ui.addTextArea(36,"<font face='MingLiU-ExtB'><p align='right'><font size='18'><font color='#12ff'>♚",nil,588,25,20,16,0x24,0x010101,alpha,true)
	else
		ui.addTextArea(36,"<font face='MingLiU-ExtB'><p align='right'><font size='18'><font color='#12ff'> ",nil,588,25,20,16,0x24,0x010101,alpha,true)
	end
end
function eventLoop(passed,remain)
	if not game.current_mode == "paused" then
		game.remain=remain/1000
	end
	if game.current_mode == "wait_mices" then
		if remain <= 1 then
			resetGame()
			tfm.exec.setGameTime(40)
		end
	end
	if game.current_mode == "paused" then
		game.loop=game.loop+1
		tfm.exec.setGameTime(game.remain)
		if game.loop > 24 then
			game.current_mode="play"
		end
	end
	if game.current_mode == "random1" then
		game.selected_map=maps[math.random(#maps)]
		game.random_count=game.random_count+1
		displayLobbyText(text.randomising)
		ui.addTextArea(10,"<p align='center'><font face='Bahnscrift SemiLight,Segoe UI,Arial'><font size='34'><font color='#ffffff'>"..game.selected_map.."",nil,290,98,240,78,0,0,1,true)
		if game.random_count >= 10 then
			tfm.exec.setGameTime(7)
			game.current_mode="random2"
			displayLobbyText("The selected map:")
			ui.addTextArea(10,"<font face='Bahnscrift SemiLight,Segoe UI,Arial'><font size='34'><font color='#00ff00'>"..game.selected_map.."",nil,290,98,240,78,0,0,1,true)
		end
	end
	if game.current_mode == "random2" then
		if remain < 1 then
			for i=10,16 do
				ui.removeTextArea(i)
			end
			tfm.exec.newGame(game.selected_map)
		end
	end
	if game.current_mode == "team_choose" then
		if remain >= 10000 then
			displayLargeLobbyText("00:"..math.floor(remain/1000).."")
		elseif remain <= 10000 and remain >= 1000 then
			displayLargeLobbyText("<font color='#ff0000'>00:0"..math.floor(remain/1000).."")
		else
			if game.red_count > 0 and game.blue_count > 0 then
				ui.removeTextArea(12)
				game.current_mode="random1"
				tfm.exec.setGameTime(12)
			else
				tfm.exec.setGameTime(10)
			end
		end
		if remain <= 2000 then
			if game.red_count > 0 and game.blue_count > 0 then
				for i=15,16 do
					ui.removeTextArea(i)
				end
			end
		end
	end
	if game.current_mode == "waiting_start" and passed > 12000 then
		game.current_mode="play"
		chooseCapitains()
		sortPlayersTurn()
		game_time=112+(game.red_count*8)+(game.blue_count*8)
		game_seconds=game_time
	end
	if game.current_mode == "play" then
		tfm.exec.addShamanObject(0,tfm.get.room.playerList[game.actual_player].x,tfm.get.room.playerList[game.actual_player].y-40)
		if game_seconds > 0.5 then
			game_seconds=game_seconds-0.5
		end
		scorePanel(game.alpha)
		if remain < 1 then
			game.current_mode="count_kills"
			tfm.exec.chatMessage(text.time_up)
		end
	end
	if game.current_mode == "count_kills" then
		if game_seconds > 0.5 then
			game_seconds=game_seconds-0.5
		end
		scorePanel(game.alpha)
		game.loop=game.loop+0.5
		if game.loop > 5 then
			if game_seconds > 0 then
				checkPlayersAlive()
			else
				if game.red_count > 0 and game.blue_count == 0 then
					declareWinRed()
				elseif game.red_count == 0 and game.blue_count > 0 then
					declareWinBlue()
				else
					declareDraw()
				end
			end
		end
	end
	if game.current_mode == "end_game" then
		if remain < 1 then
			resetGame()
		end
	end
end
function declareWinRed()
	tfm.exec.setGameTime(15)
	game.current_mode="end_game"
	for id,name in pairs(game.red_players) do
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(300,700),186)
		tfm.exec.playEmote(name,0)
	end
	for id,name in pairs(game.blue_players) do
		tfm.exec.playEmote(name,2)
	end
	tfm.exec.chatMessage("<R>"..text.victory_red_1.."")
end
function declareWinBlue()
	tfm.exec.setGameTime(15)
	game.current_mode="end_game"
	for id,name in pairs(game.blue_players) do
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(1000,1300),186)
		tfm.exec.playEmote(name,0)
	end
	for id,name in pairs(game.red_players) do
		tfm.exec.playEmote(name,2)
	end
	tfm.exec.chatMessage("<BL>"..text.victory_blue_1.."")
end
function declareDraw()
	tfm.exec.setGameTime(30)
	game.current_mode="end_game"
	for id,name in pairs(game.blue_players) do
		tfm.exec.playEmote(name,8)
	end
	for id,name in pairs(game.red_players) do
		tfm.exec.playEmote(name,8)
	end
	tfm.exec.chatMessage("<J>"..text.draw_game.."")
end
function checkPlayersAlive()
	game.loop=0
	if game.kills_count == 2 then
		tfm.exec.chatMessage("<ROSE>Double Kill of "..game.actual_player.."!")
	elseif game.kills_count >= 3 then
		tfm.exec.chatMessage("<ROSE>Multi Kill: "..game.kills_count.." kills of "..game.actual_player.."!")
	end
	if game.red_count > 0 and game.blue_count > 0 then
		game.current_mode="play"
		sortPlayersTurn()
	elseif game.red_count > 0 and game.blue_count == 0 then
		declareWinRed()
	elseif game.red_count == 0 and game.blue_count > 0 then
		declareWinBlue()
	else
		declareDraw()
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "enter_red" and data[name].team == "" then
		data[name].team="red"
		table.insert(game.red_players,name)
		tfm.exec.movePlayer(name,200,288)
		for i=15,16 do
			ui.removeTextArea(i,name)
		end
		tfm.exec.chatMessage("<R>"..text.join_red.."",name)
		game.red_count=game.red_count+1
	elseif callback == "enter_blue" and data[name].team == "" then
		data[name].team="blue"
		table.insert(game.blue_players,name)
		tfm.exec.movePlayer(name,600,288)
		for i=15,16 do
			ui.removeTextArea(i,name)
		end
		tfm.exec.chatMessage("<BL>"..text.join_blue.."",name)
		game.blue_count=game.blue_count+1
	end
end
resetGame()
tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.63.1<br>by Spectra_phantom#6089<br><br>The requested room is loading or updating. Please wait...",nil)
