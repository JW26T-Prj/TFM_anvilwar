-- Transformice #anvilwar module loader - Version 2.172.1
-- By Spectra_phantom#6089
-- Included sub-modules: #deadfender, #pool.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.172.1",
	_MAINV = "40736.127",
	_DEVELOPER = "Spectra_phantom#6089" }

initAnvilwar = function()
--[[ #anvilwar Reborn
Module authors : Spectra_phantom#6089, Morganadxana#0000, Rakan_raster#0000
(C) 2017-2021 Spectra Advanced Module Group

Version : RTM 40736.127
Compilation date : 04/02/2021 18:14 UTC
Sending player : Morganadxana#0000

Number of maps : 132
Number of module special members : 20 ]]--

_VERSION = "Lua 5.4"
_AUTHOR = "Spectra_phantom#6089"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7581524","@7494251","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892","@7497464","@7497395","@7512948","@7555653","@7688028","@7655209","@7690671"}
map_names={"The Dual-Sided Fight Area","No Name","Inside the Castle","Hell and Water","A very simple waterfall","No Name","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","No Name","The first #anvilwar map","The Beach Test Map 2","No Name","No Name","The Six Attributes","Inside the Ocean","No Name","No Name","No Name","No Name","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","No Name","No Name","On the Seabed","The Palace of Swords","The Castle of Fire","No Name","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","No Name","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","No Name","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","No Name","No Name","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge (v2)","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","No Name","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","No Name","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas #1","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","No Name","No Name","Do Not Hit The Anvil","No Name","No Name","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Acid Revenge","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury","Released Things","No Name","No Name","No Name","This is a Terror","No Name","No Name","Escape from Nyan Cat"}
players_red={}; alives_red={};
players_blue={}; alives_blue={};
lobby_map='<C><P Ca="" /><Z><S><S Y="325" T="12" P="0,0,0.3,0.2,0,0,0,0" L="800" o="ffffffff" X="400" H="10" /><S Y="250" T="12" P="0,0,0,0,90,0,0,0" L="800" o="ffffffff" X="300" H="10" /><S Y="250" T="12" P="0,0,0,0,90,0,0,0" L="800" o="ffffffff" X="500" H="10" /><S Y="-5" T="12" P="0,0,0.3,0.2,0,0,0,0" L="800" o="ffffffff" X="400" H="10" /></S><D><DS Y="-25" X="400" /></D><O /></Z></C>'
current_map=""; actual_player="";
enabled=false; powerups=false; permafrost=false; night_mode=false; gravity=false;
mices=0; loop=0; skips=0; skipsq=0; skip_time=0; needs=0; turn=0; choose_time=40; time_passed=0; time_remain=0; current_red=0; current_blue=0;
points_loop=0; pf_time=0; general_time=0; total_time=0; map_id=0; set_player=""; set_map="";
mode="lobby"
images_id={};
playersList={}; helpers={}; mods={
"Dinamarquers#0000",
"Flaysama#5935",
"Chavestomil#0000",
"Shun_kazami#7014",
"Ddniemo#0000",
"Gmctf#0000",
"Liviliviah#0000",
"Ork#0015",
"Sorreltail#7677",
"Diadem#9470",
"Pamots#0095"};
admins={"Spectra_phantom#6089",
"Morganadxana#0000",
"Rakan_raster#0000"}
ninjas={"Rivenbagassa#0000",
"Aurelianlua#0000",
"Viego#0345",
"Forzaldenon#0000",
"Velkozdapic#0000"};
banneds={};
data={}

lang = {}
lang.br = {
	version = "Versão",
	mices_room = "Ratos na sala : ",
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
	skip1 = "Caso você queira pular este mapa, digite !skip. São necessários ao menos ",
	skip2 = " votos.",
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
	powerups = "<font size='11.5'><b>Tecla '1' - Disparo Duplo</b><br>Este powerup faz você atirar duas bigornas de uma vez.<br><b>Nível Mínimo:  1  /  Pontuação: 8pts</b><br><br><b>Tecla '2' - Disparo Triplo</b><br>Este powerup faz você atirar três bigornas de uma vez.<br><b>Nível Mínimo:  2  /  Pontuação: 14pts</b><br><br><b>Tecla '3' - Olha a Explosão</b><br>Este powerup permite a você criar uma explosão em um local do time inimigo.<br><b>Nível Mínimo:  3  /  Pontuação: 25pts</b><br><br><b>Tecla '4' - Congelamento</b><br>Este powerup congela todos os jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo:  3  /  Pontuação: 20pts</b><br><p align='right'><a href='event:pw2'>Ir à Página 2</a>",
	commands = "<font size='11.5'>Os comandos que começam com <b>*</b> podem ser utilizados apenas por administradores, FunCorps e o dono da sala (/room #anvilwar00seunome).<br>!commands - Mostra esta caixa de texto.<br>!anvils - Mostra as bigornas disponíveis para compra<br>!help (ou <b>H</b>) - Mostra a ajuda do jogo.<br>!tc [mensagem] - Envia uma mensagem que aparece apenas para os jogadores do seu time.<br>!powerups (ou <b>U</b>) - Mostra os powerups disponíveis e seus respectivos custos.<br>!skip - Vote para pular o mapa atual. São necessários um mínimo de votos equivalente a metade dos ratos na sala. Este comando também só pode ser usado a cada 15 minutos.<br>!p [usuário] (ou <b>P</b>) - Mostra o seu perfil. Tenha em mente que o perfil e o ranking não são permanentes e serão zerados quando a sala esvazia.<br>!ranking (ou <b>R</b>) - Mostra o ranking dos jogadores na sala.<br><R><b>*</b><N> !pw [senha] - Adiciona uma senha na sala. Digite apenas !pw para remover a senha.<br><R><b>*</b><N> !ban [usuário] - Bane o usuário da sala. Digite novamente este comando para remover o banimento.<br><R><b>*</b><N> !reset - Cancela a partida atual e retorna à tela inicial.<br><R><b>*</b><N> !limit [número] - Altera o limite de jogadores da sala.<br><R><b>*</b><N> !testmap [@código] - Testa um mapa. Isso pode ser útil para enviar o mapa para o #anvilwar.",
	help = "<font size='12'><b>Bem-vindo ao #anvilwar!</b><br>O objetivo deste module é matar os jogadores do time adversário usando bigornas.<br><br>O jogo é simples de ser jogado. Quando for sua vez, use as teclas <b>Z e X</b> para mudar a potência do seu tiro e as teclas <b>C e V</b> para mudar o ângulo.<br>O time que conseguir eliminar todos os jogadores do outro time vencerá o jogo!<br><br>Quando você joga ou ganha partidas, você vai receber <J><b>AnvilCoins</b><N>. Esta é a moeda do jogo. Ela pode ser usada para comprar novas bigornas, powerups e diversos outros itens.<br>Divirta-se e que vença o melhor time!<br><br><N><R><b>Administradores:</b><N> Spectra_phantom#6089 (GM), Morganadxana#0000 e Rakan_raster#0000<br><VP><b>Contribuidores:</b><N> Flaysama#5935, Chavestomil#0000 e Dinamarquers#0000<br><J><b>Tradutores:</b><N> Patrick_mahomes#1795 (BR)",
	skip0 = "Este comando pode ser usado somente daqui a ",
	seconds = " segundos.",
	skip = "Você votou para pular o mapa atual.",
	skip1 = "votou para pular o mapa atual.",
	skip9 = "Vocês votaram para pular o mapa atual. Sorteando um novo mapa...",
	skip2 = "Este comando requer um mínimo de <b>8</b> ratos na sala, e requer situações específicas.",
	leave = "Sair",
	join = "Entrar",
	getr = "Preparem-se! A partida vai começar em instantes!",
	powerups2 = "<font size='11.5'><b>Tecla '5' - Night Mode</b><br>Este powerup remove a visão dos jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo: 4  /  Pontuação: 16pts</b><br><br><b>Tecla '6' - Anvil Rain</b><br>Este powerup vai fazer chover bigornas em áreas aleatórias do time inimigo.<br><b>Nível Mínimo: 3  /  Pontuação: 20pts</b><br><br><b>Tecla '7' - Gravity Anomaly</b><br>Este powerup vai aumentar consideravelmente a gravidade até o outro time atirar.<br><b>Nível Mínimo: 5  /  Pontuação: 25pts</b><br><br><p align='right'><a href='event:pw1'>Voltar à Página 1</a>",
	using = "Bigorna sendo utilizada: ",
	ac0 = "Você não possui AnvilCoins suficientes para comprar esta bigorna :(",
	level = "avançou para o nível ",
	draw = "<b>Empate!</b><br>A tela principal será carregada em alguns instantes.",
	winblue = "<b>Vitória do time AZUL!</b><br>A tela principal será carregada em alguns instantes.",
	winred = "<b>Vitória do time VERMELHO!</b><br>A tela principal será carregada em alguns instantes.",
	as = "É a vez de: ",
	as1 = "<b>É a sua vez de atirar!</b><br><J>Use as teclas Z e X para mudar a potência do tiro, C e V para mudar o ângulo e BARRA DE ESPAÇO para atirar. Digite !help para mais informações.<br><br><N>Pontos para gastar com powerups: ",
	rm = "Sorteando mapa...",
	rm1 = "Mapa selecionado: ",
	t60s = "Faltam 60 segundos!",
	t30s = "Faltam 30 segundos!",
	powerups_a = "Os powerups estão liberados!",
	time = "<b>Tempo esgotado!</b> O time adversário irá atirar agora."
}
lang.en = {
	version = "Version",
	mices_room = "Mices on Room : ",
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
	skip1 = "If you want to skip this map, please type !skip. Is needed a minimum of ",
	skip2 = " votes.",
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
	powerups = "<font size='11.5'><b>Key '1' - Double Shoot</b><br>This powerup makes you shoot 2 anvils at once.<br><b>Required Level: 1  /  Required Score: 8pts</b><br><br><b>Key '2' - Triple Shoot</b><br>This powerup makes you shoot 3 anvils at once.<br><b>Required Level: 2  /  Required Score: 14pts</b><br><br><b>Key '3' - Explosion</b><br>This powerup allows you to create an explosion on the enemy team area.<br><b>Required Level: 3  /  Required Score: 25pts</b><br><br><b>Key '4' - Permafrost</b><br>This powerup freezes all enemy team players by a limited time.<br><b>Required Level: 3  /  Required Score: 20pts</b><br><p align='right'><a href='event:pw2'>Go to Page 2</a>",
	commands = "<font size='11.5'>The commands marked with <b>*</b> can be used only by Administrators, FunCorp members and the room owner (/room #anvilwar00yourname).<br>!commands - Display this message box.<br>!anvils - Show available #anvilwar anvils to buy.<br>!help (or <b>H</b> key) - Display the game help.<br>!tc [message] - Send a message that is visible only for players of your team.<br>!powerups (or <b>U</b> key) - Show all available powerups and their respective costs.<br>!skip - Vote to skip the current map. Are needed a minimum of votes equivalent of half of mices on the room to skip the current map. This command also only can be used every 15 minutes.<br>!p [username] (or <b>P</b> key) - Show your profile on game. Note that the profile and ranking aren't permanent and will be erased when the room empties.<br>!ranking (or <b>R</b> key) - Show the room ranking.<br><R><b>*</b><N> !pw [password] - Locks the room with a password. Use only !pw to clear the password.<br><R><b>*</b><N> !ban [username] - Bans the specified player from the room. Use again this command to unban the player.<br><R><b>*</b><N> !reset - Cancel the current match and returns to the lobby screen.<br><R><b>*</b><N> !limit [number] - Change the limit of mices on the room.<br><R><b>*</b><N> !testmap [@code] - Test a map. This can use useful when you want to send your map to #anvilwar.",
	help = "<font size='12'><b>Welcome to #anvilwar!</b><br>The objective of this module is kill all the players of other team using anvils.<br><br>The module is very easy to play. When reaches your turn, use <b>Z and X</b> keys to change the intensity of the anvil shoot and <b>C and V</b> keys to change the angle of the anvil.<br>The team that kill all players of other team will win the game!<br><br>When you kill players or win matches, you will receive <J><b>AnvilCoins</b><N>. This is the money of #anvilwar module. It can be used to unlock custom anvils, powerups and other things.<br>Enjoy the module and may the best team wins!<br><br><N><R><b>Administrators:</b><N> Spectra_phantom#6089 (GM), Morganadxana#0000 and Rakan_raster#0000<br><VP><b>Contributors:</b><N> Flaysama#5935, Chavestomil#0000 and Dinamarquers#0000<br><J><b>Translators:</b><N> Patrick_mahomes#1795 (BR)",
	skip0 = "This command can be only used in ",
	seconds = " seconds.",
	skip = "You voted to skip the current map.",
	skip1 = " voted to skip the current map. ",
	skip9 = "They voted to skip the current map. This command can be used only every 15 minutes.",
	skip2 = "This command can be only used with <b>8</b> or more mices, and only at specific situations.",
	leave = "Leave",
	join = "Join",
	getr = "Get Ready! The match will start in a few seconds!",
	powerups2 = "<font size='11.5'><b>Key '5' - Night Mode</b><br>This powerup remove the vision of players of enemy team.<br><b>Required Level: 4  /  Required Score: 16pts</b><br><br><b>Key '6' - Anvil Rain</b><br>This powerup will create a anvil rain on random enemy team areas.<br><b>Required Level: 3  /  Required Score: 20pts</b><br><br><b>Key '7' - Gravity Anomaly</b><br>This powerup will incrase the gravity of map by 200% during 3 seconds.<br><b>Required Level: 5  /  Required Score: 25pts</b><br><br><p align='right'><a href='event:pw1'>Return to Page 1</a>",
	using = "You are now using the ",
	ac0 = "You don't have AnvilCoins to buy this anvil.",
	level = "reached the level",
	draw = "<b>Draw!</b><br>The lobby screen will load shortly.",
	winblue = "<b>Victory of the BLUE team!</b><br>The lobby screen will load shortly.",
	winred = "<b>Victory of the RED team!</b><br>The lobby screen will load shortly.",
	as = "Actual shooter: ",
	as1 = "<b><b>It's your time to shoot.</b><br><J>Use Z and X keys to change the anvil power, C and V to change the anvil angle and SPACEBAR to shoot. Type !help for more information.<br><br><N>Points available: ",
	rm = "Randomizing map...",
	rm1 = "Selected Map : ",
	t60s = "60 seconds remaining!",
	t30s = "30 seconds remaining!",
	powerups_a = "The powerups are now available!",
	time = "<b>Time is up!</b> The next team will play now."
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

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"reset","help","skip","sync","pw","commands","powerups","p","kill","ban","limit","ranking","tc","anvils","set","testmap"} do
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

function showImage(name,link,x,y,scalex,scaley)
	image_id=tfm.exec.addImage(link,":1",x,y,name,scalex,scaley,0,0.95)
	table.insert(images_id,image_id)
end

function showAvailableAnvils(name)
	i=0
	for _,link in next,{"1788f85d7e2.png","1788f85ef53.png","1788f8606c4.png","1788f861e33.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",230,120+(i*50),name,1.0,1.0,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	i=0
	for _,link in next,{"1788f8635a6.png","1788f864d16.png","1788f866489.png"} do
		i=i+1
		image_id=tfm.exec.addImage(link,"&1",400,120+(i*50),name,1.0,1.0,0,1.0)
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
	ui.addTextArea(401,"<p align='center'><font color='#000000'><font size='18'><i>#anvilwar Reborn - "..text.version.." RTM 40736.127 </i>",name,52,18,700,60,0,0,1.0,true)
	ui.addTextArea(400,"<p align='center'><font size='18'><i>#anvilwar Reborn - "..text.version.." RTM 40736.127 <R></i>",name,50,16,700,60,0,0,1.0,true)
	ui.addTextArea(403,"<p align='center'><font color='#000000'><font size='13'><i>"..text.comp_date.."04/02/2021 18:14 UTC - "..text.uploaded.."Morganadxana#0000</i>",name,92,34,600,60,0,0,1.0,true)
	ui.addTextArea(402,"<p align='center'><font size='13'><i>"..text.comp_date.."04/02/2021 18:14 UTC - "..text.uploaded.."Morganadxana#0000</i>",name,90,32,600,60,0,0,1.0,true)
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
		ui.setMapName("<N><b>#anvilwar Reborn</b>   <G>|   <VP>"..text.version.." <b>RTM 40736.127</b> <R>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	elseif mode == "shoot" or mode == "wait2" or mode == "wait3" then
		local m=math.floor(general_time/60)
		local s=math.floor(general_time-(m*60))
		if s >= 10 then
			ui.setMapName("<N><b>"..text.as.."</b> <V>"..actual_player.."   <G>|   <R>Red Team <b>"..rawlen(alives_red).."</b> <V>- <BL><b>"..rawlen(alives_blue).."</b> Blue Team   <G>|   <N>Game Time : <V><b>"..m..":"..s.."</b> <J>("..time_remain..")<")
		else
			ui.setMapName("<N><b>"..text.as.."</b> <V>"..actual_player.."   <G>|   <R>Red Team <b>"..rawlen(alives_red).."</b> <V>- <BL><b>"..rawlen(alives_blue).."</b> Blue Team   <G>|   <N>Game Time : <V><b>"..m..":0"..s.."</b> <J>("..time_remain..")<")
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
	end
end

function calculateMatchTime()
	total_time=180+(mices*7)
	general_time=total_time
end

function calculatePoints(name)
	if data[name] then
		data[name].winrate=math.floor((data[name].wins/data[name].matches)*100)
		if data[name].current_coins > 0 then
			data[name].coins=data[name].coins+data[name].current_coins+data[name].score
			data[name].exp=data[name].exp+(data[name].current_coins*2)
			if data[name].exp >= data[name].maxp then
				advanceLevel(name)
			end
			tfm.exec.chatMessage("<VP>You won <b>"..data[name].current_coins.."</b> AnvilCoins!",name)
		end
		data[name].current_coins=0
		data[name].eff=math.floor((data[name].kills/data[name].killeds)*100)
	end
end

function detectVictory()
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
				ui.addTextArea(-4,"<font color='#000001'><font size='11'>"..text2.."",name,501,80,260,270,0,0,1.0,true)
				ui.addTextArea(-3,"<BL>"..text2,name,500,79,260,270,0,0,1.0,true)
				ui.addTextArea(-1,"<font color='#000001'><font size='11'>"..text1.."",name,21,80,260,270,0,0,1.0,true)
				ui.addTextArea(-2,"<R>"..text1,name,20,79,260,270,0,0,1.0,true)
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
		data[name]={level=1,exp=0,maxp=100,score=0,kills=0,wins=0,matches=0,killeds=0,eff=0.0,winrate=0.0,coins=50,multikills=0,
		killed=false,team=0,ranking=0,skip=false,angle=45,power=5,powerup=0,
		current_coins=0,opened=false,active_imgs={},anvils={0,0,0,0,0,0},current_anvil=0}
		table.insert(playersList,name)
	end
	if name:sub(1,1) == "*" then
		data[name].ranking=-1
	end
	if string.find(tfm.get.room.name,name) then
		table.insert(mods,name)
		tfm.exec.chatMessage(text.manager,name)
		print(name)
	end
	for _,k in next,{32,49,50,51,52,53,54,55,67,72,80,82,85,86,88,90} do
		tfm.exec.bindKeyboard(name,k,true,true)
	end
	system.bindMouse(name,true)
	if mode == "lobby" then
		if data[name] then
			if data[name].ranking >= 0 then
				showImage(name,"1788ddc0a4c.png",0,0,1.0,1.0)
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
		for i=1,5 do
			spawnAnvil(10,math.random(850,1500),100,0,1,false)
		end
	elseif data[actual_player].team == 2 then
		for i=1,5 do
			spawnAnvil(10,math.random(100,750),100,0,1,false)
		end
	end
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
			tfm.exec.setGameTime(6)
		end
		if powerups == true then
			if data[name].powerup == 0 then
				if code == 49 and data[name].score >= 8 and data[name].level >= 1 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p1.."")
					data[name].powerup=1
					setScores(name,-8,true)
				elseif code == 49 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 50 and data[name].score >= 14 and data[name].level >= 2 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-14,true)
				elseif code == 50 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 51 and data[name].score >= 25 and data[name].level >= 3 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-25,true)
					data[name].powerup=3
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
				elseif code == 51 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 52 and data[name].score >= 20 and data[name].level >= 3 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-20,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
				elseif code == 52 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 53 and data[name].score >= 16 and data[name].level >= 4 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-16,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
				elseif code == 53 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 54 and data[name].score >= 20 and data[name].level >= 3 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-20,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
				elseif code == 54 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
				if code == 55 and data[name].score >= 25 and data[name].level >= 5 then
					tfm.exec.chatMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-25,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,25)
					pf_time=-2
					gravity=false
				elseif code == 55 then
					tfm.exec.chatMessage("<R>"..text.p0.."",name)
				end
			end
		end
		if code == 90 then
			if data[name].power > 0 then
				data[name].power=data[name].power-1
			end
			tfm.exec.chatMessage("<J>"..text.ap.."<b>"..data[name].power.."</b>",name)
		end
		if code == 88 then
			if data[name].power < 10 then
				data[name].power=data[name].power+1
			end
			tfm.exec.chatMessage("<J>"..text.ap.."<b>"..data[name].power.."</b>",name)
		end
		if code == 67 then
			if data[name].angle > 0 then
				data[name].angle=data[name].angle-5
			end
			tfm.exec.chatMessage("<J>"..text.ag.."<b>"..data[name].angle.."°</b>",name)
		end
		if code == 86 then
			if data[name].angle < 90 then
				data[name].angle=data[name].angle+5
			end
			tfm.exec.chatMessage("<J>"..text.ag.."<b>"..data[name].angle.."°</b>",name)
		end
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
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
		end
	end
	if mode == "shoot" then
		if data[name].team > 0 then
			data[name].current_coins=math.floor(data[name].current_coins/2)
		end
		if name == actual_player then
			data[name].current_coins=math.floor(data[name].current_coins/2)
			tfm.exec.chatMessage(""..text.suicide..""..actual_player)
			setScores(name,0,false)
			mode="wait3"
			tfm.exec.setGameTime(6)
		end
		data[name].killeds=data[name].killeds+1
		tfm.exec.setPlayerScore(name,0,false)
	end
	if mode == "wait3" then
		if data[actual_player].team == data[name].team then
			if actual_player == name then
				data[actual_player].current_coins=0
				setScores(actual_player,0,false)
				tfm.exec.chatMessage(""..text.suicide..""..actual_player)
			else
				data[actual_player].current_coins=data[actual_player].current_coins-5
				setScores(actual_player,-5,true)
				tfm.exec.chatMessage("<VP>"..text.tk1.."<b>"..actual_player.."</b>"..text.tk2..""..name..".")
			end
		else
			data[name].current_coins=math.floor(data[name].current_coins/2)
			setScores(name,math.floor(data[name].score/2),true)
		end
		data[name].killeds=data[name].killeds+1
		tfm.exec.setPlayerScore(name,0,false)
	end
end

function eventMouse(name,x,y)
	if actual_player == name and data[name].powerup == 3 then
		if time_remain >= 6 then
			if data[name].team == 1 and x > 805 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
			if data[name].team == 2 and x < 795 then
				tfm.exec.explosion(x,y,25,150,true)
				tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
			end
		end
	end
end

function lobby()
	mode="lobby"; choose_time=30; powerups=false;
	tfm.exec.newGame(lobby_map)
	tfm.exec.setGameTime(36000)
	players_red={};	players_blue={}; loop=0;
	for i=-8, -1 do
		ui.removeTextArea(i,nil)
	end
	for name,player in next,tfm.get.room.playerList do
		removeImagePlayers(name)
		showLobbyText(name)
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		if data[name] then
			data[name].opened=false
			if data[name].ranking >= 0 then
				showTeams(name)
				showImage(name,"1788ddc0a4c.png",0,0,1.0,1.0)
				data[name].team=0
				data[name].current_coins=0
				setScores(name,0,false)
			else
				tfm.exec.killPlayer(name)
				tfm.exec.chatMessage("<R>"..text.banned.."",name)
			end
		end
	end
end

function eventNewGame()
	set_map=""
	if mode == "wait1" then
		for i=400,403 do ui.removeTextArea(i,nil) end
		mode="wait2"
		tfm.exec.setGameTime(20)
		skipsq=math.ceil(mices/2)
		if mices >= 8 then
			tfm.exec.chatMessage(""..text.skip1.."<b>"..skipsq.."</b>"..text.tk2.."")
		end
		moveTeams()
		for name,player in next,tfm.get.room.playerList do
			data[name].score=0
			if data[name].team > 0 then
				data[name].matches=data[name].matches+1
			end
		end
	end
	actual_shooter="-"
	if mode == "lobby" then
		tfm.exec.chatMessage("<VP>"..text.submission.."<br><BL>https://atelier801.com/topic?t=894824&f=6")
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
		tfm.exec.chatMessage("Sync: "..command:sub(6).."",name)
	end
	if command == "reset" and data[name].ranking >= 2 then
		lobby()
	end
	if (command:sub(0,2) == "pw") and data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(tostring(command:sub(4)))
		if string.len(command:sub(4)) > 0 then
			tfm.exec.chatMessage(""..text.pw..""..command:sub(4).."",name)
		else
			tfm.exec.chatMessage(text.pw0,name)
		end
	end
	if (command:sub(0,5) == "limit") and data[name].ranking >= 2 then
		tfm.exec.setRoomMaxPlayers(tonumber(command:sub(7)))
		tfm.exec.chatMessage(""..text.limit..""..command:sub(7).."",name)
	end
	if (command:sub(0,3) == "set") and data[name].ranking >= 3 then
		if data[command:sub(5)] then
			set_player=command:sub(5)
		end
	end
	if (command:sub(0,4) == "kill") and data[name].ranking >= 3 then
		tfm.exec.killPlayer(command:sub(6))
	end
	if (command:sub(0,7) == "testmap") and data[name].ranking >= 2 then
		if mode == "lobby" then
			set_map=command:sub(9)
			tfm.exec.chatMessage(""..text.load1..""..command:sub(9)..". "..text.load2.."",name)
		else
			tfm.exec.chatMessage(text.load0,name)
		end
	end
	if (command:sub(0,3) == "ban") and data[name].ranking >= 2 then
		if data[command:sub(5)] then
			if data[command:sub(5)].ranking == 0 then
				removeTeam(command:sub(5))
				data[command:sub(5)].ranking=-2
				tfm.exec.killPlayer(command:sub(5))
				table.insert(banneds,command:sub(5))
				tfm.exec.chatMessage("<R><b>"..command:sub(5).."</b>"..text.ban.."")
				if mode == "lobby" or mode == "map_sort" or mode == "wait1" or mode == "wait2" then
					lobby()
				end
			elseif data[command:sub(5)].ranking == -2 then
				if rawlen(banneds) > 0 then
					for i=1,rawlen(banneds) do
						if banneds[i] == command:sub(5) then
							table.remove(banneds,i)
							data[command:sub(5)].ranking=0
							tfm.exec.chatMessage("<J><b>"..command:sub(5).."</b>"..text.ban0.."")
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
					tfm.exec.chatMessage("<font color='#f13503'><font face='Microsoft Sans Serif'>•<font face='Verdana'> <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			elseif data[name].team == 2 then
				for _,p in next,players_blue do
					tfm.exec.chatMessage("<font color='#0335f1'><font face='Microsoft Sans Serif'>•<font face='Verdana'> <b>["..name.."]</b> "..command:sub(4).."",p)
				end
			end
		end
	end
	if command == "ranking" then
		eventRanking(name)
	end
	if command == "anvils" then
		if data[name].opened == false then
			tfm.exec.chatMessage("<J>"..text.ac.."<b>"..data[name].coins.."</b> AnvilCoins.",name)
			showMenu(name,0x999999,220,120,360,235,"#anvilwar Anvils","<font size='11.5'>                <b>Default Anvil</b><br>                Cost: 0 ACs<br>                <a href='event:a0'>Equip!</a><br><br>                <b>Red Anvil</b><br>                Cost: 200 ACs<br>                <a href='event:a1'>Equip!</a><br><br>                <b>Blue Anvil</b><br>                Cost: 200 ACs<br>                <a href='event:a2'>Equip!</a><br><br>                <b>White Anvil</b><br>                Cost: 400 ACs<br>                <a href='event:a3'>Equip!</a>")
		ui.addTextArea(1005,"<i><font size='11.5'>                <b>Rainbow Anvil</b><br>                Cost: 500 ACs<br>                <a href='event:a4'>Equip!</a><br><br>                <b>Sharingan Anvil</b><br>                Cost: 1000 ACs<br>                <a href='event:a5'>Equip!</a><br><br>                <b>Black Hole Anvil</b><br>                Cost: 1000 ACs<br>                <a href='event:a6'>Equip!</a>",name,393,151,175,175,0,0,1.0,true)
			showAvailableAnvils(name)
		end
	end
	if command == "powerups" then
		showMenu(name,0xc23517,140,90,520,250,"#anvilwar Powerups",text.powerups)
	end
	if command == "commands" then
		showMenu(name,0x125490,120,90,560,285,"#anvilwar Commands",text.commands)
	end
	if command == "help" then
		showMenu(name,0x457426,100,90,600,260,"Help",text.help)
	end
	if command == "skip" then
		if mode == "wait2" and data[name].skip == false and mices >= 8 then
			if skip_time > 0 then
				tfm.exec.chatMessage("<R>"..text.skip0.."<b>"..skip_time.."</b>"..text.seconds.."",name)
			else
				skips=skips+1
				tfm.exec.chatMessage(text.skip,name)
				data[name].skip=true
				if skips > math.ceil(skipsq/2) then
					tfm.exec.chatMessage("<J><b>"..name.."</b>"..text.skip1.." ("..skips.."/"..skipsq.."")
				end
				if skips >= skipsq then
					skip_time=900
					tfm.exec.chatMessage("<ROSE>"..text.skip9.."")
					loop=0
					mode="map_sort"
				end
			end
		else
			tfm.exec.chatMessage("<R>"..text.skip2.."",name)
		end
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
			tfm.exec.chatMessage("<R>User not found",nome)
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
			ui.addTextArea(482,"<font size='16'><font color='#000000'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,210,150,25,0,0,0.9,true)
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
			ui.addTextArea(482,"<font size='16'><font color='#000000'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,210,150,25,0,0,0.9,true)
		end
	end
end

function moveTeams()
	tfm.exec.chatMessage("<VP>"..text.getr.."")
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
		tfm.exec.chatMessage(""..text.using.."<N><b>Default Anvil!</b>",name)
	end
	if callback == "a1" then
		if data[name].anvils[1] == 1 then
			data[name].current_anvil=1
			tfm.exec.chatMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[1]=1
				data[name].current_anvil=1
				tfm.exec.chatMessage(""..text.using.."<N><b>Red Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a2" then
		if data[name].anvils[2] == 1 then
			data[name].current_anvil=2
			tfm.exec.chatMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
		else
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
				data[name].anvils[2]=1
				data[name].current_anvil=2
				tfm.exec.chatMessage(""..text.using.."<N><b>Blue Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a3" then
		if data[name].anvils[3] == 1 then
			data[name].current_anvil=3
			tfm.exec.chatMessage(""..text.using.."<N><b>White Anvil!</b>",name)
		else
			if data[name].coins >= 400 then
				data[name].coins=data[name].coins-400
				data[name].anvils[3]=1
				data[name].current_anvil=3
				tfm.exec.chatMessage(""..text.using.."<N><b>White Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a4" then
		if data[name].anvils[4] == 1 then
			data[name].current_anvil=4
			tfm.exec.chatMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
		else
			if data[name].coins >= 500 then
				data[name].coins=data[name].coins-500
				data[name].anvils[4]=1
				data[name].current_anvil=4
				tfm.exec.chatMessage(""..text.using.."<N><b>Rainbow Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a5" then
		if data[name].anvils[5] == 1 then
			data[name].current_anvil=5
			tfm.exec.chatMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
		else
			if data[name].coins >= 1000 then
				data[name].coins=data[name].coins-1000
				data[name].anvils[5]=1
				data[name].current_anvil=5
				tfm.exec.chatMessage(""..text.using.."<N><b>Sharingan Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
	if callback == "a6" then
		if data[name].anvils[6] == 1 then
			data[name].current_anvil=6
			tfm.exec.chatMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
		else
			if data[name].coins >= 1000 then
				data[name].coins=data[name].coins-1000
				data[name].anvils[6]=1
				data[name].current_anvil=6
				tfm.exec.chatMessage(""..text.using.."<N><b>Black Hole Anvil!</b>",name)
			else
				tfm.exec.chatMessage("<R>"..text.ac0.."",name)
			end
		end
	end
end

function advanceLevel(name)
	data[name].level=data[name].level+1
	data[name].exp=data[name].exp-data[name].maxp
	data[name].maxp=data[name].maxp*1.4
	tfm.exec.chatMessage("<N><b>"..name.."</b> "..text.level.." <b>"..data[name].level.."</b>!")
end

function drawMatch()
	mode="end"
	tfm.exec.setGameTime(20)
	tfm.exec.chatMessage("<J>"..text.draw.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
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
	tfm.exec.chatMessage("<BL>"..text.winblue.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
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
	tfm.exec.chatMessage("<R>"..text.winred.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
end

function setShooter()
	if set_player == "" then
		if turn == 0 then
			turn=1
			actual_player=alives_blue[math.random(#alives_blue)]
			tfm.exec.setGameTime(15)
		elseif turn == 1 then
			turn=0
			actual_player=alives_red[math.random(#alives_red)]
			tfm.exec.setGameTime(15)
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
	tfm.exec.chatMessage("<N>"..text.as.." <b>"..actual_player.."</b>")
	tfm.exec.chatMessage("<VP>"..text.as1..""..data[actual_player].score.."",actual_player)
	enabled=true
	mode="shoot"
end

function getAlivePlayers()
	tfm.exec.setWorldGravity(0,10)
	current_red=rawlen(alives_red); current_blue=rawlen(alives_blue); pf_time=0;
	alives_red={}
	alives_blue={}
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
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				tfm.exec.chatMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				tfm.exec.chatMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
			end
		elseif data[actual_player].team == 2 then
			killsc=current_red-rawlen(alives_red)
			data[actual_player].kills=data[actual_player].kills+killsc
			data[actual_player].current_coins=data[actual_player].current_coins+2*killsc
			setScores(actual_player,killsc*3,true)
			if data[actual_player].multikills < killsc then
				data[actual_player].multikills=killsc
			end
			if killsc == 2 then
				tfm.exec.chatMessage("<J>Double Kill of <b>"..actual_player.."</b>!")
			elseif killsc >= 3 then
				tfm.exec.chatMessage("<J>Multi Kill! "..killsc.." kills of <b>"..actual_player.."</b>!")
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
				if rawlen(players_red) - rawlen(players_blue) <= 3 and rawlen(players_red) - rawlen(players_blue) >= -3 then
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
	if skip_time > 0 then
		skip_time=skip_time-0.5
	end
	if mode == "map_sort" then
		if set_map == "" then
			if loop < 8 then
				loop=loop+1
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..text.rm.."",nil,102,317,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='28'><i>"..text.rm.."",nil,100,315,600,45,0,0,1.0,true)
			map_id=math.random(1,rawlen(maps))
				ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,102,357,600,45,0,0,1.0,true)
				ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='28'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,100,355,600,45,0,0,1.0,true)
			elseif loop == 8 then
				current_map=maps[map_id]
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..text.rm1.."",nil,102,317,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='28'><i>"..text.rm1.."",nil,100,315,600,45,0,0,1.0,true)
				ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..map_names[map_id].." - "..maps[map_id].."",nil,102,357,600,45,0,0,1.0,true)
				ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='28'><VP><i>"..map_names[map_id].." - "..maps[map_id].."",nil,100,355,600,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
			end
		else
			current_map=set_map
			ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..text.rm1.."",nil,102,317,600,45,0,0,1.0,true)
			ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='28'><i>"..text.rm1.."",nil,100,315,600,45,0,0,1.0,true)
			ui.addTextArea(-8,"<font face='Arial'><p align='center'><font color='#000000'><font size='28'><i>"..current_map.."",nil,102,357,600,45,0,0,1.0,true)
			ui.addTextArea(-7,"<font face='Arial'><p align='center'><font size='28'><VP><i>"..current_map.."",nil,100,355,600,45,0,0,1.0,true)
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
				tfm.exec.chatMessage("<ROSE>"..text.t60s.."")
			end
			if general_time == 30 then
				tfm.exec.chatMessage("<ROSE>"..text.t30s.."")
			end
		end
		if time_passed == 60 and powerups == false then
			powerups=true
			tfm.exec.chatMessage(text.powerups_a)
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
		if time_passed % 12 == 0 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].team > 0 then
					if data[name].killed == false then
						setScores(name,1,true)
					end
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
		tfm.exec.chatMessage("<R>"..text.time.."")
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
		if pf_time == 4 then
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

initDeadfender = function()
admins = {
	["Refletz#6472"] = true,
	["Soristl1#0000"] = true,
}
system.disableChatCommandDisplay (nil, true)
tfm.exec.setRoomMaxPlayers(15)
tt = 0
mice = {}
lang = {}
portaisid = {}
lang.br = {
	text1 = "<p align='center'><font size='14px'><font color='#000000'><b>O jogo começa em",
	text2 = "<p align='center'><font size='15px'><a href='event:p'>Clique aqui para participar",
	text3 = "<p align='center'><font size='12px'>Jogadores participando:",
	text4 = "<p align='center'><font size='15px'>Participando",
	text5 = "<j>Capacidade Máxima de jogadores atingida.<n>",
	text6 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n>",
	text7 = "<p align='left'><font size='15px'><bv>Como jogar<n>:<font size='12px'><br><br><br>1- Impeça que o cannon chegue ao 'gol' com pisos que você mesmo ira colocar no mapa através do click do mouse na area verde;<br><br>2- o cannon irá spawnar em cima da área verde. Use a área verde para colocar os pisos (Com o click), que irão impedir o cannon de chegar ao chão e impedir que vá ao 'gol';<br><br>3- Você pode colocar 2 ou 3 objetos. Vai depender da rodada em que você está.",
	text8 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n>",
	text9 = "<font size='15px'><bv>Comandos<n>: -- <rose>*<n> -> Comandos para o admin da sala (Em breve) --<font size='12px'><br><br><br><j>!resettimer<n> <rose>*<n> - Reseta o tempo de iniciar a partida.<br><j>!lang [BR/EN]<n> - Muda o idioma do jogo.",
	text10 = "<p align='center'><font size='12px'><a href='event:vida'>Vida dos jogadores",
	text11 = "<p align='center'><font size='15px'><font color='#D30A0A'>Leia a ajuda para:<br>Instruções | Comandos",
	text12 = "<p align='center'><font size='12px'>Nessa rodada poderá spawnar",
	text13 = "<font size='15px'><font color='#000000'><b>Coloque pisos através do click do mouse, clicando na área <font color='#178E31'>verde<n>.",
	text14 = "<font size='15px'><font color='#000000'><b>Evite que o Cannon caia no gol para não perder <r>uma vida<n>.",
	text15 = "pisos",
	text18 = "<j>É necessário dois jogadores ou mais para iniciar a partida<n>",
	text19 = "O jogador",
	text20 = "morreu!",
	text21 = "venceu!",
	text22 = "Empate!",
	text23 = "<a href='event:ajuda'>Como jogar</a><br><a href='event:cmd'>Comandos</a><br><n2>Opções<n><br><a href='event:credits'>Creditos</a>",
	text24 = "Fechar",
	text25 = "<p align='center'><font size='20px'><j>Creditos<n><br></p><p align='left'><font size='12px'>Este jogo foi desenvolvido por Refletz#6472 (Soristl). espero que gostem ^^.<br><br>Agradecimentos especiais:<br><br><j>Esh#0095<n> (<v>Design Popup e Texts<n>) | <j>Chisaky#0000<n> (<v>Tradução para En<n>) | <j>Darkwolf07#9890<n> (<v>Criador das imagens no jogo<n>)",
}
lang.en = {
	text1 = "<p align='center'><font size='14px'><font color='#000000'><b>The game will start in",
	text2 = "<p align='center'><font size='15px'><a href='event:p'>Press to participate",
	text3 = "<p align='center'><font size='12px'>Players in game:",
	text4 = "<p align='center'><font size='15px'>Participating",
	text5 = "<j>Maximum player capacity reached.<n>",
	text6 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n>",
	text7 = "<p align='left'><font size='15px'><bv>How to play<n>:<font size='12px'><br><br><br>1- Prevent the cannon from reaching the goal by placing the grounds (you can spawn them by clicking on the green area);<br><br>2- The cannon will spawn on the green area. Use the green area to place the grounds by clicking on the screen and prevent the cannon from reaching the goal.;<br><br>3- You'll be able to place 2 or 3 grounds. It depends on the current round.",		
	text8 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n>",
	text9 = "<font size='15px'><bv>Commands<n>: -- <rose>*<n> -> Room admin commands (Cooming soon) --<font size='12px'><br><br><br><j>!resettimer<n> <rose>*<n> - The time to start is reset<br><j>!lang [BR/EN]<n> - Change the game language.",
	text10 = "<p align='center'><font size='12px'><a href='event:vida'>Players lives ",
	text11 = "<p align='center'><font size='15px'><font color='#D30A0A'>Read the help to:<br>Instructions | Commands",
	text12 = "<p align='center'><font size='12px'>In this round you’ll be able to spawn",
	text13 = "<font size='15px'><font color='#000000'><b>Spawn the grounds by clicking in the <font color='#178E31'>green area.",
	text14 = "<font size='15px'><font color='#000000'><b>Prevent the cannon from reaching the goal to avoid losing <r>one life<n>.",
	text15 = "grounds",
	text18 = "<j>Two or more players are required to start the game<n>",
	text19 = "The player",
	text20 = "died!",
	text21 = "won!",
	text22 = "Draw!",
	text23 = "<a href='event:ajuda'>How to play</a><br><a href='event:cmd'>Commands</a><br><n2>Options<n><br><a href='event:credits'>Credits</a>",
	text24 = "Close",
	text25 = "<p align='center'><font size='20px'><j>Credits<n><br></p><p align='left'><font size='12px'>This game was developed by Refletz#6472(Soristl). I hope you guys enjoy it! ^^.<br><br> Acknowledgments:<br><br><j>Esh#0095<n> (<v>Pop-up design and texts<n>) | <j>Chisaky#0000<n> (<v>English translation<n>) | <j>Darkwolf07#9890<n> (<v>Game Images<n>)",
}

if tfm.get.room.community == "br" then
    trad = lang.br
else
	trad = lang.en
end

imageId = {}

for name, data in pairs(tfm.get.room.playerList) do
	mice[name] = {v = name, tr = trad}
	table.insert(mice, mice[name])
	imageId[name] = {}
end

function ui.addWindow(id, text, player, x, y, width, height, alpha, corners, closeButton, buttonText)
    id = tostring(id)
    ui.addTextArea(id.."000000000", "", player, x, y, width, height, 0x573926, 0x573926, alpha, true)
    ui.addTextArea(id.."0", "", player, x+1, y+1, width-2, height-2, 0x8a583c, 0x8a583c, alpha, true)
    ui.addTextArea(id.."00", "", player, x+3, y+3, width-6, height-6, 0x2b1f19, 0x2b1f19, alpha, true)
    ui.addTextArea(id.."000", "", player, x+4, y+4, width-8, height-8, 0xc191c, 0xc191c, alpha, true)
    ui.addTextArea(id.."0000", "", player, x+5, y+5, width-10, height-10, 0x2d5a61, 0x2d5a61, alpha, true)
    ui.addTextArea(id.."00000", text, player, x+5, y+6, width-10, height-12, 0x142b2e, 0x142b2e, alpha, true)
    if corners then
        table.insert(imageId[player], tfm.exec.addImage("155cbe97a3f.png", "&1", x-7, (y+height)-22, player))
        table.insert(imageId[player], tfm.exec.addImage("155cbe99c72.png", "&1", x-7, y-7, player))
        table.insert(imageId[player], tfm.exec.addImage("155cbe9bc9b.png", "&1", (x+width)-20, (y+height)-22, player))
        table.insert(imageId[player], tfm.exec.addImage("155cbea943a.png", "&1", (x+width)-20, y-7, player))
    end
    if closeButton then
        ui.addTextArea(id.."000000", "", player, x+8, y+height-22, width-16, 13, 0x7a8d93, 0x7a8d93, alpha, true)
        ui.addTextArea(id.."0000000", "", player, x+9, y+height-21, width-16, 13, 0xe1619, 0xe1619, alpha, true)
        ui.addTextArea(id.."00000000", "", player, x+9, y+height-21, width-17, 12, 0x314e57, 0x314e57, alpha, true)
        ui.addTextArea(id.."", buttonText, player, x+9, y+height-24, width-17, nil, 0x314e57, 0x314e57, 0, true)
    end
end

function closeWindow(id, player)
    var = tostring(id)
    for text = 1, 10 do
        ui.removeTextArea(var, player)
        var = var.."0"
	end
	for i = 1, #imageId[player] do
		tfm.exec.removeImage(imageId[player][i])
	end
end

ui.addTextArea(4000, "<p align='center'><font size='12px'><a href='event:menuOpen'>Menu", nil, 5, 25, 40, 20, 0x0e232b, 0x171717, 1, true)

function iniciar()
	tfm.exec.disableAutoShaman() tfm.exec.newGame('<C><P F="8" L="2131" H="600" /><Z><S><S L="2131" X="1065" H="40" Y="580" T="10" P="0,0,0.3,0,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="6a7495" X="-5" Y="300" T="12" H="610" /><S L="10" o="6a7495" X="2135" H="610" Y="300" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="6a7495" H="2131" Y="-1" T="12" X="1065" /><S P="0,0,0.3,0.2,0,0,0,0" Y="0" L="10" X="0" c="4" i="322,450,../godspaw/img/renard/anim-1-3.png" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" Y="0" L="10" X="0" c="4" i="100,200,17429228e27.png" T="14" H="10" /></S><D><DS Y="479" X="213" /></D><O /></Z></C>')
	tfm.exec.disableAutoNewGame()
	tfm.exec.disableAutoScore (true)
	tfm.exec.disableAutoTimeLeft (true)
	tfm.exec.disableAfkDeath (true)
	tfm.exec.disableMortCommand (true)
	tfm.exec.disablePhysicalConsumables (true)
	removeText()
	ui.removeTextArea(3001)
	ui.removeTextArea(3002)
	tabela = {}
	for tv = 1, #mice do
		ui.addTextArea(1, mice[tv].tr.text2, mice[tv].v, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(2, mice[tv].tr.text3.." "..#tabela.."/8", mice[tv].v, 30, 370, 200, 25, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(18, mice[tv].tr.text13, mice[tv].v, 989, 350, 190, 90, 0x242424, 0xFFFFFF, 0, false)
		ui.addTextArea(19, mice[tv].tr.text14, mice[tv].v, 1745, 348, 190, 92, 0x242424, 0xFFFFFF, 0, false)
		if tt == 0 then
			ui.addTextArea(5001, "", mice[tv].v, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
			ui.addPopup(0, 1, mice[tv].tr.text11, mice[tv].v, 300, 150, 250, true)
		end
	end
	tabela1 = {}
	objectList = {}
	fim = false
	inGame = false
	spec = {}
	players = {}
	playersOnGame = {}
	twin = {}
	colors = {"<font color='#D00D0D'>", "<font color='#1C59D9'>", "<font color='#FFE300'>", "<font color='#19C52E'>", "<font color='#FF8300'>", "<font color='#FF00F6'>", "<font color='#9100FF'>", "<font color='#00F3F3'>"}
	cm = 0
	tt = 1
	time = os.time() + 25000
	modo = "espera"
	--system.bindMouse (admin, true)
end

function eventTextAreaCallback(tI, name, c)
	if c == "p" and #tabela < 8 then
		t = false
		for i = 1, #tabela, 1 do
			if tabela[i] == name then
				t = true
			end
		end
		if t == false then
			table.insert(tabela, name)
			ui.addTextArea(1, mice[name].tr.text4, mice[name].v, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
			for pf = 1, #mice do
				ui.addTextArea(2, mice[pf].tr.text3.." "..#tabela.."/8", mice[pf].v, 30, 370, 200, 25, 0x0e232b, 0x171717, 1, true)
			end
		end
		if #tabela == 8 then
			for vt = 1, #mice do
				tfm.exec.chatMessage (trad.text5, nil)
			end
			for tb = 1, #tabela do
				ui.removeTextArea(4, tabela[tb])
			end
		end
	elseif c == "menuOpen" then
		ui.addTextArea(4000, "<p align='center'><font size='12px'><a href='event:menuClose'>Menu", name, 5, 25, 40, 20, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(4001, "<font size='11px'><textformat leading='5'>"..mice[name].tr.text23.."", name, 5, 55, 90, 80, 0x0e232b, 0x171717, 0.5, true)
	elseif c == "menuClose" then
		ui.addTextArea(4000, "<p align='center'><font size='12px'><a href='event:menuOpen'>Menu", name, 5, 25, 40, 20, 0x0e232b, 0x171717, 1, true)
		ui.removeTextArea(4001, name)
	elseif c == "ajuda" then
		repita(name)
	elseif c == "cmd" then
		ui.addWindow(-1, ""..mice[name].tr.text8.."</font><font face='verdana'><p align='left'><br><br>"..mice[name].tr.text9.."", name, 74, 50, 704, 300, 1, true, true, "<a href='event:closeWindow'><p align='center'>"..mice[name].tr.text24)
	elseif c == "credits" then
		ui.addWindow(-1, ""..mice[name].tr.text25.."", name, 74, 50, 704, 300, 1, true, true, "<a href='event:closeWindow'><p align='center'>"..mice[name].tr.text24)
	elseif c == "vida" then
		lang.br.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Vida dos jogadores</font><p align='left'><font size='14px'><font face='arial'><br><br>Jogador: <r>"..tabela1[1].."<n> | Vida: "..playersOnGame[1].life.."<br>Jogador: <bv>"..tabela1[2].."<n> | Vida: "..playersOnGame[2].life.."<br>Jogador: <j>"..tabela1[3].."<n> | Vida: "..playersOnGame[3].life.."<br>Jogador: <vp>"..tabela1[4].."<n> | Vida: "..playersOnGame[4].life.."<br>Jogador: <ce>"..tabela1[5].."<n> | Vida: "..playersOnGame[5].life.."<br>Jogador: <rose>"..tabela1[6].."<n> | Vida: "..playersOnGame[6].life.."<br>Jogador: <vi>"..tabela1[7].."<n> | Vida: "..playersOnGame[7].life.."<br>Jogador: <ch>"..tabela1[8].."<n> | Vida: "..playersOnGame[8].life..""
		lang.en.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Players' lives</font><p align='left'><font size='14px'><font face='arial'><br><br>Player: <r>"..tabela1[1].."<n> | Life: "..playersOnGame[1].life.."<br>Player: <bv>"..tabela1[2].."<n> | Life: "..playersOnGame[2].life.."<br>Player: <j>"..tabela1[3].."<n> | Life: "..playersOnGame[3].life.."<br>Player: <vp>"..tabela1[4].."<n> | Life: "..playersOnGame[4].life.."<br>Player: <ce>"..tabela1[5].."<n> | Life: "..playersOnGame[5].life.."<br>Player: <rose>"..tabela1[6].."<n> | Life: "..playersOnGame[6].life.."<br>Player: <vi>"..tabela1[7].."<n> | Life: "..playersOnGame[7].life.."<br>Player: <ch>"..tabela1[8].."<n> | Life: "..playersOnGame[8].life..""
		ui.addTextArea(3001, mice[name].tr.text16, name, 264, 114, 400, 200, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(3002, "<p align='center'><font size='15px'><a href='event:fecha1'><r>X<n>", name, 620, 124, 30, 20, 0x0e232b, 0x171717, 1, true)	
	elseif c == "fecha1" then
		ui.removeTextArea(3001, name)
		ui.removeTextArea(3002, name)
	elseif c == "closeWindow" then
		closeWindow(-1, name)
	end
end

function eventLoop(current, remaining)
	if modo == "espera" then
		local x = math.ceil((time - os.time())/1000)
		c =  string.format("%d", x)
		ui.addTextArea(0, trad.text1.." "..c.."s", nil, 110, 390, 220, 25, 0x0e232b, 0x171717, 0, false)
		if x == 0 then
			if #tabela >= 2 then
				removeText()
				maps()
				if cm == 0 then
					cm = cm + 1
					checkPlayers()
				end
			else
				time = os.time() + 15000
				tfm.exec.chatMessage (trad.text18, nil)
			end
		end
	elseif modo == "espera2" then
		for player1, data in pairs(tfm.get.room.playerList) do
			table.insert(spec, player1)
		end
		for element1 = 1, #players do
			for element2 = 1, #spec do
				if players[element1] == spec[element2] then
					table.remove(spec, element2)
				end
			end
		end
		for element3 = 1, #spec do 
			tfm.exec.killPlayer(spec[element3])
		end
		teleportPlayers()
		modo = "espera1"
		popup()
	elseif modo == "espera1" then
		removeText()
		conts()
		maxspawn = math.random(2,3)
		for fr = 1, #mice do
			ui.addTextArea(7, mice[fr].tr.text12.." "..maxspawn.." "..mice[fr].tr.text15.."", mice[fr].v, 240, 56, 340, 25, 0x0e232b, 0x171717, 1, true)
		end
		attLife(nil)
		time = os.time() + 15000
		portais()
		checkl()
		modo = "iniciar"
	elseif modo == "iniciar" then
		local x1 = math.ceil((time - os.time())/1000)
		c = string.format("%d", x1)
		ui.setMapName ("<rose>Cannon Spawn in "..c.."s")
		if x1 == 0 then
			for ok = 1, #playersOnGame do
				system.bindMouse (playersOnGame[ok].name, false)
			end
			for hh = 1, #idImgToBorders do
				 tfm.exec.removeImage(idImgToBorders[hh])
			end
			spawnCannon()
		    time = os.time() + 10000
			modo = "definicao"
		end	
	elseif modo == "definicao" then
		local x2 = math.ceil((time - os.time())/1000)
		c1 = string.format("%d", x2)
		if x2 == 0 then
			spawnT()
			modo = "espera3"
			time = os.time() + 5000
			ui.setMapName ("<rose>Processing...")
		end
	elseif modo == "espera3" then
		local x10 = math.ceil((time - os.time())/1000)
		if x10 == 0 then
			collect()
			condi = 0
			condi2 = 0
			objcoords()
			condi = condi + 1
			if condi2 == 1 then
				ui.removeTextArea(2)
				ui.removeTextArea(5)
				ui.removeTextArea(6)
				checkwin()
			end
		end
	elseif modo == "limpar" then
		limpar()
		modo = "espera1"
	elseif modo == "vitoria" then
		local x3 = math.ceil((time - os.time())/1000)
		c = string.format("%d", x3)
		for lg = 1, 8 do
			if twin[1] == playersOnGame[lg].name then
				ui.addTextArea(5000, "<p align='center'><font size='30px'><textformat leading='150'><br>"..colors[lg]..""..twin[1].."</font> "..trad.text21.."", nil, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
			end
		end
		if x3 == 0 then
			iniciar()
		end
	elseif modo == "empate" then
		local x4 = math.ceil((time - os.time())/1000)
		c = string.format("%d", x4)
		ui.addTextArea(5000, "<p align='center'><font size='30px'><textformat leading='150'><br>"..trad.text22.."", nil, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
		if x4 == 0 then
			iniciar()
		end
	end
end

function eventMouse(jogador, x5, y5)
	if jogador == playersOnGame[1].name then
		checkCoordsOfClick(x5, y5, 1, 118, 244)
	elseif jogador == playersOnGame[2].name then
		checkCoordsOfClick(x5, y5, 2, 560, 686)
	elseif jogador == playersOnGame[3].name then
		checkCoordsOfClick(x5, y5, 3, 1002, 1128)
	elseif jogador == playersOnGame[4].name then
		checkCoordsOfClick(x5, y5, 4, 1444, 1570)
	elseif jogador == playersOnGame[5].name then
		checkCoordsOfClick(x5, y5, 5, 1886, 2012)
	elseif jogador == playersOnGame[6].name then
		checkCoordsOfClick(x5, y5, 6, 2328, 2454)
	elseif jogador == playersOnGame[7].name then
		checkCoordsOfClick(x5, y5, 7, 2770, 2896)
	elseif jogador == playersOnGame[8].name then
		checkCoordsOfClick(x5, y5, 8, 3212, 3338)
	end
end

function checkCoordsOfClick(x, y, index, initBorderSpawn, EndBorderSpawn)
	if statsOfPlayers[index].counter >= 0 and statsOfPlayers[index].counter < maxspawn then
		if x >= initBorderSpawn and x <= EndBorderSpawn then
			if y >= 299 and y <= 362 then
				statsOfPlayers[index].counter = statsOfPlayers[index].counter + 1
				statsOfPlayers[index].id = statsOfPlayers[index].id + 1
				CheckCoordAndIdofGround(x, y, statsOfPlayers[index].id)
			end
		end
	end
end

tc = {8, 9, 10, 3, 1}
td = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
te = {3, 11, 2, 4, 8}

function CheckCoordAndIdofGround(x, y, id)
	if y <= 316 then
		grounds(id, x, y, tc)	
	elseif y >= 317 and y < 347 then
		grounds(id, x, y, td)
	elseif y >= 347 then
		grounds(id, x, y, te)
	end
end

function grounds(id, x, y, arg2)
	t = {10, 20}
	ang = {0, 30, 45, 60, -30, -45}
	arg1 = arg2[math.random(#arg2)]
	if arg1 == 0 then
		tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = .2, restitution = .0, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 1 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = .0, restitution = .10, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 2 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 0, restitution = 1.2, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 3 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 0, restitution = 5.0, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 4 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 30, restitution = 0.2, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 5 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 20, restitution = .1, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 6 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 20, restitution = .1, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 7 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 10, restitution = .0, miceCollision = true, angle = ang[math.random(#ang)], groundCollision = true})
    elseif arg1 == 8 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 20, restitution = .1, miceCollision = false, angle = ang[math.random(#ang)], groundCollision = false})
    elseif arg1 == 9 then
        tfm.exec.addPhysicObject(id, x, y, {type = arg1, color = math.random(0xFFFFFF), width = t[math.random(#t)], height = 2, friction = 20, restitution = .1, miceCollision = false, angle = ang[math.random(#ang)], groundCollision = false})
    elseif arg1 == 10 then
        tfm.exec.addPhysicObject(id, x, y, {type = 9, color = math.random(0xFFFFFF), width = 40, height = 40, friction = 20, restitution = .1, miceCollision = false, angle = ang[math.random(#ang)], groundCollision = false})
    elseif arg1 == 11 then
        tfm.exec.addPhysicObject(id, x, y, {type = 13, color = 0xAA65C7, width = 10, height = 10, friction = .0, restitution = 1.2, miceCollision = false, angle = ang[math.random(#ang)], groundCollision = true})
		elseif arg1 == 12 then
        tfm.exec.addPhysicObject(id, x, y, {type = 13, color = 0xE88F4F, width = 10, height = 10, friction = 0, restitution = 5.0, miceCollision = false, angle = ang[math.random(#ang)], groundCollision = true})
    end
end

function checkwin()
	limpar()
	for i = 1, 8 do
		if playersOnGame[i].life <= 0 then
			for j = 1, #twin do
				if twin[j] == playersOnGame[i].name then
					tfm.exec.chatMessage (""..trad.text19.." "..colors[i].." "..playersOnGame[i].name.."</font> "..trad.text20.."", nil)
					table.remove(twin, j)
					playersOnGame[i].name = "Ninguém"
				end
			end
		end
	end
	if #twin == 1 then
		inGame = false
		modo = "vitoria"
		time = os.time() + 5000
		limpar()
	end
	if #twin == 0 then
		inGame = false
		modo = "empate"
		time = os.time() + 5000
		limpar()
	end
	if #twin > 1 then
		modo = "limpar"
	end
end

function eventPlayerLeft(jogador)
	for k = 1, #playersOnGame do
		if jogador == playersOnGame[k].name then
			playersOnGame[k].life = 0
			tw()
		end
	end
	if modo == "espera" then
		for sair = 1, #tabela, 1 do
			if tabela[sair] == jogador then
				table.remove(tabela, sair)
				for tt = 1, #mice do
					ui.addTextArea(2, mice[tt].tr.text3.." "..#tabela.."/8", mice[tt].name, 30, 370, 200, 25, 0x0e232b, 0x171717, 1, true)
				end
				if #tabela < 8 then
					for tts = 1, #mice do
						ui.addTextArea(4, mice[tts].tr.text2, mice[tts].name, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
					end
					for vvv = 1, #tabela do
						ui.removeTextArea(4, tabela[vvv])
					end
				end
			end
		end
	end
end

function tw()
	if #twin <= 2 then
		checkwin()
	end
end

function eventNewPlayer(jogador)
	xg = false
		for vv = 1, #mice do
			if mice[vv].v == jogador then
			xg = true
		end
	end
	if xg == false then
		mice[jogador] = {v = jogador, tr = trad}	
		table.insert(mice, mice[jogador])
	end
	ui.addTextArea(4000, "<p align='center'><font size='12px'><a href='event:menuOpen'>Menu", jogador, 5, 25, 40, 20, 0x0e232b, 0x171717, 1, true)
	imageId[jogador] = {}
	if modo == "espera" then
		tfm.exec.respawnPlayer(jogador)
		for vk = 1, #mice do
			if mice[vk].v == jogador then
				ui.addTextArea(2, mice[vk].tr.text3.." "..#tabela.."/8", jogador, 30, 370, 200, 25, 0x0e232b, 0x171717, 1, true)
			end
		end
		ui.addTextArea(18, mice[jogador].tr.text13, mice[jogador].v, 989, 350, 190, 90, 0x242424, 0xFFFFFF, 0, false)
		ui.addTextArea(19, mice[jogador].tr.text14, mice[jogador].v, 1745, 348, 190, 92, 0x242424, 0xFFFFFF, 0, false)
		lt = false
		if lt == false and #tabela < 8 then
			for vs = 1, #mice do
				if mice[vs].v == jogador then
					ui.addTextArea(1, mice[vs].tr.text2, jogador, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
				end
			end
		end
	elseif modo ~= "espera" then
		for lg = 1, #mice do
			if mice[lg].v == jogador then
				ui.addTextArea(7, mice[lg].tr.text12.." "..maxspawn.." "..mice[lg].tr.text15.."", jogador, 240, 56, 340, 25, 0x0e232b, 0x171717, 1, true)
			end
		end
		attLife(jogador)
		spawn()
	end
	if inGame == true then
		ui.addTextArea(3000, mice[jogador].tr.text10, mice[jogador].v, 650, 34, 145, 20, 0x0e232b, 0x171717, 1, true)
	end	
	ui.addTextArea(5001, "", jogador, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
	ui.addPopup(0, 1, mice[jogador].tr.text11, jogador, 300, 150, 250, true)
end

function popup()
	times = {"<font color='#D00D0D'>Red</font>", "<font color='#1C59D9'>Blue</font>", "<font color='#FFE300'>Yellow</font>", "<font color='#19C52E'>Green</font>", "<font color='#FF8300'>Orange</font>", "<font color='#FF00F6'>Rose</font>", "<font color='#9100FF'>Purple</font>", "<font color='#00F3F3'>Cyan</font>"}
	for tt = 1, #players do
		player = players[tt]
		text = times[tt]
		lang.br.text17 = "<font size='12px'>Você é do time "..text..", <b>você deve proteger seu gol spawnando pisos na area <font color='#19C52E'>Verde</font> através do <font color='#19C52E'>click do mouse</font>.</b><br>o último a sobreviver vence, boa sorte!!!</font>"
		lang.en.text17 = "<font size='12px'>You are the "..text.." team, <b>you must protect your goal placing grounds in the <font color='#19C52E'>green</font> area  by <font color='#19C52E'> pressing the left mouse button</font>.</b><br>the last survivor wins the game, good luck!!!</font>"
		checkSomePlayers(player)
		ui.addPopup(2, 0, mice[elementIndex].tr.text17, player, 200, 200, 300, true)
	end
end

function checkSomePlayers(player)
	for vi = 1, #mice do
		if player == mice[vi].v then
			elementIndex = vi
		end
	end
end

function eventChatCommand(name, message)
	if (message:sub(0,10) == "resettimer") then
		if admins[name] then
			if modo == "espera" then
				time = os.time() + 15000
			end
		end
	elseif message:sub(1,4)=="lang" then
		v = string.lower(message:sub(6,7))
		if lang[v] then
			if v == "en" then
				mice[name].tr = lang.en
				att(name)
			elseif v == "br" then
				mice[name].tr = lang.br
				att(name)
			end
		end
	end
end

function att(jogador)
	if modo == "espera" then
		for vp = 1, #mice do
			if mice[vp].v == jogador then
				ui.addTextArea(2, mice[vp].tr.text3.." "..#tabela.."/8", jogador, 30, 370, 200, 25, 0x0e232b, 0x171717, 1, true)
			end
		end
		ui.addTextArea(18, mice[jogador].tr.text13, jogador, 989, 350, 190, 90, 0x242424, 0xFFFFFF, 0, false)
		ui.addTextArea(19, mice[jogador].tr.text14, jogador, 1745, 348, 190, 92, 0x242424, 0xFFFFFF, 0, false)
		t = false
		for i = 1, #tabela, 1 do
			if tabela[i] == jogador then
				t = true
				if t == true then
					ui.addTextArea(1, mice[jogador].tr.text4, jogador, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
				end			
			end
		end
		if t == false then
			if #tabela < 8 then
				for pv = 1, #mice do
					if mice[pv].v == jogador then
						ui.addTextArea(1, mice[pv].tr.text2, mice[pv].v, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
					end
				end
			else
				for tb = 1, #tabela do
					ui.removeTextArea(4, tabela[tb])
				end
			end
		end		
	elseif modo ~= "espera" then
		ui.addTextArea(7, mice[jogador].tr.text12.." "..maxspawn.." "..mice[jogador].tr.text15.."", jogador, 240, 56, 340, 25, 0x0e232b, 0x171717, 1, true)
		if inGame == true then
			ui.addTextArea(3000, mice[jogador].tr.text10, jogador, 650, 34, 145, 20, 0x0e232b, 0x171717, 1, true)
		end
	end
end

function eventPopupAnswer(popupID, name, answer)
	if popupID == 0 then
		if answer == "yes" then
			ui.removeTextArea(5001, name)
			repita(name)
		elseif answer == "no" then
			ui.removeTextArea(5001, name)
		end
	end
end

function checkPlayers()
	for i = 1, 8 do
		if #tabela > 0 then
			l = math.random(#tabela)
			playersOnGame[#playersOnGame + 1] = {name = tabela[l], life = 3}
			twin[i] = tabela[l]
			tabela1[#tabela1 + 1] = tabela[l]
			table.insert(players, tabela[l])
			table.remove(tabela, l)
		else
			playersOnGame[#playersOnGame + 1] = {name = "Ninguém", life = 0}
			tabela1[#tabela1 + 1] = "Ninguém"
			local name = "Ninguém"
			table.insert(players, name)
		end
	end
	lang.br.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Vida dos jogadores</font><p align='left'><font size='14px'><font face='arial'><br><br>Jogador: <r>"..tabela1[1].."<n> | Vida: "..playersOnGame[1].life.."<br>Jogador: <bv>"..tabela1[2].."<n> | Vida: "..playersOnGame[2].life.."<br>Jogador: <j>"..tabela1[3].."<n> | Vida: "..playersOnGame[3].life.."<br>Jogador: <vp>"..tabela1[4].."<n> | Vida: "..playersOnGame[4].life.."<br>Jogador: <ce>"..tabela1[5].."<n> | Vida: "..playersOnGame[5].life.."<br>Jogador: <rose>"..tabela1[6].."<n> | Vida: "..playersOnGame[6].life.."<br>Jogador: <vi>"..tabela1[7].."<n> | Vida: "..playersOnGame[7].life.."<br>Jogador: <ch>"..tabela1[8].."<n> | Vida: "..playersOnGame[8].life..""
	lang.en.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Players' lives</font><p align='left'><font size='14px'><font face='arial'><br><br>Player: <r>"..tabela1[1].."<n> | Life: "..playersOnGame[1].life.."<br>Player: <bv>"..tabela1[2].."<n> | Life: "..playersOnGame[2].life.."<br>Player: <j>"..tabela1[3].."<n> | Life: "..playersOnGame[3].life.."<br>Player: <vp>"..tabela1[4].."<n> | Life: "..playersOnGame[4].life.."<br>Player: <ce>"..tabela1[5].."<n> | Life: "..playersOnGame[5].life.."<br>Player: <rose>"..tabela1[6].."<n> | Life: "..playersOnGame[6].life.."<br>Player: <vi>"..tabela1[7].."<n> | Life: "..playersOnGame[7].life.."<br>Player: <ch>"..tabela1[8].."<n> | Life: "..playersOnGame[8].life..""
	modo = "espera2"
	inGame = true
	if inGame == true then
		for pp = 1, #mice do
			ui.addTextArea(3000, mice[pp].tr.text10, mice[pp].v, 650, 34, 145, 20, 0x0e232b, 0x171717, 1, true)
		end
	end
end

statsOfPlayers = {}

function conts()
	local ids = 0
	for i = 1, #playersOnGame do
		if playersOnGame[i].life > 0 then
			statsOfPlayers[i] = {counter = 0, id = ids}
			ids = ids + 3
			system.bindMouse (playersOnGame[i].name, true)
		end
	end
end

map = 1


function maps()
	mapas = {'<C><P D="connexion/x_forteresse/7.jpg, 600, 0, 2;connexion/x_forteresse/7.jpg, 1200, 0, 1;connexion/x_forteresse/7.jpg, 1800, 0, 1;connexion/x_forteresse/7.jpg, 2400, 0, 1;connexion/x_forteresse/7.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="3000" X="1244" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="10" X="2321" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="316" X="-190" /></D><O /></Z></C>', 
			 '<C><P D="connexion/x_forteresse/10.jpg, 600, 0, 2;connexion/x_forteresse/10.jpg, 1200, 0, 1;connexion/x_forteresse/10.jpg, 1800, 0, 1;connexion/x_forteresse/10.jpg, 2400, 0, 1;connexion/x_forteresse/10.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="10" o="d00d0d" X="-1" H="130" Y="205" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="d00d0d" H="800" Y="81" T="12" X="-241" /><S L="10" o="d00d0d" H="130" X="154" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="1c59d9" X="598" Y="141" T="12" H="130" /><S L="10" o="d00d0d" X="354" H="130" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="1c59d9" H="130" Y="206" T="12" X="446" /><S L="10" o="1c59d9" H="406" X="400" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="d00d0d" X="201" Y="141" T="12" H="130" /><S L="10" o="ffe300" X="1042" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="1c59d9" H="130" Y="206" T="12" X="799" /><S L="10" o="ffe300" H="130" X="892" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="ffe300" X="844" Y="81" T="12" H="406" /><S L="10" o="1c59d9" X="645" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ffe300" H="130" N="" Y="141" T="12" X="1089" /><S L="10" o="ffe300" H="130" X="1239" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="19c52e" X="1332" Y="206" T="12" H="130" /><S L="10" o="19c52e" X="1287" H="406" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="19c52e" H="130" Y="141" T="12" X="1489" /><S L="10" o="19c52e" H="130" X="1533" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="19c52e" X="1685" Y="206" T="12" H="130" /><S L="10" o="ff8300" X="1779" H="130" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="ff8300" H="406" Y="81" T="12" X="1731" /><S L="10" o="ff8300" H="130" X="1931" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff8300" X="1977" Y="141" T="12" H="130" /><S L="10" o="ff8300" X="2128" H="130" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="ff00f6" H="130" Y="206" T="12" X="2223" /><S L="10" o="ff00f6" H="406" X="2175" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff00f6" X="2375" Y="141" T="12" H="130" /><S L="10" o="ff00f6" X="2421" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="ff00f6" H="130" Y="206" T="12" X="2576" /><S L="10" o="9100ff" H="130" X="2668" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="9100ff" X="2619" Y="81" T="12" H="406" /><S L="10" o="9100ff" X="2819" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="9100ff" H="130" Y="141" T="12" X="2865" /><S L="10" o="9100ff" H="130" X="3012" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="f3f3" X="3104" Y="206" T="12" H="130" /><S L="10" o="f3f3" X="3063" H="406" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="f3f3" H="130" Y="141" T="12" X="3263" /><S L="10" o="f3f3" H="130" X="3309" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="f3f3" X="3443" Y="205" T="12" H="130" /><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="f3f3" H="800" X="3704" Y="80" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="43" X="400" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="845" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="1290" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="2180" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="1730" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="2621" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="3061" Y="402" T="2" P="0,0,0,1.0,0,0,0,0" /></S><D><DS Y="307" X="-149" /></D><O /></Z></C>',
			 '<C><P L="3463" D="connexion/x_forteresse/3.jpg, 600, 0, 2;connexion/x_forteresse/3.jpg, 1200, 0, 1;connexion/x_forteresse/3.jpg, 1800, 0, 1;connexion/x_forteresse/3.jpg, 2400, 0, 1;connexion/x_forteresse/3.jpg, 3000, 0, 1" /><Z><S><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="528" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0,100,0,0,0,0" L="10" X="90" N="" Y="191" T="3" H="10" /><S P="1,0,0,100,0,0,0,0" L="10" X="717" N="" Y="190" T="3" H="10" /><S L="10" H="10" X="272" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S X="178" L="193" H="10" c="4" Y="191" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="622" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="1161" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="975" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="1066" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="1417" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="1605" H="10" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S H="10" L="193" X="1510" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="2049" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="1860" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" H="10" c="4" Y="190" T="8" X="1955" /><S L="10" H="10" X="2307" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="2493" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S X="2398" L="193" H="10" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="10" X="2748" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" H="10" X="2937" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="2842" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="3192" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="3381" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S H="10" L="193" X="3286" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="294" X="-159" /></D><O><O C="12" Y="190" X="178" P="0" /><O C="22" Y="190" X="90" P="0" /><O C="22" Y="190" X="272" P="0" /><O C="12" Y="190" P="0" X="624" /><O C="22" Y="190" P="0" X="718" /><O C="12" Y="190" X="1066" P="0" /><O C="12" Y="190" P="0" X="1509" /><O C="22" Y="190" X="1161" P="0" /><O C="22" Y="192" P="0" X="1605" /><O C="12" Y="191" X="1955" P="0" /><O C="22" Y="192" X="2049" P="0" /><O C="22" Y="190" P="0" X="975" /><O C="22" Y="190" P="0" X="1861" /><O C="22" Y="190" P="0" X="529" /><O C="22" Y="191" X="1418" P="0" /><O C="12" Y="190" P="0" X="2398" /><O C="22" Y="191" X="2307" P="0" /><O C="22" Y="190" P="0" X="2493" /><O C="12" Y="190" X="2842" P="0" /><O C="22" Y="190" P="0" X="2748" /><O C="22" Y="190" X="2938" P="0" /><O C="12" Y="190" P="0" X="3286" /><O C="22" Y="190" X="3192" P="0" /><O C="22" Y="190" P="0" X="3381" /></O></Z></C>',
			 '<C><P D="x_deadmeat/cinematique/106.jpg, 600, 0, 2;x_deadmeat/cinematique/106.jpg, 1200, 0, 1;x_deadmeat/cinematique/106.jpg, 1800, 0, 1;x_deadmeat/cinematique/106.jpg, 2400, 0, 1;x_deadmeat/cinematique/106.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="3000" X="1244" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="10" X="2321" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="d00d0d" X="78" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="d00d0d" H="150" Y="170" T="12" X="278" /><S L="20" H="10" X="83" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="272" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="1c59d9" H="150" Y="170" T="12" X="522" /><S L="10" o="1c59d9" H="150" X="722" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="527" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="716" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="ffe300" H="150" X="966" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ffe300" X="1166" Y="170" T="12" H="150" /><S L="20" H="10" X="971" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="1160" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="19c52e" X="1410" Y="170" T="12" H="150" /><S L="10" o="19c52e" X="1610" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="1415" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="1604" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="ff8300" X="1854" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff8300" H="150" Y="170" T="12" X="2054" /><S L="20" H="10" X="1859" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="2048" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff00f6" H="150" Y="170" T="12" X="2298" /><S L="20" X="2303" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="10" o="ff00f6" H="150" X="2498" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" H="10" X="2492" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="9100ff" H="150" X="2742" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" H="10" X="2747" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="9100ff" X="2942" Y="170" T="12" H="150" /><S L="20" X="2936" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="f3f3" X="3186" Y="170" T="12" H="150" /><S L="10" o="f3f3" X="3386" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="3191" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="3380" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /></S><D><DS Y="298" X="-145" /></D><O><O C="3" Y="180" P="0" X="178" /><O C="12" Y="180" P="0" X="180" /><O C="3" Y="180" X="622" P="0" /><O C="12" Y="180" X="622" P="0" /><O C="3" Y="180" P="0" X="1066" /><O C="12" Y="180" P="0" X="1066" /><O C="3" Y="180" X="1510" P="0" /><O C="12" Y="180" X="1510" P="0" /><O C="3" Y="180" P="0" X="1954" /><O C="12" Y="180" P="0" X="1954" /><O C="3" Y="180" X="2398" P="0" /><O C="12" Y="180" X="2398" P="0" /><O C="3" Y="180" P="0" X="2842" /><O C="12" Y="180" P="0" X="2842" /><O C="3" Y="180" X="3286" P="0" /><O C="12" Y="180" X="3286" P="0" /></O></Z></C>',
			 '<C><P L="3463" D="x_deadmeat/cinematique/105.jpg, 0, 0;x_deadmeat/cinematique/105.jpg, 800, 0;x_deadmeat/cinematique/105.jpg, 2400" /><Z><S><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="316" X="-190" /></D><O><O C="4" Y="350" P="0" X="400" /><O C="12" Y="351" P="0" X="402" /><O C="4" Y="350" X="844" P="0" /><O C="12" Y="351" X="846" P="0" /><O C="4" Y="350" P="0" X="1288" /><O C="12" Y="351" P="0" X="1290" /><O C="4" Y="350" X="1732" P="0" /><O C="12" Y="351" X="1734" P="0" /><O C="4" Y="350" P="0" X="2176" /><O C="12" Y="351" P="0" X="2178" /><O C="4" Y="350" X="2620" P="0" /><O C="12" Y="351" X="2622" P="0" /><O C="4" Y="350" P="0" X="3064" /><O C="12" Y="351" P="0" X="3066" /></O></Z></C>',
			 '<C><P D="x_deadmeat/cinematique/1.jpg, 0, 0;x_deadmeat/cinematique/1.jpg, 1600, 0;x_deadmeat/cinematique/1.jpg, 3200, 0" L="3463" /><Z><S><S L="3000" X="1244" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="10" X="2321" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="17" H="17" X="120" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="160" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="240" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="200" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="160" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="200" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="240" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="120" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="564" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="604" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="644" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="684" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="564" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="604" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="644" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="684" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1008" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1048" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1088" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1128" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1008" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1048" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1088" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1128" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1452" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1492" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1532" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1572" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1452" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1492" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1532" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1572" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1896" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1936" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1976" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2016" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1896" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="1936" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="1976" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2016" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2340" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2380" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2420" H="17" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2460" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2340" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2380" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" X="2420" H="17" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2460" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2784" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2824" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2864" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2904" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2784" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2824" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2864" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="2904" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3228" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3268" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3308" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3348" Y="244" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3228" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3268" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3308" Y="282" T="9" P="0,0,,,,0,0,0" /><S L="17" H="17" X="3348" Y="282" T="9" P="0,0,,,,0,0,0" /></S><D><DS Y="316" X="-190" /></D><O /></Z></C>',
			 '<C><P D="x_deadmeat/cinematique/42.jpg, 0, 0;x_deadmeat/cinematique/42.jpg, 1600, 0;x_deadmeat/cinematique/42.jpg, 3200, 0;" L="3463" /><Z><S><S c="4" L="106" H="10" X="188" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S H="10" L="33" X="130" c="1" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="249" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="632" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="575" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="687" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="1076" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="1131" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="1019" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="1520" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="1462" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="1582" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="1964" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="1908" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="2022" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="2408" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="2470" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="2358" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="2852" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="2800" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="2907" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S c="4" L="106" H="10" X="3296" Y="212" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="33" H="10" X="3245" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="33" H="10" X="3348" Y="212" T="1" P="1,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="413" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="857" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="1301" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="1746" Y="92" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="2189" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="2633" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" H="10" X="3077" Y="93" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="101" X="413" H="10" Y="357" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="413" c="4" N="" Y="359" T="1" H="14" /><S L="101" X="857" H="10" Y="357" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="858" c="4" N="" Y="359" T="1" H="14" /><S L="101" X="1746" H="10" Y="357" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="1746" c="4" N="" Y="359" T="1" H="14" /><S L="101" X="2189" H="10" Y="357" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="2189" c="4" N="" Y="359" T="1" H="14" /><S P="0,0,0,1.2,0,0,0,0" L="101" X="1301" c="1" Y="357" T="2" H="10" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="1301" c="4" N="" Y="359" T="1" H="14" /><S L="101" X="2633" H="10" Y="356" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="2633" c="4" N="" Y="359" T="1" H="14" /><S L="101" X="3077" H="10" Y="357" T="2" P="0,0,0,1.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="105" X="3077" c="4" N="" Y="359" T="1" H="14" /></S><D><DS Y="426" X="-207" /></D><O><O C="12" Y="210" P="0" X="189" /><O C="22" Y="212" P="0" X="234" /><O C="22" Y="213" P="0" X="145" /><O C="12" Y="213" P="0" X="633" /><O C="22" Y="212" P="0" X="588" /><O C="22" Y="212" P="0" X="677" /><O C="12" Y="212" P="0" X="1076" /><O C="22" Y="212" P="0" X="1031" /><O C="22" Y="213" P="0" X="1121" /><O C="12" Y="211" P="0" X="1522" /><O C="22" Y="212" P="0" X="1567" /><O C="22" Y="212" P="0" X="1477" /><O C="12" Y="212" P="0" X="1963" /><O C="22" Y="212" P="0" X="2010" /><O C="22" Y="212" P="0" X="1920" /><O C="12" Y="212" P="0" X="2409" /><O C="22" Y="212" P="0" X="2368" /><O C="22" Y="212" P="0" X="2459" /><O C="12" Y="212" P="0" X="2853" /><O C="22" Y="212" P="0" X="2814" /><O C="22" Y="212" P="0" X="2894" /><O C="12" Y="213" P="0" X="3296" /><O C="22" Y="211" P="0" X="3257" /><O C="22" Y="212" P="0" X="3336" /></O></Z></C>',
			 '<C><P L="3463" D="x_deadmeat/x_campement/fond3.png, 0, 0;x_deadmeat/x_campement/fond3.png, 1215, 0;x_deadmeat/x_campement/fond3.png, 2426, 0" /><Z><S><S H="10" L="108" X="187" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="631" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="1519" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="1075" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="1963" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="2851" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="3295" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S X="2407" L="108" H="10" c="4" Y="222" T="17" P="1,0,0.3,0.2,0,0,0,0" /><S H="10" L="10" X="242" c="1" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S H="10" L="10" X="132" c="1" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S H="10" L="10" X="577" c="1" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1025" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1130" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1470" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1575" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1912" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="2020" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="2907" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="2799" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="2464" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="2357" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="3245" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="3348" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="687" Y="222" T="19" P="1,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="416" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="240" X="416" Y="279" T="9" P="0,0,,,,0,0,0" /><S c="4" L="10" H="240" X="860" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="1304" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="1748" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="2192" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="2636" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S c="4" L="10" H="240" X="3080" Y="279" T="19" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="240" X="3080" Y="279" T="9" P="0,0,,,,0,0,0" /><S L="10" H="240" X="2636" Y="279" T="9" P="0,0,,,,0,0,0" /><S L="10" H="240" X="2192" Y="279" T="9" P="0,0,,,,0,0,0" /><S L="10" H="240" X="1748" Y="279" T="9" P="0,0,,,,0,0,0" /><S L="10" H="240" X="1304" Y="279" T="9" P="0,0,,,,0,0,0" /><S L="10" H="240" X="860" Y="279" T="9" P="0,0,,,,0,0,0" /></S><D><DS Y="-41" X="882" /></D><O><O C="12" Y="222" P="0" X="187" /><O C="12" Y="222" P="0" X="630" /><O C="12" Y="222" P="0" X="1076" /><O C="12" Y="221" P="0" X="1520" /><O C="12" Y="220" P="0" X="1964" /><O C="12" Y="221" P="0" X="2407" /><O C="12" Y="222" P="0" X="2851" /><O C="12" Y="222" P="0" X="3295" /><O C="22" Y="223" P="0" X="240" /><O C="22" Y="222" P="0" X="135" /><O C="22" Y="222" P="0" X="580" /><O C="22" Y="222" P="0" X="1027" /><O C="22" Y="222" P="0" X="1128" /><O C="22" Y="221" P="0" X="3248" /><O C="22" Y="222" P="0" X="3346" /><O C="22" Y="223" P="0" X="2905" /><O C="22" Y="222" P="0" X="2802" /><O C="22" Y="223" P="0" X="2462" /><O C="22" Y="223" P="0" X="2360" /><O C="22" Y="223" P="0" X="2017" /><O C="22" Y="223" P="0" X="1915" /><O C="22" Y="222" P="0" X="1573" /><O C="22" Y="222" P="0" X="1473" /><O C="22" Y="223" P="0" X="685" /></O></Z></C>',
			 '<C><P L="3463" D="x_deadmeat/cinematique/107.jpg, 0, 0;x_deadmeat/cinematique/107.jpg, 1599, 0;x_deadmeat/cinematique/107.jpg, 3198, 0" /><Z><S><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="d00d0d" H="10" Y="51" T="12" X="132" /><S L="10" o="d00d0d" H="260" X="181" Y="135" T="12" P="1,999999,500,0.2,0,1,9999,9990" /><S P="0,0,0,0,50,0,0,0" L="70" o="d00d0d" X="25" Y="118" T="12" H="10" /><S P="0,0,0,0.2,0,0,0,0" L="200" o="d00d0d" H="10" Y="9" T="12" X="180" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="d00d0d" X="42" Y="51" T="12" H="10" /><S L="122" o="d00d0d" H="10" X="230" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="122" o="d00d0d" X="317" H="10" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="72" o="d00d0d" X="342" H="10" Y="112" T="12" P="0,0,0,0,-50,0,0,0" /><S L="200" o="1c59d9" H="10" X="624" Y="9" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="1,999999,500,0.2,0,1,9999,9990" L="10" o="1c59d9" X="625" Y="135" T="12" H="260" /><S L="122" o="1c59d9" H="10" X="576" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="1c59d9" X="674" Y="51" T="12" H="10" /><S L="122" o="1c59d9" X="486" H="10" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="70" o="1c59d9" X="469" H="10" Y="118" T="12" P="0,0,0,0,50,0,0,0" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="1c59d9" H="10" Y="51" T="12" X="761" /><S P="0,0,0,0,-50,0,0,0" L="72" o="1c59d9" H="10" Y="112" T="12" X="786" /><S L="10" o="ffe300" X="1069" H="260" Y="135" T="12" P="1,999999,500,0.2,0,1,9999,9990" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="ffe300" X="1020" Y="51" T="12" H="10" /><S P="0,0,0,0.2,0,0,0,0" L="200" o="ffe300" X="1068" Y="9" T="12" H="10" /><S L="122" o="ffe300" X="1118" H="10" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="122" o="ffe300" H="10" X="1205" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="ffe300" H="10" Y="51" T="12" X="930" /><S P="0,0,0,0,50,0,0,0" L="70" o="ffe300" H="10" Y="118" T="12" X="913" /><S L="72" o="ffe300" H="10" X="1230" Y="112" T="12" P="0,0,0,0,-50,0,0,0" /><S P="1,999999,500,0.2,0,1,9999,9990" L="10" o="19c52e" H="260" Y="135" T="12" X="1513" /><S L="200" o="19c52e" X="1512" H="10" Y="9" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="19c52e" H="10" Y="51" T="12" X="1562" /><S L="122" o="19c52e" X="1464" H="10" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="122" o="19c52e" H="10" X="1374" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="70" o="19c52e" H="10" X="1357" Y="118" T="12" P="0,0,0,0,50,0,0,0" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="19c52e" X="1649" Y="51" T="12" H="10" /><S P="0,0,0,0,-50,0,0,0" L="72" o="19c52e" X="1674" Y="112" T="12" H="10" /><S L="10" o="ff8300" H="260" X="1957" Y="135" T="12" P="1,999999,500,0.2,0,1,9999,9990" /><S P="0,0,0,0.2,0,0,0,0" L="200" o="ff8300" H="10" Y="9" T="12" X="1956" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="ff8300" H="10" Y="51" T="12" X="1908" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="ff8300" X="1818" Y="51" T="12" H="10" /><S P="0,0,0,0,50,0,0,0" L="70" o="ff8300" X="1801" Y="118" T="12" H="10" /><S L="122" o="ff8300" H="10" X="2006" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="122" o="ff8300" X="2093" H="10" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="72" o="ff8300" X="2118" H="10" Y="112" T="12" P="0,0,0,0,-50,0,0,0" /><S P="1,999999,500,0.2,0,1,9999,9990" L="10" o="ff00f6" X="2401" Y="135" T="12" H="260" /><S L="200" o="ff00f6" H="10" X="2400" Y="9" T="12" P="0,0,0,0.2,0,0,0,0" /><S L="122" o="ff00f6" H="10" X="2352" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="122" o="ff00f6" X="2262" H="10" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="70" o="ff00f6" X="2245" H="10" Y="118" T="12" P="0,0,0,0,50,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="ff00f6" X="2450" Y="51" T="12" H="10" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="ff00f6" H="10" Y="51" T="12" X="2537" /><S P="0,0,0,0,-50,0,0,0" L="72" o="ff00f6" H="10" Y="112" T="12" X="2562" /><S P="1,999999,500,0.2,0,1,9999,9990" L="10" o="9100FF" X="2845" Y="135" T="12" H="260" /><S L="200" o="9100FF" H="10" X="2844" Y="9" T="12" P="0,0,0,0.2,0,0,0,0" /><S L="122" o="9100FF" H="10" X="2796" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="122" o="9100FF" X="2706" H="10" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="70" o="9100FF" X="2689" H="10" Y="118" T="12" P="0,0,0,0,50,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="9100FF" X="2894" Y="51" T="12" H="10" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="9100FF" H="10" Y="51" T="12" X="2981" /><S P="0,0,0,0,-50,0,0,0" L="72" o="9100FF" H="10" Y="112" T="12" X="3006" /><S P="1,999999,500,0.2,0,1,9999,9990" L="10" o="00F3F3" X="3289" Y="135" T="12" H="260" /><S L="200" o="00F3F3" H="10" X="3288" Y="9" T="12" P="0,0,0,0.2,0,0,0,0"  /><S L="122" o="00F3F3" H="10" X="3240" Y="51" T="12" P="0,0,0,0.2,40,0,0,0" /><S L="122" o="00F3F3" X="3150" H="10" Y="51" T="12" P="0,0,0,0.2,-40,0,0,0" /><S L="70" o="00F3F3" X="3133" H="10" Y="118" T="12" P="0,0,0,0,50,0,0,0" /><S P="0,0,0,0.2,-40,0,0,0" L="122" o="00F3F3" X="3338" Y="51" T="12" H="10" /><S P="0,0,0,0.2,40,0,0,0" L="122" o="00F3F3" H="10" Y="51" T="12" X="3425" /><S P="0,0,0,0,-50,0,0,0" L="72" o="00F3F3" H="10" Y="112" T="12" X="3450" /><S L="3000" H="11" X="1441" Y="459" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="3000" X="2101" H="11" Y="459" T="2" P="0,0,0,1.2,0,0,0,0" /></S><D><DS Y="-25" X="51" /></D><O /><L><JP MV="Infinity,70" M1="3" AXIS="0,1" /><JR M2="5" M1="3" /><JP MV="Infinity,70" M1="11" AXIS="0,1" /><JR M2="10" M1="11" /><JP MV="Infinity,70" M1="18" AXIS="0,1" /><JR M2="20" M1="18" /><JP MV="Infinity,70" M1="26" AXIS="0,1" /><JR M2="27" M1="26" /><JP MV="Infinity,70" M1="34" AXIS="0,1" /><JR M2="35" M1="34" /><JP MV="Infinity,70" M1="42" AXIS="0,1" /><JR M2="43" M1="42" /><JP MV="Infinity,70" M1="50" AXIS="0,1" /><JR M2="51" M1="50" /><JP MV="Infinity,70" M1="58" AXIS="0,1" /><JR M2="59" M1="58" /></L></Z></C>'
	}
	cn1 = {}
	cn2 = {}
	cn3 = {}
	cn4 = {}
	cn5 = {}
	cn6 = {}
	cn7 = {}
	cn8 = {}
	cnsy = {}
	if map == 1 then
		pad()
	elseif map == 2 then
		cnsy = {179}
		cn1 = {4, 178, 345}
		cn2 = {448, 622, 789}
		cn3 = {892, 1066, 1233}
		cn4 = {1336, 1510, 1677}
		cn5 = {1780, 1954, 2121}
		cn6 = {2224, 2398, 2565}
		cn7 = {2668, 2842, 3009}
		cn8 = {3112, 3286, 3453}
	elseif map == 3 then
		pad()
	elseif map == 4 then
		cnsy = {80}
		for nc1 = 98, 258, 1 do
			table.insert(cn1, nc1)
		end
		for nc2 = 542, 702, 1 do
			table.insert(cn2, nc2)
		end
		for nc3 = 986, 1146, 1 do
			table.insert(cn3, nc3)
		end
		for nc4 = 1430, 1590, 1 do
			table.insert(cn4, nc4)
		end
		for nc5 = 1874, 2034, 1 do
			table.insert(cn5, nc5)
		end
		for nc6 = 2318, 2478, 1 do
			table.insert(cn6, nc6)
		end
		for nc7 = 2762, 2922, 1 do
			table.insert(cn7, nc7)
		end
		for nc8 = 3206, 3366, 1 do
			table.insert(cn8, nc8)
		end
	elseif map >= 5 and map <= 8 then
		pad()
	elseif map == 9 then
		cnsy = {167, 154, 134}
		cn1 = {131, 155, 203, 211, 242}
		cn2 = {575, 599, 647, 655, 686}
		cn3 = {1019, 1043, 1091, 1099, 1130}
		cn4 = {1463, 1487, 1535, 1543, 1574}
		cn5 = {1907, 1931, 1979, 1987, 2018}
		cn6 = {2351, 2375, 2423, 2431, 2462}
		cn7 = {2795, 2819, 2867, 2875, 2906}
		cn8 = {3239, 3263, 3311, 3319, 3350}
	end
	tfm.exec.newGame(mapas[map])
	map = map + 1
	   if map == (#mapas + 1) then
		map = 1
	end
	spawn()
end

function spawnCannon()
	cnsX = {cn1, cn2, cn3, cn4, cn5, cn6, cn7, cn8}
	for i = 1, 8 do
		if playersOnGame[i].life > 0 then
			t1 = tfm.exec.addShamanObject(17, cnsX[i][math.random(#(cnsX[i]))], cnsy[math.random(#cnsy)], 0, 0, 0, false)
			objectList[playersOnGame[i].name] = {id = t1}
			table.insert(objectList, i, objectList[playersOnGame[i].name])
		else
			objectList[playersOnGame[i].name] = {id = nil}
			table.insert(objectList, i, objectList[playersOnGame[i].name])
		end
	end
end

function collect()
	coordX = {}
	coordY = {}
	for i = 1, 8 do
		if playersOnGame[i].life > 0 then
			objX1 = tfm.get.room.objectList[objectList[i].id].x
			objY1 = tfm.get.room.objectList[objectList[i].id].y
			coordX[#coordX + 1] = objX1
			coordY[#coordY + 1] = objY1
		end
	end
end

function attLife(name)
	local textId = {0, 1, 16, 17, 18, 19, 21, 22}
	local textCoordinatesX = {154, 598, 1042, 1486, 1929, 2374, 2818, 3262}
	for g = 1, 8 do
		ui.addTextArea(textId[g], "<p align='center'><font size='15px'><b>"..playersOnGame[g].life.."", name, textCoordinatesX[g], 56, 50, 30, 0x161616, 0x161616, 0, false)
	end
end

function repita(jogador)
	ui.addWindow(-1, mice[jogador].tr.text6.."<br><br><font face='verdana'>"..mice[jogador].tr.text7.."", jogador, 74, 50, 704, 300, 1, true, true, "<a href='event:closeWindow'><p align='center'>"..mice[jogador].tr.text24)
end

function removeText()
	for text = 0, 22, 1 do
		ui.removeTextArea(text)
	end
	if inGame == false then
		ui.removeTextArea(3000)
	end
	ui.removeTextArea(5000)
end

function limpar()
	if #objectList > 0 then
		for obj = 1, #playersOnGame, 1 do
			if objectList[playersOnGame[obj].name].id ~= nil then
				tfm.exec.removeObject(objectList[playersOnGame[obj].name].id)
			end
		end
	end
	objectList = {}
	if #portaisid > 0 then
		for idobj = 1, #portaisid, 1 do
			tfm.exec.removeObject(portaisid[idobj])
		end
	end
	portaisid = {}
	for piso = 0, 24, 1 do
		tfm.exec.removePhysicObject(piso)
	end
	for piso3 = 98, 105, 1 do
		tfm.exec.removePhysicObject(piso3)
	end
	if #idImgToBorders > 0 then
		for jjj = 1, #idImgToBorders do
			tfm.exec.removeImage(idImgToBorders[jjj])
		end
	end
	if fim == true then
		for piso2 = 50, 97, 1 do
			tfm.exec.removePhysicObject(piso2)
		end
	end
end

function spawn()
	valor = 178
	valor7 = 1
	cor = {0xD00D0D, 0x1C59D9, 0xFFE300, 0x19C52E, 0xFF8300, 0xFF00F6, 0x9100FF, 0x00F3F3}
	for h = 50, 57, 1 do
		tfm.exec.addPhysicObject(h, valor, 401, {
			type = 12,
			color = cor[valor7],
			width = 200,
			height = 10,
			friction = 5000,
			restitution = .2,
			miceCollision = false,
			groundCollision = true})
			valor = valor + 444
			valor7 = valor7 + 1
		end
	valor1 = 83
	for j = 58, 65, 1 do
		tfm.exec.addPhysicObject(j, valor1, 390, {
			type = 2,
			color = 0xFFFFFF,
			width = 10,
			height = 20,
			friction = 0,
			restitution = 1.3,
			miceCollision = false,
			groundCollision = true})
			valor1 = valor1 + 444
	end
	valor6 = 83
	valor8 = 1
	for jj = 90, 97, 1 do
		tfm.exec.addPhysicObject(jj, valor6 + 1, 391, {
			type = 12,
			color = cor[valor8],
			width = 10,
			height = 20,
			friction = 5000,
			restitution = 0,
			miceCollision = false,
			groundCollision = true})
			valor6 = valor6 + 444
			valor8 = valor8 + 1
	end
	valor2 = 273
	for q = 66, 73, 1 do
		tfm.exec.addPhysicObject(q, valor2, 390, {
			type = 2,
			color = math.random(0xFFFFFF),
			width = 10,
			height = 20,
			friction = 5000,
			restitution = 1.3,
			miceCollision = false,
			groundCollision = true})
			valor2 = valor2 + 444
	end
	valor5 = 273
	valor9 = 1
	for gg = 82, 89, 1 do
		tfm.exec.addPhysicObject(gg, valor5 - 1, 391, {
			type = 12,
			color = cor[valor9],
			width = 10,
			height = 20,
			friction = 5000,
			restitution = 0,
			miceCollision = false,
			groundCollision = true})
			valor5 = valor5 + 444
			valor9 = valor9 + 1
	end
	valor3 = 178
	valor4 = 1
	for p = 74, 81, 1 do
		tfm.exec.addPhysicObject(p, valor3, 66, {
			type = 13,
			color =  cor[valor4],
			width = 20,
			height = 0,
			friction = 0,
			restitution = .2,
			miceCollision = false,
			groundCollision = false})
			valor3 = valor3 + 444
			valor4 = valor4 + 1
	end
end

function checkl()
	local textCoordinatesX = {118, 563, 1008, 1453, 1898, 2343, 2783, 3223}
	local textId = {3, 4, 5, 6, 8, 9, 10, 11}
	idImgToBorders = {}
	for i = 1, 8 do
		if playersOnGame[i].life > 0 then
			idImg = tfm.exec.addImage ("177ad5c0c60.png", "_0", textCoordinatesX[i], 302, playersOnGame[i].name)
			idImgToBorders[#idImgToBorders + 1] = idImg
		end
	end		
end

function objcoords()
	initGoalExtension = {90, 534, 978, 1422, 1866, 2310, 2754, 3198}
	endGoalExtension = {265, 709, 1153, 1597, 2041, 2485, 2929, 3373}
	for i = 1, #initGoalExtension  do
		index = i 
		cannonCheckCoordinates(initGoalExtension[i], endGoalExtension[i], index)
	end
	condi2 = condi2 + 1
end

function cannonCheckCoordinates(InitExtensionGoal, EndExtensionGoal)
	for cn = 1, #coordX do
		if coordX[cn] >= InitExtensionGoal and coordX[cn] <= EndExtensionGoal then
			if coordY[cn] == 381 then
				lostLife(InitExtensionGoal, index)
			end
		end
	end
end

function lostLife(InitExtensionGoal, index)
	local valuesOfInitExtensionGoalToCompare = {90, 534, 978, 1422, 1866, 2310, 2754, 3198}
	for i = 1, #valuesOfInitExtensionGoalToCompare do
		if playersOnGame[index].life > 0 then
			if InitExtensionGoal == valuesOfInitExtensionGoalToCompare[i] then
				playersOnGame[index].life = playersOnGame[index].life - 1
			end
		else
			break
		end
	end
	attLife(nil)
end

function portais()
	port1 = tfm.exec.addShamanObject(26, math.random(118, 3338), math.random(307, 345), 0, 0, 0, false)
	port2 = tfm.exec.addShamanObject(27, math.random(118, 3338), math.random(307, 345), 0, 0, 0, false)
	table.insert(portaisid, port1)
	table.insert(portaisid, port2)
end

function spawnT()
	valor10 = 178
	for vnb = 98, 105, 1 do
		tfm.exec.addPhysicObject(vnb, valor10, 362, {
		type = 8,
		width = 200,
		height = 10,
		miceColission = true,
		groundCollision = true})
		valor10 = valor10 + 444
	end
end

function teleportPlayers()
	value = 178
	for hgj = 1, #players do
		tfm.exec.movePlayer (players[hgj], value, 10000, false, 0, 0, false)
		value = value + 444
	end
end

function pad()
	for nc1 = 136, 212, 1 do
		table.insert(cn1, nc1)
	end
	for nc2 = 582, 658, 1 do
		table.insert(cn2, nc2)
	end
	for nc3 = 1028, 1104, 1 do
		table.insert(cn3, nc3)
	end
	for nc4 = 1474, 1550, 1 do
		table.insert(cn4, nc4)
	end
	for nc5 = 1920, 1996, 1 do
		table.insert(cn5, nc5)
	end
	for nc6 = 2366, 2442, 1 do
		table.insert(cn6, nc6)
	end
	for nc7 = 2812, 2888, 1 do
		table.insert(cn7, nc7)
	end
	for nc8 = 3258, 3334, 1 do
		table.insert(cn8, nc8)
	end
	for ncsy = 93, 254, 1 do
		table.insert(cnsy, ncsy)
	end
end

iniciar()
end

initPool = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.newGame("@7601768")
xml2=''
run_time=0
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	ui.setMapName("<font color='#14ACEE'><font size='12'>The Master Pool 5.2 - Advanced LUA Map made by <b>Aurelianlua#0000</b><")
end
function eventPlayerDied(name)
	eventNewPlayer(name)
end
function eventNewGame()
	xml2=tfm.get.room.xmlMapInfo.xml
end
function eventLoop()
	if run_time <= 3.5 then
		run_time=run_time+0.5
		if run_time >= 4 then
			tfm.exec.newGame(xml2)
			ui.setMapName("<font color='#14ACEE'><font size='12'>The Master Pool 5.2 - Advanced LUA Map made by <b>Aurelianlua#0000</b><")
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].y > 800 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-15,0,-0.6,0,-0.05,nil)
		end
		if tfm.get.room.playerList[name].y > 850 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-28,0,-0.6,0,-0.05,nil)
		end
		if tfm.get.room.playerList[name].y > 900 then
				tfm.exec.displayParticle(14,tfm.get.room.playerList[name].x+16,tfm.get.room.playerList[name].y-41,0,-0.6,0,-0.05,nil)
		end
	end
end
end

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7803705")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00deadfender<br>/room #anvilwar00pool<br><br><BL>Do you want to see your module included into #anvilwar rooms? Contact <b>Spectra_phantom#6089</b> on Transformice or <b>BarodiusEleven#2941</b> on Discord.")
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.172.1<br>By Spectra_phantom#6089")
if string.find(tfm.get.room.name,"*") then
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") or string.find(tfm.get.room.name,"survivor") then
		tfm.exec.chatMessage("<R>Room name not allowed. Shutting down...")
	elseif string.find(tfm.get.room.name,"deadfender") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'deadfender' on room name.<br>Initialising #deadfender module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initDeadfender()
	elseif string.find(tfm.get.room.name,"pool") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'pool' on room name.<br>Initialising #pool module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initPool()
	elseif string.find(tfm.get.room.name,"rooms") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'rooms' on room name.<br>Showing available #anvilwar rooms.")
		Rooms()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
