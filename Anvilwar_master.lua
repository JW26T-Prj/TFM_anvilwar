-- Transformice #anvilwar module loader - Version 2.193
-- By Spectra_phantom#6089
-- Included sub-modules: #watercatch, #truefalse, #pistas, #objects.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.193",
	_MAINV = "42879.152",
	_DEVELOPER = "Spectra_phantom#6089" }

initAnvilwar = function()
--[[ #anvilwar Reborn
Module authors : Spectra_phantom#6089, Morganadxana#0000
(C) 2017-2021 Spectra Advanced Module Group

Version : RTM 42879.152
Compilation date : 08/24/2021 12:40 UTC
Sending player : Morganadxana#0000

Number of maps : 152
Number of module special members : 11 ]]--

_VERSION = "Lua 5.4"
_AUTHOR = "Spectra_phantom#6089"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892","@7497464","@7497395","@7512948","@7555653","@7688028","@7655209","@7690671","@7845674","@7845680","@7845682","@7845738","@7859139","@7845709","@7844985","@7859144","@7860343","@7860623","@7860498","@7863972","@7803705","@7845724","@7866585","@7834953","@7866596","@7703547","@7795869","@7869247","@7844978","@7869610","@7654290"}
map_names={"The Dual-Sided Fight Area","No Name","Inside the Castle","Hell and Water","A very simple waterfall","No Name","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","No Name","The first #anvilwar map","The Beach Test Map 2","No Name","No Name","The Six Attributes","Inside the Ocean","No Name","No Name","No Name","No Name","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","No Name","No Name","On the Seabed","The Palace of Swords","The Castle of Fire","No Name","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","No Name","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","No Name","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","No Name","No Name","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge (v2)","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","No Name","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","No Name","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas #1","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","No Name","No Name","Do Not Hit The Anvil","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Acid Revenge","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury","Released Things","No Name","No Name","No Name","This is a Terror","No Name","No Name","Escape from Nyan Cat","Sharingan Eye","Zombie Attack","Destructed Zone","Eye of Black Hole","Reversed Ninja Degrees","No Name","No Name","The Beach Test Map 6","The Beach Test Map 7","Vexos Arena","Releasing Anvils","The Hug of Agony","Try a Little More","No Name","No Name","No Name","Land of Spirits","No Name","No Name","No Name","No Name","Tobi - Akatsuki","Water Backgrounds"}
players_red={}; alives_red={};
players_blue={}; alives_blue={};
lobby_map='<C><P Ca="" /><Z><S><S L="800" o="ffffffff" X="400" H="10" Y="325" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="800" o="ffffffff" X="300" H="10" Y="250" T="12" P="0,0,0,0,90,0,0,0" /><S L="800" o="ffffffff" X="500" H="10" Y="250" T="12" P="0,0,0,0,90,0,0,0" /><S L="800" o="ffffffff" X="400" H="10" Y="-5" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0,90,0,0,0" L="800" o="ffffffff" H="10" Y="250" T="12" X="10" /><S P="0,0,0,0,90,0,0,0" L="800" o="ffffffff" H="10" Y="250" T="12" X="790" /></S><D><DS Y="-25" X="400" /></D><O /></Z></C>'
current_map=""; actual_player="";
enabled=false; powerups=false; permafrost=false; night_mode=false; gravity=false; testmode=false; change=false;
mices=0; loop=0; turns=0; needs=0; turn=0; choose_time=40; time_passed=0; time_remain=0; current_red=0; current_blue=0;
points_loop=0; pf_time=0; general_time=0; total_time=0; map_id=0; set_player=""; set_map="-1"; def_map=-1; red_cap=""; blue_cap=""; temp_name=""; bar_text="";
mode="lobby"
images_id={};
playersList={}; helpers={}; mods={
"Dinamarquers#0000",
"Flaysama#5935",
"Chavestomil#0000",
"Shun_kazami#7014"};
admins={"Spectra_phantom#6089",
"Morganadxana#0000",
"Rakan_raster#0000"}
ninjas={"Aurelianlua#0000",
"Viego#0345",
"Forzaldenon#0000",
"Ashearcher#0000"};
banneds={};
data={}

lang = {}
lang.br = {
	version = "Versão",
	mices_room = "Ratos : ",
	comp_date = "Data de compilação : ",
	uploaded = "Carregado por ",
	ending = "Fim de jogo! Retornando à tela principal em alguns segundos...",
	won = "Você ganhou ",
	manager = "Você é o gerenciador desta sala. Digite !commands para ver os comandos disponíveis.",
	p1 = "usou o powerup Disparo Duplo!",
	p2 = "usou o powerup Disparo Triplo!",
	p3 = "usou o powerup Olha a Explosão!",
	p4 = "usou o powerup Congelamento!",
	p5 = "usou o powerup Modo Noturno!",
	p6 = "usou o powerup Chuva de Bigornas!",
	p7 = "usou o powerup Anomalia Gravitacional!",
	p0 = "Você não possui pontos e/ou níveis suficientes para usar este powerup.",
	ap = "Potência: ",
	ag = "Ângulo: ",
	suicide = "O seguinte jogador cometeu suicídio: ",
	tk1 = "Oh não! ",
	tk2 = " matou um companheiro de equipe: ",
	banned = "Esta conta foi banida desta sala.",
	submission = "As avaliações de mapas do #anvilwar estão abertas!",
	pw = "Senha trocada para: ",
	pw0 = "Senha removida.",
	limit = "Limite de ratos na sala: ",
	load1 = "O seguinte mapa será carregado: ",
	load2 = "Certifique-se que há pelo menos 1 jogador em cada equipe.",
	load0 = "Você precisa estar na tela principal para testar um mapa. Digite !reset para fazer isso e tente novamente.",
	ban = " foi banido desta sala.",
	ban0 = " foi desbanido desta sala.",
	ac = "Você atualmente possui ",
	powerups = "<font size='11.5'><b>Tecla '1' ou F1 - Disparo Duplo</b><br>Este powerup faz você atirar duas bigornas de uma vez.<br><b>Nível Mínimo:  1  /  Pontuação: 8pts</b><br><br><b>Tecla '2' ou F2 - Disparo Triplo</b><br>Este powerup faz você atirar três bigornas de uma vez.<br><b>Nível Mínimo:  2  /  Pontuação: 14pts</b><br><br><b>Tecla '3' ou F3 - Olha a Explosão</b><br>Este powerup permite a você criar uma explosão em um local do time inimigo.<br><b>Nível Mínimo:  3  /  Pontuação: 25pts</b><br><br><b>Tecla '4' ou F4 - Congelamento</b><br>Este powerup congela todos os jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo:  3  /  Pontuação: 14pts</b><br><p align='right'><a href='event:pw2'>Ir à Página 2</a>",
	commands = "<font size='11.5'>Os comandos que começam com <b>*</b> podem ser utilizados apenas por administradores, FunCorps e o dono da sala (/room #anvilwar00seunome).<br>!commands (ou <b>B</b>) - Mostra esta caixa de texto.<br>!anvils - Mostra as bigornas disponíveis para compra<br>!help (ou <b>H</b>) - Mostra a ajuda do jogo.<br>!tc [mensagem] - Envia uma mensagem que aparece apenas para os jogadores do seu time.<br>!powerups (ou <b>U</b>) - Mostra os powerups disponíveis e seus respectivos custos.<br>!change - Altera para o modo antigo de trocar a força e o ângulo dos tiros. Digite novamente este comando para reverter.<br>!p [usuário] (ou <b>P</b>) - Mostra o seu perfil. Tenha em mente que o perfil e o ranking não são permanentes e serão zerados quando a sala esvazia.<br>!ranking (ou <b>R</b>) - Mostra o ranking dos jogadores na sala.<br><R><b>*</b><N> !pw [senha] - Adiciona uma senha na sala. Digite apenas !pw para remover a senha.<br><R><b>*</b><N> !ban [usuário] - Bane o usuário da sala. Digite novamente este comando para remover o banimento.<br><R><b>*</b><N> !reset - Cancela a partida atual e retorna à tela inicial.<br><R><b>*</b><N> !limit [número] - Altera o limite de jogadores da sala.<br><R><b>*</b><N> !testmap [@código] - Testa um mapa. Isso pode ser útil para enviar o mapa para o #anvilwar.",
	help = "<font size='12'><b>Bem-vindo ao #anvilwar!</b><br>O objetivo deste module é matar os jogadores do time adversário usando bigornas.<br><br>O jogo é simples de ser jogado. Quando for sua vez, use as teclas <b>Z e X</b> (ou as teclas de 1 a 9 no modo antigo) para mudar a potência do seu tiro e as teclas <b>C e V</b> para mudar o ângulo.<br>O time que conseguir eliminar todos os jogadores do outro time vencerá o jogo!<br><br>Quando você joga ou ganha partidas, você vai receber <J><b>AnvilCoins</b><N>. Esta é a moeda do jogo. Ela pode ser usada para comprar novas bigornas, powerups e diversos outros itens.<br>Divirta-se e que vença o melhor time!<br><br><N><R><b>Administradores:</b><N> Spectra_phantom#6089 (GM) e Morganadxana#0000<br><VP><b>Contribuidores:</b><N> Flaysama#5935, Chavestomil#0000 e Dinamarquers#0000<br><J><b>Tradutores:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " segundos.",
	leave = "Sair",
	join = "Entrar",
	getr = "Preparem-se! A partida vai começar em instantes!",
	powerups2 = "<font size='11.5'><b>Tecla '5' ou F5 - Modo Noturno</b><br>Este powerup remove a visão dos jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo: 4  /  Pontuação: 12pts</b><br><br><b>Tecla '6' ou F6 - Chuva de Bigornas</b><br>Este powerup vai fazer chover bigornas em áreas aleatórias do time inimigo.<br><b>Nível Mínimo: 3  /  Pontuação: 30pts</b><br><br><b>Tecla '7' ou F7 - Anomalia Gravitacional</b><br>Este powerup vai aumentar consideravelmente a gravidade até o outro time atirar.<br><b>Nível Mínimo: 5  /  Pontuação: 18pts</b><br><br><p align='right'><a href='event:pw1'>Voltar à Página 1</a>",
	using = "Bigorna sendo utilizada: ",
	ac0 = "Você não possui AnvilCoins suficientes para comprar esta bigorna :(",
	level = "avançou para o nível ",
	draw = "<b>Empate!</b><br>A tela principal será carregada em alguns instantes.",
	winblue = "<b>Vitória do time AZUL!</b><br>A tela principal será carregada em alguns instantes.",
	winred = "<b>Vitória do time VERMELHO!</b><br>A tela principal será carregada em alguns instantes.",
	as = "É a vez de: ",
	as1 = "<b>É a sua vez de atirar!</b><br><J>Use a BARRA DE ESPAÇO para atirar. Digite !help para mais informações.<br><br><N>Pontos para gastar com powerups: ",
	rm = "Sorteando mapa...",
	rm1 = "Mapa selecionado: ",
	t60s = "Faltam 60 segundos!",
	t30s = "Faltam 30 segundos!",
	powerups_a = "Os powerups estão liberados!",
	time = "<b>Tempo esgotado!</b> O time adversário irá atirar agora.",
	cap_text = "foi escolhido para ser o líder do seu time.",
	cap = "<J><b>Você foi escolhido como o líder do time.</b><N><br>Digite !leader para saber as funcionalidades e os benefícios de ser o líder do seu time.",
	leader = "Os líderes dos times <b>são escolhidos aleatoriamente</b> e possui as seguintes vantagens em relação aos outros jogadores:<br><br>• Recebe 50% a mais de quantidade de pontos e AnvilCoins em relação aos outros jogadores<br>• Pode reviver jogadores mortos do seu time usando !rv [jogador]<br>• Pode transferir seus pontos para outro jogador do seu time usando !tp [jogador]<br>• Possui 50% a mais de tempo para atirar do que os outros jogadores.",
	legacy = "<J><b>Confiram os submódulos do #anvilwar!</b><br><VP>/sala #anvilwar00watercatch<br>/sala #anvilwar00truefalse<br>/sala #anvilwar00objects<br><br><N>Para descobrir as novidades desta versão, digite <b>!changelog</b>.",
	disabled = "Este comando foi desabilitado por um administrador.",
	gametime = "Tempo",
	timeup = "<ROSE>Tempo esgotado! Este será o último tiro!",
	red_team = "Time Vermelho",
	blue_team = "Time Azul"
}
lang.en = {
	version = "Version",
	mices_room = "Mice : ",
	comp_date = "Compilation date : ",
	uploaded = "Uploaded by ",
	ending = "End of game! The lobby screen will be loaded in a few seconds.",
	won = "You won ",
	manager = "You are the manager of this room. Type !commands to see all available commands.",
	p1 = "used the powerup Double Shoot!",
	p2 = "used the powerup Triple Shoot!",
	p3 = "used the powerup Explosion!",
	p4 = "used the powerup Permafrost!",
	p5 = "used the powerup Night Mode!",
	p6 = "used the powerup Anvil Rain!",
	p7 = "used the powerup Gravity Anomaly!",
	p0 = "You don't have level and score to use this powerup.",
	ap = "Power: ",
	ag = "Angle: ",
	suicide = "The following player commited suicide: ",
	tk1 = "Oh no! ",
	tk2 = " has killed a player of her team: ",
	banned = "This account was banned of this room.",
	submission = "#anvilwar Map Submissions are now open!",
	pw = "Password changed to: ",
	pw0 = "Password cleared.",
	limit = "New room mice limit ",
	load1 = "The next map will be loaded: ",
	load2 = "The room needs to have a least 1 player into each team.",
	load0 = "You needs to stay into LOBBY mode to use this command. Use !reset command and try again.",
	ban = " was banned of room.",
	ban0 = " was unbanned of room.",
	ac = "You currently have ",
	powerups = "<font size='11.5'><b>Key '1' or F1 - Double Shoot</b><br>This powerup makes you shoot 2 anvils at once.<br><b>Required Level: 1  /  Required Score: 8pts</b><br><br><b>Key '2' or F2 - Triple Shoot</b><br>This powerup makes you shoot 3 anvils at once.<br><b>Required Level: 2  /  Required Score: 14pts</b><br><br><b>Key '3' or F3 - Explosion</b><br>This powerup allows you to create an explosion on the enemy team area.<br><b>Required Level: 3  /  Required Score: 25pts</b><br><br><b>Key '4' or F4 - Permafrost</b><br>This powerup freezes all enemy team players by a limited time.<br><b>Required Level: 3  /  Required Score: 14pts</b><br><p align='right'><a href='event:pw2'>Go to Page 2</a>",
	commands = "<font size='11.5'>The commands marked with <b>*</b> can be used only by Administrators, FunCorp members and the room owner (/room #anvilwar00yourname).<br>!commands (or <b>B</b> key) - Display this message box.<br>!anvils - Show available #anvilwar anvils to buy.<br>!help (or <b>H</b> key) - Display the game help.<br>!tc [message] - Send a message that is visible only for players of your team.<br>!powerups (or <b>U</b> key) - Show all available powerups and their respective costs.<br>!change - Change to the legacy method of changing the anvil power and angle. Type this again to revert to the default.<br>!p [username] (or <b>P</b> key) - Show your profile on game. Note that the profile and ranking aren't permanent and will be erased when the room empties.<br>!ranking (or <b>R</b> key) - Show the room ranking.<br><R><b>*</b><N> !pw [password] - Locks the room with a password. Use only !pw to clear the password.<br><R><b>*</b><N> !ban [username] - Bans the specified player from the room. Use again this command to unban the player.<br><R><b>*</b><N> !reset - Cancel the current match and returns to the lobby screen.<br><R><b>*</b><N> !limit [number] - Change the limit of mices on the room.<br><R><b>*</b><N> !testmap [@code] - Test a map. This can use useful when you want to send your map to #anvilwar.",
	help = "<font size='12'><b>Welcome to #anvilwar!</b><br>The objective of this module is kill all the players of other team using anvils.<br><br>The module is very easy to play. When reaches your turn, use <b>Z and X</b> keys (or 1-9 keys in legacy mode) to change the intensity of the anvil shoot and <b>C and V</b> keys to change the angle of the anvil.<br>The team that kill all players of other team will win the game!<br><br>When you kill players or win matches, you will receive <J><b>AnvilCoins</b><N>. This is the money of #anvilwar module. It can be used to unlock custom anvils, powerups and other things.<br>Enjoy the module and may the best team wins!<br><br><N><R><b>Administrators:</b><N> Spectra_phantom#6089 (GM) and Morganadxana#0000<br><VP><b>Contributors:</b><N> Flaysama#5935, Chavestomil#0000 and Dinamarquers#0000<br><J><b>Translators:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " seconds.",
	leave = "Leave",
	join = "Join",
	getr = "Get Ready! The match will start in a few seconds!",
	powerups2 = "<font size='11.5'><b>Key '5' or F5 - Night Mode</b><br>This powerup remove the vision of players of enemy team.<br><b>Required Level: 4  /  Required Score: 12pts</b><br><br><b>Key '6' or F6 - Anvil Rain</b><br>This powerup will create a anvil rain on random enemy team areas.<br><b>Required Level: 3  /  Required Score: 30pts</b><br><br><b>Key '7' or F7 - Gravity Anomaly</b><br>This powerup will incrase the gravity of map by 200% until the next player shoots.<br><b>Required Level: 5  /  Required Score: 18pts</b><br><br><p align='right'><a href='event:pw1'>Return to Page 1</a>",
	using = "You are now using the ",
	ac0 = "You don't have AnvilCoins to buy this anvil.",
	level = "reached the level",
	draw = "<b>Draw!</b><br>The lobby screen will load shortly.",
	winblue = "<b>Victory of the BLUE team!</b><br>The lobby screen will load shortly.",
	winred = "<b>Victory of the RED team!</b><br>The lobby screen will load shortly.",
	as = "Actual shooter: ",
	as1 = "<b>It's your time to shoot.</b><br><J>Use the SPACEBAR to shoot. Type !help for more information.<br><br><N>Points available: ",
	rm = "Randomizing map...",
	rm1 = "Selected Map : ",
	t60s = "60 seconds remaining!",
	t30s = "30 seconds remaining!",
	powerups_a = "The powerups are now available!",
	time = "<b>Time is up!</b> The next team will play now.",
	cap_text = "was selected to be the leader of your team.",
	cap = "<J><b>You are now the team leader.</b><N><br>Type !leader to know all the functions and benefits of team leaders.",
	leader = "The team leaders <b>are randomly choosed</b> and have various advantages and benefits:<br><br>• Will receive 50% more points and AnvilCoins regarding to the other players<br>• Can revive dead team players using the !rv [player] command<br>• Can transfer your powerup score to other team players using the !tp [player] command<br>• Have 50% more shooting time.",
	legacy = "<N>If you want to see all updates and fixes of this version, type <b>!changelog</b>.",	
	disabled = "This command was disabled by an administrator.",
	gametime = "Game Time",
	timeup = "<ROSE>Time is up! This will be the last shoot!",
	red_team = "Red Team",
	blue_team = "Blue Team"
}
if string.find(tfm.get.room.name,"*") then
	text = lang.en
else
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	else
		text = lang.en
	end
end

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"reset","help","sync","pw","commands","powerups","p","kill","ban","limit","ranking","tc","anvils","set","testmap","defmap","leader","rv","tp","changelog","tm","change","compmode","change_switch"} do
	system.disableChatCommandDisplay(g)
end
tfm.exec.setRoomMaxPlayers(30)

function tableSearch(table,element)
	for i=1,rawlen(table) do
		if element == table[i] then
			return 1
		end
	end
end

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if testmode == false then
		tfm.exec.chatMessage(message,name)
	elseif testmode == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end

function showImage(name,link,x,y,scalex,scaley)
	image_id=tfm.exec.addImage(link,":1",x,y,name,scalex,scaley,0,0.95)
	table.insert(images_id,image_id)
end

function showAvailableAnvils(name)
	i=0
	for _,link in next,{"1788f85d7e2.png","1788f85ef53.png","1788f8606c4.png","1788f861e33.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",63,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1788f8635a6.png","1788f864d16.png","1788f866489.png","1789826a888.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",217,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1789826bffa.png","1789826d76c.png","178982679a6.png","17898269116.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",389,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"179ec21b84d.png","179ec2171f9.png","179ec21896c.png","179ec21a0dd.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",561,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
end

function showTeams(name)
	ui.addTextArea(478,"<font size='18'><font color='#000000'><p align='center'><b><a href='event:enter_red'>"..text.join.."",name,322,102,150,25,0,0,0.9,true)
	ui.addTextArea(480,"<font size='18'><font color='#ff4500'><p align='center'><b><a href='event:enter_red'>"..text.join.."",name,320,100,150,25,0,0,0.9,true)
	ui.addTextArea(479,"<font size='18'><font color='#000000'><p align='center'><b><a href='event:enter_blue'>"..text.join.."",name,322,192,150,25,0,0,0.9,true)
	ui.addTextArea(481,"<font size='18'><font color='#0045ff'><p align='center'><b><a href='event:enter_blue'>"..text.join.."",name,320,190,150,25,0,0,0.9,true)
end

function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,20,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end

function showLobbyText(name)
	ui.addTextArea(403,"<p align='center'><font color='#000000'><font size='13'><i>"..text.comp_date.."08/24/2021 12:40 UTC - "..text.uploaded.."Morganadxana#0000</i>",name,92,44,600,60,0,0,1.0,true)
	ui.addTextArea(402,"<p align='center'><font size='13'><i>"..text.comp_date.."08/24/2021 12:40 UTC - "..text.uploaded.."Morganadxana#0000</i>",name,90,42,600,60,0,0,1.0,true)
end

function setLeaders()
	red_cap=alives_red[math.random(#alives_red)]
	blue_cap=alives_blue[math.random(#alives_blue)]
	showMessage(""..red_cap.." "..text.cap_text.."")
	showMessage(""..blue_cap.." "..text.cap_text.."")
	showMessage(text.cap,red_cap)
	showMessage(text.cap,blue_cap)
	tfm.exec.setNameColor(red_cap,0x80f000)
	tfm.exec.setNameColor(blue_cap,0x80f000)
end

function eventRanking(name)
	local sc = {}
	for id,name in next,playersList do
		sc[#sc+1] = {n=name,s=data[name].kills,f=data[name].level,d=data[name].winrate,l=data[name].eff}
	end

	table.sort(sc,function(a,b) return a.s>b.s end)

	str1 = ''
	str2 = ''
	str3 = ''
	str4 = ''
	str5 = ''
	for k,v in pairs(sc) do
		if k < 11 then
			if str ~= '' then
				str1=str1.."<br><N>"..k.."° | <VP>"..v.n..""
				str2=str2.."<br><b><N>"..v.s.."</b>"
				str3=str3.."<br><N>"..v.f..""
				str4=str4.."<br><N>"..v.d..""
				str5=str5.."<br><N>"..v.l..""
			else
				str1="<J>"..k.."° | <VP>"..v.n..""
				str2="<J><b>"..v.s.."</b>"
				str3="<J>"..v.f..""
				str4="<J>"..v.d..""
				str5="<J>"..v.l..""
			end
		end
	end
	showMenu(name,0xffffff,200,135,400,200,""..tfm.get.room.name.." Ranking","<font size='12'># / Name                                            Kills  Level   Wins% Kills%")
	ui.addTextArea(1010,"<p align='left'><font size='12'><font face='Consolas'>"..str1,name,200,170,220,220,0,0,nil,true)
	ui.addTextArea(1011,"<p align='right'><font size='12'><font face='Consolas'>"..str2,name,420,170,40,220,0,0,nil,true)
	ui.addTextArea(1007,"<p align='right'><font size='12'><font face='Consolas'>"..str3,name,460,170,40,220,0,0,nil,true)
	ui.addTextArea(1008,"<p align='right'><font size='12'><font face='Consolas'>"..str4,name,500,170,50,220,0,0,nil,true)
	ui.addTextArea(1009,"<p align='right'><font size='12'><font face='Consolas'>"..str5,name,550,170,50,220,0,0,nil,true)
end

function giveRankings(name)
	if data[name] then
		if tableSearch(helpers,name) == 1 then
			data[name].ranking=1
			tfm.exec.setNameColor(name,0x00a9a9)
		elseif tableSearch(mods,name) == 1 then
			data[name].ranking=2
			tfm.exec.setNameColor(name,0xa9a900)
		elseif tableSearch(ninjas,name) == 1 then
			data[name].ranking=3
		elseif tableSearch(admins,name) == 1 then
			data[name].ranking=4
			tfm.exec.setNameColor(name,0xa90000)
		elseif tableSearch(banneds,name) == 1 then
			data[name].ranking=-2
		end
	end
end

function updateTextBar()
	if mode == "lobby" or mode == "map_sort" or mode == "wait1" then
		ui.setMapName("<N><b>#anvilwar Reborn</b>   <G>|   <VP>"..text.version.." <b>RTM 42879.152</b> <R>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	elseif mode == "shoot" or mode == "wait2" or mode == "wait3" then
		local m=math.floor(general_time/60)
		local s=math.floor(general_time-(m*60))
		if s >= 10 then
			ui.setMapName("<J><b>"..current_map.."</b>   <G>|   <R>"..text.red_team.." <b>"..rawlen(alives_red).."</b> <V>- <BL><b>"..rawlen(alives_blue).."</b> "..text.blue_team.."   <G>|   <N>"..text.gametime.." : <V><b>"..m..":"..s.."</b> <J>("..time_remain..")   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
		else
			ui.setMapName("<J><b>"..current_map.."</b>   <G>|   <R>"..text.red_team.." <b>"..rawlen(alives_red).."</b> <V>- <BL><b>"..rawlen(alives_blue).."</b> "..text.blue_team.."   <G>|   <N>"..text.gametime.." : <V><b>"..m..":0"..s.."</b> <J>("..time_remain..")   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
		end
	elseif mode == "end" then
		ui.setMapName("<VP><b>"..text.ending.."</b>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	end
end

function spawnAnvil(object,x,y,xp,yp,ghost)
	id=tfm.exec.addShamanObject(object,x,y,xp,yp,ghost)
	if data[actual_player].current_anvil == 1 then
		tfm.exec.addImage("1788f85ef53.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 2 then
		tfm.exec.addImage("1788f8606c4.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 3 then
		tfm.exec.addImage("1788f861e33.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 4 then
		tfm.exec.addImage("1788f8635a6.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 5 then
		tfm.exec.addImage("1788f864d16.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 6 then
		tfm.exec.addImage("1788f866489.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 7 then
		tfm.exec.addImage("1789826a888.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 8 then
		tfm.exec.addImage("1789826bffa.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 9 then
		tfm.exec.addImage("1789826d76c.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 10 then
		tfm.exec.addImage("178982679a6.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 11 then
		tfm.exec.addImage("17898269116.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 12 then
		tfm.exec.addImage("179ec21b84d.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 13 then
		tfm.exec.addImage("179ec2171f9.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 14 then
		tfm.exec.addImage("179ec21896c.png","#"..id.."",-20,-12)
	elseif data[actual_player].current_anvil == 15 then
		tfm.exec.addImage("179ec21a0dd.png","#"..id.."",-20,-12)
	end
end

function calculateMatchTime()
	total_time=180+(mices*4)
	general_time=total_time
end

function calculatePoints(name)
	if data[name] then
		data[name].winrate=math.floor((data[name].wins/data[name].matches)*100)
		if data[name].current_coins > 0 then
			if name == red_cap or name == blue_cap then
				local gained=math.floor(data[name].current_coins*1.2)+data[name].score
				data[name].coins=data[name].coins+gained
				showMessage("<VP>"..text.won.."<b>"..gained.."</b> AnvilCoins!",name)
			else
				local gained=math.floor(data[name].current_coins*0.8)+math.floor(data[name].score*0.5)
				data[name].coins=data[name].coins+gained
				showMessage("<VP>"..text.won.."<b>"..gained.."</b> AnvilCoins!",name)
			end
			data[name].exp=data[name].exp+(data[name].current_coins*2)
			if data[name].exp >= data[name].maxp then
				advanceLevel(name)
			end
		end
		data[name].current_coins=0
		data[name].eff=math.floor((data[name].kills/data[name].killeds)*100)
	end
end

function detectVictory()
	if turns == 1 then
		setLeaders()
	end
	if general_time > 0 then
		if rawlen(alives_red) == 0 and rawlen(alives_blue) == 0 then
			drawMatch()
		elseif rawlen(alives_red) == 0 then
			victoryBlue()
		elseif rawlen(alives_blue) == 0 then
			victoryRed()
		else
			setShooter()
		end
	else
		if rawlen(alives_red) == rawlen(alives_blue) then
			drawMatch()
		end
		if rawlen(alives_red) > rawlen(alives_blue) then
			victoryRed()
		end
		if rawlen(alives_red) < rawlen(alives_blue) then
			victoryBlue()
		end
	end
end

function updatePlayerList()
	text1=""; text2="";
	for id,name in next,players_red do
		text1="<font size='14.5'>"..text1.."<b> "..id.."</b> - "..name.."<br>"
	end
	for id,name in next,players_blue do
		text2="<font size='14.5'>"..text2.."<b> "..id.."</b> - "..name.."<br>"

	end
	if mode == "lobby" or mode == "map_sort" then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].opened == false then
				ui.addTextArea(-4,"<font color='#000001'><font size='10'>"..text2.."",name,501,90,260,270,0,0,1.0,true)
				ui.addTextArea(-3,"<BL>"..text2,name,500,89,260,270,0,0,1.0,true)
				ui.addTextArea(-1,"<font color='#000001'><font size='10'>"..text1.."",name,21,90,260,270,0,0,1.0,true)
				ui.addTextArea(-2,"<R>"..text1,name,20,89,260,270,0,0,1.0,true)
			end
		end
	end
end

function removeImagePlayers(name)
	if rawlen(data[name].active_imgs) > 0 then
		for _,id in next,data[name].active_imgs do
			tfm.exec.removeImage(id)
		end
		data[name].active_imgs={}
	end
end

function eventNewPlayer(name)
	mices=mices+1
	if not data[name] then
		data[name]={level=1,exp=0,maxp=100,score=0,kills=0,wins=0,matches=0,killeds=0,eff=0.0,winrate=0.0,coins=0,multikills=0,
		killed=false,team=0,ranking=0,angle=45,power=5,powerup=0,
		current_coins=0,opened=false,active_imgs={},anvils={0,0,0,0,0,0,0,0,0,0,0},current_anvil=0,legacy=false}
		table.insert(playersList,name)
	end
	if name:sub(1,1) == "*" then
		data[name].ranking=-1
	end
	if string.find(tfm.get.room.name,name) then
		table.insert(mods,name)
		showMessage(text.manager,name)
		print(name)
	end
	for _,k in next,{32,48,49,50,51,52,53,54,55,56,57,66,67,72,80,82,85,86,88,90,112,113,114,115,116,117,118} do
		tfm.exec.bindKeyboard(name,k,true,true)
	end
	system.bindMouse(name,true)
	if mode == "lobby" then
		if data[name] then
			if data[name].ranking >= 0 then
				showImage(name,"179f1fa498c.png",0,16,1.0,0.96)
				showTeams(name)
				showLobbyText(name)
				tfm.exec.respawnPlayer(name)
			end
		end
		updatePlayerList()
	end
	giveRankings(name)
	tfm.exec.setPlayerScore(name,0,false)
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

function permaFrost()
	if data[actual_player].team == 1 then
		for _,name in next,players_blue do
			tfm.exec.freezePlayer(name,true)
		end
	elseif data[actual_player].team == 2 then
		for _,name in next,players_red do
			tfm.exec.freezePlayer(name,true)
		end
	end
end

function anvilRain()
	if data[actual_player].team == 1 then
		for i=1,7 do
			spawnAnvil(10,math.random(850,1599),100,0,1,false)
		end
	elseif data[actual_player].team == 2 then
		for i=1,7 do
			spawnAnvil(10,math.random(1,750),100,0,1,false)
		end
	end
end

function showPowerMeter(name)
	bar_text=""
	for i=1,data[name].power do
		bar_text=bar_text.."▊▊▊"
	end
	ui.addTextArea(750,"<font size='15'>                   Anvil Power: <b>"..data[name].power.."</b> "..bar_text.."",name,10,376,780,20,0x010101,0x010101,1.0,true)
end

function showAngleMeter(name)
	ag=math.ceil(data[name].angle/8)
	bar_text=""
	for i=1,ag do
		bar_text=bar_text.."▊▊▊"
	end
	ui.addTextArea(750,"<font size='15'>                   Anvil Angle: <b>"..data[name].angle.."°</b> "..bar_text.."",name,10,376,780,20,0x010101,0x010101,1.0,true)
end

function nightMode()
	if data[actual_player].team == 1 then
		ui.addTextArea(999,"",nil,800,-300,1200,1400,0x000001,0x000001,0.99,false)
	elseif data[actual_player].team == 2 then
		ui.addTextArea(999,"",nil,-400,-300,1200,1400,0x000001,0x000001,0.99,false)
	end
end

function setScores(name,points)
	if offset == false then
		data[name].score=points
	else
		data[name].score=data[name].score+points
	end
	tfm.exec.setPlayerScore(name,data[name].score,false)
end

function eventKeyboard(name,code,down,x,y)
	if mode == "shoot" and actual_player == name and enabled == true then
		if code == 32 then
			if data[name].team == 1 then
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
				if data[name].powerup == 1 then
					id=spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*2),-5-(data[name].power*0.5),false)
					end
				end
			elseif data[name].team == 2 then
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
				if data[name].powerup == 1 then
					spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*2)*-1,-5-(data[name].power*0.5),false)
					end
				end
			end
			mode="wait3"
			enabled=false
			tfm.exec.setGameTime(7)
			ui.removeTextArea(750,nil)
		end
		if code >= 49 and code <= 57 and data[name].legacy == true then
			data[name].power=code-48
			showPowerMeter(name)
		end
		if code == 48 and data[name].legacy == true then
			data[name].power=10
			showPowerMeter(name)
		end
		if powerups == true then
			if data[name].powerup == 0 and data[name].legacy == false then
				if code == 49 and data[name].score >= 8 and data[name].level >= 1 then
					showMessage("<VP><b>"..name.."</b> "..text.p1.."")
					data[name].powerup=1
					setScores(name,-8,true)
				elseif code == 49 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 50 and data[name].score >= 14 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-14,true)
				elseif code == 50 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 51 and data[name].score >= 25 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-25,true)
					data[name].powerup=3
					mode="wait3"
					tfm.exec.setGameTime(10)
				elseif code == 51 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 52 and data[name].score >= 14 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-14,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
				elseif code == 52 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 53 and data[name].score >= 12 and data[name].level >= 4 then
					showMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-12,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
				elseif code == 53 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 54 and data[name].score >= 30 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-30,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
				elseif code == 54 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 55 and data[name].score >= 18 and data[name].level >= 5 then
					showMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-18,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,22)
					pf_time=-2
					gravity=false
				elseif code == 55 then
					showMessage("<R>"..text.p0.."",name)
				end
				ui.removeTextArea(750,nil)
			end
			if data[name].powerup == 0 and data[name].legacy == true then
				if code == 112 and data[name].score >= 8 and data[name].level >= 1 then
					showMessage("<VP><b>"..name.."</b> "..text.p1.."")
					data[name].powerup=1
					setScores(name,-8,true)
				elseif code == 112 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 113 and data[name].score >= 14 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-14,true)
				elseif code == 113 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 114 and data[name].score >= 25 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-25,true)
					data[name].powerup=3
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
				elseif code == 114 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 115 and data[name].score >= 14 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-14,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
				elseif code == 115 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 116 and data[name].score >= 12 and data[name].level >= 4 then
					showMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-12,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
				elseif code == 116 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 117 and data[name].score >= 30 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-30,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
				elseif code == 117 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 118 and data[name].score >= 18 and data[name].level >= 5 then
					showMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-18,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,22)
					pf_time=-2
					gravity=false
				elseif code == 118 then
					showMessage("<R>"..text.p0.."",name)
				end
				ui.removeTextArea(750,nil)
			end
		end
		if data[name].legacy == false then
			if code == 90 then
				if data[name].power > 1 then
					data[name].power=data[name].power-1
				end
				showPowerMeter(name)
			end
			if code == 88 then
				if data[name].power < 10 then
					data[name].power=data[name].power+1
				end
				showPowerMeter(name)
			end
		end
		if code == 67 then
			if data[name].angle > 0 then
				data[name].angle=data[name].angle-5
			end
			showAngleMeter(name)
		end
		if code == 86 then
			if data[name].angle < 90 then
				data[name].angle=data[name].angle+5
			end
			showAngleMeter(name)
		end
	end
	if code == 66 then
		eventChatCommand(name,"commands")
	end
	if code == 72 then
		eventChatCommand(name,"help")
	end
	if code == 82 then
		eventChatCommand(name,"ranking")
	end
	if code == 85 then
		eventChatCommand(name,"powerups")
	end
	if code == 80 then
		eventChatCommand(name,"p")
	end
end

function eventPlayerLeft(name)
	removeTeam(name)
	mices=mices-1
end

function eventPlayerDied(name)
	if mode == "lobby" and data[name].ranking >= 0 then
		tfm.exec.respawnPlayer(name)
	end
	if mode == "wait2" and time_passed < 20 or mode == "end" then
		if data[name] and data[name].team == 1 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,198,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,198,false,0,0,false)
		end
	end
	if mode == "shoot" then
		if data[name].team > 0 then
			data[name].current_coins=math.floor(data[name].current_coins/2)
		end
		if name == actual_player then
			data[name].current_coins=math.floor(data[name].current_coins/2)
			showMessage(""..text.suicide..""..actual_player)
			setScores(name,0,false)
			mode="wait3"
			tfm.exec.setGameTime(6)
		end
		data[name].killeds=data[name].killeds+1
		setScores(name,0,false)
	end
	if mode == "wait3" then
		if data[actual_player].team == data[name].team then
			if actual_player == name then
				data[actual_player].current_coins=0
				setScores(actual_player,0,false)
				showMessage(""..text.suicide..""..actual_player)
			else
				data[actual_player].current_coins=data[actual_player].current_coins-5
				setScores(actual_player,-5,true)
				showMessage("<VP>"..text.tk1.."<b>"..actual_player.."</b>"..text.tk2..""..name..".")
			end
		else
			data[name].current_coins=math.floor(data[name].current_coins/3)
			setScores(name,math.floor(data[name].score/3),true)
		end
		data[name].killeds=data[name].killeds+1
		tfm.exec.setPlayerScore(name,0,false)
	end
end

function eventMouse(name,x,y)
	if actual_player == name and data[name].powerup == 3 and mode == "wait3" then
		if time_remain >= 2 then
			if data[name].team == 1 and x > 805 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
			if data[name].team == 2 and x < 795 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
			mode="wait2"
			time_remain=6
		end
	end
end

function lobby()
	mode="lobby"; choose_time=30; powerups=false;
	tfm.exec.newGame(lobby_map)
	tfm.exec.setGameTime(36000)
	ui.removeTextArea(750,nil)
	players_red={};	players_blue={}; loop=0;
	for i=-8, -1 do
		ui.removeTextArea(i,nil)
	end
	for name,player in next,tfm.get.room.playerList do
		removeImagePlayers(name)
		showLobbyText(name)
		if data[name] then
			for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
				ui.removeTextArea(i,name)
			end
			data[name].opened=false
			if data[name].ranking >= 0 then
				showTeams(name)
				showImage(name,"179f1fa498c.png",0,16,1.0,0.96)
				data[name].team=0
				data[name].current_coins=0
				setScores(name,0,false)
			else
				tfm.exec.killPlayer(name)
				showMessage("<R>"..text.banned.."",name)
			end
		end
	end
	permafrost=false
	night_mode=false
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.freezePlayer(name,false)
	end
	ui.removeTextArea(999,nil)
end

function eventNewGame()
	set_map="-1"; def_map=-1; turns=0;
	if mode == "wait1" then
		for i=400,403 do ui.removeTextArea(i,nil) end
		mode="wait2"
		tfm.exec.setGameTime(20)
		moveTeams()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setNameColor(name,0xd7d7e6)
			data[name].score=0
			if data[name].team > 0 then
				data[name].matches=data[name].matches+1
			end
		end
	end
	actual_shooter="-"
	if mode == "lobby" then
		showMessage("<VP>"..text.submission.."<br><BL>https://atelier801.com/topic?t=894824&f=6<br><br>"..text.legacy.."")
	end
end

function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end

function eventChatCommand(name,command)
	local arg = split(command, " ")
	if (command:sub(0,4) == "sync") and data[name].ranking >= 4 then
		tfm.exec.lowerSyncDelay(command:sub(6))
		tfm.exec.setPlayerSync(command:sub(6))
		showMessage("Sync: "..command:sub(6).."",name)
	end
	if command == "reset" and data[name].ranking >= 2 then
		lobby()
	end
	if command == "change_switch" and data[name].ranking >= 2 then
		if change == false then
			change=true
		else
			change=false
		end
	end
	if (command:sub(0,2) == "pw") and data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(tostring(command:sub(4)))
		if string.len(command:sub(4)) > 0 then
			showMessage(""..text.pw..""..command:sub(4).."",name)
		else
			showMessage(text.pw0,name)
		end
	end
	if command == "tm" and data[name].ranking >= 4 then
		if testmode == false then
			testmode=true
		else
			testmode=false
		end
		showMessage(tostring(testmode),name)
	end
	if command == "changelog" then
		showMenu(name,0xa8f233,140,90,520,115,"#anvilwar Changelog - RTM 42879.152","• Added 1 new map<br>• Some bugfixes")
	end
	if (command:sub(0,2) == "rv") then
		if name == actual_player and general_time >= 30 then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				print(temp_name)
				if data[temp_name] then
					if data[name].score >= 35 then
						if tfm.get.room.playerList[temp_name].isDead == true then
							tfm.exec.respawnPlayer(temp_name)
							if data[temp_name].team == 2 then
								tfm.exec.movePlayer(temp_name,1000,205,false,0,0,false)
								data[temp_name].killed=false
							end
							if data[temp_name].team == 1 then
								tfm.exec.movePlayer(temp_name,600,205,false,0,0,false)
								data[temp_name].killed=false
							end
							showMessage("<J>The following player revived: "..temp_name.."")
							setScores(name,-35,true)
						end
					else
						showMessage(text.p0,name)
					end
				end
			end
		end
	end
	if (command:sub(0,2) == "tp") then
		if name == actual_player then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				if data[temp_name] then
					ui.addPopup(100,2,"Points",name,350,175,200,true)
				end
			end
		end
	end
	if (command:sub(0,5) == "limit") and data[name].ranking >= 2 then
		tfm.exec.setRoomMaxPlayers(tonumber(command:sub(7)))
		showMessage(""..text.limit..""..command:sub(7).."",name)
	end
	if (command:sub(0,3) == "set") and data[name].ranking >= 3 then
		if data[command:sub(5)] then
			set_player=command:sub(5)
		end
	end
 	if (command:sub(0,6) == "defmap") and data[name].ranking >= 3 then
		if mode == "lobby" then
			def_map=tonumber(command:sub(8))
			showMessage("Defined map: "..def_map.."",name)
		end
	end
	if (command:sub(0,4) == "kill") and data[name].ranking >= 3 then
		tfm.exec.killPlayer(command:sub(6))
	end
	if (command:sub(0,7) == "testmap") and data[name].ranking >= 2 then
		if mode == "lobby" then
			set_map=command:sub(9)
			showMessage(""..text.load1..""..command:sub(9)..". "..text.load2.."",name)
		else
			showMessage(text.load0,name)
		end
	end
	if (command:sub(0,3) == "ban") and data[name].ranking >= 2 then
		if data[command:sub(5)] then
			if data[command:sub(5)].ranking == 0 then
				removeTeam(command:sub(5))
				data[command:sub(5)].ranking=-2
				tfm.exec.killPlayer(command:sub(5))
				table.insert(banneds,command:sub(5))
				showMessage("<R><b>"..command:sub(5).."</b>"..text.ban.."")
				if mode == "lobby" or mode == "map_sort" or mode == "wait1" or mode == "wait2" then
					lobby()
				end
			elseif data[command:sub(5)].ranking == -2 then
				if rawlen(banneds) > 0 then
					for i=1,rawlen(banneds) do
						if banneds[i] == command:sub(5) then
							table.remove(banneds,i)
							data[command:sub(5)].ranking=0
							showMessage("<J><b>"..command:sub(5).."</b>"..text.ban0.."")
						end
					end
				end
			end
		end
	end
	if (command:sub(0,2) == "tc") then
		if data[name] then
			if data[name].team == 1 then
				for _,p in next,players_red do
					showMessage("<font color='#f13503'><font face='Microsoft Sans Serif'>•<font face='Verdana'> <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			elseif data[name].team == 2 then
				for _,p in next,players_blue do
					showMessage("<font color='#0335f1'><font face='Microsoft Sans Serif'>•<font face='Verdana'> <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			end
		end
	end
	if command == "ranking" then
		eventRanking(name)
	end
	if command == "change" then
		if change == true then
			if data[name].legacy == false then
				data[name].legacy=true
				showMessage("<VP>Legacy mode <b>enabled</b>. Use 1-9 keys to change anvil power and F1-F7 keys to use powerups.",name)
			elseif data[name].legacy == true then
				data[name].legacy=false
				showMessage("<VP>Legacy mode <b>disabled</b>. Use Z and X keys to change anvil power and 1-7 keys to use powerups.",name)
			end
		else
			showMessage(text.disabled,name)
		end
	end
	if command == "anvils" then
		if data[name].opened == false then
			showMessage("<J>"..text.ac.."<b>"..data[name].coins.."</b> AnvilCoins.",name)
			showMenu(name,0x999999,56,120,690,235,"#anvilwar Anvils","<font size='11.5'>                <b>Default Anvil</b><br>                Cost: 0 ACs<br>                <a href='event:a0'>Equip!</a><br><br>                <b>Red Anvil</b><br>                Cost: 200 ACs<br>                <a href='event:a1'>Equip!</a><br><br>                <b>Blue Anvil</b><br>                Cost: 200 ACs<br>                <a href='event:a2'>Equip!</a><br><br>                <b>White Anvil</b><br>                Cost: 400 ACs<br>                <a href='event:a3'>Equip!</a>")
			ui.addTextArea(1005,"<i><font size='11.5'>                <b>Rainbow Anvil</b><br>                Cost: 500 ACs<br>                <a href='event:a4'>Equip!</a><br><br>                <b>Sharingan Anvil</b><br>                Cost: 1000 ACs<br>                <a href='event:a5'>Equip!</a><br><br>                <b>Black Hole Anvil</b><br>                Cost: 1000 ACs<br>                <a href='event:a6'>Equip!</a><br><br>                <b>4K 1080p Anvil</b><br>                Cost: 400 ACs<br>                <a href='event:a7'>Equip!</a>",name,208,151,175,215,0,0,1.0,true)
			ui.addTextArea(1006,"<i><font size='11.5'>                <b>Thug Life Anvil</b><br>                Cost: 600 ACs<br>                <a href='event:a8'>Equip!</a><br><br>                <b>Water Anvil</b><br>                Cost: 600 ACs<br>                <a href='event:a9'>Equip!</a><br><br>                <b>Grass Anvil</b><br>                Cost: 600 ACs<br>                <a href='event:a10'>Equip!</a><br><br>                <b>RadWhite Anvil</b><br>                Cost: 700 ACs<br>                <a href='event:a11'>Equip!</a>",name,380,151,175,215,0,0,1.0,true)
			ui.addTextArea(1007,"<i><font size='11.5'>                <b>Stars Anvil</b><br>                Cost: 800 ACs<br>                <a href='event:a12'>Equip!</a><br><br>                <b>Asteroid Anvil</b><br>                Cost: 700 ACs<br>                <a href='event:a13'>Equip!</a><br><br>                <b>Expanded Anvil</b><br>                Cost: 250 ACs<br>                <a href='event:a14'>Equip!</a><br><br>                <b>Yellow Anvil</b><br>                Cost: 200 ACs<br>                <a href='event:a15'>Equip!</a>",name,552,151,175,215,0,0,1.0,true)
			showAvailableAnvils(name)
		end
	end
	if command == "powerups" then
		showMenu(name,0xc23517,140,90,520,250,"#anvilwar Powerups",text.powerups)
	end
	if command == "leader" then
		showMenu(name,0x873469,140,90,520,200,"#anvilwar Team Leader Funcions",text.leader)
	end
	if command == "commands" then
		showMenu(name,0x125490,120,90,560,285,"#anvilwar Commands",text.commands)
	end
	if command == "help" then
		showMenu(name,0x457426,100,90,600,260,"Help",text.help)
	end
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end
		if tfm.get.room.playerList[nome] and data[nome].opened == false then
			showMenu(name,0x518394,250,120,300,225,nome,"<b>Level: "..data[nome].level.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Kills: "..data[nome].kills.."<br>Matches: "..data[nome].matches.."<br>Wins: "..data[nome].wins.."<br><br>Victory Rate: "..data[nome].winrate.."%<br>Kill Rate: "..data[nome].eff.."%")
			ui.addTextArea(1006,"",name,265,215,270,10,0x101010,0x161903,1.0,true)
			ui.addTextArea(1005,"",name,265,215,((data[nome].exp/data[nome].maxp)*260)+10,10,0x95a810,0x658704,1.0,true)
		else
			showMessage("<R>User not found",nome)
		end
	end
end
function eventPopupAnswer(id,name,message)
	if id == 100 then
		if data[temp_name] and actual_player == name then
			local sp=tonumber(message)
			if sp <= data[name].score then
				setScores(name,sp*-1,true)
				setScores(temp_name,sp,true)
			end
		end
	end
end
function enterRedTeam(name)
	if choose_time > 1 and data[name].team == 0 and rawlen(players_red) <= 12 then
		tfm.exec.respawnPlayer(name)
		table.insert(players_red,name)
		updatePlayerList()
		tfm.exec.movePlayer(name,200,280,false,0,0,false)
		data[name].team=1
		for i=478,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,210,150,25,0,0,0.9,true)
		end
	end
end

function enterBlueTeam(name)
	if choose_time > 1 and data[name].team == 0 and rawlen(players_blue) <= 12 then
		tfm.exec.respawnPlayer(name)
		table.insert(players_blue,name)
		updatePlayerList()
		data[name].team=2
		tfm.exec.movePlayer(name,600,280,false,0,0,false)
		for i=478,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,210,150,25,0,0,0.9,true)
		end
	end
end

function moveTeams()
	showMessage("<VP>"..text.getr.."")
	for _,id in next,images_id do
		tfm.exec.removeImage(id)
		images_id={}
	end
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
	tfm.exec.killPlayer(name)
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
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
		removeImagePlayers(name)
		if mode == "lobby" or mode == "map_sort" then
			updatePlayerList()
		end
	end
	if callback == "pw1" then
		data[name].opened=false
		eventChatCommand(name,"powerups")
	end
	if callback == "pw2" then
		data[name].opened=false
		showMenu(name,0xc23517,140,90,520,250,"#anvilwar Powerups",text.powerups2)
	end
	if callback == "a0" then
		data[name].current_anvil=0
		showMessage(""..text.using.."<N><b>Default Anvil!</b>",name)
	end
	if callback == "a1" then
		if data[name].anvils[1] == 1 then
			data[name].current_anvil=1
			showMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[1]=1
				data[name].current_anvil=1
				showMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a2" then
		if data[name].anvils[2] == 1 then
			data[name].current_anvil=2
			showMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[2]=1
				data[name].current_anvil=2
				showMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a3" then
		if data[name].anvils[3] == 1 then
			data[name].current_anvil=3
			showMessage(""..text.using.."<N><b>White Anvil!</b>",name)
		else
			if data[name].coins >= 400 then
				data[name].coins=data[name].coins-400
				data[name].anvils[3]=1
				data[name].current_anvil=3
				showMessage(""..text.using.."<N><b>White Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a4" then
		if data[name].anvils[4] == 1 then
			data[name].current_anvil=4
			showMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
		else
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
				data[name].anvils[4]=1
				data[name].current_anvil=4
				showMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a5" then
		if data[name].anvils[5] == 1 then
			data[name].current_anvil=5
			showMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
		else
			if data[name].coins >= 1000 then
				data[name].coins=data[name].coins-1000
				data[name].anvils[5]=1
				data[name].current_anvil=5
				showMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a6" then
		if data[name].anvils[6] == 1 then
			data[name].current_anvil=6
			showMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
		else
			if data[name].coins >= 1000 then
				data[name].coins=data[name].coins-1000
				data[name].anvils[6]=1
				data[name].current_anvil=6
				showMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a7" then
		if data[name].anvils[7] == 1 then
			data[name].current_anvil=7
			showMessage(""..text.using.."<N><b>4K 1080p Anvil!</b>",name)
		else
			if data[name].coins >= 400 then
				data[name].coins=data[name].coins-400
				data[name].anvils[7]=1
				data[name].current_anvil=7
				showMessage(""..text.using.."<N><b>4K 1080p Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a8" then
		if data[name].anvils[8] == 1 then
			data[name].current_anvil=8
			showMessage(""..text.using.."<N><b>Thug Life Anvil!</b>",name)
		else
			if data[name].coins >= 600 then
				data[name].coins=data[name].coins-600
				data[name].anvils[8]=1
				data[name].current_anvil=8
				showMessage(""..text.using.."<N><b>Thug Life Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a9" then
		if data[name].anvils[9] == 1 then
			data[name].current_anvil=9
			showMessage(""..text.using.."<N><b>Water Anvil!</b>",name)
		else
			if data[name].coins >= 600 then
				data[name].coins=data[name].coins-600
				data[name].anvils[9]=1
				data[name].current_anvil=9
				showMessage(""..text.using.."<N><b>Water Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a10" then
		if data[name].anvils[10] == 1 then
			data[name].current_anvil=10
			showMessage(""..text.using.."<N><b>Grass Anvil!</b>",name)
		else
			if data[name].coins >= 600 then
				data[name].coins=data[name].coins-600
				data[name].anvils[10]=1
				data[name].current_anvil=10
				showMessage(""..text.using.."<N><b>Grass Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a11" then
		if data[name].anvils[11] == 1 then
			data[name].current_anvil=11
			showMessage(""..text.using.."<N><b>RadWhite Anvil!</b>",name)
		else
			if data[name].coins >= 700 then
				data[name].coins=data[name].coins-700
				data[name].anvils[11]=1
				data[name].current_anvil=11
				showMessage(""..text.using.."<N><b>RadWhite Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a12" then
		if data[name].anvils[12] == 1 then
			data[name].current_anvil=12
			showMessage(""..text.using.."<N><b>Stars Anvil!</b>",name)
		else
			if data[name].coins >= 800 then
				data[name].coins=data[name].coins-800
				data[name].anvils[12]=1
				data[name].current_anvil=12
				showMessage(""..text.using.."<N><b>Stars Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a13" then
		if data[name].anvils[13] == 1 then
			data[name].current_anvil=13
			showMessage(""..text.using.."<N><b>Asteroid Anvil!</b>",name)
		else
			if data[name].coins >= 700 then
				data[name].coins=data[name].coins-700
				data[name].anvils[13]=1
				data[name].current_anvil=13
				showMessage(""..text.using.."<N><b>Asteroid Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a14" then
		if data[name].anvils[14] == 1 then
			data[name].current_anvil=14
			showMessage(""..text.using.."<N><b>Expanded Anvil!</b>",name)
		else
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
				data[name].anvils[14]=1
				data[name].current_anvil=14
				showMessage(""..text.using.."<N><b>Expanded Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a15" then
		if data[name].anvils[15] == 1 then
			data[name].current_anvil=15
			showMessage(""..text.using.."<N><b>Yellow Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[15]=1
				data[name].current_anvil=15
				showMessage(""..text.using.."<N><b>Yellow Anvil!</b>",name)
			else
				showMessage("<R>"..text.ac0.."",name)
			end
		end
	end
end

function advanceLevel(name)
	data[name].level=data[name].level+1
	data[name].exp=data[name].exp-data[name].maxp
	data[name].maxp=data[name].maxp+50
	showMessage("<VP><b>"..name.."</b> "..text.level.."<b>"..data[name].level.."</b>!")
end

function drawMatch()
	mode="end"
	tfm.exec.setGameTime(20)
	showMessage("<J>"..text.draw.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
	ui.removeTextArea(750,nil)
end

function victoryBlue()
	mode="end"
	for _,name in next,players_blue do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(900,1200),180,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
	end
	tfm.exec.setGameTime(20)
	showMessage("<BL>"..text.winblue.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
	ui.removeTextArea(750,nil)
end

function victoryRed()
	mode="end"
	for _,name in next,players_red do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(400,700),180,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
	end
	tfm.exec.setGameTime(20)
	showMessage("<R>"..text.winred.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
	ui.removeTextArea(750,nil)
end

function setShooter()
	if set_player == "" then
		if turn == 0 then
			turn=1
			actual_player=alives_blue[math.random(#alives_blue)]
			tfm.exec.setGameTime(15)
			if actual_player == blue_cap then
				tfm.exec.setGameTime(22)
			end
		elseif turn == 1 then
			turn=0
			actual_player=alives_red[math.random(#alives_red)]
			tfm.exec.setGameTime(15)
			if actual_player == red_cap then
				tfm.exec.setGameTime(22)
			end
		end
	else
		if turn == 0 then
			turn=1
		elseif turn == 1 then
			turn=0
		end
		actual_player=set_player
		tfm.exec.setGameTime(15)
	end
	set_player=""
	tfm.exec.addShamanObject(0, tfm.get.room.playerList[actual_player].x, tfm.get.room.playerList[actual_player].y-55, 0, 0, 0, false)
	ui.addTextArea(750,"<i><font size='15'><p align='center'>"..text.as.." <b>"..actual_player.."</b>",nil,10,22,780,22,0x010101,0x010101,1.0,true)
	showMessage("<VP>"..text.as1..""..data[actual_player].score.."",actual_player)
	enabled=true
	mode="shoot"
end

function getAlivePlayers()
	tfm.exec.setWorldGravity(0,10)
	current_red=rawlen(alives_red); current_blue=rawlen(alives_blue); pf_time=0;
	alives_red={}
	alives_blue={}
	turns=turns+1
	for _,name in next,players_red do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_red,name)
		else
			data[name].killed=true
			setScores(name,0,false)
		end
	end
	for _,name in next,players_blue do
		data[name].powerup=0
		if tfm.get.room.playerList[name].isDead == false then
			data[name].killed=false
			table.insert(alives_blue,name)
		else
			data[name].killed=true
			setScores(name,0,false)
		end
	end
	if mode == "wait3" then
		if data[actual_player].team == 1 then
			killsc=current_blue-rawlen(alives_blue)
			data[actual_player].kills=data[actual_player].kills+killsc
			data[actual_player].current_coins=data[actual_player].current_coins+2*killsc
			setScores(actual_player,killsc*3,true)
			if actual_player == red_cap or actual_player == blue_cap then
				setScores(actual_player,killsc*2,true)
			end
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				showMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				showMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
			end
		elseif data[actual_player].team == 2 then
			killsc=current_red-rawlen(alives_red)
			data[actual_player].kills=data[actual_player].kills+killsc
			data[actual_player].current_coins=data[actual_player].current_coins+2*killsc
			setScores(actual_player,killsc*3,true)
			if actual_player == red_cap or actual_player == blue_cap then
				setScores(actual_player,killsc*2,true)
			end
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				showMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				showMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
			end
		end
	end
	detectVictory()
end

function eventLoop(passed,remain)
	time_passed=math.floor(passed/1000)
	time_remain=math.floor(remain/1000)
	updateTextBar()
	if mode == "lobby" then
		if choose_time > 0 then
			choose_time=choose_time-0.5
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].opened == false then
					ui.addTextArea(483,"<font size='55'><p align='center'><font color='#000001'>"..math.ceil(choose_time).."",name,357,122,80,60,0,0,0.97,true)
					ui.addTextArea(484,"<font size='55'><p align='center'>"..math.ceil(choose_time).."",name,355,120,80,60,0,0,0.97,true)
				end
			end
		end
		if choose_time == 0 then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				if rawlen(players_red) - rawlen(players_blue) <= 2 and rawlen(players_red) - rawlen(players_blue) >= -2 then
					for i=478,484 do ui.removeTextArea(i,nil) end
					mode="map_sort"
				else
					choose_time=15
				end
			else
				choose_time=20
			end
		end
	end
	if mode == "map_sort" then
		if set_map == "-1" then
			if loop < 8 then
				loop=loop+1
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm.."",nil,102,297,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm.."",nil,100,295,600,45,0,0,1.0,true)
				map_id=math.random(1,rawlen(maps))
				ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,102,327,600,45,0,0,1.0,true)
				ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='24'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,100,325,600,45,0,0,1.0,true)
			elseif loop == 8 then
				if def_map > 0 then
					map_id=def_map
				end
				current_map=maps[map_id]
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1.."",nil,102,297,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm1.."",nil,100,295,600,45,0,0,1.0,true)
				ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,102,327,600,45,0,0,1.0,true)
				ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..map_names[map_id].." - "..maps[map_id].."",nil,100,325,600,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
			end
		else
			current_map=set_map
			ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1.."",nil,102,297,600,45,0,0,1.0,true)
			ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm1.."",nil,100,295,600,45,0,0,1.0,true)
			ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..current_map.."",nil,102,327,600,45,0,0,1.0,true)
			ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..current_map.."",nil,100,325,600,45,0,0,1.0,true)
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
	if mode == "wait2" or mode == "wait3" or mode == "shoot" then
		if general_time > 0 then
			general_time=general_time-0.5
			if general_time == 60 then
				showMessage("<ROSE>"..text.t60s.."")
			end
			if general_time == 30 then
				showMessage("<ROSE>"..text.t30s.."")
			end
			if mode == "shoot" and general_time == 0.5 then
				showMessage("<ROSE>"..text.timeup.."")
			end
		end
		if time_passed == 60 and powerups == false then
			powerups=true
			showMessage(text.powerups_a)
		end
		if time_passed % 30 == 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].team > 0 then
					if data[name].killed == false then
						data[name].current_coins=data[name].current_coins+1
					end
				end
			end
		end
		if time_passed % 18 == 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].team > 0 then
					if data[name].killed == false then
						setScores(name,1,true)
						if name == red_cap or name == blue_cap then
							setScores(name,1,true)
						end
					end
				end
			end
		end
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].team == 1 then
				if tfm.get.room.playerList[name].x > 800 then
					tfm.exec.killPlayer(name)
				end
			end
			if data[name] and data[name].team == 2 then
				if tfm.get.room.playerList[name].x < 800 then
					tfm.exec.killPlayer(name)
				end
			end
		end
	end
	if mode == "wait3" and time_remain <= 1 then
		getAlivePlayers()
	end
	if mode == "shoot" and time_remain == 0 then
		mode="wait2"
		time_remain=6
		tfm.exec.setGameTime(6)
		enabled=false
		showMessage("<R>"..text.time.."")
	end
	if mode == "wait2" and time_remain <= -1 then
		mode="shoot"
		getAlivePlayers()
	end
	if mode == "wait1" and time_remain <= -1 then
		for i=-8, -1 do
			ui.removeTextArea(i,nil)
		end
		tfm.exec.newGame(current_map)
		calculateMatchTime()
	end
	if mode == "end" and time_remain <= 0 then
		lobby()
	end
	if permafrost == true or night_mode == true or gravity == true then
		pf_time=pf_time+1
		if pf_time == 6 then
			permafrost=false
			night_mode=false
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.freezePlayer(name,false)
			end
			ui.removeTextArea(999,nil)
		end
	end
end
lobby()
end

initWatercatch = function()
for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos"} do
	system.disableChatCommandDisplay(f)
end
tfm.exec.newGame("@7854060")
tfm.exec.setRoomMaxPlayers(30)
shaman=""; alives=0; cannons=5; z=0; data={}; mode="load"; changed=false; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
powerups={x1=-1,x2=-1,x3=-1,x4=-1,x5=-1,y1=-1,y2=-1,y3=-1,y4=-1,y5=-1,t1=0,t2=0,t3=0,t4=0,t5=0}
testmode=false;
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if testmode == false then
		tfm.exec.chatMessage(message,name)
	elseif testmode == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			tfm.exec.setPlayerScore(shaman,-1,false)
			mode="end"
			tfm.exec.setGameTime(10)
			for n,_ in next,tfm.get.room.playerList do
				alives=alives+1
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
				ui.removeTextArea(300,n)
			end
		end
	end
end
function eventNewPlayer(name)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v1.12.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
	newData={
	["o"]=99;
	["i"]=0;
	["t"]=0;
	["c"]=0;
	["opened"]=false;
	["imageid"]=-1;
	["imageid2"]=-1;
	["imageid3"]=-1;
	["imageid4"]=-1;
	["imaget"]=5;
	};
	data[name] = newData;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module e mapa criados por Morganadxana#0000. Tradução para o português feita por Rakan_raster#0000.<br><br><ROSE>Um novo mapa para o #watercatch está por vir! Maior, mais profundo e com muito mais decorações! Aguardem...",name)
	data[name].imageid = tfm.exec.addImage("17a53e210bf.png","&1",180,90,name)
	data[name].imageid2 = tfm.exec.addImage("17a53e1f94c.png",":1",0,345,name)
	data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
	data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
	data[name].imaget=5
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,220,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos. Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>5</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,59,520,340,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 18%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.<br><ROSE><b>• BALÃO</b><N><br>Te coloca em um balão. Pode ser útil para sair da água...<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação das artes")
	end
	if (message:sub(0,2)== "tc") then
		for n,_ in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[n].isShaman == false then
				showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
			end
		end
	end
	if (message:sub(0,4)== "kill") and name == "Morganadxana#0000" then
		tfm.exec.killPlayer(message:sub(6))
	end
end
function eventSummoningEnd(name,id,x,y)
	cannons=cannons-1
	if cannons >= 1 then
		showMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
	elseif cannons == 0 then
		showMessage("<VP>O shaman não pode mais usar objetos!")
	else
		showMessage("<R>O shaman excedeu o limite de objetos utilizáveis!")
		tfm.exec.killPlayer(shaman)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame("@7854060")
		changed=false
		mode="load"
	else
		tfm.exec.newGame(xml)
	end
end
function eventKeyboard(name,key,down)
	if key == 32 and mode == "game" then
		if tfm.get.room.playerList[name].x > powerups.x1-10 and tfm.get.room.playerList[name].x < powerups.x1+34 then
			if tfm.get.room.playerList[name].y > powerups.y1-10 and tfm.get.room.playerList[name].y < powerups.y1+34 then
				powerups.x1=-1
				powerups.y1=-1
				ui.removeTextArea(100,nil)
				if powerups.t1 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t1 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t1 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t1 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t1 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t1 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t1 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t1 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t1 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>BALÃO!</b>")
					balao(name)
				elseif powerups.t1 == 10 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x2-10 and tfm.get.room.playerList[name].x < powerups.x2+34 then
			if tfm.get.room.playerList[name].y > powerups.y2-10 and tfm.get.room.playerList[name].y < powerups.y2+34 then
				powerups.x2=-1
				powerups.y2=-1
				ui.removeTextArea(101,nil)
				if powerups.t2 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t2 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t2 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t2 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t2 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t2 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t2 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t2 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t2 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>BALÃO!</b>")
					balao(name)
				elseif powerups.t2 == 10 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x3-10 and tfm.get.room.playerList[name].x < powerups.x3+34 then
			if tfm.get.room.playerList[name].y > powerups.y3-10 and tfm.get.room.playerList[name].y < powerups.y3+34 then
				powerups.x3=-1
				powerups.y3=-1
				ui.removeTextArea(102,nil)
				if powerups.t3 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t3 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t3 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t3 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t3 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t3 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t3 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t3 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t3 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>BALÃO!</b>")
					balao(name)
				elseif powerups.t3 == 10 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x4-10 and tfm.get.room.playerList[name].x < powerups.x4+34 then
			if tfm.get.room.playerList[name].y > powerups.y4-10 and tfm.get.room.playerList[name].y < powerups.y4+34 then
				powerups.x4=-1
				powerups.y4=-1
				ui.removeTextArea(103,nil)
				if powerups.t4 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t4 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t4 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t4 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t4 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t4 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t4 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t4 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t4 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>BALÃO!</b>")
					balao(name)
				elseif powerups.t4 == 10 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
		if tfm.get.room.playerList[name].x > powerups.x5-10 and tfm.get.room.playerList[name].x < powerups.x5+34 then
			if tfm.get.room.playerList[name].y > powerups.y5-10 and tfm.get.room.playerList[name].y < powerups.y5+34 then
				powerups.x5=-1
				powerups.y5=-1
				ui.removeTextArea(104,nil)
				if powerups.t5 == 1 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CAIXA!</b>")
					dropPlayer(name)
				elseif powerups.t5 == 2 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>OXIGÊNIO!</b>")
					data[name].o=data[name].o+40
					if data[name].o > 100 then
						data[name].o=100
					end
				elseif powerups.t5 == 3 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>VELOCIDADE!</b>")
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.movePlayer(name,0,0,true,120,0,false)
					else
						tfm.exec.movePlayer(name,0,0,true,-120,0,false)
					end
				elseif powerups.t5 == 4 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>AFUNDAR!</b>")
					timer=1
				elseif powerups.t5 == 5 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>MEEP!</b>")
					tfm.exec.giveMeep(name,true)
				elseif powerups.t5 == 6 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>SUFOCO!</b>")
					data[name].o=data[name].o-18
					if data[name].o < 1 then
						data[name].o=1
					end
				elseif powerups.t5 == 7 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>CONGELAR!</b>")
					congelar(name)
				elseif powerups.t5 == 8 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>QUEIJO!</b>")
					queijo(name)
				elseif powerups.t5 == 9 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>BALÃO!</b>")
					balao(name)
				elseif powerups.t5 == 10 then
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
	end		
end
function eventNewGame()
xml=tfm.get.room.xmlMapInfo.xml
ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
if changed == true then
ui.removeTextArea(0,nil)
z=-1
cannons=5
ui.removeTextArea(22,nil)
alives=0
mode="hide"
for n,p in next,tfm.get.room.playerList do
	tfm.exec.giveMeep(n,false)
	if n:sub(1,1) == "*" then
		tfm.exec.killPlayer(n)
	end
	alives=alives+1
	data[n].o=99;
	data[n].i=0;
	data[n].t=0;
	data[n].c=0;
	data[n].opened=false;
	tfm.exec.bindKeyboard(n,32,true,true)
	if tfm.get.room.playerList[n].isShaman then
		tfm.exec.setPlayerSync(n)
		tfm.exec.movePlayer(n,-250,148,false,0,0,false)
		ui.addTextArea(22,"",n,-800,-800,2400,2400,0x000001,0x000001,1.0,true)
		shaman=n
		alives=alives-1
	end
	ui.addTextArea(300,"",n,8,386,782,8,0x202020,0x121212,1.0,true)
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
	ui.removeTextArea(298,n)
end
tfm.exec.setGameTime(60)
end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,20,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function genPowerup(pos,type,x,y)
	if pos == 1 then
		ui.addTextArea(100,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x1=x
		powerups.y1=y
		powerups.t1=type
	elseif pos == 2 then
		ui.addTextArea(101,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x2=x
		powerups.y2=y
		powerups.t2=type
	elseif pos == 3 then
		ui.addTextArea(102,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x3=x
		powerups.y3=y
		powerups.t3=type
	elseif pos == 4 then
		ui.addTextArea(103,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x4=x
		powerups.y4=y
		powerups.t4=type
	elseif pos == 5 then
		ui.addTextArea(104,"<font size='18'><p align='center'>!",nil,x,y,24,24,0x161636,0x121224,1.0,false)
		powerups.x5=x
		powerups.y5=y
		powerups.t5=type
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=6
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=6
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function balao(name)
	tfm.exec.attachBalloon(name, true, 0, true)
	data[name].t=6
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=6
end
function eventLoop(p,r)
time_passed=math.ceil(p/1000)
time_remain=math.ceil(r/1000)
if time_passed >= 6 and tfm.get.room.currentMap == "@7854060" then
	tfm.exec.disableAutoShaman(false)
	resetMap()
end
if changed == true then
ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v1.12.0</b><N> - criado por <ROSE><b>Morganadxana#0000</b><")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
ui.addTextArea(-2,"<font size='45'><font color='#f0f0f0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='45'><font face='Trebuchet MS'><font color='#222222'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='45'><font color='#f0f0f0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(31,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,135,22,70,54,0,0,1.0,true)
	ui.addTextArea(30,"<font size='45'><font color='#f0f0f0'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,132,19,70,54,0,0,1.0,true)
	loop=loop+0.5
	if loop == 24 then
		for i=1,5 do
			genPowerup(i,math.random(1,11),math.random(800,3000),math.random(200,800))
		end
		loop=0
	end
	if timer > 0 then
		timer=timer-0.5
		tfm.exec.setWorldGravity(0,22)
	elseif timer == 0 then
		tfm.exec.setWorldGravity(0,10.5)
	end
else
	for i=-6,104 do
		ui.removeTextArea(i,nil)
	end
end
for n,q in next,tfm.get.room.playerList do
	if data[n] then
		if data[n].imaget >= 0 then
			data[n].imaget=data[n].imaget-0.5
		end
		if data[n].imaget == 0 then
			tfm.exec.removeImage(data[n].imageid)
		end
		data[n].x=tfm.get.room.playerList[n].x
		data[n].yp=tfm.get.room.playerList[n].y
		if mode == "game" then
			if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
			if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
			if not tfm.get.room.playerList[n].isShaman then
			tfm.exec.killPlayer(n)
			end
			end
			end
			if data[n].t > 0 then
				data[n].t=data[n].t-0.5
				if data[n].t <= 0 then
					tfm.exec.removeObject(data[n].i)
					tfm.exec.freezePlayer(n,false)
					tfm.exec.removeCheese(n)
					tfm.exec.attachBalloon(n,false)
					tfm.exec.changePlayerSize(n,1)
				end
			end
			if not tfm.get.room.playerList[n].isDead then
			if mode == "game" then
			if tfm.get.room.playerList[n].y < 298 then
				if data[n].o < 99 then
					data[n].o=data[n].o+1
				end
				data[n].y=0
			else
				if tfm.get.room.playerList[n].y <= 850 then
					data[n].o=data[n].o-0.5
					data[n].c=0
				elseif tfm.get.room.playerList[n].y > 850 then
					data[n].o=data[n].o-0.7
					data[n].c=0
				end
			end
			end
			if data[n].o <= 0 then
				tfm.exec.killPlayer(n)
				showMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
				tfm.exec.addShamanObject(54, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
			end
		end
		end
		if mode == "game" then
			if data[n].o > 30 then
				if mode == "game" or mode == "hide" then
				ui.addTextArea(10,"",n,8,386,(data[n].o*7.9),8,0xf0f0f0,0x808080,1.0,true)
				data[n].d=0 end
			elseif data[n].o > 0 then
				ui.addTextArea(10,"",n,8,386,(data[n].o*7.9),8,0x801500,0xa01000,1.0,true)
				data[n].d=data[n].d+1
				if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 298 then
					showMessage("<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",n)
				end
				if data[n].d > 7 then
					data[n].d=0
				end
			end
		else
			ui.removeTextArea(10,nil)
			ui.removeTextArea(300,nil)
		end
	end
end
if r <= 2000 and mode == "hide" then
	mode="game"
	tfm.exec.setGameTime(150+math.ceil(alives*4))
	ui.removeTextArea(22,nil)
	showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>!<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
	for n,p in next,tfm.get.room.playerList do
		ui.addTextArea(300,"",n,8,386,782,8,0x202020,0x121212,1.0,true)
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.movePlayer(n,1770,210,false,0,0,false)
		end
	end
end
if r <= 1000 and mode == "game" then
	tfm.exec.setGameTime(15)
	mode="end"
	local lives=0
	for n,p in next,tfm.get.room.playerList do
	if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
		lives=lives+1
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
	end
	ui.removeTextArea(300,n)
end
showMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
end
if time_remain <= 0 and mode == "end" then
	resetMap()
	end
else
	if time_passed >= 5 and changed == false and mode == "load" then
		tfm.exec.disableAutoShaman(false)
		resetMap()
		changed=true
		mode="hide"
	end
end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a>",name,355,55,90,48,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "cred" then
		eventChatCommand(name,"creditos")
	end
end
end

initTrue = function()
blue_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0000ff,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xff0000,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 400,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(40)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
for _,f in next,{"per","skip","limits","return","cancel","at","change","admin78"} do
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
			tfm.exec.chatMessage("Please type <b>!per</b> to make a question.",name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>Souris cannot play this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
	ui.addPopup(10,0,"",nil,-1000,-1000,128,false)
	ui.addPopup(11,0,"",nil,-1100,-1000,128,false)
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setMapName("<N>True or False <b>II</b> - version <VP><b>RTM 2408.005</b> <N>made by <ROSE><b>Spectra_phantom#6089</b><")
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
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
	ui.setMapName("<N>True or False <b>II</b> - version <VP><b>RTM 2408.005</b> <N>made by <ROSE><b>Spectra_phantom#6089</b><")
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
			ui.addPopup(1,2,"Type the time limit of the round in minutes (min: 1, max: 12)",name,350,175,200,true)
		end
	end
	if id == 1 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 12 then
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
			ui.addTextArea(0,"<font size='16'><p align='center'><font face='Segoe UI,Arial'>"..questions.question.."",nil,15,25,770,50,0x010101,0x010101,0.95,true)
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
end
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Viego#0345" or name == "Aphelios#1910" then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			if tonumber(message:sub(4)) >= 5 and tonumber(message:sub(4)) <= 30 then
				answer_time=tonumber(message:sub(4))
				tfm.exec.chatMessage("Answer time: "..answer_time.."s.")
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

initObjects = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(25)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
for _,f in next,{"help","kill","run","restart","shutdown"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550","@7120063","@7607195","@7627535","@7627546","@7627556","@7631682","@7634571","@4916014","@4005264","@7033610","@7308352","@3222646","@5937915","@7114147","@7288402","@7756165","@7757983","@7754765","@7754518"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition","White and Black","Mortal Cinema","Background Directions","Without Plans","Defilante Maze","Testing Purposes","Under the Darkness","Fallen Layers","Defilante Platform","Threshold of Boxes","Simple Black","Grassy Walls","Thickness of Clouds","Unreal Illusion","Testing Lava Cave","Ninja Directions","Limits of Tomorrow","",""}
objects={1,2,3,6,10,17,23,33,35,39,40,45,46,54,60,61,65,68,69,85,89,90,95}
actual_map=""
text_difficulty="<font face='Segoe UI Symbol'>　　　　<J>　　<R><b>　　</b><font face='Verdana'>"
remaining=0
imageId=-1
actual_creator=""
bar=""
loop=0
winner=false
functs={running=false,level=0,count=8}
times=0
function eventChatCommand(name,message)
	if message == "help" then
		tfm.exec.chatMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that is falling! The last alive player wins the game!<br><br><ROSE>Module made by Spectra_phantom#6089.",name)
	end
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Varusofeyzan#0000" then
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
	functs.count=8
	times=0
	tfm.exec.setGameTime(100)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Objects.",name)
		end
	end
end
function showBar()
	for i=1,41 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."   </b><V>|   <N>Difficulty : "..text_difficulty.."   <V>|   <N>#objects <ROSE><b>RTM 8056.040</b><")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b>   <V>|   <N>Difficulty : "..text_difficulty.."   <V>|   <N>#objects <ROSE><b>RTM 8056.040</b><")
			end
		end
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
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that is falling! The last alive player wins the game!<br><br><ROSE>Module made by Spectra_phantom#6089.",name)
end
function eventLoop(p,f)
	if functs.level == 0 then
		text_difficulty="<font face='Segoe UI Symbol'>　　　　<J>　　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 1 then
		text_difficulty="<font face='Segoe UI Symbol'>▶　　　<J>　　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 2 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶　　<J>　　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 3 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶　<J>　　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 4 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶▶<J>　　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 5 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶▶<J>▶　<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 6 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶▶<J>▶▶<R><b>　　</b><font face='Verdana'>"
	elseif functs.level == 7 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶▶<J>▶▶<R><b>▶　</b><font face='Verdana'>"
	elseif functs.level >= 8 then
		text_difficulty="<font face='Segoe UI Symbol'>▶▶▶▶<J>▶▶<R><b>▶▶</b><font face='Verdana'>"
	end
	remaining=math.floor(f/1000)
	showBar()
	if f <= 3000 and functs.running == true and winner == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			functs.running=false
			showText("Time is up!")
		end
	end
	if f <= 1 and functs.running == false then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if functs.running == false and winner == false and p < 20000 then
		functs.count=functs.count-0.5
		if functs.count == 3 then
			imageId = tfm.exec.addImage("17a4e9afa86.png","&1",338,80,nul)
		end
		if functs.count == 2 then
			tfm.exec.removeImage(imageId)
			imageId = tfm.exec.addImage("17a4e9ae302.png","&1",338,80,nul)
		end
		if functs.count == 1 then
			tfm.exec.removeImage(imageId)
			imageId = tfm.exec.addImage("17a4e9acb8f.png","&1",338,80,nul)
		end
		if functs.count <= 0 and p < 20000 and winner == false then
			tfm.exec.removeImage(imageId)
			functs.running=true
			functs.level=1
			loop=9
		end
	end
	if functs.running == true then
		loop=loop+1
		object=objects[math.random(#objects)]
		if loop >= 10-functs.level and winner == false then
			removeText()
			times=times+1
			if times >= 3 and functs.level <= 7 then
				times=0
				functs.level=functs.level+1
			end
			loop=0
			if functs.level <= 7 then
				for i=1,functs.level do
					throw()
				end
			else
				for i=1,7 do
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

initPistas = function()
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.setRoomMaxPlayers(30)
pergunta=0
valendo=false
limite=7
dica10=""
dica9=""
dica8=""
resposta=""
data={}
admin=""
tempo=999
loop=0
system.disableChatCommandDisplay("help")
system.disableChatCommandDisplay("skip")
system.disableChatCommandDisplay("shaman")
system.disableChatCommandDisplay("limite")
mapa="@4677521"
lang = {}
lang.br = {
	welcome = "<J>Bem-vindo ao module do Jogo das 3 Pistas! Não sabe como jogar? Digite !help.<br><br>Script criado por Spectra_phantom#6089. Tradução e conceito original por Hecarimjhenx#0000.",
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
	welcome = "<J>Welcome to 3 Tips Game! If you want help, type !help.<br><br>Script made by Spectra_phantom#6089.",
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
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Your commands:<br>!skip = Skip the current shaman<br>!limite [number] = Change the limit of questions<br>!shaman [username] = Change the shaman",name)
	end
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
		tfm.exec.setGameTime(63)
	end
	if pergunta >= limite and valendo == false then
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
		ui.addTextArea(1,"<font size='17'><p align='center'><font face='Segoe UI'><N>"..text.c10p.." <b>"..dica10.."",nil,5,30,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 49000 then
		ui.addTextArea(2,"<font size='17'><p align='center'><font face='Segoe UI'><N>"..text.c9p.." <b>"..dica9.."",nil,5,70,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 39000 then
		ui.addTextArea(3,"<font size='17'><p align='center'><font face='Segoe UI'><N>"..text.c8p.." <b>"..dica8.."",nil,5,110,780,32,0x000001,0x000001,0.9,true)
	end
	ui.setMapName("<J>"..text.module.."   <G>|   <N>Question : <V>"..pergunta.."/"..limite.."   <G>|   <N>Time : <V>"..tempo.."s   <G>|   <N>Version <VP><b>RTM 2308.027</b><")
end
function eventChatCommand(name,message)
	if message == "skip" then
		if name == "Spectra_phantom#6089" or name == "Viego#0345" or name == "Forzaldenon#0000" or name == admin then
			tfm.exec.chatMessage(text.cancel,nil)
			tfm.exec.newGame(mapa)
		end
	end
	if(message:sub(1,6) == "limite") then
		if name == "Spectra_phantom#6089" or name == "Viego#0345" or name == "Forzaldenon#0000" or name == admin then
			limite=tonumber(message:sub(8))
		end
	end
	if(message:sub(1,6) == "shaman") then
		if name == "Spectra_phantom#6089" or name == "Viego#0345" or name == "Forzaldenon#0000" or name == admin then
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
		else
			tfm.exec.chatMessage(text.cancel,name)
			valendo=false
			tfm.exec.newGame(mapa)
			resposta=""
			ui.removeTextArea(1,nil)
			ui.removeTextArea(2,nil)
			ui.removeTextArea(3,nil)
		end
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

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.193<br>By Spectra_phantom#6089")
if string.find(tfm.get.room.name,"*") then
	tfm.exec.chatMessage("<br><VP>Tribehouse detected. Initialising main #anvilwar module.")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") or string.find(tfm.get.room.name,"survivor") then
		tfm.exec.chatMessage("<R>Room name not allowed. Shutting down...")
	elseif string.find(tfm.get.room.name,"watercatch") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'watercatch' on room name.<br>Initialising #watercatch module...")
		initWatercatch()
	elseif string.find(tfm.get.room.name,"truefalse") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'truefalse' on room name.<br>Initialising #truefalse module...")
		initTrue()
	elseif string.find(tfm.get.room.name,"pistas") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'pistas' on room name.<br>Initialising #pistas module...")
		initPistas()
	elseif string.find(tfm.get.room.name,"objects") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'objects' on room name.<br>Initialising #objects module...")
		initObjects()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
