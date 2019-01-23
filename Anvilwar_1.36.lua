tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
map="@7565678"
objects={2,201,202,203,204,205,206,207,208,209}
loop=0
winner=false
functs={running=false,level=0,count=10}
function eventNewGame()
	functs.running=false
	functs.level=0
	functs.count=10
	tfm.exec.setGameTime(144)
	removeText()
	winner=false
end
function showText(text)
	ui.addTextArea(1,"<font size='56'><p align='center'><font color='#660000'>"..text.."",nil,103,323,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='56'><p align='center'><font color='#ff0000'>"..text.."",nil,100,320,600,80,0,0,1.0,true)
end
function showTextSmall(text)
	ui.addTextArea(1,"<font size='32'><p align='center'><font color='#660000'>"..text.."",nil,103,333,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<font size='32'><p align='center'><font color='#ff0000'>"..text.."",nil,100,330,600,80,0,0,1.0,true)
end
function removeText()
	for i=0,1 do
		ui.removeTextArea(i,nil)
	end
end
function eventLoop(p,f)
	if f <= 5000 and functs.running == true and winner == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			functs.running=false
			showText("Time is up!")
		end
	end
	if f <= 1 and functs.running == false then
		tfm.exec.newGame(map)
	end
	if functs.running == false and winner == false then
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
		object=objects[math.random(#objects)]
		if loop >= 10-functs.level and winner == false then
			removeText()
			tfm.exec.addShamanObject(object,math.random(50,750),300,0,0,1,false)
			if functs.level >= 2 then
				tfm.exec.addShamanObject(object,math.random(50,750),300,0,0,1,false)
			end
			if functs.level >= 3 then
				tfm.exec.addShamanObject(object,math.random(50,750),300,0,0,1,false)
			end
			if functs.level >= 4 then
				tfm.exec.addShamanObject(object,math.random(50,750),300,0,0,1,false)
			end
			if functs.level >= 5 then
				tfm.exec.addShamanObject(object,math.random(50,750),300,0,0,1,false)
			end
			loop=0
		end
	end
	if f <= 118000 and f >= 117400 and functs.level == 1 then
		functs.level=2
		showTextSmall("Difficulty increased to 2")
	end
	if f <= 108000 and f >= 107400 and functs.level == 2 then
		functs.level=3
		showTextSmall("Difficulty increased to 3")
	end
	if f <= 98000 and f >= 97400 and functs.level == 3 then
		functs.level=4
		showTextSmall("Difficulty increased to 4")
	end
	if f <= 88000 and f >= 87400 and functs.level == 4 then
		functs.level=5
		showTextSmall("Difficulty increased to 5")
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
			showTextSmall(""..name.." wons the game!")
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			tfm.exec.setPlayerScore(name,1,true)
			tfm.exec.setGameTime(10)
			winner=true
		end
	end
end
tfm.exec.newGame(map)
