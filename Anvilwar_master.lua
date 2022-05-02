-- Transformice #anvilwar module loader - Version 2.217
-- By Spectra_phantom#6089
-- Included sub-modules: #watercatch, #cd3, #mountain, #beach.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.217",
	_MAINV = "46008.181",
	_DEVELOPER = "Spectra_phantom#6089" }

initAnvilwar = function()
--[[ #anvilwar 2022 Edition
Module authors : Spectra_phantom#6089, Morganadxana#0000
(C) 2017-2022 Spectra Advanced Module Group

Version : RTM 46008.181
Compilation date : 05/02/2022 01:16 UTC
Sending player : Spectra_phantom#6089

Number of maps : 172
Number of module special members : 9 ]]--

_VERSION = "Lua 5.4"
_AUTHOR = "Spectra_phantom#6089"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892","@7497464","@7497395","@7512948","@7555653","@7688028","@7655209","@7690671","@7845674","@7845680","@7845682","@7845738","@7859139","@7845709","@7844985","@7859144","@7860343","@7860623","@7860498","@7863972","@7803705","@7845724","@7866585","@7834953","@7866596","@7703547","@7795869","@7869247","@7844978","@7869610","@7654290","@7876838","@7879243","@7664077","@7760487","@7802869","@7808177","@7882449","@7882451","@7882453","@7882454","@7882456","@7882458","@7879251","@7748874","@7891576","@7891577","@7891578","@7892788","@7902610"}
map_names={"The Dual-Sided Fight Area","No Name","Inside the Castle","Hell and Water","A very simple waterfall","No Name","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","No Name","The first #anvilwar map","The Beach Test Map 2","No Name","No Name","The Six Attributes","Inside the Ocean","No Name","No Name","No Name","No Name","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","No Name","No Name","On the Seabed","The Palace of Swords","The Castle of Fire","No Name","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","No Name","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","No Name","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","No Name","No Name","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge (v2)","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","No Name","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","No Name","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","No Name","No Name","Do Not Hit The Anvil","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Floating Acid","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury #1","Released Things","No Name","No Name","No Name","This is a Terror","No Name","No Name","Escape from Nyan Cat","Sharingan Eye","Zombie Attack","Destructed Zone","Eye of Black Hole","Reversed Ninja Degrees","No Name","No Name","The Beach Test Map 6","The Beach Test Map 7","Vexos Arena","Releasing Anvils","The Hug of Agony","Try a Little More","No Name","No Name","No Name","Land of Spirits","No Name","No Name","No Name","No Name","Tobi - Akatsuki","Water Backgrounds","Up and Down","Watcher","Stranger Things","The Beach Test Map 8","Circle Compression","Gradient Colors","Background Reflection","Locked Dimensions","Now I See","Legacy Mansion","Water Equilibrium","Terrific Alternative","No Name","The Frozen Witch","Animal Fury #2","The Beach Test Map 9","Object Alchemy","Falling Acids","Balanced Releases"}
players_red={}; alives_red={};
players_blue={}; alives_blue={};
lobby_map="@7884784"
current_map=""; actual_player="";
enabled=false; powerups=false; permafrost=false; night_mode=false; gravity=false; change=false;
mices=0; loop=0; turns=0; needs=0; turn=0; choose_time=40; time_passed=0; time_remain=0; current_red=0; current_blue=0;
points_loop=0; pf_time=0; general_time=0; total_time=0; map_id=0; set_player=""; set_map="-1"; def_map=-1; red_cap=""; blue_cap=""; temp_name=""; bar_text="";
mode="lobby"
divider="　　　　　　　　　";
images_id={};
playersList={}; helpers={}; mods={
"Dinamarquers#0000",
"Flaysama#5935",
"Chavestomil#0000"};
admins={"Spectra_phantom#6089",
"Morganadxana#0000"}
ninjas={"Viego#0345",
"Forzaldenon#0000",
"D571#0000",
"Inthevayron#0000"};
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
	p10 = "Você precisa ser capitão do seu time e possuir 25 pontos para reviver.<br>Além disso, não é possível reviver faltando menos de 30 segundos.",
	p0 = "Você não possui pontos e/ou níveis suficientes para usar este powerup.",
	ap = "Potência: ",
	ag = "Ângulo: ",
	suicide = "O seguinte jogador cometeu suicídio: ",
	rankw = "Aviso: Tenha em mente que os dados do Ranking e do Perfil são temporários e são redefinidos quando a sala esvazia.",
	tk1 = "Oh não! ",
	tk2 = " matou um companheiro de equipe: ",
	submission = "<VP>As avaliações de mapas do #anvilwar estão abertas!",
	pw = "Senha trocada para: ",
	pw0 = "Senha removida.",
	limit = "Limite de ratos na sala: ",
	load1 = "O seguinte mapa será carregado: ",
	load2 = "Certifique-se que há pelo menos 1 jogador em cada equipe.",
	load0 = "Você precisa estar na tela principal para testar um mapa. Digite !reset para fazer isso e tente novamente.",
	ac = "Você atualmente possui ",
	powerups = "<font size='11.5'><b>Tecla '1' ou F1 - Disparo Duplo</b><br>Este powerup faz você atirar duas bigornas de uma vez.<br><b>Nível Mínimo:  1  /  Pontuação: 8pts</b><br><br><b>Tecla '2' ou F2 - Disparo Triplo</b><br>Este powerup faz você atirar três bigornas de uma vez.<br><b>Nível Mínimo:  2  /  Pontuação: 12pts</b><br><br><b>Tecla '3' ou F3 - Olha a Explosão</b><br>Este powerup permite a você criar uma explosão em um local do time inimigo.<br><b>Nível Mínimo:  3  /  Pontuação: 28pts</b><br><br><b>Tecla '4' ou F4 - Congelamento</b><br>Este powerup congela todos os jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo:  3  /  Pontuação: 24pts</b><br><p align='right'><a href='event:pw2'>Ir à Página 2</a>",
	commands = "<font size='11.5'>Os comandos que começam com <b>*</b> podem ser utilizados apenas por administradores e o dono da sala (/room #anvilwar00seunome).<br>!commands (ou <b>B</b>) - Mostra esta caixa de texto.<br>!anvils - Mostra as bigornas disponíveis para compra<br>!help (ou <b>H</b>) - Mostra a ajuda do jogo.<br>!tc [mensagem] - Envia uma mensagem que aparece apenas para os jogadores do seu time.<br>!powerups (ou <b>U</b>) - Mostra os powerups disponíveis e seus respectivos custos.<br>!p [usuário] (ou <b>P</b>) - Mostra o perfil do usuário especificado. Digite apenas !p para ver o seu perfil.<br>!ranking (ou <b>R</b>) - Mostra o ranking dos jogadores na sala.<br><R><b>*</b><N> !kill [usuário] - Mata o jogador selecionado.<br><R><b>*</b><N> !pw [senha] - Adiciona uma senha na sala. Digite apenas !pw para remover a senha.<br><R><b>*</b><N> !reset - Cancela a partida atual e retorna à tela inicial.<br><R><b>*</b><N> !limit [número] - Altera o limite de jogadores da sala.<br><R><b>*</b><N> !testmap [@código] - Testa um mapa. Isso pode ser útil para enviar o mapa para o #anvilwar. Pode ser usado somente a cada 30 minutos.",
	help = "<font size='12'><b>Bem-vindo ao #anvilwar!</b><br>O objetivo deste module é matar os jogadores do time adversário usando bigornas.<br><br>O jogo é simples de ser jogado. Quando for sua vez, use as teclas <b>Z e X</b> para mudar a potência do seu tiro e as teclas <b>C e V</b> para mudar o ângulo.<br>O time que conseguir eliminar todos os jogadores do outro time vencerá o jogo!<br><br>Quando você joga ou ganha partidas, você vai receber <J><b>AnvilCoins</b><N>. Esta é a moeda do jogo. Ela pode ser usada para comprar novas bigornas.<br>Divirta-se e que vença o melhor time!<br><br><N><R><b>Administradores:</b><N> Spectra_phantom#6089 (GM) e Morganadxana#0000<br><VP><b>Contribuidores:</b><N> Flaysama#5935, Chavestomil#0000 e Dinamarquers#0000<br><J><b>Tradutores:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " segundos.",
	leave = "Sair",
	join = "Entrar",
	getr = "Preparem-se! A partida vai começar em instantes!",
	powerups2 = "<font size='11.5'><b>Tecla '5' ou F5 - Modo Noturno</b><br>Este powerup remove a visão dos jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo: 4  /  Pontuação: 15pts</b><br><br><b>Tecla '6' ou F6 - Chuva de Bigornas</b><br>Este powerup vai fazer chover bigornas em áreas aleatórias do time inimigo.<br><b>Nível Mínimo: 4  /  Pontuação: 28pts</b><br><br><b>Tecla '7' ou F7 - Anomalia Gravitacional</b><br>Este powerup vai aumentar consideravelmente a gravidade até o outro time atirar.<br><b>Nível Mínimo: 5  /  Pontuação: 14pts</b><br><br><p align='right'><a href='event:pw1'>Voltar à Página 1</a>",
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
	legacy = "<J><b>Confiram os submódulos do #anvilwar!</b><br><VP>/sala #anvilwar00watercatch<br>/sala #anvilwar00cd3<br>/sala #anvilwar00mountain<br>/sala #anvilwar00beach<br><br><N>Para descobrir as novidades desta versão, digite <b>!changelog</b>.<br><br>",
	disabled = "Este comando foi desabilitado por um administrador.",
	gametime = "Tempo",
	timeup = "<ROSE>Tempo esgotado! Este será o último tiro!",
	red_team = "Time Vermelho",
	blue_team = "Time Azul",
	revived = "O seguinte jogador reviveu: ",
	time1 = "Você precisa aguardar ",
	time2 = "minutos para testar um mapa novamente.",
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
	p10 = "You must be the leader of your team and have at least 25 points to revive.<br>Also, isn't allowed to revive players on the last 30 seconds.",
	p0 = "You don't have level and score to use this powerup.",
	ap = "Power: ",
	ag = "Angle: ",
	suicide = "The following player commited suicide: ",
	rankw = "Keep in mind that the profile and ranking data is temporary and will be lost when the room is gone.",
	tk1 = "Oh no! ",
	tk2 = " has killed a player of her team: ",
	submission = "#anvilwar Map Submissions are now open!",
	pw = "Password changed to: ",
	pw0 = "Password cleared.",
	limit = "New room mice limit ",
	load1 = "The next map will be loaded: ",
	load2 = "The room needs to have a least 1 player into each team.",
	load0 = "You needs to stay into LOBBY mode to use this command. Use !reset command and try again.",
	ac = "You currently have ",
	powerups = "<font size='11.5'><b>Key '1' or F1 - Double Shoot</b><br>This powerup makes you shoot 2 anvils at once.<br><b>Required Level: 1  /  Required Score: 8pts</b><br><br><b>Key '2' or F2 - Triple Shoot</b><br>This powerup makes you shoot 3 anvils at once.<br><b>Required Level: 2  /  Required Score: 12pts</b><br><br><b>Key '3' or F3 - Explosion</b><br>This powerup allows you to create an explosion on the enemy team area.<br><b>Required Level: 3  /  Required Score: 28pts</b><br><br><b>Key '4' or F4 - Permafrost</b><br>This powerup freezes all enemy team players by a limited time.<br><b>Required Level: 3  /  Required Score: 24pts</b><br><p align='right'><a href='event:pw2'>Go to Page 2</a>",
	commands = "<font size='11.5'>The commands marked with <b>*</b> can be used only by Administrators and the room owner (/room #anvilwar00yourname).<br>!commands (or <b>B</b> key) - Display this message box.<br>!anvils - Show available #anvilwar anvils to buy.<br>!help (or <b>H</b> key) - Display the game help.<br>!tc [message] - Send a message that is visible only for players of your team.<br>!powerups (or <b>U</b> key) - Show all available powerups and their respective costs.<br>!p [username] (or <b>P</b> key) - Show the profile of the specified user. Type !p only to see your profile.<br>!ranking (or <b>R</b> key) - Show the room ranking.<br><R><b>*</b><N> !kill [username] - Kill the specified player.<br><R><b>*</b><N> !pw [password] - Locks the room with a password. Use only !pw to clear the password.<br><R><b>*</b><N> !reset - Cancel the current match and returns to the lobby screen.<br><R><b>*</b><N> !limit [number] - Change the limit of mices on the room.<br><R><b>*</b><N> !testmap [@code] - Test a map. This can use useful when you want to send your map to #anvilwar. Can be used only every 30 minutes.",
	help = "<font size='12'><b>Welcome to #anvilwar!</b><br>The objective of this module is kill all the players of other team using anvils.<br><br>The module is very easy to play. When reaches your turn, use <b>Z and X</b> keys to change the intensity of the anvil shoot and <b>C and V</b> keys to change the angle of the anvil.<br>The team that kill all players of other team will win the game!<br><br>When you kill players or win matches, you will receive <J><b>AnvilCoins</b><N>. This is the money of #anvilwar module. It can be used to unlock custom anvils.<br>Enjoy the module and may the best team wins!<br><br><N><R><b>Administrators:</b><N> Spectra_phantom#6089 (GM) and Morganadxana#0000<br><VP><b>Contributors:</b><N> Flaysama#5935, Chavestomil#0000 and Dinamarquers#0000<br><J><b>Translators:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " seconds.",
	leave = "Leave",
	join = "Join",
	getr = "Get Ready! The match will start in a few seconds!",
	powerups2 = "<font size='11.5'><b>Key '5' or F5 - Night Mode</b><br>This powerup remove the vision of players of enemy team.<br><b>Required Level: 4  /  Required Score: 15pts</b><br><br><b>Key '6' or F6 - Anvil Rain</b><br>This powerup will create a anvil rain on random enemy team areas.<br><b>Required Level: 4  /  Required Score: 28pts</b><br><br><b>Key '7' or F7 - Gravity Anomaly</b><br>This powerup will incrase the gravity of map by 200% until the next player shoots.<br><b>Required Level: 5  /  Required Score: 14pts</b><br><br><p align='right'><a href='event:pw1'>Return to Page 1</a>",
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
	legacy = "<N><VP>If you want to see all updates and fixes of this version, type <b>!changelog.</b><br><br>",
	disabled = "This command was disabled by an administrator.",
	gametime = "Game Time",
	timeup = "<ROSE>Time is up! This will be the last shoot!",
	red_team = "Red Team",
	blue_team = "Blue Team",
	revived = "The following player revived: ",
	time1 = "Você precisa aguardar ",
	time2 = "minutos para testar um mapa novamente.",
}
if tfm.get.room.isTribeHouse == true then
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
for _,g in next,{"reset","help","sync","pw","commands","powerups","p","kill","limit","ranking","tc","TC","Tc","tC","anvils","set","testmap","defmap","leader","rv","tp","changelog","get"} do
	system.disableChatCommandDisplay(g)
end
tfm.exec.setRoomMaxPlayers(30)

function tableSearch(table,element)
	for i=1,rawlen(table) do
		if element == table[i] then
			return true
		end
	end
end

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
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
	ui.addTextArea(480,"<font size='18'><font color='#ff4500'><p align='center'><b><a href='event:enter_red'>"..text.join.."",name,320,140,150,25,0,0,0.9,true)
	ui.addTextArea(481,"<font size='18'><font color='#0045ff'><p align='center'><b><a href='event:enter_blue'>"..text.join.."",name,320,230,150,25,0,0,0.9,true)
end

function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-11,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end

function showLobbyText(name)
	ui.addTextArea(402,"<p align='center'><font size='13'><i>"..text.version.." RTM 46008.181 - "..text.comp_date.."05/02/2022 01:16 UTC - "..text.uploaded.."Spectra_phantom#6089</i>",name,10,379,780,36,0,0,1.0,true)
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
	rk = ""
	for k,v in pairs(sc) do
		if k < 21 then
			if str ~= '' then
				if k < 10 then rk=tostring(0)..k; else rk=tostring(k) end
				str1=str1.."<br><N>"..rk.."° | <VP>"..v.n..""
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
	showMenu(name,0xffffff,200,35,400,340,""..tfm.get.room.name.." Ranking","<font size='12'># / Name                                            Kills  Level   Wins% Kills%")
	ui.addTextArea(1010,"<p align='left'><font size='12'><font face='Consolas'>"..str1,name,200,70,220,320,0,0,nil,true)
	ui.addTextArea(1011,"<p align='right'><font size='12'><font face='Consolas'>"..str2,name,420,70,40,320,0,0,nil,true)
	ui.addTextArea(1007,"<p align='right'><font size='12'><font face='Consolas'>"..str3,name,460,70,40,320,0,0,nil,true)
	ui.addTextArea(1008,"<p align='right'><font size='12'><font face='Consolas'>"..str4,name,500,70,50,320,0,0,nil,true)
	ui.addTextArea(1009,"<p align='right'><font size='12'><font face='Consolas'>"..str5,name,550,70,50,320,0,0,nil,true)
end

function giveRankings(name)
	if data[name] then
		if tableSearch(helpers,name) == true then
			data[name].ranking=1
			tfm.exec.setNameColor(name,0x00a9a9)
		elseif tableSearch(mods,name) == true then
			data[name].ranking=2
			tfm.exec.setNameColor(name,0xa9a900)
		elseif tableSearch(ninjas,name) == true then
			data[name].ranking=3
		elseif tableSearch(admins,name) == true then
			data[name].ranking=4
			tfm.exec.setNameColor(name,0xa90000)
		end
	end
end

function updateTextBar()
	if mode == "lobby" or mode == "map_sort" or mode == "wait1" then
		ui.setMapName("<N><b>#anvilwar 2022 Edition</b>   <G>|   <VP>"..text.version.." <b>RTM 46008.181</b> <R>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
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
				ui.addTextArea(-4,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,501,130,260,270,0,0,1.0,true)
				ui.addTextArea(-3,"<BL><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,500,129,260,270,0,0,1.0,true)
				ui.addTextArea(-1,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,21,130,260,270,0,0,1.0,true)
				ui.addTextArea(-2,"<R><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,20,129,260,270,0,0,1.0,true)
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
		killed=false,team=0,ranking=0,angle=40,power=5,powerup=0,
		current_coins=0,opened=false,active_imgs={},anvils={0,0,0,0,0,0,0,0,0,0,0},current_anvil=0,position=198,test_time=0}
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
				showImage(name,"17e224c629a.png",0,16,1.0,0.96)
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
		if powerups == true then
			if data[name].powerup == 0 then
				if code == 49 and data[name].score >= 8 and data[name].level >= 1 then
					showMessage("<VP><b>"..name.."</b> "..text.p1.."")
					data[name].powerup=1
					setScores(name,-8,true)
				elseif code == 49 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 50 and data[name].score >= 12 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-12,true)
				elseif code == 50 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 51 and data[name].score >= 28 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-28,true)
					data[name].powerup=3
					mode="wait3"
					tfm.exec.setGameTime(10)
				elseif code == 51 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 52 and data[name].score >= 24 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-24,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
				elseif code == 52 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 53 and data[name].score >= 15 and data[name].level >= 4 then
					showMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-15,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
				elseif code == 53 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 54 and data[name].score >= 28 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-28,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
				elseif code == 54 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 55 and data[name].score >= 14 and data[name].level >= 5 then
					showMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-14,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,22)
					pf_time=-2
					gravity=false
				elseif code == 55 then
					showMessage("<R>"..text.p0.."",name)
				end
				ui.removeTextArea(750,nil)
			end
		end
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
		if code == 67 then
			if data[name].angle > 0 then
				data[name].angle=data[name].angle-10
			end
			showAngleMeter(name)
		end
		if code == 86 then
			if data[name].angle < 90 then
				data[name].angle=data[name].angle+10
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
		data[name].position=data[name].position+3
		if data[name] and data[name].team == 1 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,data[name].position,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,data[name].position,false,0,0,false)
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
		setScores(name,0,false)
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
			tfm.exec.setGameTime(6)
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
		ui.removeTextArea(999,name)
		tfm.exec.freezePlayer(name,false)
		removeImagePlayers(name)
		showLobbyText(name)
		if data[name] then
			for i=1000,1011 do
				ui.removeTextArea(i,name)
			end
			data[name].opened=false
			if data[name].ranking >= 0 then
				showTeams(name)
				showImage(name,"17e224c629a.png",0,16,1.0,0.96)
				data[name].team=0
				data[name].current_coins=0
				setScores(name,0,false)
			else
				tfm.exec.killPlayer(name)
			end
		end
	end
	permafrost=false; night_mode=false;
	showMessage("<VP><br>"..text.legacy..text.submission.."<br><b>atelier801.com/topic?f=6&t=894824&p=1</b>")
end

function eventNewGame()
	ui.setBackgroundColor("#000000")
	set_map="-1"; def_map=-1; turns=0;
	if mode == "wait1" then
		for i=400,403 do ui.removeTextArea(i,nil) end
		mode="wait2"
		tfm.exec.setGameTime(20)
		moveTeams()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setNameColor(name,0xd7d7e6)
			data[name].score=0
			data[name].position=198
			if data[name].team > 0 then
				data[name].matches=data[name].matches+1
			else
				tfm.exec.setPlayerScore(name,0,false)
			end
		end
	end
	actual_shooter="-"
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
			showMessage("<R>"..text.rankw.."",name)
		else
			showMessage("<R>User not found",nome)
		end
	end

	if (command:sub(0,4) == "sync") and data[name].ranking >= 3 then
		tfm.exec.setPlayerSync(command:sub(6))
		showMessage("Sync: "..command:sub(6).."",name)
	end
	if command == "reset" and data[name].ranking >= 2 then
		lobby()
	end
	if (command:sub(0,2) == "pw") and data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(tostring(command:sub(4)))
		if string.len(command:sub(4)) > 0 then
			showMessage(""..text.pw..""..command:sub(4).."",name)
		else
			showMessage(text.pw0,name)
		end
	end
	if command == "changelog" then
		showMenu(name,0xa8f233,140,110,520,230,"#anvilwar Changelog - RTM 46008.181","• Added 1 new map<br>• Changed the default angle from 45° to 40°<br>• Increased the F6 powerup price from 20 to 28 points<br>• Some changes on players death<br>• The !testmap command is now restricted to one map every 30 minutes<br>• Added the !kill command for managers on !commands<br>• Increased the F4 powerup price from 24 to 28 points<br>• Reduction of the reviving price from 30 to 25 points<br>• Reduced the F7 powerup price from 18 to 14 points<br>• Added the link to the map submission")
	end
	if (command:sub(0,2) == "rv") then
		if name == actual_player and general_time >= 30 then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				print(temp_name)
				if data[temp_name] then
					if data[name].score >= 25 then
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
							showMessage("<J>"..text.revived..""..temp_name.."")
							setScores(name,-25,true)
						end
					else
						showMessage(text.p10,name)
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
	if (command:sub(0,5) == "score") and data[name].ranking >= 4 then
		temp_name=command:sub(4)
		if data[temp_name] then
			ui.addPopup(105,2,"Points",name,350,175,200,true)
		end
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
	if (command:sub(0,4) == "kill") and data[name].ranking >= 2 then
		tfm.exec.killPlayer(command:sub(6))
	end
	if (command:sub(0,7) == "testmap") then
		if mode == "lobby" then
			if string.len(command:sub(9)) == 2 or string.len(command:sub(9)) == 8 then
				if data[name].ranking <= 2 then
					if data[name].test_time <= 0 then
						set_map=command:sub(9)
						showMessage(""..text.load1..""..command:sub(9)..". "..text.load2.."",name)
						data[name].test_time=1800
					else
						ct=math.ceil(data[name].test_time/60)
						showMessage(""..text.time1..""..data[name].test_time..". "..text.load2.."",name)
					end
				else
					set_map=command:sub(9)
					showMessage(""..text.load1..""..command:sub(9)..". "..text.load2.."",name)
				end
			end
		else
			showMessage(text.load0,name)
		end
	end
	if (command:sub(0,3) == "get") and data[name].ranking >= 1 then
		if tonumber(command:sub(5)) <= rawlen(map_names) then
			showMessage(""..map_names[tonumber(command:sub(5))].." - "..maps[tonumber(command:sub(5))].."",name)
		end
	end
	if (command:sub(0,2) == "tc") or (command:sub(0,2) == "TC") or (command:sub(0,2) == "Tc") or (command:sub(0,2) == "tC") then
		if data[name] then
			if data[name].team == 1 then
				for _,p in next,players_red do
					showMessage("<VP>• <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			elseif data[name].team == 2 then
				for _,p in next,players_blue do
					showMessage("<VP>• <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			end
		end
	end
	if command == "ranking" then
		if data[name].opened == false then
			eventRanking(name)
		end
		showMessage("<R>"..text.rankw.."",name)
	end
	if command == "anvils" then
		if data[name].opened == false then
			showMessage("<J>"..text.ac.."<b>"..data[name].coins.."</b> AnvilCoins.",name)
			showMenu(name,0x999999,56,120,690,235,"#anvilwar Anvils","<font size='11.5'>"..divider.."<b>Default Anvil</b><br>"..divider.."Cost: 0 coins<br>"..divider.."<a href='event:a0'>Equip!</a><br><br>"..divider.."<b>Red Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a1'>Equip!</a><br><br>"..divider.."<b>Blue Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a2'>Equip!</a><br><br>"..divider.."<b>White Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a3'>Equip!</a>")
			ui.addTextArea(1005,"<i><font size='11.5'>"..divider.."<b>Rainbow Anvil</b><br>"..divider.."Cost: 250 coins<br>"..divider.."<a href='event:a4'>Equip!</a><br><br>"..divider.."<b>Sharingan Anvil</b><br>"..divider.."Cost: 500 coins<br>"..divider.."<a href='event:a5'>Equip!</a><br><br>"..divider.."<b>Black Hole Anvil</b><br>"..divider.."Cost: 500 coins<br>"..divider.."<a href='event:a6'>Equip!</a><br><br>"..divider.."<b>4K 1080p Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a7'>Equip!</a>",name,208,151,175,215,0,0,1.0,true)
			ui.addTextArea(1006,"<i><font size='11.5'>"..divider.."<b>Thug Life Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a8'>Equip!</a><br><br>"..divider.."<b>Water Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a9'>Equip!</a><br><br>"..divider.."<b>Grass Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a10'>Equip!</a><br><br>"..divider.."<b>RadWhite Anvil</b><br>"..divider.."Cost: 350 coins<br>"..divider.."<a href='event:a11'>Equip!</a>",name,380,151,175,215,0,0,1.0,true)
			ui.addTextArea(1007,"<i><font size='11.5'>"..divider.."<b>Stars Anvil</b><br>"..divider.."Cost: 400 coins<br>"..divider.."<a href='event:a12'>Equip!</a><br><br>"..divider.."<b>Asteroid Anvil</b><br>"..divider.."Cost: 350 coins<br>"..divider.."<a href='event:a13'>Equip!</a><br><br>"..divider.."<b>Expanded Anvil</b><br>"..divider.."Cost: 125 coins<br>"..divider.."<a href='event:a14'>Equip!</a><br><br>"..divider.."<b>Yellow Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a15'>Equip!</a>",name,552,151,175,215,0,0,1.0,true)
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
		showMenu(name,0x125490,120,105,560,265,"#anvilwar Commands",text.commands)
	end
	if command == "help" then
		showMenu(name,0x457426,100,125,600,245,"Help",text.help)
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
	if id == 105 then
		if data[temp_name] then
			setScores(temp_name,tonumber(message),true)
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
		for i=479,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
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
		for i=479,481 do
			ui.removeTextArea(i,name)
			ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
		end
	end
end

function moveTeams()
	ui.setBackgroundColor("#6a7495")
	showMessage("<VP>"..text.getr.."")
	for _,id in next,images_id do
		tfm.exec.removeImage(id)
		images_id={}
	end
	if mode == "wait2" then
		for _,name in next,players_red do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,198,false,0,0,false)
		end
		for _,name in next,players_blue do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,198,false,0,0,false)
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
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
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
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
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
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
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
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
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
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
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
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
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
			if data[name].coins >= 350 then
				data[name].coins=data[name].coins-350
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
			if data[name].coins >= 400 then
				data[name].coins=data[name].coins-400
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
			if data[name].coins >= 350 then
				data[name].coins=data[name].coins-350
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
			if data[name].coins >= 125 then
				data[name].coins=data[name].coins-125
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
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
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
	showMessage("<VP><b>"..name.."</b> "..text.level.."<b>"..data[name].level.."</b>!",name)
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
		tfm.exec.movePlayer(name,math.random(900,1200),198,false,0,0,false)
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
		tfm.exec.movePlayer(name,math.random(400,700),198,false,0,0,false)
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
	for name,player in next,tfm.get.room.playerList do
		if data[name].test_time > 0 then
			data[name].test_time=data[name].test_time-0.5
		end
	end
	if mode == "lobby" then
		if choose_time > 0 then
			choose_time=choose_time-0.5
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].opened == false then
					ui.addTextArea(483,"<font size='55'><p align='center'><font color='#000001'>"..math.ceil(choose_time).."",name,357,162,80,60,0,0,0.97,true)
					ui.addTextArea(484,"<font size='55'><p align='center'>"..math.ceil(choose_time).."",name,355,160,80,60,0,0,0.97,true)
				end
			end
		end
		if choose_time == 0 then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				if rawlen(players_red) - rawlen(players_blue) <= 1 and rawlen(players_red) - rawlen(players_blue) >= -1 then
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
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm.."",nil,102,97,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm.."",nil,100,95,600,45,0,0,1.0,true)
				map_id=math.random(1,rawlen(maps))
			elseif loop == 8 then
				if def_map > 0 then
					map_id=def_map
				end
				current_map=maps[map_id]
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,2,97,800,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,0,95,800,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
			end
		else
			current_map=set_map
			ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..set_map.."",nil,2,95,800,45,0,0,1.0,true)
			ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..set_map.."",nil,0,95,800,45,0,0,1.0,true)
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
		if time_passed % 27 == 0 then
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
		if pf_time == 7 then
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
admin={""} -- Insira o nome dos FunCorps aqui!
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,f in next,{"help","ajuda","tc","kill","powerups","creditos","changelog"} do
	system.disableChatCommandDisplay(f)
end
rd = {title = 117, look = "201;0,6_2651d3+3d65a6,23,34,40,63_21f1f6+475edc+471ebb+5991d7+19809b,33_2b7dde+538be1,58,18_86b78+b78d1",x = 268,y = 1893,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
ku = {title = 35, look = "201;224,48_131313+0,27,74_141b22+70d,2_1a1a1a,40_23566c+f0f0f,36,2,0",x = 3009,y = 4808,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
mf = {title = 1, look = "112;0,4,0,74_212121+d2d2d2,39,39,44,0,1",x = 5018,y = 319,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
dr = {title = 43, look = "150;194,6_c926d3+a63d91,39,0,0,0,0,0,0",x = 4574,y = 2329,female = true,lookLeft = true,lookAtPlayer = true,interactive = true}
cs = {title = 257, look = "1;44,40,87,3,62,91,37,52,0",x = 2475,y = 359,female = true,lookLeft = false,lookAtPlayer = true,interactive = true}
dw = {title = 2, look = "1;203,50,20,41,42,103,50,0,0",x = 2726,y = 359,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
kp = {title = 11, look = "1;16,5,20,73,26,94,29,62,46",x = 3698,y = 435,female = false,lookLeft = true,lookAtPlayer = true,interactive = true}
ag = {title = 9, look = "4;225,43,38,0,54,104,0,0,20",x = 60,y = 409,female = false,lookLeft = false,lookAtPlayer = true,interactive = true}
tfm.exec.newGame('<C><P L="5200" H="4000" d="x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1790,192" D="x_deadmeat/x_pictos/d_1763-fs8.png,236,423;x_deadmeat/x_pictos/d_1763-fs8.png,20,389;../godspaw/img/drapeau1.png,-248,183;x_deadmeat/x_pictos/d_1385-fs8.png,138,375;x_deadmeat/x_pictos/d_1385-fs8.png,-132,327;../godspaw/img/drapeau1.png,2575,183;../godspaw/img/drapeau1.png,3095,277;../godspaw/img/drapeau1.png,2050,277;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-485,12;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-773,120;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-392,-102;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5328,300;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5594,-77;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,5131,107;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4673,260;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4795,-62;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,4402,67;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3920,-75;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3986,215;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3258,230;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,3406,-4;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2989,-218;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2449,-125;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2918,78;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1860,-140;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,-21,93;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,312,39;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,73,-167;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,301,206;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1073,-79;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,539,-113;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,804,116;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,936,209;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,1256,50;x_transformice/x_evt/x_evt_04/cwlb1bml/nuage_plateforme.png,2130,51;x_deadmeat/x_pictos/d_4653.png,690,318;x_transformice/x_inventaire/2528.jpg,3398,4345;x_deadmeat/x_pictos/d_1763-fs8.png,3316,4623;x_transformice/x_inventaire/2527.jpg,2452,1813;x_transformice/x_inventaire/2526.jpg,2568,1986;x_transformice/x_inventaire/2526.jpg,2705,1814;x_transformice/x_inventaire/2526.jpg,2602,2065;x_transformice/x_inventaire/2526.jpg,2678,1679;x_transformice/x_inventaire/2526.jpg,2549,1788;x_transformice/x_inventaire/2527.jpg,2820,1519;x_transformice/x_inventaire/2527.jpg,2386,1571;x_transformice/x_inventaire/2527.jpg,2702,1708;x_transformice/x_inventaire/2527.jpg,2497,1899;x_transformice/x_inventaire/2528.jpg,2775,1621;x_transformice/x_inventaire/2528.jpg,2594,2161;x_transformice/x_inventaire/2528.jpg,2450,1689;x_transformice/x_inventaire/2528.jpg,2638,1911;x_deadmeat/x_pictos/d_4653.png,4890,321;x_deadmeat/x_pictos/d_4524.png,1473,3814;x_deadmeat/x_pictos/d_1694-fs8.png,1019,2741;x_deadmeat/x_pictos/d_1098-fs8.png,970,2547;x_deadmeat/x_pictos/d_1219-fs8.png,783,2155;x_deadmeat/x_pictos/d_1385-fs8.png,467,1856;x_deadmeat/x_pictos/d_1385-fs8.png,1234,3542;x_deadmeat/x_pictos/d_1385-fs8.png,1174,3353;x_deadmeat/x_pictos/d_1385-fs8.png,1096,3123;x_transformice/x_inventaire/2528.jpg,3516,3145;x_deadmeat/x_pictos/d_1736-fs8.png,3369,3236;x_deadmeat/x_pictos/d_1219-fs8.png,3926,2610;x_deadmeat/x_pictos/d_1219-fs8.png,3816,2718;x_deadmeat/x_pictos/d_1762-fs8.png,5672,2164;x_deadmeat/x_pictos/d_1771-fs8.png,5232,2171;x_deadmeat/x_pictos/d_1694-fs8.png,5010,2153;x_deadmeat/x_pictos/d_1694-fs8.png,5432,2117;x_deadmeat/x_pictos/d_20-fs8.png,5494,2120;x_deadmeat/x_pictos/d_1747-fs8.png,5661,2198;x_deadmeat/x_pictos/d_1747-fs8.png,5426,2185;x_deadmeat/x_pictos/d_1747-fs8.png,5226,2190;x_deadmeat/x_pictos/d_1747-fs8.png,5007,2215;x_deadmeat/x_pictos/d_1762-fs8.png,3877,2701;x_deadmeat/x_pictos/d_1762-fs8.png,3728,2917;x_deadmeat/x_pictos/d_1762-fs8.png,4194,2455;x_deadmeat/x_pictos/d_1762-fs8.png,4072,2534;x_deadmeat/x_pictos/d_1736-fs8.png,4581,2252;x_deadmeat/x_pictos/d_1736-fs8.png,4302,2334;x_deadmeat/x_pictos/d_1219-fs8.png,4878,2147;x_deadmeat/x_pictos/d_3298.png,4842,2215;x_transformice/x_inventaire/2528.jpg,-99,2429;x_transformice/x_inventaire/2528.jpg,245,3237;x_transformice/x_inventaire/2528.jpg,367,2812;x_transformice/x_inventaire/2528.jpg,3439,574;x_transformice/x_inventaire/2528.jpg,1794,633;x_transformice/x_inventaire/2528.jpg,321,1814;x_deadmeat/x_pictos/d_1761-fs8.png,4340,3414;x_deadmeat/x_pictos/d_1761-fs8.png,4099,3290;x_deadmeat/x_pictos/d_1761-fs8.png,4175,3329;x_deadmeat/x_pictos/d_1761-fs8.png,3729,3072;x_deadmeat/x_pictos/d_1761-fs8.png,3996,3248;x_deadmeat/x_pictos/d_1761-fs8.png,4208,3350;x_deadmeat/x_pictos/d_1761-fs8.png,4305,3393;x_deadmeat/x_pictos/d_1761-fs8.png,3897,3193;x_deadmeat/x_pictos/d_1761-fs8.png,-49,2601;x_deadmeat/x_pictos/d_1761-fs8.png,-204,2358;x_deadmeat/x_pictos/d_1761-fs8.png,393,1874;x_deadmeat/x_pictos/d_1736-fs8.png,-66,315;x_deadmeat/x_pictos/d_1736-fs8.png,4415,3888;x_transformice/x_inventaire/2526.jpg,755,2085;x_transformice/x_inventaire/2526.jpg,174,1852;x_transformice/x_inventaire/2526.jpg,628,1969;x_transformice/x_inventaire/2526.jpg,237,3193;x_transformice/x_inventaire/2526.jpg,293,2852;x_transformice/x_inventaire/2527.jpg,220,2942;x_transformice/x_inventaire/2527.jpg,315,2804;x_transformice/x_inventaire/2527.jpg,183,3218;x_transformice/x_inventaire/2527.jpg,559,1942;x_transformice/x_inventaire/2527.jpg,-20,1864;x_deadmeat/x_pictos/d_1219-fs8.png,643,2004;x_deadmeat/x_pictos/d_1219-fs8.png,513,1896;x_deadmeat/x_pictos/d_1219-fs8.png,-114,1898;x_deadmeat/x_pictos/d_1219-fs8.png,267,1829;x_deadmeat/x_pictos/d_1219-fs8.png,391,2795;x_deadmeat/x_pictos/d_1219-fs8.png,335,2863;x_deadmeat/x_pictos/d_1219-fs8.png,1545,3764;x_deadmeat/x_pictos/d_1219-fs8.png,3940,3179;x_deadmeat/x_pictos/d_1219-fs8.png,3312,3315;x_deadmeat/x_pictos/d_1219-fs8.png,3647,2995;x_deadmeat/x_pictos/d_1105-fs8.png,5091,3831;x_deadmeat/x_pictos/d_1105-fs8.png,3145,3450;x_deadmeat/x_pictos/d_1105-fs8.png,3462,3641;x_deadmeat/x_pictos/d_1105-fs8.png,3348,3526;x_deadmeat/x_pictos/d_1105-fs8.png,2678,3521;x_deadmeat/x_pictos/d_1105-fs8.png,2743,3509;x_deadmeat/x_pictos/d_1105-fs8.png,305,3239;x_deadmeat/x_pictos/d_1105-fs8.png,1405,3798;x_transformice/x_inventaire/2527.jpg,3275,531;x_transformice/x_inventaire/2526.jpg,3353,628;x_transformice/x_inventaire/2526.jpg,1948,510;x_transformice/x_inventaire/2526.jpg,1853,593;x_transformice/x_inventaire/2527.jpg,1866,534;x_deadmeat/x_pictos/d_17-fs8.png,2234,180;x_deadmeat/x_pictos/d_17-fs8.png,2843,171;x_transformice/x_inventaire/2530.jpg,4955,3772;x_transformice/x_inventaire/2530.jpg,2453,3348;x_deadmeat/x_pictos/d_1762-fs8.png,3264,3414;x_deadmeat/x_pictos/d_1762-fs8.png,3504,3649;x_deadmeat/x_pictos/d_1762-fs8.png,3673,3819;x_deadmeat/x_pictos/d_1762-fs8.png,3595,3746;x_deadmeat/x_pictos/d_1098-fs8.png,3666,3849;x_deadmeat/x_pictos/d_1098-fs8.png,3508,3692;x_deadmeat/x_pictos/d_1098-fs8.png,3360,3547;x_transformice/x_inventaire/2529.jpg,4996,3836;x_transformice/x_inventaire/2529.jpg,2859,3488;x_transformice/x_inventaire/2529.jpg,1115,3779;x_transformice/x_inventaire/2526.jpg,1337,3733;x_transformice/x_inventaire/2526.jpg,416,3894;x_transformice/x_inventaire/2526.jpg,959,3802;x_transformice/x_inventaire/2526.jpg,2186,3641;x_transformice/x_inventaire/2526.jpg,2700,3319;x_transformice/x_inventaire/2526.jpg,4925,3852;x_transformice/x_inventaire/2526.jpg,5147,3890;x_transformice/x_inventaire/2526.jpg,4518,3896;x_transformice/x_inventaire/2526.jpg,3741,3887;x_transformice/x_inventaire/2526.jpg,2688,3474;x_transformice/x_inventaire/2528.jpg,2718,3409;x_transformice/x_inventaire/2528.jpg,2451,3445;x_transformice/x_inventaire/2528.jpg,747,3853;x_transformice/x_inventaire/2527.jpg,668,3880;x_transformice/x_inventaire/2527.jpg,835,3830;x_transformice/x_inventaire/2527.jpg,2930,3417;x_transformice/x_inventaire/2527.jpg,2276,3597;x_transformice/x_inventaire/2527.jpg,2427,3496;x_transformice/x_inventaire/2527.jpg,4385,3941;x_transformice/x_inventaire/2527.jpg,4664,3860;x_transformice/x_inventaire/2528.jpg,4829,3846;x_transformice/x_inventaire/2528.jpg,502,3891;x_transformice/x_inventaire/2528.jpg,1211,3758;x_deadmeat/x_pictos/d_1103-fs8.png,3614,3765;x_deadmeat/x_pictos/d_1103-fs8.png,3304,3451;x_deadmeat/x_pictos/d_1771-fs8.png,2474,3537;x_deadmeat/x_pictos/d_1771-fs8.png,2137,3702;x_deadmeat/x_pictos/d_1771-fs8.png,3046,3446;x_deadmeat/x_pictos/d_1762-fs8.png,2963,3442;x_deadmeat/x_pictos/d_1762-fs8.png,2236,3629;x_deadmeat/x_pictos/d_1098-fs8.png,2342,3553;x_deadmeat/x_pictos/d_1098-fs8.png,2018,3700;x_deadmeat/x_pictos/d_1747-fs8.png,2132,3716;x_deadmeat/x_pictos/d_1747-fs8.png,2227,3661;x_deadmeat/x_pictos/d_1747-fs8.png,2471,3553;x_deadmeat/x_pictos/d_1747-fs8.png,3040,3463;x_deadmeat/x_pictos/d_1747-fs8.png,2951,3478;x_deadmeat/x_pictos/d_1109-fs8.png,4970,3870;x_deadmeat/x_pictos/d_1109-fs8.png,307,1891;x_deadmeat/x_pictos/d_1109-fs8.png,1800,3803;x_deadmeat/x_pictos/d_1733-fs8.png,2779,3484;x_deadmeat/x_pictos/d_1733-fs8.png,2335,3594;x_deadmeat/x_pictos/d_1733-fs8.png,2013,3744;x_deadmeat/x_pictos/d_1733-fs8.png,1769,3814;x_deadmeat/x_pictos/d_1733-fs8.png,1643,3834;x_deadmeat/x_pictos/d_1733-fs8.png,1520,3835;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,125,3585;x_deadmeat/x_pictos/d_4561.png,4509,3973;x_deadmeat/x_pictos/d_4565.png,4691,3930;x_deadmeat/x_pictos/d_3628.png,5023,3713;x_deadmeat/x_pictos/d_2847.png,2640,3500;x_deadmeat/x_pictos/d_2847.png,1915,3767;x_deadmeat/x_pictos/d_2847.png,185,399;x_deadmeat/x_pictos/d_2847.png,-155,1943;x_deadmeat/x_pictos/d_2847.png,345,1860;x_deadmeat/x_pictos/d_2847.png,916,3804;x_deadmeat/x_pictos/d_2847.png,1244,3757;x_deadmeat/x_pictos/d_2847.png,844,3860;x_deadmeat/x_pictos/d_2847.png,449,3917;x_deadmeat/x_pictos/d_1771-fs8.png,1347,3789;x_deadmeat/x_pictos/d_1771-fs8.png,1171,3765;x_deadmeat/x_pictos/d_1771-fs8.png,999,3810;x_deadmeat/x_pictos/d_1771-fs8.png,412,3935;x_deadmeat/x_pictos/d_1771-fs8.png,311,3932;x_deadmeat/x_pictos/d_1771-fs8.png,532,3924;x_deadmeat/x_pictos/d_1771-fs8.png,797,3880;x_deadmeat/x_pictos/d_1771-fs8.png,714,3893;x_deadmeat/x_pictos/d_1762-fs8.png,886,2345;x_deadmeat/x_pictos/d_1762-fs8.png,-174,345;x_deadmeat/x_pictos/d_1762-fs8.png,594,1977;x_deadmeat/x_pictos/d_1762-fs8.png,-4,1905;x_deadmeat/x_pictos/d_1762-fs8.png,-158,2419;x_deadmeat/x_pictos/d_1762-fs8.png,-18,2641;x_deadmeat/x_pictos/d_1762-fs8.png,-22,2507;x_deadmeat/x_pictos/d_1762-fs8.png,328,2917;x_deadmeat/x_pictos/d_1762-fs8.png,262,3001;x_deadmeat/x_pictos/d_1762-fs8.png,194,3273;x_deadmeat/x_pictos/d_1762-fs8.png,506,3929;x_deadmeat/x_pictos/d_1762-fs8.png,956,3853;x_deadmeat/x_pictos/d_1762-fs8.png,1110,3811;x_deadmeat/x_pictos/d_1762-fs8.png,1608,3847;x_deadmeat/x_pictos/d_1762-fs8.png,1870,3795;x_deadmeat/x_pictos/d_1762-fs8.png,2180,3679;x_deadmeat/x_pictos/d_1762-fs8.png,2308,3621;x_deadmeat/x_pictos/d_1762-fs8.png,2724,3501;x_deadmeat/x_pictos/d_1762-fs8.png,3212,3417;x_deadmeat/x_pictos/d_1762-fs8.png,3458,3607;x_deadmeat/x_pictos/d_1762-fs8.png,5030,3951;x_deadmeat/x_pictos/d_1762-fs8.png,4774,3943;x_deadmeat/x_pictos/d_1762-fs8.png,4688,4013;x_deadmeat/x_pictos/d_1762-fs8.png,4310,3975;x_deadmeat/x_pictos/d_1762-fs8.png,4370,3413;x_deadmeat/x_pictos/d_1762-fs8.png,4128,3303;x_deadmeat/x_pictos/d_1762-fs8.png,4042,3263;x_deadmeat/x_pictos/d_1762-fs8.png,3768,3115;x_deadmeat/x_pictos/d_1762-fs8.png,3782,2825;x_deadmeat/x_pictos/d_1762-fs8.png,3990,2593;x_deadmeat/x_pictos/d_1762-fs8.png,4246,2431;x_deadmeat/x_pictos/d_1762-fs8.png,4526,2323;x_deadmeat/x_pictos/d_1762-fs8.png,5286,2181;x_deadmeat/x_pictos/d_1762-fs8.png,5086,2199;x_deadmeat/x_pictos/d_1762-fs8.png,4820,2235;x_deadmeat/x_pictos/d_1762-fs8.png,4752,2249;x_deadmeat/x_pictos/d_1694-fs8.png,5340,2147;x_deadmeat/x_pictos/d_1694-fs8.png,4952,2185;x_deadmeat/x_pictos/d_1694-fs8.png,4434,2309;x_deadmeat/x_pictos/d_1694-fs8.png,4556,3989;x_deadmeat/x_pictos/d_1694-fs8.png,4836,3895;x_deadmeat/x_pictos/d_1812-fs8.png,256,3937;x_deadmeat/x_pictos/d_1812-fs8.png,464,3923;x_deadmeat/x_pictos/d_1812-fs8.png,1032,3775;x_deadmeat/x_pictos/d_1812-fs8.png,872,3819;x_deadmeat/x_pictos/d_1812-fs8.png,664,3885;x_deadmeat/x_pictos/d_1694-fs8.png,4236,3351;x_deadmeat/x_pictos/d_1694-fs8.png,3832,3125;x_deadmeat/x_pictos/d_1694-fs8.png,2894,3445;x_deadmeat/x_pictos/d_1694-fs8.png,1290,3729;x_deadmeat/x_pictos/d_1694-fs8.png,374,3905;x_deadmeat/x_pictos/d_1694-fs8.png,214,3235;x_deadmeat/x_pictos/d_1694-fs8.png,198,3051;x_deadmeat/x_pictos/d_1694-fs8.png,358,2867;x_deadmeat/x_pictos/d_1694-fs8.png,696,2053;x_deadmeat/x_pictos/d_1694-fs8.png,216,1841;x_deadmeat/x_pictos/d_1694-fs8.png,-84,1905;x_deadmeat/x_pictos/d_1103-fs8.png,64,367;x_deadmeat/x_pictos/d_1103-fs8.png,5146,2173;x_deadmeat/x_pictos/d_1103-fs8.png,4688,2251;x_deadmeat/x_pictos/d_1103-fs8.png,4116,2469;x_deadmeat/x_pictos/d_1103-fs8.png,5096,3851;x_deadmeat/x_pictos/d_1103-fs8.png,3098,3417;x_deadmeat/x_pictos/d_1103-fs8.png,2536,3503;x_deadmeat/x_pictos/d_1103-fs8.png,1962,3737;x_deadmeat/x_pictos/d_1103-fs8.png,1460,3789;x_deadmeat/x_pictos/d_1103-fs8.png,610,3893;x_deadmeat/x_pictos/d_1103-fs8.png,260,3905;x_deadmeat/x_pictos/d_1103-fs8.png,256,3219;x_deadmeat/x_pictos/d_1103-fs8.png,136,3269;x_deadmeat/x_pictos/d_3004.png,4804,3825;x_deadmeat/x_pictos/d_1103-fs8.png,410,1845;x_transformice/x_evt/x_evt_26/elisah9_trhc.png,2485,3207;x_deadmeat/x_pictos/d_1103-fs8.png,100,1849;x_deadmeat/x_pictos/d_3291.png,2700,58;x_deadmeat/x_pictos/d_3292.png,2450,139;x_deadmeat/x_pictos/d_3283.png,2969,172;x_deadmeat/x_pictos/d_3004.png,4251,3871;x_deadmeat/x_pictos/d_3004.png,4503,3870;x_deadmeat/x_pictos/d_3283.png,2063,166;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,1413,3488;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,5168,3569;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,4868,3588;x_transformice/x_evt/x_evt_01/kjneb75/herbe.png,4562,3607;x_deadmeat/x_pictos/d_20-fs8.png,3013,362;x_deadmeat/x_pictos/d_20-fs8.png,2901,318;x_deadmeat/x_pictos/d_20-fs8.png,2793,274;x_deadmeat/x_pictos/d_20-fs8.png,2637,262;x_deadmeat/x_pictos/d_20-fs8.png,2521,258;x_deadmeat/x_pictos/d_20-fs8.png,2397,258;x_deadmeat/x_pictos/d_20-fs8.png,2281,274;x_deadmeat/x_pictos/d_20-fs8.png,2169,310;x_deadmeat/x_pictos/d_20-fs8.png,2041,354;x_transformice/x_evt/x_evt_01/kjneb75/loupiote2.png,2565,4100" P="" mc="" MEDATA="79,1:80,1;;;;-0;0:::1-"/><Z><S><S T="10" X="2524" Y="931" L="1222" H="340" P="0,0,0.3,0.2,30,0,0,0"/><S T="10" X="2604" Y="737" L="1048" H="522" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2600" Y="1003" L="344" H="1070" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2696" Y="957" L="1222" H="340" P="0,0,0.3,0.2,-30,0,0,0"/><S T="10" X="2578" Y="1013" L="922" H="340" P="0,0,0.3,0.2,60,0,0,0"/><S T="10" X="2720" Y="1117" L="922" H="340" P="0,0,0.3,0.2,-30,0,0,0"/><S T="10" X="2599" Y="875" L="1241" H="340" P="0,0,0.3,0.2,-7,0,0,0"/><S T="12" X="-210" Y="-314" L="10" H="4000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="7" X="5954" Y="4713" L="1693" H="1736" P="0,0,1.1,0.2,-10,0,0,0"/><S T="12" X="5410" Y="900" L="10" H="3000" P="0,0,0,0.5,0,0,0,0" o="324650" m=""/><S T="10" X="2600" Y="424" L="360" H="100" P="0,0,0.3,0.2,0,0,0,0"/><S T="10" X="2260" Y="469" L="360" H="100" P="0,0,0.3,0.2,-15,0,0,0"/><S T="10" X="2940" Y="469" L="360" H="100" P="0,0,0.3,0.2,15,0,0,0"/><S T="10" X="1981" Y="630" L="360" H="100" P="0,0,0.3,0.2,-45,0,0,0"/><S T="10" X="3219" Y="630" L="360" H="100" P="0,0,0.3,0.2,45,0,0,0"/><S T="10" X="1998" Y="991" L="640" H="100" P="0,0,0.3,0.2,245,0,0,0"/><S T="10" X="3202" Y="991" L="640" H="100" P="0,0,0.3,0.2,-245,0,0,0"/><S T="10" X="2373" Y="1440" L="624" H="100" P="0,0,0.3,0.2,215,0,0,0"/><S T="10" X="2827" Y="1440" L="624" H="100" P="0,0,0.3,0.2,-215,0,0,0"/><S T="12" X="1333" Y="463" L="228" H="28" P="1,0,1.2,0.2,0,1,0,0" o="324650" i="-5,-232,x_transformice/x_evt/x_evt_19/svtrixcv/bateau.png"/><S T="7" X="6303" Y="3166" L="2121" H="1800" P="0,0,1.1,0.2,3,0,0,0"/><S T="7" X="5146" Y="2955" L="500" H="1433" P="0,0,1.1,0.2,-8,0,0,0"/><S T="7" X="2851" Y="4139" L="551" H="1206" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="3072" Y="3908" L="549" H="826" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="3743" Y="3482" L="519" H="702" P="0,0,1.1,0.2,-44,0,0,0"/><S T="7" X="4299" Y="3235" L="210" H="1260" P="0,0,1.1,0.2,-60,0,0,0"/><S T="7" X="4343" Y="3173" L="210" H="1260" P="0,0,1.1,0.2,-48,0,0,0"/><S T="7" X="4469" Y="3158" L="280" H="1406" P="0,0,1.1,0.2,-36,0,0,0"/><S T="7" X="4608" Y="3100" L="320" H="1440" P="0,0,1.1,0.2,-24,0,0,0"/><S T="7" X="4823" Y="3006" L="360" H="1408" P="0,0,1.1,0.2,-16,0,0,0"/><S T="7" X="3191" Y="4020" L="923" H="691" P="0,0,1.1,0.2,-45,0,0,0"/><S T="7" X="3989" Y="3553" L="519" H="702" P="0,0,1.1,0.2,-64,0,0,0"/><S T="7" X="4108" Y="3695" L="399" H="653" P="0,0,1.1,0.2,-94,0,0,0"/><S T="7" X="2531" Y="4212" L="551" H="1183" P="0,0,1.1,0.2,-25,0,0,0"/><S T="7" X="2116" Y="4291" L="951" H="1012" P="0,0,1.1,0.2,-15,0,0,0"/><S T="7" X="1610" Y="4374" L="551" H="969" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="1583" Y="4013" L="640" H="278" P="0,0,1.1,0.2,15,0,0,0"/><S T="7" X="866" Y="4331" L="802" H="1133" P="0,0,1.1,0.2,75,0,0,0"/><S T="7" X="788" Y="3726" L="205" H="974" P="0,0,1.1,0.2,80,0,0,0"/><S T="7" X="383" Y="4065" L="205" H="636" P="0,0,1.1,0.2,85,0,0,0"/><S T="7" X="-239" Y="4289" L="1063" H="1405" P="0,0,1.1,0.2,168,0,0,0"/><S T="7" X="-408" Y="3275" L="949" H="974" P="0,0,1.1,0.2,178,0,0,0"/><S T="7" X="696" Y="3446" L="582" H="974" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="625" Y="3069" L="582" H="649" P="0,0,1.1,0.2,40,0,0,0"/><S T="7" X="-670" Y="2648" L="1092" H="974" P="0,0,1.1,0.2,148,0,0,0"/><S T="7" X="297" Y="2598" L="582" H="253" P="0,0,1.1,0.2,30,0,0,0"/><S T="7" X="1" Y="2251" L="582" H="142" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="-571" Y="2030" L="582" H="718" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="-1154" Y="2133" L="603" H="718" P="0,0,1.1,0.2,-10,0,0,0"/><S T="7" X="125" Y="2206" L="582" H="142" P="0,0,1.1,0.2,70,0,0,0"/><S T="7" X="280" Y="2200" L="582" H="382" P="0,0,1.1,0.2,-90,0,0,0"/><S T="7" X="429" Y="2255" L="582" H="382" P="0,0,1.1,0.2,-50,0,0,0"/><S T="7" X="684" Y="2498" L="486" H="517" P="0,0,1.1,0.2,-30,0,0,0"/><S T="7" X="810" Y="2881" L="486" H="517" P="0,0,1.1,0.2,-6,0,0,0"/><S T="12" X="1790" Y="-590" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="4316" Y="-590" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="7" X="930" Y="4474" L="731" H="966" P="0,0,1.1,0.2,95,0,0,0"/><S T="7" X="2084" Y="4458" L="731" H="966" P="0,0,1.1,0.2,95,0,0,0"/><S T="13" X="4988" Y="489" L="71" P="0,0,1,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="4988" Y="380" L="10" H="92" P="0,0,1,0.2,15,0,0,0" o="324650" m=""/><S T="12" X="5045" Y="395" L="10" H="101" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="5029" Y="342" L="58" H="10" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="4569" Y="2308" L="20" H="10" P="0,0,0,0,0,0,0,0" o="324650" m=""/><S T="12" X="263" Y="1873" L="20" H="10" P="0,0,0,0,720,0,0,0" o="324650" m=""/><S T="12" X="829" Y="339" L="58" H="10" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="12" X="788" Y="377" L="10" H="92" P="0,0,1,0.2,15,0,0,0" o="324650" m=""/><S T="12" X="845" Y="392" L="10" H="101" P="0,0,1,0.2,10,0,0,0" o="324650" m=""/><S T="13" X="788" Y="486" L="71" P="0,0,1,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="3695" Y="482" L="199" H="60" P="1,0,1.2,0.2,0,1,0,0" o="324650" i="-30,-197,x_bateaupirate.png"/><S T="13" X="1720" Y="121" L="210" P="0,0,0.3,0.2,0,0,0,0" o="DEE336" c="4"/><S T="12" X="4316" Y="-490" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="12" X="1790" Y="-490" L="3994" H="12" P="0,0,0.3,0.2,0,0,0,0" o="324650" m=""/><S T="7" X="168" Y="1640" L="582" H="382" P="0,0,1.1,0.2,-5,0,0,0"/><S T="7" X="-588" Y="1392" L="1971" H="602" P="0,0,1.1,0.2,-15,0,0,0"/><S T="7" X="5" Y="982" L="582" H="382" P="0,0,1.1,0.2,-20,0,0,0"/><S T="7" X="-353" Y="824" L="930" H="1073" P="0,0,1.1,0.2,-80,0,0,0"/><S T="7" X="-253" Y="1420" L="930" H="1073" P="0,0,1.1,0.2,-110,0,0,0"/><S T="7" X="3336" Y="4640" L="1335" H="1666" P="0,0,1.1,0.2,-87,0,0,0"/><S T="7" X="4689" Y="4679" L="1335" H="1196" P="0,0,1.1,0.2,-90,0,0,0"/><S T="9" X="1000" Y="2250" L="4000" H="3500" P="0,0,0,0,0,0,0,0" m=""/><S T="9" X="5000" Y="2250" L="4000" H="3500" P="0,0,0,0,0,0,0,0" m=""/></S><D><P X="3015" Y="3497" T="79" P="0,0"/><P X="2617" Y="3557" T="79" P="0,0"/><P X="2422" Y="3614" T="79" P="0,0"/><P X="2098" Y="3768" T="79" P="0,0"/><P X="1740" Y="3870" T="79" P="0,0"/><P X="240" Y="3080" T="79" P="0,0"/><P X="302" Y="3009" T="79" P="0,0"/><P X="-78" Y="2575" T="79" P="0,0"/><P X="58" Y="1925" T="79" P="0,0"/><P X="1687" Y="3849" T="85" C="4B8E72" P="0,0"/><P X="2825" Y="3494" T="86" C="BB5631" P="0,0"/><P X="256" Y="3290" T="81" P="0,0"/><P X="189" Y="1904" T="81" P="0,0"/><P X="3610" Y="3133" T="88" P="0,0"/><P X="3483" Y="3269" T="134" P="0,0"/><P X="848" Y="2302" T="79" P="0,0"/><P X="962" Y="2507" T="79" P="0,0"/><P X="1062" Y="2974" T="79" P="0,0"/><P X="1170" Y="3333" T="79" P="0,0"/><P X="1243" Y="3539" T="79" P="0,0"/><P X="1281" Y="3710" T="79" P="0,0"/><DS X="2604" Y="361"/></D><O><O X="2885" Y="1537" C="4" P="110,1"/><O X="2821" Y="1715" C="4" P="-70,0"/><O X="2758" Y="1892" C="4" P="110,0"/><O X="2695" Y="2066" C="4" P="110,0"/><O X="2631" Y="2244" C="4" P="110,1"/><O X="2565" Y="2244" C="4" P="-110,1"/><O X="2501" Y="2066" C="4" P="-110,0"/><O X="2438" Y="1892" C="4" P="-110,0"/><O X="2374" Y="1714" C="4" P="-110,0"/><O X="2311" Y="1537" C="4" P="-110,1"/><O X="2280" Y="1449" C="11" P="0"/><O X="2917" Y="1449" C="11" P="0"/><O X="2343" Y="1626" C="14" P="0"/><O X="2407" Y="1804" C="14" P="0"/><O X="2470" Y="1979" C="14" P="0"/><O X="2533" Y="2154" C="14" P="0"/><O X="2598" Y="2332" C="11" P="0"/><O X="2663" Y="2156" C="14" P="0"/><O X="2726" Y="1977" C="14" P="0"/><O X="2789" Y="1802" C="14" P="0"/><O X="2854" Y="1626" C="14" P="0"/><O X="2167" Y="1440" C="67" P="-120,0"/><O X="2313" Y="1690" C="67" P="-120,0"/><O X="2458" Y="1942" C="67" P="-120,0"/><O X="2096" Y="1315" C="11" P="0"/><O X="2385" Y="1814" C="14" P="0"/><O X="2240" Y="1565" C="14" P="0"/><O X="2451" Y="1929" C="22" P="0"/><O X="2744" Y="1929" C="22" P="0"/><O X="2955" Y="1565" C="14" P="0"/><O X="2737" Y="1942" C="67" P="120,0"/><O X="3099" Y="1315" C="11" P="0"/><O X="2810" Y="1815" C="14" P="0"/><O X="2882" Y="1690" C="67" P="120,0"/><O X="3028" Y="1440" C="67" P="120,0"/><O X="2955" Y="1565" C="14" P="0"/><O X="3101" Y="1316" C="11" P="0"/><O X="2748" Y="1920" C="22" P="0"/><O X="2809" Y="1818" C="14" P="0"/></O><L/></Z></C>')
tfm.exec.addNPC("Rheylean Darther",rd)
tfm.exec.addNPC("Keith Under",ku)
tfm.exec.addNPC("Mayra Flowers",mf)
tfm.exec.addNPC("Dylan Reigns",dr)
tfm.exec.addNPC("Camille Sanders",cs)
tfm.exec.addNPC("Daniel Winngs",dw)
tfm.exec.addNPC("King Pirate",kp)
tfm.exec.addNPC("Aaron Grand",ag)

tfm.exec.setRoomMaxPlayers(40)
shaman=""; ratos=0; alives=0; cannons=6; z=0; data={}; mode="wait"; loop=0; timer=0; xml=''; time_passed=0; time_remain=0;
powerups={x1=-1,x2=-1,x3=-1,x4=-1,y1=-1,y2=-1,y3=-1,y4=-1,t1=0,t2=0,t3=0,t4=0}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(0,0,message,name,250,100,300,true)
	end
end
function defineShaman()
	max_score=0
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].score >= max_score and not tfm.get.room.playerList[name].isShaman then
			shaman=name
			tfm.exec.setShaman(shaman)
			tfm.exec.setPlayerScore(shaman,-1,false)
			tfm.exec.setShamanMode(shaman,1)
			tfm.exec.movePlayer(shaman,2600,-550,false,0,0,false)
			showMessage("<ROSE>Não esqueça de se mover, ou você perderá sua vez como shaman!",name)
			alives=alives-1
			max_score=tfm.get.room.playerList[name].score
			break
		end
	end
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function showWater(name)
	tfm.exec.addImage("17f74387366.png","!1",-600,513,name,20,2.75,0,1)
	tfm.exec.addImage("17f74378b9a.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f7437d864.png","?1",-600,471,name,1,1,0,1)
	tfm.exec.addImage("17f74378b9a.png","!1",-600,471,name,1,1,0,0.44)
	tfm.exec.addImage("17f74382569.jpg","?1",-600,513,name,2,1.375,0,1)
end
function eventTalkToNPC(name, npc)
	if npc == "Rheylean Darther" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Rheylean Darther] <N>Quem ousa a mergulhar nas minhas sagradas águas, e interromper a paz de <ROSE><b>Rheylean Darther</b>?<br><br><BL>Ah, é só mais um desavisado... <J>SAIA DE MINHA PRESENÇA AGORA, OU SENTIRÁ A MINHA FÚRIA!",name)
		else
			showMessage("<V>[Rheylean Darther] <VP>Vá, e devore todos estes enfadonhos em meu nome! <b>AGORA!</b>",name)
		end
	elseif npc == "Keith Under" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Keith Under] <N>Você tem muita coragem de estar aqui no mar profundo. Não achei que você sobreviveria. Acho que aqui o <VP>shaman<N> não me encontra. Você o viu?<br><br><R>Espera... Você o viu? Onde ele está? Se estiver por perto, preciso sair daqui AGORA!",name)
		else
			showMessage("<V>[Keith Under] <N>Entre razões e emoções, a saída... Que barulho foi esse?<br><br><J><b>AH, ELE DE NOVO NÃO! SAIA DE MIM AGORA!</b>",name)
		end
	elseif npc == "Mayra Flowers" then
		showMessage("<V>[Mayra Flowers] <N>Muuuuuuuu! <font face='Segoe UI Symbol'>(●'◡'●)<font face='Verdana'>",name)
	elseif npc == "Dylan Reigns" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Dylan Reigns] <N>Oi. Me chame de Dylan Reigns. Sou uma das sobreviventes daquela tragédia catastrófica, e queria...<br><R>O MONSTRO ESTÁ VINDO! CORRA!!",name)
		else
			showMessage("<V>[Dylan Reigns] <R>O MONSTRO ESTÁ AQUI! ALGUÉM ME TIRE DAQUI!",name)
		end
	elseif npc == "Camille Sanders" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Camille Sanders] <N>Sou uma náufraga.<br><br>Há pouco tempo, um grande cataclisma mágico aconteceu e agora estou aqui, no meio deste oceano.<br><br>Recebi boatos de que guardiões muito poderosos estão guardando este lugar, mas não tenho como descer para descobrir.<br><br>O que sei, é que um monstro horroroso chamado <VP>shaman <N>está nos caçando para nos devorar. <br><br>Você precisa fazer de tudo para sobreviver neste lugar.<br>Seja lá como for.",name)
		else
			showMessage("<V>[Camille Sanders] <N>Olha só quem está aqui... Se não é o tal do <VP>shaman...<br><br><N>Preciso contar para... Espera, aquele é mesmo o <VP>shaman<N>?<br><br><J><b>FUJAM TODOS!!</b>",name)
		end
	elseif npc == "Daniel Winngs" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Daniel Winngs] <N>Eu era guia turístico desta região, até o momento do grande cataclisma acontecer e acabar com tudo o que eu tinha.<br><br>Agora, depois de muita luta, consegui descer até o fundo do mar e descobrir o que realmente existe lá.<br><br>E vi que ele está tomado por guardiões desconhecidos que podem até mesmo te prender no fundo do mar.<br><br>Portanto, tenha cuidado se for entrar no mar. Talvez seja um caminho sem volta.<br><br>Ah, e tome cuidado com um certo <VP>shaman<N>. Ele não quer a gente vivo, digo isso porque quase fui engolido por ele...",name)
		else
			showMessage("<V>[Daniel Winngs] <N>Saia daqui agora, seu bicho fedorento!",name)
		end
	elseif npc == "King Pirate" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[King Pirate] <N>Todos a bordo, marujos!<br>Ah, esqueci. Não tenho mais marujos. Perdi todos naquele grande cataclisma.<br>Mas gostei do seu visual. Me lembra bastante os dos meus antigos marujos...<br><br>Infelizmente sei que tenho quase certeza que não saio vivo daqui. O tal <VP>shaman<N> está no fundo do mar pronto para me engolir. E se fosse você, sairia logo daqui. Só estou aqui porque não há muito o que eu fazer...",name)
		else
			showMessage("<V>[King Pirate] <N>Pelas barbas do pirata! O monstro está aqui!<br><br><VP>Evacuar navio agora! Ah!",name)
		end
	elseif npc == "Aaron Grand" then
		if not tfm.get.room.playerList[name].isShaman then
			showMessage("<V>[Aaron Grand] <N>Não sei se considero isso uma saudação. Meu mental está destruído depois daquilo tudo que presenciei.<br><br>E como se não bastasse, o pior ainda está por vir. Um grande <VP>shaman<N> submarino está vindo nos devorar. Se você fosse, sairia logo daqui...<br><br>Mas já que não quer, fique um pouco aqui. Vamos conversar.",name)
		else
			showMessage("<V>[Aaron Grand] <N>Qual será sua intenção? Tirar minha vida com suas próprias mãos? Nunca!",name)
		end
	end
end
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			showMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			mode="end"
			shaman=""
			tfm.exec.setGameTime(10)
			for n,_ in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(n)
				tfm.exec.playerVictory(n)
				ui.removeTextArea(300,n)
			end
		end
	end
	if alives <= 0 then
		mode="end"
		shaman=""
		tfm.exec.setGameTime(15)
		showMessage("<VP><b>O shaman matou todos os ratos e venceu o jogo!</b><br><N>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
end
function eventPlayerLeft(name)
	ratos=ratos-1;
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,1,false)
	ui.setBackgroundColor("#5FA9D4")
	showWater(name)
	newData={
	["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["moved"]=0; ["imageid"]=-1; ["imageid2"]=-1; ["imageid3"]=-1; ["imageid4"]=-1; ["imaget"]=5;
	};
	data[name] = newData;
	ratos=ratos+1;
	showMessage("<font color='#0080ff'><b>Bem-vindos ao module #watercatch!</b><br><J>Digite !help para ver a ajuda deste module.<br><br><N>Module e mapa criados por Morganadxana#0000.<br><br><BL>Atenção: Conexões lentas com a Internet podem fazer com que as artes da água demorem para carregar.<br><br>Caso o mapa não carregue, saia do jogo e entre novamente.",name)
	data[name].imageid2 = tfm.exec.addImage("17a53e1f94c.png",":1",0,350,name)
	data[name].imageid3 = tfm.exec.addImage("17ae4e47000.png","&1",2,22,name)
	data[name].imageid4 = tfm.exec.addImage("17ae4e48770.png","&1",670,22,name)
	data[name].imaget=5
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0xf0f0f0,140,90,520,265,"Ajuda do Module #watercatch","O objetivo é bem simples: <b>Fugir do shaman</b>, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br><R><b>Shamans, não esqueçam de se mexer, ou irão morrer AFK!</b><br><br><VP>Os quadrados marcados por <ROSE>'!'<VP> são powerups, que geram efeitos aleatórios nos ratos.<J><br>Estes powerups podem ser acionados pressionando ESPAÇO em cima deles.<br><N>Você pode ver os possíveis efeitos dos powerups indo no Menu e clicando em Powerups. Vale ressaltar que eles funcionam apenas depois que o shaman for liberado.<br><br><N>Caso você seja shaman, você tem um limite de <b>6</b> objetos que podem ser utilizados. Exceder este limite fará com que a partida acabe.")
	end
	if message == "powerups" then
		showMenu(name,0xf0f0f0,140,76,520,315,"Powerups do Module #watercatch","<font size='11'>Os seguintes powerups estão disponíveis no momento:<br><ROSE><b>• CAIXA</b><N><br>Faz aparecer uma caixa de acompanhamento em cima de você.<br><ROSE><b>• OXIGÊNIO</b><N><br>Aumenta o seu nível de oxigênio em 40%.<br><ROSE><b>• VELOCIDADE</b><N><br>Te dá um grande impulso de velocidade.<br><ROSE><b>• AFUNDAR</b><N><br>Cria uma anomalia temporária que leva todos os ratos em direção ao fundo do lago.<br><ROSE><b>• MEEP</b><N><br>Te dá o poder de usar o Meep!<br><ROSE><b>• SUFOCO</b><N><br>Diminui o seu nível de oxigênio em 25%. Caso seu nível esteja abaixo disso e você pegue este powerup, você morrerá afogado.<br><ROSE><b>• CONGELAR</b><N><br>Congela o seu rato.<br><ROSE><b>• QUEIJO</b><N><br>Dá queijo para o seu rato. Caso você esteja dentro do lago, você provavelmente será levado para o fundo dele.<br><ROSE><b>• REDUZIR</b><N><br>Reduz temporariamente o tamanho do seu rato.")
	end
	if message == "creditos" then
		showMenu(name,0xf0f0f0,140,90,520,130,"Créditos","As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código original para o Português<br><ROSE><b>• Spectra_phantom#6089</b><N> - Ideia original e criação do mapa e das artes")
	end
	if message == "changelog" then
		showMenu(name,0xf0f0f0,140,90,520,90,"Changelog da Versão 3.0.3","• Correções de bugs")
	end
	if (message:sub(0,2) == "tc") then
		if tfm.get.room.playerList[name].isShaman == false then
			for n,_ in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[n].isShaman == false then
					showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
				end
			end
		end
	end
	if name == "Morganadxana#0000" or verifyAdmin(name) == true then
		if (message:sub(0,3) == "msg") then
			showMessage("<VP>• [FunCorp - <b>"..name.."</b>] "..message:sub(5).."")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
	end
end
function eventSummoningEnd(name,id,x,y)
	if time_passed >= 60 then
		if id > 0 then
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
	end
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage("<R>Você não pode mais usar objetos! Invocar um objeto fará com que você morra e a partida termine!",name)
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
					data[name].o=data[name].o-25
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
					showMessage("<N>"..name.." <J>ativou o powerup <ROSE><b>REDUZIR!</b>")
					reduzir(name)
				end
			end
		end
	end
	if key == 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if data[name].moved == 0 then
			data[name].moved=1
		end
	end
end
function reset()
	if ratos >= 4 then
		mode="hide"
		shaman=""
		alives=0
		for n,p in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[n].isShaman then
				tfm.exec.setPlayerScore(n,0,false)
			end
			tfm.exec.respawnPlayer(n)
			tfm.exec.setShaman(n,false)
			for i=32,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			tfm.exec.giveMeep(n,false)
			alives=alives+1
			data[n].o=99; data[n].moved=0; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false;
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		defineShaman()
		ui.setBackgroundColor("#5FA9D4")
		z=-1
		cannons=6
		ui.removeTextArea(22,nil)
		mode="hide"
		tfm.exec.setGameTime(60)
	else
		mode="wait"
		showMessage("<R>São necessários pelo menos 4 ratos para jogar este module.")
		tfm.exec.setGameTime(20)
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
	end
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=12
end
function dropPlayer(name)
	data[name].i=tfm.exec.addShamanObject(61,tfm.get.room.playerList[name].x,tfm.get.room.playerList[name].y+10,0,0,0,false)
	data[name].t=6
end
function reduzir(name)
	tfm.exec.changePlayerSize(name,0.5)
	data[name].t=14
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/1000)
	time_remain=math.ceil(r/1000)
	ui.setMapName("<font color='#0080ff'><b>#watercatch!</b><N> Versão <J><b>v3.0.3</b><N> - <VP>versão reduzida <N>- criada por <ROSE><b>Morganadxana#0000</b><")
	local m=math.floor(r/60000)
	local s=math.floor((((m*60000)-r) * -1) / 1000)
	ui.addTextArea(-1,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
	ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	if s < 10 then
		ui.addTextArea(-1,"<font size='45'><font face='Trebuchet MS'><font color='#222222'><b><i>"..m..":0"..s.."</b>",n,569,22,110,54,0,0,1.0,true)
		ui.addTextArea(-2,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..m..":0"..s.."</b>",n,566,19,110,54,0,0,1.0,true)
	end
	if mode == "wait" then
		if time_remain < 1 then
			reset()
		end
	end
	if mode == "hide" then
		if time_remain <= 30 and time_remain >= 29 then
			for n,p in next,tfm.get.room.playerList do
				if data[n].moved == 0 then
					tfm.exec.killPlayer(n)
				end
			end
		end
	end
	if mode == "game" then
		if loop >= 16 then
			if time_passed >= 60 then
				for i=1,4 do
					genPowerup(i,math.random(1,11),math.random(500,4700),math.random(450,1500))
				end
				loop=0
			end
		end
	end
	if mode == "game" or mode == "hide" then
		ui.addTextArea(31,"<font size='45'><font color='#222222'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,135,22,70,54,0,0,1.0,true)
		ui.addTextArea(30,"<font size='45'><font color='#d0d0d0'><font face='Trebuchet MS'><b><i>"..alives.."</b>",n,132,19,70,54,0,0,1.0,true)
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
		if tfm.get.room.playerList[n].y <= 495 then
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: 0m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		else
			ui.addTextArea(295,"<p align='center'><font size='13'>Profundidade: "..math.floor(math.pow(tfm.get.room.playerList[n].y-495,1.735)/2500).."m",n,310,57,180,21,0x000001,0x000001,0.75,true)
		end
		if data[n] then
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
			end
			if data[n].t > 0 then
				data[n].t=data[n].t-0.5
				if data[n].t <= 0 then
					tfm.exec.removeObject(data[n].i)
					tfm.exec.freezePlayer(n,false)
					tfm.exec.removeCheese(n)
					tfm.exec.changePlayerSize(n,1)
				end
			end
			if not tfm.get.room.playerList[n].isDead then
				if mode == "game" or mode == "hide" then
					if tfm.get.room.playerList[n].y < 500 then
						if data[n].o < 99 then
							data[n].o=data[n].o+1
						end
						data[n].y=0
					else
						if tfm.get.room.playerList[n].y <= 1200 then
							data[n].o=data[n].o-0.3
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 1200 and tfm.get.room.playerList[n].y <= 3500 then
							data[n].o=data[n].o-0.4
							data[n].c=0
						elseif tfm.get.room.playerList[n].y > 3500 then
							data[n].o=data[n].o-0.8
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
		if mode == "game" or mode == "hide" then
			if data[n].o > 30 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0xf0f0f0,0x808080,1.0,true)
				data[n].d=0
				tfm.exec.setNameColor(n,0xc2c2da)
			elseif data[n].o > 0 then
				ui.addTextArea(10,"",n,8,390,(data[n].o*7.9),3,0x801500,0xa01000,1.0,true)
				data[n].d=data[n].d+1
				tfm.exec.setNameColor(n,0xff4500)
				if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 598 then
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
	if r <= 2000 and mode == "hide" then
		mode="game"
		tfm.exec.setGameTime(240+math.ceil(alives*2.4))
		ui.removeTextArea(22,nil)
		showMessage("<J><b>O shaman foi liberado! Salvem-se quem puder!</b><br><N>Os itens marcados com <BL>!<N> são poderes especiais, que podem trazer efeitos positivos ou negativos aos ratos. Aperte ESPAÇO para usá-los.<br><br><ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.")
		for n,p in next,tfm.get.room.playerList do
			ui.addTextArea(300,"",n,8,390,782,3,0x202020,0x121212,1.0,true)
		end
		tfm.exec.movePlayer(shaman,2600,196,false,0,0,false)
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
		end
		tfm.exec.killPlayer(shaman)
		shaman=""
		showMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
		ui.removeTextArea(300,n)
	end
	if r <= 200 and mode == "end" then
		reset()
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a>",name,355,85,90,60,0x000001,0x000001,0.80,true)
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
	if callback == "change" then
		eventChatCommand(name,"changelog")
	end
end
reset()
end

initCd3 = function()
-- Script do module Cidade Dorme, versão RTM 2927.021 LTS, desenvolvido por Rakan_raster#0000.
-- NÃO SE ESQUEÇA DE COLOCAR O SEU NOME NA LINHA 5 ANTES DE INICIAR!!
-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.

admin="" -- colocar seu nome aqui, funcorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
modo="inicial"; contador=0; rodada=0; data={}; templist={};
mapas={"@3110915","@3148619","@4411212","@4477478","@5832272","@3203198","@5113656","@6380942","@7730312","@7712670","@7896560"}
tfm.exec.setRoomMaxPlayers(40)
system.disableChatCommandDisplay("reiniciar")
system.disableChatCommandDisplay("help")
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : <br><BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : <br><BL>"..temp_text.."")
		end
	end
end
function showDebugText(text)
	for _,name in next,{"Rakan_raster#0000","Xayah_raster#7598","Aurelianlua#0000","Forzaldenon#0000","Skyymellu#0000"} do
		showMessage(text,name)
	end
end
function getTypesPlayers()
	quant={assasinos=0,detetives=0,medicos=0}
	for name,player in next,tfm.get.room.playerList do
		if data[name] and data[name].type == 1 and not tfm.get.room.playerList[name].isDead then
			quant.assasinos=quant.assasinos+1
		end
		if data[name] and data[name].type == 2 and not tfm.get.room.playerList[name].isDead then
			quant.medicos=quant.medicos+1
		end
		if data[name] and data[name].type == 3 and not tfm.get.room.playerList[name].isDead then
			quant.detetives=quant.detetives+1
		end
	end
end
function checkNickname(name)
	for i=1,rawlen(jogadores.lista) do
		if jogadores.lista[i] == name then
			return true
		end
	end
end
function eventChatCommand(name,comando)
	if comando == "reiniciar" then
		if name == "Rakan_raster#0000" or name == "Xayah_raster#7598" or name == "Aurelianlua#0000" or name == "Forzaldenon#0000" or name == "Skyymellu#0000" or name == admin then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
	if comando == "help" then
		showMessage("<p align='center'><VP><b>Bem-vindo ao module Cidade Dorme.</b><br><br><p align='left'><N>Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas.<br><br>O jogo consiste basicamente em 4 classes de jogadores:<br><R>• Assasinos: <N>São aqueles que irão tentar matar os outros ratos, não importando suas funções.<br><BL>• Médicos: <N>São aqueles que irão tentar salvar os jogadores dos assasinos.<br><VP>• Detetives: <N>São aqueles que irão tentar descobrir e matar os assasinos.<br><J>• Vítimas: <N>Ficam só rezando pra não serem mortos.<br><br>O jogo acaba sempre quando todos os assasinos, detetives ou vítimas são mortos.<br><br><ROSE>Quaisquer bugs ou problemas reporte para Rakan_raster#0000.",name)
	end
end
function eventNewGame()
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.setPlayerScore(name,0,false)
		data[name].type=0
		if string.find(tfm.get.room.name,name) then
			admin=name
			showMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar ou reiniciar a partida.")
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
	rodada=0
	ui.setMapName("<N><b>Cidade Dorme v3</b> <VP>RTM 2927.021 LTS <N>- por <J>Rakan_raster#0000<")
end
function escolherAssasinos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=1
		quant.assasinos=quant.assasinos+1
		showMessage("<J>Você foi escolhido(a) como assasino(a).<br><br>Sua função será matar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja matar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<R>Assasino: "..name.."")
	end
end
function escolherMedicos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=2
		quant.medicos=quant.medicos+1
		showMessage("<J>Você foi escolhido(a) como médico(a).<br><br>Sua função será salvar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<BL>Médico: "..name.."")
	end
end
function escolherDetetives(name)
	if data[name] and data[name].type == 0 then
		data[name].type=3
		quant.detetives=quant.detetives+1
		showMessage("<J>Você foi escolhido(a) como detetive.<br><br>Sua função será de tentar descobrir quem são os assasinos e matar eles. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer. Não digite mais nada além do nome do usuário!<br>",name)
		showDebugText("<VP>Detetive: "..name.."")
	end
end
function eventNewPlayer(name)
	if not data[name] then
		showMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 2927.021 LTS<br><p align='left'>",name)
	end
	data[name]={type=-1,morre=false}
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if data[name] and data[name].type == 0 then
		data[name].type=-1
	end
	getTypesPlayers()
	for i=1,rawlen(jogadores.lista) do
		if jogadores.lista[i] == name then
			table.remove(jogadores.lista,i)
			jogadores.vivos=jogadores.vivos-1
		end
	end
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in next,tfm.get.room.playerList do
		if not tfm.get.room.playerList[name].isDead then
			table.insert(jogadores.lista,name)
		end
	end
	getTypesPlayers()
	data[name].type=-1
end
function definirLimites()
	if jogadores.vivos < 8 then
		limites.assasinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 8 and jogadores.vivos < 14 then
		limites.assasinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 14 and jogadores.vivos < 20 then
		limites.assasinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 20 and jogadores.vivos < 26 then
		limites.assasinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 26 and jogadores.vivos < 32 then
		limites.assasinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 32 then
		limites.assasinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.detetives do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearDetetives()
end
function sortearAssasinos()
	for i=1,limites.assasinos do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherAssasinos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos: <R><b>"..quant.assasinos.."</b>  <V>|  <J>Detetives: <VP><b>"..quant.detetives.."</b>  <V>|  <J>Médicos: <N><b>"..quant.medicos.."</b>  <V>|  <N>Rodada: <J><b>"..rodada.."</b>  <BL>|  <N><b>Cidade Dorme v3</b> <VP>RTM 2927.021 LTS<")
	end
	if contador == 3 then
		if admin == "" then
			showMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00cd3#Spectra_phantom#6089</b><br><br>Em caso de um FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
			contador=-65536
		else
			showMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 2927.021 LTS<br><p align='left'>")
		end
	end
	if contador == 10 then
		showMessage("<VP>Digite !help caso não saiba como funciona este jogo.")
	end
	if contador == 35 then
		jogadores.lista={}
		templist={}
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				jogadores.vivos=jogadores.vivos+1
				data[name]={type=0,morre=false}
				table.insert(jogadores.lista,name)
				table.insert(templist,name)
			end
		end
		definirLimites()
		if jogadores.vivos >= 5 then
			showMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><br><ROSE><b>POR FAVOR, NINGUÉM REVELE SUAS FUNÇÕES PORQUE ESTRAGA O JOGO!!</b>")
		else
			showMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=990
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in next,tfm.get.room.playerList do
			if data[name].type == 0 then
				showMessage("<J>Você foi escolhido como vítima.",name)
			end
		end
	end
	if contador == 48 then
		showMessage("<J>A rodada será iniciada em 5 segundos! SE PREPAREM!")
		jogadores.vitimas=0
	end
	if contador == 53 then
		showMessage("<VP>O JOGO COMEÇOU!")
		rodada=rodada+1
	end
	if contador == 58 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 1 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(101,2,"Quem deseja matar?",name,110,220,580,true)
				showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
			end
		end
	end
	if contador == 83 then
		if quant.medicos > 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 1 then
					ui.addPopup(101,0,"",name,-8910,325,20,true)
				end
				if data[name] and data[name].type == 2 and tfm.get.room.playerList[name].isDead == false then
					ui.addPopup(102,2,"Quem deseja salvar dos assasinos?",name,110,220,580,true)
					showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
				end
			end
		else
			contador=107
		end
	end
	if contador == 108 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 2 then
				ui.addPopup(102,0,"",name,-8910,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Hora da verdade! Vamos ver quem morreu...")
	end
	if contador == 115 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<J>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
				elseif data[name].type == 2 then
					showMessage("<R>Os assasinos mataram o médico <b>"..name.."!</b>")
				elseif data[name].type == 3 then
					showMessage("<R>Os assasinos mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
		if jogadores.vitimas == 0 then
			showMessage("<VP>Ufa! Ninguém foi morto!")
		end
	end
	if contador == 120 then
		if quant.assasinos == 0 and quant.detetives == 0 then
			showMessage("<N><b>Todos os assasinos e detetives foram mortos! Temos um empate!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		else
			showMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 125 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 3 and tfm.get.room.playerList[name].isDead == false then
				ui.addPopup(103,2,"Quem você acha que é o assasino?",name,110,220,580,true)
				showMessage("<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag!",name)
			end
		end
	end
	if contador == 150 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].type == 3 then
				ui.addPopup(103,0,"",name,-8910,325,20,true)
			end
		end
		showMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 155 then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[name].type == 0 then
					showMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[name].type == 1 then
					showMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[name].type == 2 then
					showMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[name].type == 3 then
					showMessage("<J>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 160 then
		if quant.assasinos == 0 and quant.detetives == 0 then
			showMessage("<N><b>Todos os assasinos e detetives foram mortos! Temos um empate!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.assasinos == 0 then
			showMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		elseif quant.detetives == 0 then
			showMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=985
		else
			showMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=42
		end
	end
	if contador >= 1015 then
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 58 and contador <= 83 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 81 then
				ui.addPopup(101,2,"Quem deseja matar?",name,110,220,580,true)
			end
		else
			if data[message] and data[message].morre == false and tfm.get.room.playerList[message].isDead == false then
				data[message].morre=true
				jogadores.vitimas=jogadores.vitimas+1
				showMessage("Você decidiu matar o jogador "..message..".",name)
				showDebugText(""..name.." decidiu matar o jogador "..message..".")
			end			
		end
	end
	if id == 102 and contador >= 83 and contador <= 108 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 106 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos?",name,110,220,580,true)
			end
		else
			if data[message] and tfm.get.room.playerList[message].isDead == false then
				if data[message].morre == true then
					jogadores.vitimas=jogadores.vitimas-1
				end
				data[message].morre=false
				showMessage("Você decidiu salvar o jogador "..message..".",name)
				showDebugText(""..name.." decidiu salvar o jogador "..message..".")
			end
		end
	end
	if id == 103 and contador >= 125 and contador <= 150 then
		if not checkNickname(message) == true or message == name then
			showMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			if contador <= 148 then
				ui.addPopup(103,2,"Quem você acha que é o assasino?",name,110,220,580,true)
			end
		else
			if data[message] and data[message].morre == false and tfm.get.room.playerList[message].isDead == false then
				data[message].morre=true
				showMessage("Você acha que "..message.." é o assasino.",name)
				showDebugText(""..name.." acha que o assasino é "..message..".")
			end
		end
	end
end
tfm.exec.newGame(mapas[math.random(#mapas)])
end

initMountain = function()
for _,f in next,{"AutoNewGame","AutoTimeLeft","AfkDeath","AutoShaman","AutoScore","DebugCommand","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"help","powerups","creditos","changelog"} do
	system.disableChatCommandDisplay(g)
end
number_scale={8240,7400,6760,6230,5760,5350,4970,4620,4260,4000,3693,3417,3175,2900,2650,2390,2180,1950,1750,1550,1360,1150,935,770}
data={}; lang={}; loop=0; map_count=0; event_selected=0; running=false; pass_int=0; falt_int=0; run_int=0; event_int=0; endgame=false; changed=false; vencedor="";
map="@7901662"; xml2=''
ground={type = 12,width = 10,height = 210,foregound = 1,friction = 0.0,restitution = 1.0,angle = 0,color = 0xffffff,miceCollision = true,groundCollision = true,dynamic = false}
powerups={wind=false,meteor=false,gravity=false,cheese=false}
events_pt={"Fúria da Tormenta","Chuva de Meteoros","Anomalia Gravitacional","Queijo para Todos"}
events_en={"Wind Fury","Meteor Rain","Gravity Anomaly","Cheese for All"}
power_d={p2={6,8,10,12},p3={12,14,16,18,20,22}}
lang.br = {
	mapname = "<N><b>#mountain</b>  <V>-  <N>versão <ROSE>v1.0.7   <G>|   <N>Desenvolvido por <J>Morganadxana#0000<",
	enter = "<N>Bem-vindo ao module <J><b>#mountain!</b><br><N>Você tem 3 minutos para escalar a grande montanha que há pelo caminho!<br><br><ROSE>Versão v1.0.7 - desenvolvido por Morganadxana#0000<br><VP>O module foi atualizado! Para descobrir as novidades, digite !changelog.",
	newgame = "<N>Caso não saiba o que fazer neste module, digite <b>!help</b>.",
	getready = "<J>Se prepare! A estrada para a montanha será liberada em breve!",
	start = "<VP><b>E que comece a batalha!</b>",
	event1 = "O evento",
	event2 = "será iniciado em instantes, e terá duração de ",
	event3 = "segundos!",
	event4 = " começou! Salve-se quem puder!",
	t10secs = "<font color='#ff8000'>Restam apenas 10 segundos! Apenas o rato que estiver mais alto sobreviverá!",
	winner = "é o grande vencedor!",
	scaled = "Ele(a) subiu ",
	recognized = "metros e agora é reconhecido pelos deuses da montanha!",
	event5 = " foi encerrado!",
	reached2 = "<G>Você atingiu os 2000 metros de altura.<br>Ventos bem gelados começam a te rodear e você começa a sentir falta de ar.",
	reached3 = "<G>Você atingiu os 5000 metros de altura.<br>Já está impossível de suportar o extremo frio, e você começa a ter sérias dificuldades para respirar.",
	reached4 = "<G>Você atingiu os 10000 metros de altura.<br>As correntes geladas começam a te fazer congelar, e seu rato passa a ter um sério problema de asfixia devido a falta de ar.",
	reached5 = "<G>Você atingiu os 20000 metros de altura.<br>Você começa a ver as estrelas muito mais claramente, mesmo no dia claro. No entanto, isto é um péssimo sinal. O ar rarefeito e as baixíssimas temperaturas fazem seu rato morrer aos poucos.",
	reached6 = "<VP>Você chegou no pico da montanha! Os deuses reconheceram sua bravura e coragem e te acolheram para o céu!",
	reached7 = " <VP>chegou até o topo da montanha!<br><N>Ele(a) agora se integra nas estrelas e passa a brilhar como nunca!",
	nowinners = "<R>Não há vencedores!",
	help = "<p align='center'><VP><b>Bem-vindo ao module #mountain.</b><br><br><p align='left'><N>Este modo é bem simples. O objetivo é subir o máximo possível a grande montanha que há pela frente.<br><br>No entanto, os deuses da montanha estão furiosos, e podem atacar com vários contratempos.<br><br>A partida acaba depois de 3 minutos, quando todos os ratos morrem ou quando alguém chega no pico da montanha.<br><br><ROSE>Quaisquer bugs ou problemas reporte para Morganadxana#0000.",
	powerups = "<G>• Fúria da Tormenta: <N>Correntes de vento começam a pairar em volta da montanha.<br><G>• Chuva de Meteoros: <N>Meteoros começam a cair do céu, fazendo com que você caia.<br><G>• Anomalia Gravitacional: <N>Um campo gravítico intenso aparece na montanha, alterando de forma aleatória a gravidade do mapa.<br><G>• Queijo para Todos: <N>Todos os jogadores recebem queijo.",
	credits = "As seguintes pessoas ajudaram no desenvolvimento deste module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Desenvolvedora do código e criadora do mapa<br><ROSE><b>• Rakan_raster#0000</b><N> - Tradução do código para o Inglês<br><ROSE><b>• Spectra_phantom#6089</b><N> - Criação das artes",
	memory_error = "<R>Aviso: Não há mais memória disponível para o Transformice. Para continuar jogando este module, saia do jogo e entre novamente.",
	juliahenderson = "Você não me acha linda?",
	andersondarther = "Não ligue para ela. Sempre gosta de se exibir com seus visuais...<br><br>Agora falando sério, os deuses escondem um segredo gigante nesta montanha. Poderes extremamente fortes estão presentes no topo dela.<br><br>No entanto, não se empolgue. Os mesmos deuses estão muito furiosos ultimamente, e não querem que ninguém suba...",
	mylenneganditz = "Ei, você! Fique comigo, preciso de amigos!",
	lyncdowryammer = "Sinto na pele a desgraça que ela passou. Perdeu todos os seus amigos durante uma chuva de meteoros...<br><br>Agora falando sério, os deuses escondem um segredo gigante nesta montanha. Poderes extremamente fortes estão presentes no topo dela.<br><br>No entanto, não se empolgue. Os mesmos deuses estão muito furiosos ultimamente, e não querem que ninguém suba..."
}
lang.en = {
	mapname = "<N><b>#mountain</b>  <V>-  <N>version <ROSE>v1.0.7   <G>|   <N>Developed by <J>Morganadxana#0000<",
	enter = "<N>Welcome to the <J><b>#mountain</b> module!<br><N>You have 3 minutes to scale the big mountain that is on your way!<br><ROSE>Version v1.0.7 - developed by Morganadxana#0000<br><V>Translation by Rakan_raster#0000<br><VP>If you want to see the latest updates, type !changelog.",
	newgame = "<N>If you don't know about this module, please type <b>!help</b>.",
	getready = "<J>Get ready! The road to the mountain will be opened!",
	start = "<VP><b>Go!</b>",
	event1 = "The event",
	event2 = "will start in a few seconds, and will last for ",
	event3 = "seconds!",
	event4 = " started!",
	t10secs = "<font color='#ff8000'>10 seconds remaining! The player that scaled more will survive!",
	winner = "is the winner!",
	scaled = "(S)he scaled ",
	recognized = "meters and now is recognized by the mountain gods!",
	event5 = " is gone!",
	reached2 = "<G>You reached 2000 meters of height.<br>The cold wings starts to surround you, and the air starts to be rarefied...",
	reached3 = "<G>You reached 5000 meters of height.<br>It's almost impossible to tolerate the extreme cold temperatures, and you starts to have serious difficulties to breathe correctly.",
	reached4 = "<G>You reached 10000 meters of height.<br>The strong cold wings starts to freeze you, and your mice starts to have serious suffocation problems because of lack of air...",
	reached5 = "<G>You reached 20000 meters of height.<br>You starts to see the stars with much more clarity, even on the clear day. However, the rarified air and the extremely low temperatures is making your mice to die.",
	reached6 = "<VP>You reached the peak of the mountain! The gods recognized your bravery and courage. Now, you is part of the heaven!",
	reached7 = " <VP>reached the top of the mountain!<br><N>(S)he now is part of the stars and will bright many more!",
	nowinners = "<R>No winners!",
	help = "<p align='center'><VP><b>Welcome to the #mountain module.</b><br><br><p align='left'><N>This game is very simple. The objective is scale the big mountain that is in front of you.<br><br>However, the mountain gods are furious, and can attack you with various events.<br><br>The match will end after 3 minutes, when there is no more alive mices or when someone reaches the top of the mountain.<br><br><ROSE>Bugs and problems? Report to Morganadxana#0000.",
	powerups = "<G>• Wind Fury: <N>Strong winds hover around the mountain.<br><G>• Meteor Rain: <N>Some meteors will fall from the heaven, making you go down.<br><G>• Gravity Anomaly: <N>A strong gravitational field appears on the mountain, randomly changing the gravity of the map.<br><G>• Cheese For All: <N>All the players will have cheese.",
	credits = "The following players helped on this module:<br><br><ROSE><b>• Morganadxana#0000</b><N> - Code developer and creator of the map<br><ROSE><b>• Rakan_raster#0000</b><N> - English translation<br><ROSE><b>• Spectra_phantom#6089</b><N> - Image creation",
	memory_error = "<R>Warning: There's no more available memory for Transformice. To continue playing this game, log out of your account and enter again.",
	juliahenderson = "You don't think that I'm beautiful?",
	andersondarther = "Don't be fooled by her. She always likes to show off...<br><br>Talking serious, the mountain gods are hiding a very powerful secret. Extremely powerful things are present on the peak of the mountain.<br><br>However, don't get carried. The same gods are very furious recently. They like that nobody scale the mountain...",
	mylenneganditz = "Hey! Stay with me! I need of friends!",
	lyncdowryammer = "I'm sorry about what happened. She lost all of your friends during a meteor rain...<br><br>However, don't get carried. The same gods are very furious recently. They like that nobody scale the mountain..."
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		print(temp_text)
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i><br><br>"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function defineVencedor()
	max_score=10800
	winner=""
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].y < max_score and data[name].enabled == true then
			winner=name
			max_score=tfm.get.room.playerList[name].y
		end
	end
	return winner
end
function showImages(name)
	for i=0,1 do
		tfm.exec.addImage("17fe373d035.jpg","?1",-400+(i*3400),9492,name,1,1)
	end
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,0,name,10,10,0,1)
end
function resetEvents()
	wind=false; meteor=false; gravity=false; cheese=false;
	run_int=0;
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.removeCheese(name)
	end
	tfm.exec.setWorldGravity(0,10)
end
function eventChatCommand(name,command)
	if command == "help" then
		showMenu(name,0x808080,150,120,500,250,"Help",text.help)
	end
	if command == "powerups" then
		showMenu(name,0xf2a267,150,120,500,160,"Powerups",text.powerups)
	end
	if command == "creditos" then
		showMenu(name,0xb6e980,140,90,520,130,"Credits",text.credits)
	end
	if command == "changelog" then
		showMenu(name,0x2578f6,140,70,520,270,"Changelog","<font size='11'>[v1.0.7]:<br>• Slight changes on winning selection<br><br>[v1.0.6]:<br>• Fixed some issues with the end of game<br>• Added command hiding for !powerups, !changelog and !creditos<br>• Slight changes on the Universal Menu scheme<br><br>[v1.0.5]:<br>• More fixes on winner selection<br>• Added the Universal Menu scheme<br>• Added a protection for avoiding bugs with low memory client players<br><br>[v1.0.4]:<br>• Bug fixes on Meteor Rain<br>• Bug fixes on winner selection<br>• Added an altitude marker<br>• English translation for NPCs")
	end
end
function eventNewPlayer(name)
	showMessage(text.enter,name)
	ui.setMapName(text.mapname)
	newData={
		["x"]=0; ["a"]=0; ["enabled"]=false; ["opened"]=false; }
	data[name]=newData;
	showImages(name)
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventPlayerDied(name)
	data[name].enabled=false
	if changed == true then
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		showMessage(text.nowinners)
		tfm.exec.setGameTime(15)
		endgame=true; running=false;
		tfm.exec.newGame(xml2,false)
	end
	end
end
function eventTalkToNPC(name, npc)
	if npc == "Julia Henderson" then
		showMessage("<V>[Julia Henderson] <N>"..text.juliahenderson.."",name)
	elseif npc == "Anderson Darther" then
		showMessage("<V>[Anderson Darther] <N>"..text.andersondarther.."",name)
	elseif npc == "Mylenne Ganditz" then
		showMessage("<V>[Mylenne Ganditz] <N>"..text.mylenneganditz.."",name)
	elseif npc == "Lync Dowryammer" then
		showMessage("<V>[Lync Dowryammer] <N>"..text.lyncdowryammer.."",name)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cred'>Créditos</a><br><a href='event:change'>Changelog</a>",name,355,57,90,60,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for i=1000,1004 do
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
	if callback == "change" then
		eventChatCommand(name,"changelog")
	end
end
function eventNewGame()
	ui.setBackgroundColor("#000000")
	if changed == true then
		resetEvents()
		running=false; map_count=map_count+1; run_int=0; pass_int=0; event_int=0; endgame=false; vencedor="";
		tfm.exec.setGameTime(226)
		for i=0,1 do
			tfm.exec.addPhysicObject(i, 180+(i*5680), 10475, ground)
		end
		for name,player in next,tfm.get.room.playerList do
			data[name].a=0;
			data[name].enabled=true;
			showImages(name)
			ui.setMapName(text.mapname)
		end
		showMessage(text.newgame)
		for i=1,24 do
			ui.addTextArea(i,"<p align='center'>"..tostring(i*1000).."",nil,2980,number_scale[i],40,16,0x010101,0x010101,1.0,false)
		end
		tfm.exec.addNPC("Anderson Darther",{title = 298, look = "1;123_125508,0,0,4,60_324716+316441+4b926d+900f31+20310+ece674+e47c39+8d2637+900f31+900f31,40_256c23+717a30,31_ef4a6+f3f9bc,0,47",x = 4680,y = 10550,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
		tfm.exec.addNPC("Lync Dowryammer",{title = 253, look = "176;40_7b00c8+70335,0,20_9d00ff,43_290448,29_729be0+1d0241,0,1_5c00cb+211ce0,0,0",x = 1700,y = 10320,female = false,lookLeft = true,lookAtPlayer = true,interactive = true})
		tfm.exec.addNPC("Mylenne Ganditz",{title = 244, look = "161;212,38,57,66,62,0,33,0,0",x = 2430,y = 9368,female = true,lookLeft = true,lookAtPlayer = true,interactive = true})
		tfm.exec.addNPC("Julia Henderson",{title = 125, look = "142;234,49_efa5e2+edf1f2+edf1f2+edf1f2,77,0,43,97,3,0,0",x = 3505,y = 9188,female = true,lookLeft = false,lookAtPlayer = true,interactive = true})
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventLoop(passado,faltando)
	pass_int=pass_int+1
	falt_int=math.floor(faltando/500)
	if changed == true then
	if pass_int == 14 then
		showMessage(text.getready)
	elseif pass_int == 28 then
		showMessage("<BL><b>3...</b>")
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].y <= 400 and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				data[name].enabled=false
				showMessage(text.memory_error,name)
			end
		end
	elseif pass_int == 30 then
		showMessage("<BL><b>2...</b>")
	elseif pass_int == 32 then
		showMessage("<BL><b>1...</b>")
	elseif pass_int == 34 then
		showMessage(text.start)
		for i=0,1 do
			tfm.exec.removePhysicObject(i)
		end	
		running=true
	end
	if running == true then
		if wind == true then
			for i=1,24 do
				x=math.random(2800,3200)
				y=math.random(2000,10000)
				tfm.exec.explosion(x, y, -8, 100, true)
				tfm.exec.displayParticle(math.random(26,27), x, y, 1, 1, 1, 1)
			end
		end
		if meteor == true then
			loop=loop+1
			if loop == 4 then
				for i=1,2 do
					x=math.random(2600,3400)
					tfm.exec.addShamanObject(85, x, 0, 0, 0, 0, false)
				end
				loop=0
			end
		end
		if gravity == true then
			loop=loop+1
			if loop == 4 then
				tfm.exec.setWorldGravity(0,math.random(10,15))
				loop=0
			end
		end
		if cheese == true then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(name)
			end
		end
		run_int=run_int+0.5
		if run_int == 28 and falt_int >= 48 then
			event_selected=math.random(1,4)
			if event_selected == 2 then
				event_int=power_d.p2[math.random(#power_d.p2)]
			elseif event_selected == 3 then
				event_int=power_d.p3[math.random(#power_d.p3)]
			else
				event_int=math.random(12,24)
			end
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			end
		end
		if run_int == 33 and falt_int >= 48 then
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event4.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event4.."")
			end
			if event_selected == 1 then
				wind=true
			elseif event_selected == 2 then
				meteor=true
			elseif event_selected == 3 then
				gravity=true
			elseif event_selected == 4 then
				cheese=true
			end
		end
		if falt_int == 20 and endgame == false then
			showMessage(text.t10secs)
		end
		if falt_int <= 2 and endgame == false then
			while vencedor == "" do
				vencedor = defineVencedor()
			end
			for name,player in next,tfm.get.room.playerList do
				if not name == vencedor then
					tfm.exec.killPlayer(name)
				end
			end
			tfm.exec.giveCheese(vencedor)
			tfm.exec.playerVictory(vencedor)
			tfm.exec.setPlayerScore(vencedor,data[vencedor].a,true)
			showMessage("<VP><V><b>"..vencedor.."</b> <VP>"..text.winner.."<br><N>"..text.scaled.."<V>"..math.floor(math.pow((tfm.get.room.playerList[vencedor].y/-1+10565)/100,2.2)).." <N>"..text.recognized.."")
			tfm.exec.setGameTime(15)
			falt_int=15
			endgame=true
		end
		if falt_int <= 1 and endgame == true then
			tfm.exec.newGame(xml2,false)
		end
		if wind == true or meteor == true or gravity == true or cheese == true then
			event_int=event_int-0.5
			if event_int == 0 then
				resetEvents()
				if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
					showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event5.."")
				else
					showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event5.."")
				end
				event_selected=0;
			end
		end
	end
	for name,player in next,tfm.get.room.playerList do
		if data[name].enabled == true then
		if running == true then
			data[name].x=math.floor(math.pow((tfm.get.room.playerList[name].y/-1+10565)/100,2.2))
			if data[name].x >= 1000 and data[name].a == 0 then
				data[name].a=1
			end
			if data[name].x >= 2000 and data[name].a == 1 then
				showMessage(text.reached2,name)
				data[name].a=2
			end
			if data[name].x >= 5000 and data[name].a == 2 then
				showMessage(text.reached3,name)
				data[name].a=3
			end
			if data[name].x >= 10000 and data[name].a == 3 then
				showMessage(text.reached4,name)
				data[name].a=4
			end
			if data[name].x >= 20000 and data[name].a == 4 then
				showMessage(text.reached5,name)
				data[name].a=5
			end
			if data[name].x >= 24650 and data[name].a == 5 then
				showMessage(text.reached6,name)
				data[name].a=10
				for n,player in next,tfm.get.room.playerList do
					if not name == n then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
						tfm.exec.setPlayerScore(name,data[name].a,true)
						showMessage("<b>"..name.."</b>"..text.reached7.."")
						tfm.exec.setGameTime(15)
						falt_int=15
						endgame=true
						data[name].enabled=false
					end
				end
			end
		end
		end
	end
	else
		if faltando <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
tfm.exec.newGame(map)
end

initBeach = function()
for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7903160")
data={}; changed=false; xml2='';

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		print(temp_text)
	end
end
function showNPCs()
	tfm.exec.addNPC("Julia Lynner",{title = 382, look = "1;228,50,72,0,50_d946a7,90,44,0,0",x = 10032,y = 989,female = true,lookLeft = false,lookAtPlayer = false,interactive = true})
	tfm.exec.addNPC("Brand Northern",{title = 357, look = "1;225,0,46,34,26,104_3c3a87+6e7291+a5a7c1+caccdd+7582b3+f3f5f7,49,0,0",x = 10259,y = 875,female = false,lookLeft = false,lookAtPlayer = false,interactive = true})
	tfm.exec.addNPC("John Grand",{title = 298, look = "1;231,8,7,34,5,105,0,0,33",x = 9236,y = 1106,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Danniel Victor",{title = 296, look = "1;194,29,27,41,54,103,33,81,57",x = 3172,y = 1202,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Kenner Henderson",{title = 266, look = "27;236,45,22,0,44,0,50,67,35",x = 751,y = 1263,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
	tfm.exec.addNPC("Keith Cramer",{title = 216, look = "7;190_220b04+767576+585155+c44444+e0ddce+202020+e7e6e5,6_1d1c1c+464646,5_70707+d4c316,9,54,94,36,0,20",x = 567,y = 2925,female = false,lookLeft = false,lookAtPlayer = true,interactive = true})
end
function showWater(name)
	for i=0,2 do
		-- tfm.exec.addImage("17f74387366.png","!1",-600+(i*6400),1418,name,20,1.2,0,1)
		-- tfm.exec.addImage("17f74378b9a.png","?1",-600+(i*6396),1376,name,1,1,0,1)
		-- tfm.exec.addImage("17f7437d864.png","?1",-600+(i*6396),1376,name,1,1,0,0.5)
		-- tfm.exec.addImage("17f74378b9a.png","!1",-600+(i*6396),1376,name,1,1,0,0.44)
		-- tfm.exec.addImage("17f74382569.jpg","?1",-600+(i*6390),1418,name,2,0.6,0,1)
		tfm.exec.addImage("17def3df6c5.jpg","?1",-600+(i*5200),1400,name,1,1.2)
		tfm.exec.addImage("17def3e4466.png","!1",-600+(i*5200),1374,name,10,1.2,0,1)
		tfm.exec.addImage("17def3da8f8.png","!1",-600+(i*5194),1387,name,1,1,0,0.75)
	end
	for h=0,4 do
		tfm.exec.addImage("1803e8e2250.jpg","?1",-1200+(h*2169),1050,name,1,0.75,0,1)
	end
	ui.setBackgroundColor("#7DB1E0")
end
function eventChatCommand(name,message)
	if message == "reset" then
		if name == "Morganadxana#0000" or name == "Ashearcher#0000" then
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
function eventTalkToNPC(name, npc)
	if npc == "Julia Lynner" then
		showMessage("<V>[Julia Lynner] <N>Bem-vindo(a) ao Quiosque do Raposo Azul. Confira os preços de nossos produtos...<br><br>Espera, eu perdi meu papel com os preços!",name)
	elseif npc == "Brand Northern" then
		showMessage("<V>[Brand Northern] <N>Olha, olha, olha a água mineral, água mineral, água mineral...",name)
	elseif npc == "John Grand" then
		showMessage("<V>[John Grand] <J>Ah! Que delícia, cara!",name)
	elseif npc == "Danniel Victor" then
		showMessage("<V>[Danniel Victor] <N>Esta é a área conhecida como <R>Ilha do Dragão Vermelho.<N><br><br>Debaixo dela existe um recife de plantas muito grande, no qual vários peixes conseguem viver muito bem. É um lugar muito lindo, vale a pena conhecer. Ah, e tome cuidado com a água. Não fique muito tempo dentro do mar. Você pode afundar e não voltar mais.",name)
	elseif npc == "Kenner Henderson" then
		showMessage("<V>[Kenner Henderson] <N>Foi você o <R>fi********* <N>que amarrou aquele pneu nas ligações elétricas?<br><br><VP>Não? Ainda bem. <N>Pois algum ser sem cérebro inventou de colocar um pneu nos fios para tentar fazer uma tirolesa. Como estou furioso por isso...<br><br>Ah, e se está curioso para saber o que é aquela escada, ela dá para o gerador nuclear principal, que fica bem no fundo do mar. Não me aventuraria a descer até lá...",name)
	elseif npc == "Keith Cramer" then
		showMessage("<V>[Keith Cramer] <R>NÃO ESTÁ VENDO QUE ESTA É UMA ÁREA RESTRITA? SAIA DAQUI AGORA! QUER SER INFECTADO(A)? NÃO? ENTÃO SAIA AGORA, C******!",name)
	end
end
function eventPlayerWon(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
end
function eventPlayerDied(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
end
function eventNewGame(name)
	if changed == true then
		for name,_ in next,tfm.get.room.playerList do
			showWater(name)
		end
		showNPCs()
		ui.setMapName("<VP>Praia da Reserva Verde")
		tfm.exec.setGameTime(3600)
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	showWater(name)
	newData={
	["z"]=1;
	};
	data[name] = newData;
	if changed == true then
		ui.setMapName("Praia da Reserva Verde")
	end
	showMessage("<VP><b>Bem-vindo(a) a Praia da Reserva Verde.</b><br><br><p align='left'><N>Este é um mapa-script de praia bem grande e com diversos recursos para se divertir. Aproveite e curta!<br><br><R>Aviso: Este mapa pode consumir até 1,8GB de RAM dependendo de casos específicos.<br><br><ROSE><b>Mapa feito por Morganadxana#0000.</b><br><J>Agradecimentos especiais para <b>Draw#6691, Soft#1388, Viincenzo#9526, Lacoste#8972, Lipersz#9863, Spectra_phantom#6089, Threshlimit#0000, Star#8558 e <b>Lanadelrey#4862.</b><br><br><N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:<br><N><VP>raw.githubusercontent.com/JW26T-Prj/FunCorpModules/master/Praia%20da%20Reserva%20Verde.lua",name)
end
function eventLoop(p,f)
	if changed == true then
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].y >= 1399 then
				if data[name].z <= 1.45 then
					data[name].z=data[name].z+0.01
				end
			else
				data[name].z=1
			end
			tfm.exec.setPlayerGravityScale(name,data[name].z)
			if p >= 2000 and p <= 10000 then
				if tfm.get.room.playerList[name].y <= 400 and tfm.get.room.playerList[name].x <= 800 and not tfm.get.room.playerList[name].isDead then
					showMessage("<R>Aviso: Não há mais memória disponível para o Transformice. Para poder entrar neste mapa, saia do jogo e entre novamente.",name)
				end
			end
		end
	else
		if f <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
for name,_ in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.217<br>By Spectra_phantom#6089")

if tfm.get.room.isTribeHouse == true then
	tfm.exec.chatMessage("<br><VP>Tribehouse detected. Initialising main #anvilwar module.")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") or string.find(tfm.get.room.name,"survivor") then
		tfm.exec.chatMessage("<R>Room name not allowed.")
	elseif string.find(tfm.get.room.name,"watercatch") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'watercatch' on room name.<br>Initialising #watercatch module...")
		initWatercatch()
	elseif string.find(tfm.get.room.name,"cd3") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'cd3' on room name.<br>Initialising #cd3 module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initCd3()
	elseif string.find(tfm.get.room.name,"mountain") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'mountain' on room name.<br>Initialising #mountain module...")
		initMountain()
	elseif string.find(tfm.get.room.name,"beach") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'beach' on room name.<br>Initialising #beach module...")
		initBeach()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
