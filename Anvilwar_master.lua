--[[ Script contendo o module #anvilwar, #mestre, #pistas, #fall2, #objects e #true_false. Compilado às 20h37 (UTC) 03/06/2019 e atualizado às 20h56 (UTC) 04/06/2019. ]]--

local modulo = {
	_NOME = "anvilwar",
	_VERSION = "1.62.2",
	_AUTHOR = "Spectra_phantom#6089"
}

active = ""

initAnvilwar = function()
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
		tfm.exec.chatMessage("<J>POR FAVOR, LEIA ISTO ANTES DE JOGAR!<br><br><b>https://atelier801.com/topic?f=686054&t=932136</b>")
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
end

initTrue = function()
blue_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0000ff,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xff0000,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 400,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
kazarina={name="Kazarina"}
for _,f in next,{"per","skip","kazarina","limits","return","cancel","at","change","admin78"} do
	system.disableChatCommandDisplay(f)
end
current_mode=""
answer_time=20
remain_time=0
game_map="@7605289"
for name,player in pairs(tfm.get.room.playerList) do
	tfm.exec.setPlayerScore(name,0,false)
end
function eventNewGame()
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in pairs(tfm.get.room.playerList) do
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
		end
	end
	questions.round=0
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setMapName("True or False II Remaked by Spectra_phantom#6089<")
end
function eventPlayerDied(name)
	if not tfm.get.room.playerList[name].isShaman then
		limits.mices_alive=limits.mices_alive-1
	end
end
function reset()
	tfm.exec.newGame(game_map)
	tfm.exec.setGameTime(60)
	current_mode="waiting"
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
		end
	end
	ui.setMapName("True or False II Remaked by Spectra_phantom#6089<")
end
function isTrue()
	tfm.exec.chatMessage("<VP>The answer is TRUE!")
	tfm.exec.addPhysicObject(1, 585, -400, red_ground)
end
function isFalse()
	tfm.exec.chatMessage("<R>The answer is FALSE!")
	tfm.exec.addPhysicObject(0, 215, -400, blue_ground)
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 15 then
			limits.questions=tonumber(answer)
			ui.addPopup(1,2,"Type the time limit of the round in minutes (min: 1, max: 10)",name,350,175,200,true)
		end
	end
	if id == 1 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 10 then
			limits.time=tonumber(answer)
			tfm.exec.chatMessage("Questions limit changed to "..limits.questions.." and time limit changed to "..limits.time.."")
		end
	end
	if id == 10 then
		if string.len(answer) >= 10 and string.len(answer) <= 170 then
			questions.question=answer
			ui.addPopup(11,1,"Click YES if your answer is TRUE<br>Click NO if your answer is FALSE",name,350,175,200,true)
		else
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
			tfm.exec.chatMessage("<R>Your question is too large or too short. Please type other question.",name)
		end
	end
	if id == 11 then
		if remain_time > 1 then
			questions.answer=answer
			questions.round=questions.round+1
			current_mode="truefalse"
			tfm.exec.setGameTime(answer_time)
			for name,player in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[name].isShaman then
					tfm.exec.movePlayer(name,400,330)
				else
					tfm.exec.movePlayer(name,400,1330)
				end
			end
			tfm.exec.chatMessage("<N>"..questions.question.."")
			ui.addTextArea(0,"<font size='16'><p align='center'><font face='Bahnschrift SemiLight,Segoe UI,Arial'>"..questions.question.."",nil,15,25,770,50,0x010101,0x010101,0.95,true)
			tfm.exec.chatMessage(questions.answer,"Spectra_phantom#6089")
			tfm.exec.chatMessage(questions.answer,"Forzaldenon#0000")
		end
	end
	if id == 20 then
		if answer == "yes" then
			reset()
			tfm.exec.chatMessage("<R>"..name.." skipped your turn.")
		end
	end
	if id == 30 then
		if answer == "" then
			kazarina.name="Kazarina"
		else
			kazarina.name=answer
		end
	end
end
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Jarvanfender#0000" or name == "Gus_grav#7473" then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			if tonumber(message:sub(4)) >= 5 and tonumber(message:sub(4)) <= 30 then
				answer_time=tonumber(message:sub(4))
				tfm.exec.chatMessage("Answer time: "..answer_time.."")
			end
		end
		if(message:sub(0,7) == "admin78") then
			if current_mode == "waiting" then
				tfm.exec.setPlayerScore(message:sub(9),10001,false)
				reset()
			end
		end
		if message == "return" then
			if current_mode == "truefalse" then
				for name,player in pairs(tfm.get.room.playerList) do
					if not tfm.get.room.playerList[name].isShaman then
						tfm.exec.movePlayer(name,400,-100)
					end
				end
				current_mode="waiting"
				tfm.exec.setGameTime(60)
				tfm.exec.chatMessage("<R>This question has been cancelled.")
				ui.removeTextArea(0,nil)
			end
		end
		if message == "cancel" then
			if current_mode == "truefalse" or current_mode == "waiting" then
				for name,player in pairs(tfm.get.room.playerList) do
					tfm.exec.killPlayer(name)
				end
				reset()
				tfm.exec.chatMessage("<R>This shaman has been skipped.")
			end
		end
		if message == "change" then
			ui.addPopup(30,2,"Kazarina?",name,350,175,200,true)
		end
		if(message:sub(0,8) == "kazarina") then
			local texto=message:sub(12)
			if message:sub(10,10) == "1" then
				tfm.exec.chatMessage("<J><b>• ["..kazarina.name.."] </b>"..texto.."")
			elseif message:sub(10,10) == "2" then
				tfm.exec.chatMessage("<R><b>• ["..kazarina.name.."] </b>"..texto.."")
			elseif message:sub(10,10) == "3" then
				tfm.exec.chatMessage("<VP><b>• ["..kazarina.name.."] </b>"..texto.."")
			end
		end
	end
	if tfm.get.room.playerList[name].isShaman and current_mode == "waiting" then
		if message == "per" and limits.mices_alive >= 2 then
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
		end
		if message == "skip" then
			ui.addPopup(20,1,"Skip your turn?",name,350,175,200,true)
		end
	end
end
function eventLoop(time,remaining)
	remain_time=remaining/1000
	if remaining < 1 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>Time is up! Other shaman will be choosed.")
	end
	if remaining < 1000 and current_mode == "truefalse" then
		ui.removeTextArea(0,nil)
		tfm.exec.addPhysicObject(2, 400, 200, center_ground)
		tfm.exec.setGameTime(5)
		current_mode="wait"
	end
	if remaining < 300 and current_mode == "wait" then
		if questions.answer == "yes" then
			isTrue()
		else
			isFalse()
		end
		tfm.exec.setGameTime(7)
		current_mode="answer"
	end
	if remaining <= 1 and current_mode == "answer" then
		if questions.answer == "yes" then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > 400 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.movePlayer(name,400,-50)
				end
			end
		else
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x < 400 then
					tfm.exec.killPlayer(name)
				else
					tfm.exec.movePlayer(name,400,-50)
				end
			end
		end
		tfm.exec.removePhysicObject(2)
		current_mode="waiting"
		tfm.exec.setGameTime(60)
	end
	if remaining < 55000 and limits.mices_alive <= 0 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>No winners!")
	end
	if remaining < 55000 and limits.mices_alive == 1 and current_mode == "waiting" then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead and not tfm.get.room.playerList[name].isShaman then
				tfm.exec.setPlayerScore(name,10000,false)
				reset()
			end
		end
	end
	if remaining < 55000 and remaining >= 54400 and limits.mices_alive >= 2 and questions.round >= 1 and current_mode == "waiting" then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y)
			end
		end
		if questions.round >= limits.questions and current_mode == "waiting" then
			reset()
			tfm.exec.chatMessage("<R>Questions limit reached!")
		end
	end
	if time > limits.time*60000 and current_mode == "waiting" then
		reset()
		tfm.exec.chatMessage("<R>Time limit reached!")
	end
end
reset()
end

initMestre = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(35)
mapas={6788085,6788183,6789853,6791944,6792480,6808957,6810292,6821950,6830799,6866406,6866549,6788693,6788728,6859175,6834529,6866437,6812488,6876638,6876563,6885971,6888512,6893463,6900149,6907177,6892608,6982387,5328362,5957905,7055459,7290270,7290275,7404106,7404327,7382263,7394517,7405103,7400694,7400678,7412412,7412422,7431981,7354948,7525277,6983850,6892022,6981135,6943992,6879100,6885799,6885841,6886906,6754319,6789272,6790912,6833993}
active=0 
vivo=0 
rato=0 
dificuldade=1 
rodadas=0 
string="" 
rodada=0 
number=0 
xpos=0 
ypos=0 
data={} 
lang={} 
pergunta="Interval"
tempo=10
resposta=""
unlocked=true 
for _,f in next,{"run","q","r","mapa","reset","time"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N>Bem-vindo a sala Mestre Mandou! Nesta sala seu objetivo é fazer tudo o que o script mandar.<ROSE><br><VP>Script criado por Darakdarkus7#0000 - Versão RTM Compilação 49",
	dancar = "Dance!",
	sentar = "Sente!",
	confetar = "Atire 5 confetes!",
	mouse = "Clique na tela 10 vezes!",
	beijos = "Dê 10 beijos!",
	dormir = "Vocês estão com sono. Durmam para descansar.",
	raiva = "Tigrounette é do mal! Fiquem com raiva dele!",
	chorem = "Vocês não ganharam queijo :( Chorem!",
	esquerda = "Não vá para a esquerda!",
	direita = "Não vá para a direita!",
	numero = "Digite o seguinte número: ",
	digitar = "Digite qualquer coisa e mande para mim.",
	falar = "Não falem nada!",
	pular = "Não pulem!",
	mexer = "Não se mexam!",
	bandeira = "Balance a bandeira de qualquer país!",
	ano = "Em que ano estamos?",
	vesquerda = "Fique virado para a esquerda!",
	vdireita = "Fique virado para a direita!",
	quadradov = "Fique no quadrado vermelho!",
	quadrado = "Fique no quadrado branco!",
	retangulo = "Fique dentro do retângulo branco!",
	retangulov = "Fique dentro do retângulo vermelho!",
	nretangulo = "Não fique dentro do retângulo branco!",
	preesquerda30 = "Pressione 30 vezes a tecla para ESQUERDA!",
	predireita30 = "Pressione 30 vezes a tecla para DIREITA!",
	preesquerda60 = "Pressione 60 vezes a tecla para ESQUERDA!",
	predireita60 = "Pressione 60 vezes a tecla para DIREITA!",
	preesquerda200 = "Pressione 100 vezes a tecla para ESQUERDA!",
	predireita200 = "Pressione 100 vezes a tecla para DIREITA!",
	espaco = "Pressione a barra de espaço 20 vezes!",
	nome = "Digite o seu nome no jogo (com #número).",
	ndance = "Não dance!",
	rats = "Há quantos ratos nessa sala?",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	mices = "Esta sala requer pelo menos 4 ratos.",
	difficulty = "Dificuldade",
	creator = "Module criado por Darakdarkus7#0000",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por"
}
lang.en = {
	welcome = "<N>Welcome to script Master Says! On this module you have to do everything that the master says.<ROSE><br><VP>Module created by Darakdarkus7#0000 - Version RTM Compilation 49, translated to English by Spectra_phantom#6089",
	dancar = "Dance!",
	sentar = "Sit!",
	confetar = "Throw 5 confetti!",
	mouse = "Click on screen 10 times!",
	beijos = "Give 10 kisses!",
	dormir = "They are sleepy. Sleep to rest.",
	raiva = "Tigrounette is evil! Get angry with him!",
	chorem = "No cheese for you. Cry!",
	esquerda = "Don't go to the LEFT!",
	direita = "Don't go to the RIGHT!",
	numero = "Type this number: ",
	digitar = "Type anything and send to me.",
	falar = "Don't speak nothing!",
	pular = "Don't jump!",
	mexer = "Don't move!",
	bandeira = "Balance the flag of anything country!",
	ano = "What year are we?",
	vesquerda = "Stay facing LEFT!",
	vdireita = "Stay facing RIGHT!",
	quadradov = "Stay on the red square!",
	quadrado = "Stay on the white square!",
	retangulo = "Stay on the white rectangle!",
	retangulov = "Stay on the red rectangle!",
	nretangulo = "Don't stay on the white rectangle!",
	preesquerda30 = "Press 30 times the LEFT key!",
	predireita30 = "Press 30 times the RIGHT key!",
	preesquerda60 = "Press 60 times the LEFT key!",
	predireita60 = "Press 60 times the RIGHT key!",
	preesquerda200 = "Press 100 times the LEFT key!",
	predireita200 = "Press 100 times the RIGHT key!",
	espaco = "Press 20 times the SPACEBAR!",
	nome = "Type your nickname (with #number)!",
	ndance = "Don't dance!",
	rats = "How many rats are in this room?",
	mestre = "Master Says",
	map = "Map",
	time = "Time",
	mice = "Mice",
	round = "Round",
	mices = "This room requires at least 4 players.",
	difficulty = "Difficulty",
	creator = "Module created by Darakdarkus7#0000",
	segundos = "seconds.",
	fim = "End of match! The next match will start on ",
	playingmap = "Playing map",
	created = "created by"
}
lang.ar = {
	welcome = "<N>مرحبًا بكم في نمط الرئيس! في هذا النمط، عليك فعل كل مايقوله الرئيس!.<ROSE><br><VP>صُنع النمط عن طريقDarakdarkus7#0000 - الإصدار : RTM Compilation 49, تُرجم للغة العربية عن طريق اللاعب : [Vigo#4765]",
	dancar = "ارقص!",
	sentar = "اجلس!",
	confetar = "قُم برمي 5 أوراق.",
	mouse = "اضغط على الشاشة بالفأرة 10 مرات!",
	beijos = "أعطي 10 قبلات!",
	dormir = "إنهم يَشعرون بالنُعاس، نام لتستريح!",
	raiva = "تايغرونيت شرير!، قُم بالغضب منه!",
	chorem = "لم تلتقط أي قطعة من الجبن، ابكي!",
	esquerda = "لا تذهب لليسار!",
	direita = "لا تذهب لليمين!",
	numero = "اكتب هذا الرقم: ",
	digitar = "اكتب أيَّ شيء وارسله لي.",
	falar = "لا تتحدث أو تقل أيَّ شيء.!",
	pular = "لا تَقفز!",
	mexer = "لا تتحرك!",
	bandeira = "ارفع علم أي دول.",
	ano = "في أي عام نحن؟",
	vesquerda = "ابقى مواجهًا لليسار!",
	vdireita = "ابقى مواجهًا لليمين!",
	quadradov = "ابقى في المربع الأحمر!",
	quadrado = "ابقى في المربع الأبيض",
	retangulo = "ابقى في المستطيل الأبيض",
	retangulov = "ابقى في المستطيل الأحمر!",
	nretangulo = "لا تبقى في المستطيل الأبيض!",
	preesquerda30 = "اضغط 30 مرة على زر السهم الأيسر!",
	predireita30 = "اضغط 30 مرة على زر السهم الأيمن!",
	preesquerda60 = "اضغط 60 مرة على زر السهم الأيسر!",
	predireita60 = "اضغط 60 مرة على زر السهم الأيمن",
	preesquerda200 = "اضغط 100 مرة على زر السهم الأيسر",
	predireita200 = "اضغط 100 مرة على زر السهم الأيمن",
	espaco = "أضغط على زر المسافة 20 مرة!",
	nome = "اكتب اسمك (مع رقم #الهاشتاج)ـ",
	ndance = "لا ترقص!",
	rats = "كم عدد الفئران في هذه الغرفة؟",
	mestre = "الرئيس يقول",
	map = "الخريطة",
	time = "الوقت",
	mice = "الفئران",
	round = "الجولة",
	mices = "هذه الغرفة تطلب على الأقل 4 لاعبين",
	difficulty = "الصعوبة",
	creator = "صُنع النمط عن طريق Darakdarkus7#0000",
	segundos = "ثوانٍ.",
	fim = "نهاية الجولة! ستبدأ الجولة التالية في غضون ",
	playingmap = "بدأ الخارطة",
	created = "created by"
}
lang.es = {
welcome = "<N> Bienvenido al módulo ¡Simón dice! En este módulo tienes que hacer todo lo que dice simón. <ROSE> <br> <VP> Módulo creado por Darakdarkus7#0000 - Versión RTM Compilation 49",
dancar = "¡Danza!",
sentar = "¡Sentarse!",
confetar = "¡Lanza confeti 5 veces!",
mouse = "¡Haga clic en la pantalla 10 veces!",
beijos = "¡Lanza 10 besos!",
dormir = "Tienen sueño. Duerman para descansar",
raiva = "¡Tigrounette es malvado! ¡Enójate con él!",
chorem = "No hay queso para ti. Llora!",
esquerda = "¡No vayas a la IZQUIERDA!",
direita = "¡No vayas a la DERECHA!",
numero = "Escriba este número:",
digitar = "Escribe cualquier cosa y mándamela",
falar = "¡No hables nada!",
pular = "¡No saltes!",
mexer = "¡No te muevas!",
bandeira = "¡Agita la bandera de cualquier país!",
ano = "¿En qué año estamos?",
vesquerda = "¡Quédate frente a la IZQUIERDA!",
vdireita = "¡Mantente mirando a la DERECHA!",
quadrado = "¡Quédate en el cuadrado blanco!",
quadradov = "¡Quédate en el cuadrado rojo!",
retangulo = "¡Quédate en el rectángulo blanco!",
retangulov = "¡Quédate en el rectángulo rojo!",
nretangulo = "¡No te quedes en el rectángulo blanco!",
preesquerda30 = "Presiona 30 veces la tecla IZQUIERDA!",
predireita30 = "Presiona 30 veces la tecla DERECHA!",
preesquerda60 = "Presiona 60 veces la tecla IZQUIERDA!",
predireita60 = "Presiona 60 veces la tecla DERECHA!",
preesquerda200 = "Presione 100 veces la tecla IZQUIERDA!",
predireita200 = "Presione 100 veces la tecla DERECHA!",
espaco = "Presione 20 veces la barra espaciadora!",
nome = "Escribe tu apodo (con #numero incluido)",
ndance = "¡No bailes!",
rats = "How many rats are in this room?",
mestre = "Simón dice",
map = "Mapa",
time = "Hora",
mice = "Ratones",
round = "Redondo",
mices = "Esta sala requiere al menos 4 jugadores",
difficulty = "Dificultad",
creator = "Módulo creado por Darakdarkus7#0000",
segundos = "segundos.",
fim = "¡Fin del partido! El próximo partido comenzará el ",
playingmap = "Mapa de juego",
created = "creado por"
}
if tfm.get.room.community == "br" then
	text = lang.br
elseif tfm.get.room.community == "ar" then
	text = lang.ar
elseif tfm.get.room.community == "es" then
	text = lang.es
else
	text = lang.en
end
function eventNewPlayer(name)
	rato=rato+1
	for k=32, 87 do
		tfm.exec.bindKeyboard(name,k,false,true)
	end
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			["s"]=0;
			};		
 	data[name] = newData;
	tfm.exec.chatMessage(""..text.welcome.."",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if active >= 0 then
		vivo=vivo-1
		local i=0
		local name
		for pname,player in pairs(tfm.get.room.playerList) do
			if not player.isDead then
				i=i+1
				name=pname
			end
		end
		if i==0 then
			active=-1
		elseif i==1 then
			active=-1
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setGameTime(10)
		end
	end
end
function eventNewGame()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>POR FAVOR, LEIA ISTO ANTES DE JOGAR!<br><br><b>https://atelier801.com/topic?f=686054&t=932136</b>")
	end
	ui.removeTextArea(0,nil)
	rodada=0
	active=0
	vivo=0
	rato=0
	dificuldade=1
	if unlocked == true then
		tfm.exec.setGameTime(15)
	else
		tfm.exec.setGameTime(36000)
	end
	for name,player in pairs(tfm.get.room.playerList) do
		vivo=vivo+1
		rato=rato+1
		if data[name] then
			data[name].c=0
			data[name].key=0
		end
	end
	rodadas=math.floor(10+(rato/3))
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	active=math.random(1,37)
	getCommand()
end
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if(message:sub(0,3) == "run") then
				active=tonumber(message:sub(5))
				getCommand()
		end
	end
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if(message:sub(0,1) == "q") then
			pergunta=message:sub(3)
		end
	end
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if(message:sub(0,1) == "r") then
			resposta=message:sub(3)
		end
	end
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if(message:sub(0,4) == "mapa") then
			tfm.exec.newGame(message:sub(6))
			active=0
		end
	end
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if message == "reset" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			active=0
		end
	end
	if name == "Spectra_phantom#6089" or name == "Darakdarkus7#0000" then
		if(message:sub(0,4) == "time") then
			tempo=message:sub(6)
		end
	end
end
function getCommand()
	rodada=rodada+1
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].c=0
		data[name].s=0
	end
	if active == 1 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.dancar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 2 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.sentar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 3 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.confetar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(6)
	end
	if active == 4 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.mouse.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(6)
	end
	if active == 5 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.beijos.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(15)
	end
	if active == 6 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.dormir.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 7 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.raiva.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 8 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.chorem.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 9 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.esquerda.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(8)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1 
		end
	end
	if active == 10 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.direita.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(8)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 11 then
		number=math.random(100000,999999)
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.numero..""..number.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 12 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.digitar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 13 then
		number=math.random(10000000,99999999)
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.numero..""..number.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 14 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.falar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 15 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.pular.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 16 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.mexer.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 17 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.bandeira.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 18 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.ano.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 19 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.vesquerda.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 20 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.vdireita.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 21 then
		xpos=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadrado.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
	end
	if active == 22 then
		xpos=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 23 then
		xpos=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nretangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 24 then
		ypos=math.random(40,300) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 25 then
		ypos=math.random(40,300) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nretangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 26 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.preesquerda30.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 27 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.predireita30.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(9)
	end
	if active == 28 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.preesquerda60.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(15)
	end
	if active == 29 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.predireita60.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(15)
	end
	if active == 30 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.espaco.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 31 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nome.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 32 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.ndance.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 33 then
		xpos=math.random(60,650) 
		local xpos2=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadrado.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 34 then
		xpos=math.random(60,650) 
		local xpos2=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadradov.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		xpos=math.random(60,650) 
		local xpos2=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 36 then
		xpos=math.random(60,650) 
		local xpos2=math.random(60,650) 
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulov.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 37 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.rats.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(6)
	end
	if active == 38 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..pergunta.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(tempo)
	end
end
function eventChatMessage(name,message)
	if active == 11 or active == 13 then
		if message == tostring(number) or message == string then
			data[name].c=1
		end
	end
	if active == 12 then
		data[name].c=1
	end
	if active == 14 or active == 16 then
		tfm.exec.killPlayer(name)
	end
	if active == 18 then
		if message == "2019" then
			data[name].c=1
		end
	end
	if active == 31 then
		if string.upper(message) == string.upper(name) then
			data[name].c=1
		end
	end
	if active == 37 then
		if message == tostring(rato) then
			data[name].c=1
		end
	end
	if active == 38 then
		if tostring(message) == tostring(resposta) then
			data[name].c=1
		end
	end
end
function eventEmotePlayed(name,id)
	if active == 1 then
		if id == 0 or id == 10 then
			data[name].c=1
		end
	end
	if active == 2 then
		if id == 8 then
			data[name].c=1
		end
	end
	if active == 3 then
		if id == 9 then
			data[name].s=data[name].s+1
			if data[name].s >= 5 then
				data[name].c=1
			end
		end
	end
	if active == 5 then
		if id == 3 then
			data[name].s=data[name].s+1
			if data[name].s >= 10 then
				data[name].c=1
			end
		end
	end
	if active == 6 then
		if id == 6 then
			data[name].c=1
		end
	end
	if active == 7 then
		if id == 4 then
			data[name].c=1
		end
	end
	if active == 8 then
		if id == 2 then
			data[name].c=1
		end
	end
	if active == 16 then
		tfm.exec.killPlayer(name)
	end
	if active == 17 then
		if id == 10 then
			data[name].c=1
		end
	end
	if active == 32 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		data[name].s=data[name].s+1
		if data[name].s >= 10 then
			data[name].c=1
		end
	end
end
function eventKeyboard(name,id,down,x,y)
	if active == 9 then
		if id == 37 or id == 65 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 10 then
		if id == 39 or id == 68 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 15 then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 16 then
		tfm.exec.killPlayer(name)
	end
	if active == 26 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 27 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 30 then
				data[name].c=1
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 28 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
			end
		end
		if data[name].key == 37 and id == 65 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 65 and id == 37 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 60 then
				data[name].c=1
			end
		end
		if data[name].key == 39 and id == 68 then
			tfm.exec.killPlayer(name)
		end
		if data[name].key == 68 and id == 39 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 30 then
		if id == 32 then
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
	end
end
function eventLoop(passado,faltando)
	local tempo=math.floor(faltando/1000)
	if active == -2 then
		ui.setMapName("<N>"..text.mices.."<")
	elseif active == -1 then
		ui.setMapName("<VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."<")
	end
	if active >= 0 then
		if passado > 1200 and passado < 1700 and unlocked == true then
			tfm.exec.chatMessage(""..text.playingmap.." <J>"..tfm.get.room.currentMap.."<BL> "..text.created.." <J>"..tfm.get.room.xmlMapInfo.author)
		end
	end
	if rato < 3 then
		if tfm.get.room.currentMap == "@7277839" and unlocked == true then
			active=-2
			tfm.exec.setGameTime(8000)
		else
			if passado > 3000 and unlocked == true then
				tfm.exec.newGame("@7277839")
				tfm.exec.setGameTime(8000)
				tfm.exec.chatMessage("<R>"..text.mices.."",nil)
			end
		end
	end
	if rato >= 3 then
		if tfm.get.room.currentMap == "@7277839" and unlocked == true then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			active=0
		end
	end
	if active < 0 and faltando < 1 and unlocked == true then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if active == 0 and faltando < 1000 then
		if rodada < rodadas then
			sortearComandos()
		else
			active=-1
			tfm.exec.setGameTime(10)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(true)
				tfm.exec.playerVictory(true)
			end
		end
	end
	if active > 0 and faltando < 1 and rato > 1 then
		if active == 19 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == true then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 20 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == false then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 21 or active == 34 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 35 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < 300 then
					tfm.exec.killPlayer(name)
				else
					if player.x < xpos-20 or player.x > xpos+100 then
						tfm.exec.killPlayer(name)
					end
				end
			end
		end
		if active == 22 or active == 36 or active == 37 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x < xpos or player.x > xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 23 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > xpos and player.x < xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 24 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < ypos-10 or player.y > ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 25 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y > ypos-10 and player.y < ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		ui.removeTextArea(0,nil)
		ui.removeTextArea(1,nil)
		ui.removeTextArea(2,nil)
		active=0
		if rodada == 4 or rodada == 6 or rodada == 8 or rodada == 10 or rodada == 12 then
			dificuldade=dificuldade+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].key=0
			if data[name].c == 0 then
				tfm.exec.killPlayer(name)
			end
		end
		if vivo > 4 then
			tfm.exec.setGameTime(9-dificuldade)
		else
			tfm.exec.setGameTime(6-dificuldade)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].c == 1 then
				tfm.exec.setNameColor(name,0x00ff00)
			else
				tfm.exec.setNameColor(name,0xc2c2da)
			end
		end
	end
end
tfm.exec.newGame("@7277839")
end

initPistas = function()
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.setRoomMaxPlayers(24)
pergunta=0
valendo=false
limite=6 -- Variável usada para armazenar o limite de partidas
dica10="" -- Variável usada para armazenar a dica valendo 10 pontos
dica9="" -- Variável usada para armazenar a dica valendo 9 pontos
dica8="" -- Variável usada para armazenar a dica valendo 8 pontos
resposta="" -- Variável usada para armazenar a resposta da pergunta
data={}
tempo=999 -- NÃO ALTERAR!
loop=0
system.disableChatCommandDisplay("help")
system.disableChatCommandDisplay("skip")
system.disableChatCommandDisplay("shaman")
system.disableChatCommandDisplay("limite")
mapa="@4677521" -- Variável usada para armazenar o mapa do module
lang = {}
lang.br = {
	welcome = "<J>Bem-vindo ao module do Jogo das 3 Pistas! Não sabe como jogar? Digite !help.<br><br>Script criado por Shun_kazami#7014 e os membros da Spectra Advanced Module Group. Créditos adicionais a Hecarimjhenx#0000 e Miss_fortune#9548",
	time = "<R>Tempo esgotado! A resposta era ",
	fim = "<R>Partida encerrada! O jogador com melhor pontuação será o shaman!",
	shaman = "<R>Acabou o tempo! Outro shaman será escolhido.",
	c10p = "Dica valendo 10 pontos:",
	c9p = "Dica valendo 9 pontos:",
	c8p = "Dica valendo 8 pontos:",
	module = "Jogo das 3 Pistas",
	cancel = "<R>Rodada cancelada.",
	question = "<VP>Pressione G para fazer uma pergunta.",
	help = "<J>Como jogar:<br>Quando você tiver jogando, o shaman te dará 3 dicas. Se você acertar a pergunta, você ganha um número de pontos específico, dependendo de quanto tempo você demorou para responder. Quem tiver mais pontos no final vira o shaman do jogo.",
	win = "acertou a resposta! A resposta era",
	cancelled = "<R>O shaman não pode falar nada no chat durante seu turno.",
	responder = "<ROSE>Podem responder agora!"
}
lang.en = {
	welcome = "<J>Welcome to 3 Tips Game! If you want help, type !help.<br><br>Script made by Shun_kazami#7014 and the Spectra Advanced Module Group. Credits to Hecarimjhenx#0000 and Miss_fortune#9548",
	time = "<R>End of time! The answer was",
	fim = "<R>The match ended! The best player will be the shaman.",
	shaman = "<R>Time is gone! Other shaman will be selected.",
	c10p = "Tip for 10 points:",
	c9p = "Tip for 9 points:",
	c8p = "Tip for 8 points:",
	module = "3 Tips Game",
	cancel = "<R>Cancelled match.",
	question = "<VP>Press G to make a question.",
	help = "<J>How to Play:<br>When you is playing, the shaman will make 3 tips. If you discover the answer, you win points, depending of time remaining to win. At final of the match, the player that get more points will be the shaman.",
	win = "discovered the answer! The answer was",
	cancelled = "<R>The shaman can't type nothing on the chat.",
	responder = "<ROSE>You can answer now!"
}
if tfm.get.room.community == "br" then
	text = lang.br
else
	text = lang.en
end
tfm.exec.newGame(mapa)
rato=0
function eventNewPlayer(name)
	newData={
		["played"]=0;
			}
	data[name]=newData;
	tfm.exec.bindKeyboard(name,71,true,true)
	tfm.exec.respawnPlayer(name)
	tfm.exec.chatMessage(text.welcome,name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventSummoningEnd(name,type,x,y,angle,vx,vy,obj)
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.chatMessage("<ROSE>Isn't allowed the use of shaman objects in this module.",nil)
			tfm.exec.newGame(mapa)
		end
	end
end
function eventLoop(p,f)
	loop=loop+1
	tempo=math.ceil(f/1000)
	if f < 2000 and valendo == true then
		tfm.exec.chatMessage(""..text.time..""..resposta.."",nil)
		ui.removeTextArea(1,nil)
		ui.removeTextArea(2,nil)
		ui.removeTextArea(3,nil)
		valendo=false
		tfm.exec.setGameTime(64)
	end
	if pergunta == limite and valendo == false then
		tfm.exec.chatMessage(text.fim,nil)
		tfm.exec.newGame(mapa)
	end
	if f <= 100 then
		tfm.exec.chatMessage(text.shaman,nil)
		tfm.exec.newGame(mapa)
	end
	if loop == 10 then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	if valendo == true and f <= 59000 then
		ui.addTextArea(1,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c10p.." <b>"..dica10.."",nil,5,30,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 49000 then
		ui.addTextArea(2,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c9p.." <b>"..dica9.."",nil,5,70,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 39000 then
		ui.addTextArea(3,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c8p.." <b>"..dica8.."",nil,5,110,780,32,0x000001,0x000001,0.9,true)
	end
	ui.setMapName("<J>"..text.module.."   <G>|   <N>Question : <V>"..pergunta.."/"..limite.."   <G>|   <N>Time : <V>"..tempo.."s   <G>|   <N>Compilation RTM 17<")
end
function eventChatCommand(name,message)
	if message == "skip" then
		if name == "Shun_kazami#7014" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			tfm.exec.chatMessage(text.cancel,nil)
			tfm.exec.newGame(mapa)
		end
	end
	if(message:sub(1,6) == "limite") then
		if name == "Shun_kazami#7014" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			limite=tonumber(message:sub(8))
		end
	end
	if(message:sub(1,6) == "shaman") then
		if name == "Shun_kazami#7014" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			tfm.exec.setPlayerScore(message:sub(8),9999,false)
			tfm.exec.newGame(mapa)
		end
	end
	if message == "help" then
		tfm.exec.chatMessage(text.help,name)
	end
end
function eventNewGame()
	loop=0
	ui.removeTextArea(1,nil)
	ui.removeTextArea(2,nil)
	ui.removeTextArea(3,nil)
	pistas={p10="",p9="",p8=""}
	valendo=false
	pergunta=0
	tfm.exec.setGameTime(64)
	rato=0
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			if data[name] then
				data[name].played=1
				tfm.exec.chatMessage(text.question,name)
			end
		end
		tfm.exec.bindKeyboard(name,71,true,true)
		rato=rato+1
		tfm.exec.setPlayerScore(name,0,false)
	end
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>POR FAVOR, LEIA ISTO ANTES DE JOGAR!<br><br><b>https://atelier801.com/topic?f=686054&t=932136</b>")
	end
end
function eventChatMessage(name,message)
	 if string.upper(message) == string.upper(resposta) and valendo == true then
		if tfm.get.room.playerList[name].isShaman == false then
			if tempo >= 50 then
				tfm.exec.setPlayerScore(name,10,true)
			elseif tempo >= 40 and tempo < 50 then
				tfm.exec.setPlayerScore(name,9,true)
			elseif tempo < 40 then
				tfm.exec.setPlayerScore(name,8,true)
			end
			valendo=false
			tfm.exec.setGameTime(64)
			tfm.exec.chatMessage("<VP>"..name.." "..text.win.." "..string.upper(resposta).."",nil)
			resposta=""
			ui.removeTextArea(1,nil)
			ui.removeTextArea(2,nil)
			ui.removeTextArea(3,nil)
		end
	end
	if tfm.get.room.playerList[name].isShaman == true then
		tfm.exec.chatMessage(text.cancelled,name)
		valendo=false
		tfm.exec.newGame(mapa)
		resposta=""
		ui.removeTextArea(1,nil)
		ui.removeTextArea(2,nil)
		ui.removeTextArea(3,nil)
	end
end
function eventKeyboard(name,key)
	if tfm.get.room.playerList[name].isShaman then
		ui.addPopup(0,2,text.c10p,name,350,125,200,true)
	end
end
function eventPopupAnswer(id,name,answer)
	if tfm.get.room.playerList[name].isShaman then
	if id == 0 then
		dica10=answer
		ui.addPopup(1,2,text.c9p,name,350,125,200,true)
	end
	if id == 1 then
		dica9=answer
		ui.addPopup(2,2,text.c8p,name,350,125,200,true)
	end
	if id == 2 then
		dica8=answer
		ui.addPopup(3,2,"Insert the ANSWER:",name,350,125,200,true)
	end
	if id == 3 then
		if string.len(answer) >= 2 and string.len(answer) <= 80 then
			pergunta=pergunta+1
			resposta=string.upper(answer)
			tfm.exec.setGameTime(64)
			valendo=true
		else
			ui.addPopup(3,2,"Insert the ANSWER:",name,350,125,200,true)
		end
	end
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].isShaman then
		tfm.exec.newGame(mapa)
	end
end
end

initObjects = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(20)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
for _,f in next,{"help","kill","run","add","reset","restart"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition"}
objects={1,2,10,35,39,40,54,60,61,85,90,201,202,203,204,205,206,207,208,209}
actual_map=""
actual_creator=""
bar=""
loop=0
winner=false
functs={running=false,level=0,count=10}
times=0
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Reksai_void2600#6638" then
		if message == "help" then
			tfm.exec.chatMessage("<J>The objective of this room is survive! Don't touch on the boxes and win the game!<br><br>Module made by Reksai_void2600#6638 and the Spectra Advanced Module Group")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if (message:sub(0,3) == "run") then
			tfm.exec.newGame(message:sub(5))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventNewGame()
	functs.running=false
	functs.level=0
	functs.count=10
	times=0
	tfm.exec.setGameTime(100)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	actual_creator=tfm.get.room.xmlMapInfo.author
	changeBar()
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Objects.",name)
		end
	end
end
function showBar()
	for i=1,22 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<J>#objects RTM 4001.015   <BL>|   <J>"..tfm.get.room.currentMap.."   <BL>|   <N>Difficulty : "..bar.."<")
			else
				ui.setMapName("<J>#objects RTM 4001.015   <BL>|   <J>"..map_names[i].." <BL>- "..tfm.get.room.currentMap.."   <BL>|   <N>Difficulty : "..bar.."<")
			end
		end
	end
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>POR FAVOR, LEIA ISTO ANTES DE JOGAR!<br><br><b>https://atelier801.com/topic?f=686054&t=932136</b>")
	end
end
function showText(text)
	ui.addTextArea(1,"<font size='56'><p align='center'><font color='#222222'>"..text.."",nil,103,93,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='56'><p align='center'><font color='#ffffff'>"..text.."",nil,100,90,600,80,0,0,1.0,true)
end
function showTextSmall(text)
	ui.addTextArea(1,"<font size='32'><p align='center'><font color='#222222'>"..text.."",nil,103,103,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='32'><p align='center'><font color='#ffffff'>"..text.."",nil,100,100,600,80,0,0,1.0,true)
end
function changeBar()
	if functs.level == 1 then
		bar="<font face='Consolas'><VP>█───<J>──<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 2 then
		bar="<font face='Consolas'><VP>██──<J>──<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 3 then
		bar="<font face='Consolas'><VP>███─<J>──<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 4 then
		bar="<font face='Consolas'><VP>████<J>──<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 5 then
		bar="<font face='Consolas'><VP>████<J>█─<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 6 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>───<font face='Verdana'>"
	elseif functs.level == 7 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>█──<font face='Verdana'>"
	elseif functs.level == 8 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>██─<font face='Verdana'>"
	elseif functs.level >= 9 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>███<font face='Verdana'>"
	else
		bar="<font face='Consolas'><VP>────<J>──<font color='#ff0000'>───<font face='Verdana'>"
	end
end
function removeText()
	for i=0,1 do
		ui.removeTextArea(i,nil)
	end
end
function throw()
	position=math.random(0,800)
	tfm.exec.addShamanObject(object,position,-300,0,0,1,false)
	tfm.exec.addShamanObject(0,position,100,0,0,1,false)
end
function eventLoop(p,f)
	showBar()
	if f <= 3000 and functs.running == true and winner == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			functs.running=false
			showText("Time is up!")
		end
	end
	if p >= 1000 and p <= 1600 then
		tfm.exec.chatMessage("Playing map <J>"..tfm.get.room.currentMap.."<BL> made by <J>"..tfm.get.room.xmlMapInfo.author)
		if string.find(tfm.get.room.name,"meep") then
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveMeep(name)
			end
		end
	end
	if f <= 1 and functs.running == false then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if functs.running == false and winner == false and p < 20000 then
		functs.count=functs.count-0.5
		if functs.count <= 3 then
			showText(""..math.ceil(functs.count).."")
		end
		if functs.count <= 0 and p < 20000 and winner == false then
			functs.running=true
			functs.level=1
			showText("Go!")
		end
	end
	if functs.running == true then
		loop=loop+1
		changeBar()
		object=objects[math.random(#objects)]
		if loop >= 10-functs.level and winner == false then
			removeText()
			times=times+1
			if times >= 3 and functs.level <= 8 then
				times=0
				functs.level=functs.level+1
			end
			loop=0
			if functs.level <= 5 then
				for i=1,functs.level do
					throw()
				end
			else
				for i=1,5 do
					throw()
				end
			end
		end
	end
end
function eventPlayerDied(name)
	if functs.running == true then
		local i=0
		local name
		for pname,player in pairs(tfm.get.room.playerList) do
			if not player.isDead then
				i=i+1
				name=pname
			end
		end
		if i==0 then
			functs.running=false
			winner=true
			showText("No winners!")
			tfm.exec.setGameTime(5)
		elseif i==1 then
			functs.running=false
			showTextSmall(""..name.." wins the game!")
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setPlayerScore(name,1,true)
			tfm.exec.setGameTime(5)
			winner=true
		end
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
end

initFall2 = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.setRoomMaxPlayers(24)
xml2=''
creator=""
position=0
objective=60
enabled=false
map=""
mapas={"@7411648","@7568910","@7410842","@7568917","@7568919","@7568922","@7568923","@7568928","@7568964","@7568967","@7568965","@7354962","@7569413"}
system.disableChatCommandDisplay("obj")
lobby="@7404106"
changed=false
function eventChatCommand(name,message)
	if(message:sub(1,3) == "obj") then
		if name == "Jhinsword350#0000" or name == "Vaicntaefeto#0000" then
			objective=tonumber(message:sub(5))
			tfm.exec.chatMessage("<J>Objective changed to: "..objective,nil)
		end
	end
end
function eventNewGame()
	if enabled == true then
		position=0
		if changed == false and enabled == true then
			xml2=tfm.get.room.xmlMapInfo.xml
			creator=tfm.get.room.xmlMapInfo.author
			map=tfm.get.room.currentMap
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	else
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.1",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.1! Script made by <b>Vaicntaefeto#0000</b>.<")
		tfm.exec.setGameTime(60)
	end
end
function eventLoop(p,f)
	if p >= 5000 and p <= 6000 and changed == false and enabled == true then
		tfm.exec.newGame(xml2)
		changed=true
		ui.setMapName("<J>#fall 2.1   <BL>|   <J>"..creator.." <BL>- "..map.."   <BL>|   <J>Objective : <J>"..objective.." points<")
		tfm.exec.chatMessage("If the maps aren't showing to you, please disconnect from your account and connect again. This is a Transformice issue about memory allocation.")
	end
	if f <= 1 and enabled == true then
		changed=false
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if enabled == false and f >= 1000 then
		ui.addTextArea(11,"<font face='Eras Demi ITC'><font size='18'><font color='#ffff00'>Get ready! The match will start on "..math.floor(f/1000).." seconds.",nil,220,370,600,32,0,0,1.0,true)
	end
	if f <= 10000 and f >= 9000 and enabled == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
			changed=false
		end
	end
	if f <= 1 and enabled == false then
		for i=10,11 do
			ui.removeTextArea(i,nil)
		end
		enabled=true
		tfm.exec.newGame(mapas[math.random(#mapas)])
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].score >= objective and enabled == true then
			enabled=false
			tfm.exec.newGame(lobby)
			tfm.exec.chatMessage("<VP><b>Congratulations!</b> "..name.." wins the game with "..tfm.get.room.playerList[name].score.." points!")
		end
	end
end
function eventPlayerWon(name)
	position=position+1
	if position == 1 then
		tfm.exec.setGameTime(20)
	end
	if position <= 8 then
		tfm.exec.setPlayerScore(name,10-position,true)
	else
		tfm.exec.setPlayerScore(name,1,true)
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
	end
end
function eventNewPlayer(name)
	if enabled == false then
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.1",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.1! Script made by <b>Vaicntaefeto#0000</b>.<")
	end
	tfm.exec.chatMessage("<J>Welcome to the #fall2 module!<br><br>The objective of this room is fall to the end of the map!<br>The player that score more points will win the game!<br><br><R>WARNING: This script require at least 3GB of RAM to work without problems.<J><br><br>Script made by Vaicntaefeto#0000",name)
end
tfm.exec.newGame(lobby)
end

tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.62.2<br>by Spectra_phantom#6089<br><br>The requested room is loading or updating. Please wait...",nil)

if string.find(tfm.get.room.name,"true_false") then
	active = "true_false"
	initTrue()
elseif string.find(tfm.get.room.name,"mestre") then
	active = "mestre"
	initMestre()
elseif string.find(tfm.get.room.name,"pistas") then
	active = "pistas"
	initPistas()
elseif string.find(tfm.get.room.name,"objects") then
	active = "objects"
	initObjects()
elseif string.find(tfm.get.room.name,"fall2") then
	active = "fall2"
	initFall2()
else
	active = "anvilwar"
	initAnvilwar()
end
