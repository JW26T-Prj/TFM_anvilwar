--[[ #anvilwar Reborn
Module authors : Spectra_phantom#6089, Morganadxana#0000, Rakan_raster#0000
(C) 2017-2021 Spectra Advanced Module Group

Version : RTM -----.---
Compilation date : --/--/---- --:-- UTC
Sending player : Spectra_phantom#6089

Number of maps : ---
Number of module special members : -- ]]--

_VERSION = "Lua 5.4"
_AUTHOR = "Spectra_phantom#6089"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7581524","@7494251","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892"}
players_red={}; alives_red={};
players_blue={}; alives_blue={}; 
lobby_map="@7277839"; current_map=""; actual_player="";
enabled=false;
mices=0; loop=0; skips=0; skipsq=0; skip_time=0; needs=0; turn=0; choose_time=40; time_passed=0; time_remain=0; current_red=0; current_blue=0;
mode="lobby"
helpers={}; mods={}; admins={}; ninjas={"Forzaldenon#0000"}; banneds={};
data={}

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"reset","set","p","help","ban","unban","sync","pw","skip"} do
	system.disableChatCommandDisplay(g)
end

function tableSearch(table,element)
	for i=1,rawlen(table) do
		if element == table[i] then
			return true
		else
			return false
		end
	end
end

function showTeams(name)
	ui.addTextArea(478,"<font size='18'><font color='#000000'><p align='center'><b><a href='event:enter_red'>Join",name,302,102,150,25,0,0,0.9,true)
	ui.addTextArea(480,"<font size='18'><font color='#ff4500'><p align='center'><b><a href='event:enter_red'>Join",name,300,100,150,25,0,0,0.9,true)
	ui.addTextArea(479,"<font size='18'><font color='#000000'><p align='center'><b><a href='event:enter_blue'>Join",name,302,337,150,25,0,0,0.9,true)
	ui.addTextArea(481,"<font size='18'><font color='#0045ff'><p align='center'><b><a href='event:enter_blue'>Join",name,300,335,150,25,0,0,0.9,true)
end

function updatePlayerList()
	text1=""; text2="";
	for id,name in next,players_red do
		text1="<font size='14.5'>"..text1.."<b> "..id.."</b> - "..name.."<br>"
	end
	for id,name in next,players_blue do
		text2="<font size='14.5'>"..text2.."<b> "..id.."</b> - "..name.."<br>"
		
	end
	ui.addTextArea(-4,"<font color='#000001'>"..text2.."",nil,481,91,260,270,0,0,1.0,true)
	ui.addTextArea(-3,text2,nil,480,90,260,270,0,0,1.0,true)
	ui.addTextArea(-1,"<font color='#000001'>"..text1.."",nil,21,91,260,270,0,0,1.0,true)
	ui.addTextArea(-2,text1,nil,20,90,260,270,0,0,1.0,true)
end

function eventNewPlayer(name)
	mices=mices+1
	if not data[name] then
		data[name]={level=1,exp=0,maxp=100,kills=0,winrate=0.0,coins=100,multikills=0,killed=false,banned=false,souris=false,team=0,ranking=0,skip=false,angle=45,power=5,powerup=0}
	end
	if name:sub(1,1) == "*" then
		data[name].souris=true
		data[name].ranking=-1
	end
	for _,k in next,{32,49,50,51,52,53,54,55,56,57,67,72,80,86,88,90} do
		tfm.exec.bindKeyboard(name,k,true,true)
	end
	if mode == "lobby" then
		if data[name] then
			if data[name].souris == false and data[name].banned == false then
				showTeams(name)
				tfm.exec.respawnPlayer(name)
			end
		end
		updatePlayerList()
	end
end

function giveRankings(name)
	if data[name] then
		if tableSearch(helpers,name) then
			data[name].ranking=1
		elseif tableSearch(mods,name) then
			data[name].ranking=2
		elseif tableSearch(ninjas,name) then
			data[name].ranking=3
		elseif tableSearch(admins,name) then
			data[name].ranking=4
		elseif tableSearch(banneds,name) then
			data[name].ranking=-2
		end
	end
end

function eventKeyboard(name,code,down,x,y)
	if mode == "shoot" and actual_player == name then
		if code == 32 then
			if data[name].team == 1 then
				tfm.exec.addShamanObject(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
				if data[name].powerup == 1 then
					tfm.exec.addShamanObject(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						tfm.exec.addShamanObject(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
					end
				end
			elseif data[name].team == 2 then
				tfm.exec.addShamanObject(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
				if data[name].powerup == 1 then
					tfm.exec.addShamanObject(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						tfm.exec.addShamanObject(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
					end
				end
			end
			mode="wait3"
			tfm.exec.setGameTime(6)
		end
		if data[name].powerup == 0 then
			if code == 49 then
				print("double shoot")
				data[name].powerup=1
			end
			if code == 50 then
				print("triple shoot")
				data[name].powerup=2
			end
		end
		if code == 90 then
			if data[name].power > 0 then
				data[name].power=data[name].power-1
			end
			print(data[name].power)
		end
		if code == 88 then
			if data[name].power < 10 then
				data[name].power=data[name].power+1
			end
			print(data[name].power)
		end
		if code == 67 then
			if data[name].angle > 20 then
				data[name].angle=data[name].angle-5
			end
			print(data[name].angle)
		end
		if code == 86 then
			if data[name].angle < 70 then
				data[name].angle=data[name].angle+5
			end
			print(data[name].angle)
		end
	end
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	giveRankings(name)
end

function eventPlayerLeft(name)
	if mode == "lobby" or mode == "map_sort" or mode == "wait1" then
		removeTeam(name)
	end
end

function eventPlayerDied(name)
	if mode == "lobby" then
		tfm.exec.respawnPlayer(name)
	end
	if mode == "wait2" and time_passed < 20 or mode == "end" then
		if data[name] and data[name].team == 1 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
		else
			-- Under construction!
		end
	end
	if mode == "shoot" then
		-- Under construction!
	end
end

function lobby()
	mode="lobby"; choose_time=10;
	tfm.exec.newGame(lobby_map)
	tfm.exec.setGameTime(36000)
	players_red={};	players_blue={}; loop=0;
	for i=-8, -1 do
		ui.removeTextArea(i,nil)
	end
	for name,player in next,tfm.get.room.playerList do
		if data[name] then
			if data[name].souris == false and data[name].banned == false then
				showTeams(name)
				data[name].team=0
			end
		end
	end
end

function eventNewGame()
	if mode == "wait1" then
		mode="wait2"
		tfm.exec.setGameTime(20)
		skipsq=math.ceil(mices/2)
		if mices >= 8 then
			print("<ROSE>If you want to skip this map, please type !skip. Is needed a minimum of <b>"..skipsq.."</b> votes.")
		end
		moveTeams()
	end
end

function eventChatCommand(name,command)
	if command == "reset" and data[name].ranking >= 2 then
		lobby()
	end
	if (command:sub(0,4) == "sync") and data[name].ranking >= 3 then
		tfm.exec.lowerSyncDelay(message:sub(6))
		print("Sync: "..message:sub(6).."",name)
	end
	if (command:sub(0,2) == "pw") and data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(message:sub(4))
		if rawlen(message:sub(4)) > 0 then
			print("Password changed to: "..message:sub(4).."",name)
		else
			print("Password cleared.",name)
		end
	end
	if command == "skip" then
		if mode == "wait2" and data[name].skip == false and mices >= 8 then
			if skip_time > 0 then
				print("<R>This command can be only used in <b>"..skip_time.."</b> seconds.",name)
			else
				skips=skips+1
				print("You voted to skip the current map.",name)
				data[name].skip=true
				if skips > math.ceil(skipsq/2) then
					print("<J><b>"..name.."</b> voted to skip the current map. ("..skips.."/"..skipsq.."")
				end
				if skips >= skipsq then
					skip_time=900
					print("<ROSE>They voted to skip the current map. This command can be used only every 15 minutes.")
					loop=0
					mode="map_sort"
				end
			end
		else
			print("<R>This command can be only used with <b>8</b> or more mices, and only at specific situations.",name)
		end
	end
end

function enterRedTeam(name)
	if choose_time > 1 and data[name].team == 0 then
		table.insert(players_red,name)
		updatePlayerList()
		data[name].team=1
		for i=478,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#000000'><p align='center'><b><a href='event:quit'>Leave",name,300,210,150,25,0,0,0.9,true)
		end
	end
end

function enterBlueTeam(name)
	if choose_time > 1 and data[name].team == 0 then
		table.insert(players_blue,name)
		updatePlayerList()
		data[name].team=2
		for i=478,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#000000'><p align='center'><b><a href='event:quit'>Leave",name,300,210,150,25,0,0,0.9,true)
		end
	end
end

function moveTeams()
	if mode == "wait2" then
		for _,name in next,players_red do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
		end
		for _,name in next,players_blue do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
		end
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].team == 0 then
				tfm.exec.killPlayer(name)
			end
		end
	end
end

function removeTeam(name)
	length1=rawlen(players_red)
	length2=rawlen(players_blue)
	for i=1,length1 do
		if players_red[i] == name then
			table.remove(players_red,i)
			updatePlayerList()
			showTeams(name)
			data[name].team=0
			ui.removeTextArea(482,name); break
		end
	end
	for i=1,length2 do
		if players_blue[i] == name then
			table.remove(players_blue,i)
			updatePlayerList()
			showTeams(name)
			data[name].team=0
			ui.removeTextArea(482,name); break
		end
	end
end

function eventTextAreaCallback(id,name,callback)
	if callback == "enter_red" then
		enterRedTeam(name)
	end
	if callback == "enter_blue" then
		enterBlueTeam(name)
	end
	if callback == "quit" then
		removeTeam(name)
	end
end

function calculatePoints(name)
	-- Under construction!
end

function drawMatch()
	mode="end"
	tfm.exec.setGameTime(20)
end

function victoryBlue()
	mode="end"
	for _,name in next,players_blue do
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(900,1200),180,false,0,0,false)
		tfm.exec.playEmote(name,0)
		calculatePoints(name)
	end
	tfm.exec.setGameTime(20)
end

function victoryRed()
	mode="end"
	for _,name in next,players_red do
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(400,700),180,false,0,0,false)
		tfm.exec.playEmote(name,0)
		calculatePoints(name)
	end
	tfm.exec.setGameTime(20)
end

function setShooter()
	if turn == 0 then
		turn=1
		actual_player=alives_blue[math.random(#alives_blue)]
		tfm.exec.setGameTime(15)
	elseif turn == 1 then
		turn=0
		actual_player=alives_red[math.random(#alives_red)]
		tfm.exec.setGameTime(15)
	end
	print(actual_player)
	enabled=true
	mode="shoot"
end

function getAlivePlayers()
	current_red=rawlen(alives_red); current_blue=rawlen(alives_blue);
	alives_red={}
	alives_blue={}
	for _,name in next,players_red do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_red,name)
		else
			data[name].killed=true
		end
	end
	for _,name in next,players_blue do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_blue,name)
		else
			data[name].killed=true
		end
	end
	if mode == "wait3" then
		if data[actual_player].team == 1 then
			killsc=current_blue-rawlen(alives_blue)
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				print("double kill - "..actual_player)
			elseif killsc >= 3 then
				print("multi kill - "..killsc.." - "..actual_player)
			end
		elseif data[actual_player].team == 2 then
			killsc=current_red-rawlen(alives_red)
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				print("double kill - "..actual_player)
			elseif killsc >= 3 then
				print("multi kill - "..killsc.." - "..actual_player)
			end
		end
	end
	if rawlen(alives_red) == 0 and rawlen(alives_blue) == 0 then
		drawMatch()
	elseif rawlen(alives_red) == 0 then
		victoryBlue()
	elseif rawlen(alives_blue) == 0 then
		victoryRed()
	else
		setShooter()
	end
end

function eventLoop(passed,remain)
	time_passed=math.floor(passed/1000)
	time_remain=math.floor(remain/1000)
	if mode == "lobby" then
		if choose_time > 0 then
			choose_time=choose_time-0.5
			ui.addTextArea(483,"<font size='55'><p align='center'><font color='#000001'>"..math.ceil(choose_time).."",nil,337,22,80,60,0,0,0.97,true)
			ui.addTextArea(484,"<font size='55'><p align='center'>"..math.ceil(choose_time).."",nil,335,20,80,60,0,0,0.97,true)
		end
		if choose_time == 0 then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				if rawlen(players_red) - rawlen(players_blue) <= 3 and rawlen(players_red) - rawlen(players_blue) >= -3 then
					for i=480,484 do ui.removeTextArea(i,nil) end
					mode="map_sort"
				else
					choose_time=15
				end
			else
				choose_time=30
			end
		end
	end
	if skip_time > 0 then
		skip_time=skip_time-0.5
	end
	if mode == "map_sort" then
		if loop < 8 then
			loop=loop+1
			ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>Randomizing map...",nil,152,27,500,45,0,0,1.0,true)
			ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='28'><i>Randomizing map...",nil,150,25,500,45,0,0,1.0,true)
			current_map=maps[math.random(#maps)]
			ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..current_map.."",nil,152,357,500,45,0,0,1.0,true)
			ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='28'><i>"..current_map.."",nil,150,355,500,45,0,0,1.0,true)
		elseif loop == 8 then
			for i=-6, -5 do
				ui.removeTextArea(i,nil)
			end
			ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>Selected Map : "..current_map.."",nil,152,357,500,45,0,0,1.0,true)
			ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='28'><VP><i>Selected Map : "..current_map.."",nil,150,355,500,45,0,0,1.0,true)
			mode="wait1"
			tfm.exec.setGameTime(10)
		end
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait1" and time_remain > 0 then
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait3" and time_remain == 1 then
		getAlivePlayers()
	end
	if mode == "shoot" and time_remain == 0 then
		tfm.exec.setGameTime(6,true)
		enabled=false
		mode="wait2"
	end
	if mode == "wait2" and time_remain == 1 then
		mode="shoot"
		getAlivePlayers()
	end
	if mode == "wait1" and time_remain == 0 then
		for i=-8, -1 do
			ui.removeTextArea(i,nil)
		end
		tfm.exec.newGame(current_map)
	end
	if mode == "end" and time_remain == 0 then
		lobby()
	end
end

lobby()