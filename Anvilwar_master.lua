-- Transformice #anvilwar module loader - Version 2.270.3
-- By Spectra_phantom#6089
-- Included sub-modules: #objects, #truefalse.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.270.3",
	_MAINV = "56671.274 LTS",
	_DEVELOPER = "Spectra_phantom#6089" }
	
initAnvilwar = function()
-- #anvilwar
-- Module authors : Spectra_phantom#6089
-- (C) 2017-∞ Spectra Advanced Module Group

-- Version : RTM 56671.274 LTS
-- Compilation date : 08/09/2024 13:46 UTC
-- Sending player : Spectra_phantom#6089

-- Number of maps : 217
-- Number of module special members : 12

_VERSION = "Lua 5.4"
_AUTHOR = "Spectra_phantom#6089"

maps={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7940082","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892","@7497395","@7512948","@7555653","@7688028","@7655209","@7690671","@7845674","@7845680","@7845682","@7845738","@7859139","@7845709","@7844985","@7859144","@7860343","@7860623","@7860498","@7863972","@7803705","@7845724","@7866585","@7834953","@7866596","@7703547","@7795869","@7869247","@7844978","@7869610","@7654290","@7876838","@7879243","@7664077","@7760487","@7802869","@7808177","@7882449","@7882451","@7882453","@7882454","@7882456","@7882458","@7879251","@7748874","@7891576","@7891577","@7891578","@7892788","@7902610","@7904039","@7869352","@7869389","@7841404","@7922465","@7919510","@7919518","@7919522","@7920813","@7922467","@7921968","@7922249","@7922362","@7922698","@7923483","@7922924","@7920975","@7926144","@7923482","@7930770","@7939243","@7939245","@7939272","@7940628","@7941546","@7941548","@7941562","@7941578","@7941580","@7942420","@7956682","@7941709","@7919225","@7946233","@7955389","@7955397","@7955430","@7955514","@7955596","@7955609","@7956254","@7956255","@7956259","@7956699","@7957747","@7957772"}
map_names={"The Dual-Sided Fight Area","No Name","Inside the Castle","Hell and Water","A very simple waterfall","No Name","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","No Name","The first #anvilwar map","The Beach Test Map 2","No Name","No Name","The Six Attributes","Inside the Ocean","No Name","No Name","No Name","No Name","The Stone Platforms","Inside the Hell","Testing Spaceship","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of The Void","The Bridge of Death","No Name","On the Seabed","The Palace of Swords","The Castle of Fire","No Name","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","No Name","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","No Name","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","No Name","No Name","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge (v2)","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","No Name","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","No Name","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Soccer Teams #1","May the force Be with You","Don't Jump! #1","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","No Name","No Name","Do Not Hit The Anvil","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Floating Acid","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury #1","Released Things","No Name","No Name","This is a Terror","No Name","No Name","Escape from Nyan Cat","Sharingan Eye","Zombie Attack","Destructed Zone","Eye of Black Hole","Soccer Teams #2","No Name","No Name","The Beach Test Map 6","The Beach Test Map 7","Vexos Arena","Releasing Anvils","The Hug of Agony","Try a Little More","No Name","No Name","No Name","Land of Spirits","No Name","No Name","No Name","No Name","Tobi - Akatsuki","Water Backgrounds","Up and Down","Watcher","Stranger Things","The Beach Test Map 8","Circle Compression","Gradient Colors","Background Reflection","Locked Dimensions","Now I See","Legacy Mansion","Water Equilibrium","Terrific Alternative","No Name","The Frozen Witch","Animal Fury #2","The Beach Test Map 9","Object Alchemy","Don't Jump! #2","The Beach Test Map 10","Balancing Things","Uzumaki Boruto Eyes","Namikaze Minato","Dragon Eyes","No Name","Stone Overriding","The Beach Test Map 11","Extreme Stone Maze","Neathian Guardian","No Name","No Name","No Name","Halloween","Soccer Teams #3","PSG","Apple VS Android","Unaligned Dimension","Siren Equilibrium","Nike","The Star Forger #1","Blade of The Exile","The Dancer of Blades","The Star Forger #2","The Tidecaller","Soccer Teams #4","Don't Jump! #3","Blade of The Ruined King","Soccer Teams #5","Don't Cross The Red Line","The Scorn of The Moon","No Name","Spider and the Web","Autumn vs Winter","Soccer Teams #6","The Visionary","Noxus VS Ionia","Shurima VS Targon","Freljord Desert","Lacoste","Bilgewater Harrowing","Extreme Honey Maze","The Beach Test Map 12","Piltover VS Zaun","Malevolent Sanctuary","Ixtal Rainforest","Great City of Demacia"}
objects={1,2,3,4,6,7,10,23,33,34,39,45,46,54,60,61,65,68,69,90,95}
players_red={}; alives_red={};
players_blue={}; alives_blue={};
lobby_map="@7884784"
current_map=""; actual_player="";
enabled=false; powerups=false; custom_map=true; permafrost=false; night_mode=false; gravity=false; change=false; custom_mode=false; dsettings=true; mices=0; loop=0; turns=0; needs=0; turn=0; choose_time=20; time_passed=0; time_remain=0; current_red=0; current_blue=0; ping_check=1; sudden_death=false; old_limit=40; points_loop=0; pf_time=0; general_time=0; total_time=0; map_id=0; set_player=""; set_map="-1"; def_map=-1; red_cap=""; blue_cap=""; temp_name=""; bar_text=""; final="";
settings={time=180,plimit=16,map_mode=0,map_select="@7412348",g_powerups=true,shoot_time=16,anti_kami=false,sd_switch=true,bg_switch=false,cap_lifes=2,autoping=true,manual=false}
mode="lobby"
divider="　　　　　　　　　";
images_id={};
playersList={};
mods={"Dinamarquers#0000","Flaysama#5935","Chavestomil#0000"};
admins={"Spectra_phantom#6089","Geracionz#0000"};
data={}
lang = {}
lang.br = {
	version = "Versão",
	mices_room = "Ratos : ",
	comp_date = "Data de compilação : ",
	uploaded = "Carregado por ",
	ending = "Fim de jogo! Retornando à tela principal em alguns segundos...",
	won = "Você ganhou ",
	manager = "Você é o gerenciador desta sala. Digite !adcommands para ver os comandos disponíveis para os administradores de sala.",
	p1 = "usou o powerup Disparo Duplo!",
	p2 = "usou o powerup Disparo Triplo!",
	p3 = "usou o powerup Olha a Explosão!",
	p4 = "usou o powerup Congelamento!",
	p5 = "usou o powerup Modo Noturno!",
	p6 = "usou o powerup Chuva de Bigornas!",
	p7 = "usou o powerup Anomalia Gravitacional!",
	p8 = "usou o powerup Caixa de Acompanhamento!",
	p9 = "usou o powerup Tiro Aleatório!",
	p10 = "Você precisa ser capitão do seu time e possuir 30 pontos para reviver.<br>Além disso, não é possível reviver faltando menos de 30 segundos.",
	p0 = "Você não possui pontos e/ou nível suficientes para usar este powerup.",
	ap = "Potência: ",
	ag = "Ângulo: ",
	suicide = "O seguinte jogador cometeu suicídio: ",
	rankw = "Aviso: Tenha em mente que os dados do Ranking e do Perfil são temporários e são redefinidos quando a sala esvazia.",
	tk1 = "Oh não! ",
	tk2 = " matou um companheiro de equipe: ",
	submission = "<br><N>As avaliações de mapas do #anvilwar estão abertas!",
	pw = "Senha trocada para: ",
	pw0 = "Senha removida.",
	limit = "Limite de ratos na sala: ",
	load1 = "O seguinte mapa será carregado: ",
	load2 = "Certifique-se que há pelo menos 1 jogador em cada equipe.",
	load0 = "Você precisa estar na tela principal para executar esta função. Digite !reset para fazer isso e tente novamente.",
	ac = "Você atualmente possui ",
	powerups = "<font size='11.5'><b>Tecla '1' - Disparo Duplo</b><br>Este powerup faz você atirar duas bigornas de uma vez.<br><b>Nível Mínimo:  1  /  Pontuação: 8pts</b><br><br><b>Tecla '2' - Disparo Triplo</b><br>Este powerup faz você atirar três bigornas de uma vez.<br><b>Nível Mínimo:  2  /  Pontuação: 12pts</b><br><br><b>Tecla '3' - Olha a Explosão</b><br>Este powerup permite a você criar uma explosão em um local do time inimigo.<br><b>Nível Mínimo:  3  /  Pontuação: 20pts</b><br><br><b>Tecla '4' - Congelamento</b><br>Este powerup congela todos os jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo:  3  /  Pontuação: 15pts</b><br><p align='right'><a href='event:pw2'>Ir à Página 2</a>",
	powerups2 = "<font size='11.5'><b>Tecla '5' - Modo Noturno</b><br>Este powerup remove a visão dos jogadores do time inimigo por um tempo limitado.<br><b>Nível Mínimo: 3  /  Pontuação: 10pts</b><br><br><b>Tecla '6' - Chuva de Bigornas</b><br>Este powerup vai fazer chover bigornas em áreas aleatórias do time inimigo.<br><b>Nível Mínimo: 3  /  Pontuação: 16pts</b><br><br><b>Tecla '7' - Anomalia Gravitacional</b><br>Este powerup vai aumentar consideravelmente a gravidade até o outro time atirar.<br><b>Nível Mínimo: 4  /  Pontuação: 12pts</b><br><br><b>Tecla '8' - Caixa de Acompanhamento</b><br>Atira uma caixa de acompanhamento ao invés de uma bigorna.<br><b>Nível Mínimo: 2  /  Pontuação: 16pts</b><br><br><b>Tecla '9' - Tiro Aleatório</b><br>Atira uma objeto aleatório ao invés de uma bigorna.<br><b>Nível Mínimo: 2  /  Pontuação: 8pts</b><br><p align='right'><a href='event:pw1'>Voltar à Página 1</a>",
	commands = "<font size='11.5'>!commands (ou <b>B</b>) - Mostra esta caixa de texto.<br>!anvils - Mostra as bigornas disponíveis para compra<br>!help (ou <b>H</b>) - Mostra a ajuda do jogo.<br>!tc [mensagem] - Envia uma mensagem que aparece apenas para os jogadores do seu time.<br>!powerups (ou <b>U</b>) - Mostra os powerups disponíveis e seus respectivos custos.<br>!p [usuário] (ou <b>P</b>) - Mostra o perfil do usuário especificado. Digite apenas !p para ver o seu perfil.<br>!ranking (ou <b>R</b>) - Mostra o ranking dos jogadores na sala.",
	help = "<font size='12'><b>Bem-vindo ao #anvilwar!</b><br>O objetivo deste module é matar os jogadores do time adversário usando bigornas.<br><br>O jogo é simples de ser jogado. Quando for sua vez, use as teclas <b>Z e X</b> para mudar a potência do seu tiro e as teclas <b>C e V</b> para mudar o ângulo. Use a <b>BARRA DE ESPAÇO</b> para atirar.<br>O time que conseguir eliminar todos os jogadores do outro time vencerá o jogo!<br><br>Quando você joga ou ganha partidas, você vai receber <J><b>AnvilCoins</b><N>. Esta é a moeda do jogo. Ela pode ser usada para comprar novas bigornas.<br>Divirta-se e que vença o melhor time!<br><br><N><R><b>Administradores:</b><N>Spectra_phantom#6089 e Geracionz#0000<br><VP><b>Contribuidores:</b><N> Flaysama#5935, Chavestomil#0000 e Dinamarquers#0000<br><J><b>Tradutores:</b><N> Patrick_mahomes#1795 (BR)",
	adcommands = "<font size='11.5'><N>!pw [senha] - Adiciona uma senha na sala. Digite apenas !pw para remover a senha.<br>!reset - Cancela a partida atual e retorna à tela inicial.<br>!limit [número] - Altera o limite de jogadores da sala.<br>!lc [0-3] - Altera a configuração do verificador de latência dos jogadores.<br>!settings - Altera as configurações da sala.",
	seconds = " segundos.",
	leave = "Sair",
	join = "Entrar",
	getr = "Preparem-se! A partida vai começar em instantes!",
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
	t30s = "Faltam 30 segundos!<br><br>A partir deste momento, não é mais possível reviver jogadores.",
	powerups_a = "Os powerups estão liberados!",
	time = "<b>Tempo esgotado!</b> O time adversário irá atirar agora.",
	cap_text = "foi escolhido para ser o líder do seu time.",
	cap = "<J><b>Você foi escolhido como o líder do time.</b><N><br>Digite !leader para saber as funcionalidades e os benefícios de ser o líder do seu time.",
	leader = "Os líderes dos times <b>são escolhidos aleatoriamente</b> e possui as seguintes vantagens em relação aos outros jogadores:<br><br>• Recebe 50% a mais de quantidade de pontos e AnvilCoins em relação aos outros jogadores<br>• Pode reviver jogadores mortos do seu time usando !rv [jogador]<br>• Pode transferir seus pontos para outro jogador do seu time usando !tp [jogador]<br>• Possui 20% a mais de tempo para atirar do que os outros jogadores<br>• Pode voltar a vida uma vez se morto.",
	legacy = "<N>Conheça todas as salas dentro do modo #anvilwar:<br><br><J><b>Cuidado com os objetos que estão caindo do céu!</b><br><VP>/sala #anvilwar00objects<br><br><J><b>A resposta é verdadeira ou falsa? Jogue este clássico do Transformice!</b><br><VP>/sala #anvilwar00truefalse<br><br><N>As avaliações de mapas do #anvilwar estão abertas!<br><J>atelier801.com/topic?f=6&t=894824&p=1#m1",
	disabled = "Este comando foi desabilitado por um administrador.",
	gametime = "Tempo",
	timeup = "<ROSE>Tempo esgotado! Este será o último tiro!",
	red_team = "Time Vermelho",
	blue_team = "Time Azul",
	revived = "O seguinte jogador reviveu: ",
	suddendeath = "<J><b>MORTE SÚBITA ATIVADA!</b><br><br>A partir de agora, a equipe que conseguir qualquer eliminação será declarada a vencedora!",
	latency = "Você não pode participar do jogo pois sua média de ping está muito alta.",
	custom = "<VP>O administrador da sala definiu regras personalizadas para esta sala.",
	defining = "<J>O administrador da sala está definindo regras personalizadas para esta sala. Por favor, aguarde...",
	kami = "<R>O modo anti-kamikaze está ativo nesta sala.",
	errorbg1 = "O modo Meninos contra Meninas está habilitado. Apenas meninas podem entrar no time vermelho.",
	errorbg2 = "O modo Meninos contra Meninas está habilitado. Apenas meninos podem entrar no time azul.",
	bgtext = "<N>O modo Meninos contra Meninas está habilitado. Meninos precisam entrar no time azul, enquanto meninas precisam entrar no time vermelho.",
	wrong = "Você não possui permissão para usar este comando",
	tmaperror = "O comando !testmap foi descontinuado. Para rodar um mapa personalizado, use o comando !settings e crie uma partida personalizada.",
	life1 = "<VP>O capitão do time <BL>azul <VP>foi morto, e agora possui apenas ", life3 = " vida(s).",
	life2 = "<VP>O capitão do time <R>vermelho <VP>foi morto, e agora possui apenas ",
	player_sync = "Jogador com menor ping para sync: ",
	startmatch = "<VP><b>Para iniciar uma partida no modo de inserção manual, digite !start.</b>",
	compet = "<VP>O Modo Competitivo está habilitado nesta sala. Os times são definidos pelo gerenciador da mesma.",
}
lang.en = {
	version = "Version",
	mices_room = "Mice : ",
	comp_date = "Compilation date : ",
	uploaded = "Uploaded by ",
	ending = "End of game! The lobby screen will be loaded in a few seconds.",
	won = "You won ",
	manager = "You are the manager of this room. Type !adcommands to see all available commands for room managers.",
	p1 = "used the powerup Double Shoot!",
	p2 = "used the powerup Triple Shoot!",
	p3 = "used the powerup Explosion!",
	p4 = "used the powerup Permafrost!",
	p5 = "used the powerup Night Mode!",
	p6 = "used the powerup Anvil Rain!",
	p7 = "used the powerup Gravity Anomaly!",
	p8 = "used the powerup Companion Box!",
	p9 = "used the powerup Random Shoot!",
	p10 = "You must be the leader of your team and have at least 30 points to revive.<br>Also, isn't allowed to revive players on the last 30 seconds.",
	p0 = "You don't have level or score to use this powerup.",
	ap = "Power: ",
	ag = "Angle: ",
	suicide = "The following player commited suicide: ",
	rankw = "Keep in mind that the profile and ranking data is temporary and will be lost when the room is gone.",
	tk1 = "Oh no! ",
	tk2 = " has killed a player of her team: ",
	submission = "<br><N>#anvilwar Map Submissions are now open!",
	pw = "Password changed to: ",
	pw0 = "Password cleared.",
	limit = "New room mice limit ",
	load1 = "The next map will be loaded: ",
	load2 = "The room needs to have a least 1 player into each team.",
	load0 = "You needs to stay into LOBBY mode to use this command. Use !reset command and try again.",
	ac = "You currently have ",
	powerups = "<font size='11.5'><b>Key '1' - Double Shoot</b><br>This powerup makes you shoot 2 anvils at once.<br><b>Required Level: 1  /  Required Score: 8pts</b><br><br><b>Key '2' - Triple Shoot</b><br>This powerup makes you shoot 3 anvils at once.<br><b>Required Level: 2  /  Required Score: 12pts</b><br><br><b>Key '3' - Explosion</b><br>This powerup allows you to create an explosion on the enemy team area.<br><b>Required Level: 3  /  Required Score: 20pts</b><br><br><b>Key '4' - Permafrost</b><br>This powerup freezes all enemy team players by a limited time.<br><b>Required Level: 3  /  Required Score: 15pts</b><br><p align='right'><a href='event:pw2'>Go to Page 2</a>",
	powerups2 = "<font size='11.5'><b>Key '5' - Night Mode</b><br>This powerup remove the vision of players of enemy team.<br><b>Required Level: 3  /  Required Score: 10pts</b><br><br><b>Key '6' - Anvil Rain</b><br>This powerup will create a anvil rain on random enemy team areas.<br><b>Required Level: 3  /  Required Score: 16pts</b><br><br><b>Key '7' - Gravity Anomaly</b><br>This powerup will incrase the gravity of map by 200% until the next player shoots.<br><b>Required Level: 4  /  Required Score: 14pts</b><br><br><b>Key '8' - Companion Box</b><br>Shoot an companion box instead of an anvil.<br><b>Required Level: 2  /  Required Score: 16pts</b><br><br><b>Key '9' - Random Shoot</b><br>Shoot an random object instead of an anvil.<br><b>Required Level: 2  /  Required Score: 8pts</b><br><p align='right'><a href='event:pw1'>Return to Page 1</a>",
	commands = "<font size='11.5'>!commands (or <b>B</b> key) - Display this message box.<br>!anvils - Show available #anvilwar anvils to buy.<br>!help (or <b>H</b> key) - Display the game help.<br>!tc [message] - Send a message that is visible only for players of your team.<br>!powerups (or <b>U</b> key) - Show all available powerups and their respective costs.<br>!p [username] (or <b>P</b> key) - Show the profile of the specified user. Type !p only to see your profile.<br>!ranking (or <b>R</b> key) - Show the room ranking.",
	adcommands = "<font size='11.5'>!pw [password] - Locks the room with a password. Use only !pw to clear the password.<br>!reset - Cancel the current match and returns to the lobby screen.<br>!limit [number] - Change the limit of mices on the room.<br>!lc [0-3] - Change the level of the player's latency checker.<br>!settings - Change the room settings.",
	help = "<font size='12'><b>Welcome to #anvilwar!</b><br>The objective of this module is kill all the players of other team using anvils.<br><br>The module is very easy to play. When reaches your turn, use <b>Z and X</b> keys to change the intensity of the anvil shoot and <b>C and V</b> keys to change the angle of the anvil. Use the <b>SPACEBAR</b> to shoot.<br>The team that kill all players of other team will win the game!<br><br>When you kill players or win matches, you will receive <J><b>AnvilCoins</b><N>. This is the money of #anvilwar module. It can be used to unlock custom anvils.<br>Enjoy the module and may the best team wins!<br><br><N><R><b>Administrators:</b><N> Spectra_phantom#6089 and Geracionz#0000<br><VP><b>Contributors:</b><N> Flaysama#5935, Chavestomil#0000 and Dinamarquers#0000<br><J><b>Translators:</b><N> Patrick_mahomes#1795 (BR)",
	seconds = " seconds.",
	leave = "Leave",
	join = "Join",
	getr = "Get Ready! The match will start in a few seconds!",
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
	t30s = "30 seconds remaining!<br><br>After this warning, isn't possible to revive players.",
	powerups_a = "The powerups are now available!",
	time = "<b>Time is up!</b> The next team will play now.",
	cap_text = "was selected to be the leader of your team.",
	cap = "<J><b>You are now the team leader.</b><N><br>Type !leader to know all the functions and benefits of team leaders.",
	leader = "The team leaders <b>are randomly choosed</b> and have various advantages and benefits:<br><br>• Will receive 50% more points and AnvilCoins regarding to the other players<br>• Can revive dead team players using the !rv [player] command<br>• Can transfer your powerup score to other team players using the !tp [player] command<br>• Have 20% more shooting time<br>• Will be revived once if was killed.",
	legacy = "<N>#anvilwar Map Submissions are open!<br><J>atelier801.com/topic?f=6&t=894824&p=1#m1",
	disabled = "This command was disabled by an administrator.",
	gametime = "Game Time",
	timeup = "<ROSE>Time is up! This will be the last shoot!",
	red_team = "Red Team",
	blue_team = "Blue Team",
	revived = "The following player revived: ",
	suddendeath = "<J><b>SUDDEN DEATH ENABLED!</b><br><br>The team that gets any player killed will lose the game!",
	latency = "You cannot enter the game because your average latency is very high.",
	custom = "<VP>The room administrator defined custom rules for this room.",
	defining = "<J>The room administrator is defining custom rules for this room. Please wait...",
	kami = "<R>The anti-kamikaze is now active.",
	errorbg1 = "The Boys against Girls mode is active. Only girls can join the red team.",
	errorbg2 = "The Boys against Girls mode is active. Only boys can join the blue team.",
	bgtext = "<N>The Boys against Girls mode is now active. Boys need to join the blue team, and girls need to join the red team.",
	wrong = "You don't have permission to use this command",
	tmaperror = "The !testmap command was discontinued. To run a custom map, create a custom match using the !settings command.",
	life1 = "<VP>The capitain of the <BL>blue <VP>was killed. (S)he has now ", life3 = " life(s).",
	life2 = "<VP>The capitain of the <R>red <VP>was killed. (S)he has now ",
	player_sync = "Player with lowest ping for sync: ",
	startmatch = "<VP><b>To start a match in the Manual insertion mode, type !start.</b>",
	compet = "<VP>The Competitive Mode is now enabled in this room. The teams are defined by the room manager.",
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
system.disableChatCommandDisplay(nil, true)
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end

function tableSearch(table,element)
	for i=1,rawlen(table) do
		if element == table[i] then
			return true
		end
	end
end

function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
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

function showTeamsManual(name)
	ui.addTextArea(480,"<font size='18'><font color='#ff4500'><p align='center'><b><a href='event:enter_red'>"..text.join.."",name,320,140,150,25,0,0,0.9,true)
	ui.addTextArea(481,"<font size='18'><font color='#0045ff'><p align='center'><b><a href='event:enter_blue'>"..text.join.."",name,320,230,150,25,0,0,0.9,true)
	ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,186,150,25,0,0,0.9,true)
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

function showRoomSettings(name)
	choose_time=30
	if data[name] and data[name].ranking >= 2 then
		for i=1000,1011 do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
		if settings.map_mode == 0 then
			string1="normal"
		elseif settings.map_mode == 1 then
			string1="@code"
		end
		showMenu(name,0x405401,200,125,400,253,""..tfm.get.room.name.." Room Settings","<p align='center'>Custom Room Mode : <b>"..tostring(custom_mode).."</b> <a href='event:cmode'>[change]</a></p><br>------------------ CUSTOM ROOM SETTINGS ------------------<br><font size='12'>Game Time : <b>"..tostring(settings.time).."</b> sec <a href='event:ctimea'>[-]</a> <a href='event:ctimeb'>[+]</a><br>Max Players/Team : <b>"..tostring(settings.plimit).."</b> <a href='event:cplayersa'>[-]</a> <a href='event:cplayersb'>[+]</a><br>Map Mode : <b>"..string1.."</b> <a href='event:cmap'>[change]</a><br>Map @code (for @CODE mode) : <b>"..tostring(settings.map_select).."</b></a><br>Powerups : <b>"..tostring(settings.g_powerups).."</b> <a href='event:cpowerups'>[change]</a><br>Shooting Time : <b>"..tostring(settings.shoot_time).."</b> sec <a href='event:cstimea'>[-]</a> <a href='event:cstimeb'>[+]</a><br>Anti-Kamikaze Mode : <b>"..tostring(settings.anti_kami).."</b> <a href='event:ckami'>[change]</a><br>Sudden Death : <b>"..tostring(settings.sd_switch).."</b> <a href='event:csd'>[change]</a><br>Boys against Girls mode : <b>"..tostring(settings.bg_switch).."</b> <a href='event:bgd'>[change]</a><br>Team Leader Lifes : <b>"..tostring(settings.cap_lifes).."</b> <a href='event:clifesa'>[-]</a> <a href='event:clifesb'>[+]</a><br>Automatic sync selection : <b>"..tostring(settings.autoping).."</b> <a href='event:aping'>[change]</a><br>Competitive mode : <b>"..tostring(settings.manual).."</b> <a href='event:manu'>[change]</a>")
	end
end

function showLobbyText(name)
	ui.addTextArea(402,"<p align='center'><font size='12'><b><font face='Courier New'><i>"..text.version.." RTM 56671.274 LTS - "..text.comp_date.."08/09/2024 13:46 UTC - "..text.uploaded.."Spectra_phantom#6089</i>",name,-10,380,820,36,0,0,1.0,true)
end

function setLeaders()
	if rawlen(alives_red) > 0 and rawlen(alives_blue) > 0 then
		red_cap=alives_red[math.random(#alives_red)]
		blue_cap=alives_blue[math.random(#alives_blue)]
		showMessage(""..red_cap.." "..text.cap_text.."")
		showMessage(""..blue_cap.." "..text.cap_text.."")
		if rawlen(alives_red) >= 2 and rawlen(alives_blue) >= 2 then
			if custom_mode == false then
				data[red_cap].lives=2; data[blue_cap].lives=2;
			elseif custom_mode == true then
				data[red_cap].lives=settings.cap_lifes; data[blue_cap].lives=settings.cap_lifes;
			end
		end
		showMessage(text.cap,red_cap)
		showMessage(text.cap,blue_cap)
		tfm.exec.setNameColor(red_cap,0x80f000)
		tfm.exec.setNameColor(blue_cap,0x80f000)
	else
		lobby();
	end
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

function updateTextBar()
	if mode == "end" then
		ui.setMapName("<VP><b>"..text.ending.."</b>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	else
		ui.setMapName("<N><b>#anvilwar</b>   <G>|   <VP>"..text.version.." <b>RTM 56671.274 LTS</b> <R>   <G>|   <N>"..text.mices_room.."<V><b>"..mices.."</b><")
	end
end

function spawnAnvil(object,x,y,xp,yp,ghost)
	if data[actual_player].powerup < 8 then
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
	elseif data[actual_player].powerup == 8 then
		id=tfm.exec.addShamanObject(61,x,y,xp,yp,ghost)
	elseif data[actual_player].powerup == 9 then
		id=tfm.exec.addShamanObject(objects[math.random(#objects)],x,y,xp,yp,ghost)
	end
end

function calculateMatchTime()
	if custom_mode == false then
		total_time=165+(mices*5)	
	else
		total_time=settings.time
	end
	general_time=total_time
end

function calculatePoints(name)
	if data[name] then
		data[name].winrate=math.floor((data[name].wins/data[name].matches)*100)
		if data[name].current_coins > 0 then
			if name == red_cap or name == blue_cap then
				local gained=math.floor(data[name].current_coins*1.5)+math.floor(data[name].score*0.75)+turns+math.floor(turns*0.9)
				data[name].coins=data[name].coins+gained
				showMessage("<VP>"..text.won.."<b>"..gained.."</b> AnvilCoins!",name)
			else
				local gained=data[name].current_coins+math.floor(data[name].score*0.5)+math.floor(turns*0.6)
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

function suddenDeath()
	showMessage(text.suddendeath)
	sudden_death=true;
	general_time=60;
	setShooter()
end

function detectVictory()
	if turns == 1 then
		for _,name in next,players_blue do
			if tfm.get.room.playerList[name].isDead == false then
				data[name].lives=1
			end
		end
		for _,name in next,players_red do
			if tfm.get.room.playerList[name].isDead == false then
				data[name].lives=1
			end
		end
		setLeaders()
		if custom_mode == true and settings.autoping == true then
			tfm.exec.setPlayerSync(checkLatencies())
		elseif custom_mode == false then
			tfm.exec.setPlayerSync(checkLatencies())
		end
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
		if custom_mode == false then
			if rawlen(alives_red) == rawlen(alives_blue) then
				if (rawlen(alives_red)+rawlen(alives_blue)) >= 3 and sudden_death == false then
					suddenDeath()
				else
					drawMatch()
				end
			end
		else
			if rawlen(alives_red) == rawlen(alives_blue) then
				if (rawlen(alives_red)+rawlen(alives_blue)) >= 3 and settings.sd_switch == true and sudden_death == false then
					suddenDeath()
				else
					drawMatch()
				end
			end
		end
		if rawlen(alives_red) > rawlen(alives_blue) then
			victoryRed()
		end
		if rawlen(alives_red) < rawlen(alives_blue) then
			victoryBlue()
		end
	end
end

function showMainText(name)
	ui.addTextArea(405,"<i><font size='72'><font color='#202020'>#anvilwar",name,213,19,400,128,0,0,0.95,true)
	ui.addTextArea(404,"<i><font size='72'>#anvilwar",name,210,16,400,128,0,0,0.95,true)
	ui.addTextArea(407,"<i><font size='12'><font color='#202020'>!help - Game help    |    !commands - Game commands    |    !ranking - Room ranking    |    !powerups - Game powerups",name,38,363,760,30,0,0,0.95,true)
	ui.addTextArea(406,"<i><font size='12'>!help - Game help    |    !commands - Game commands    |    !ranking - Room ranking    |    !powerups - Game powerups",name,35,360,760,30,0,0,0.95,true)
end

function updatePlayerList()
	text1=""; text2="";
	for id,name in next,players_red do
		text1="<font size='13'>"..text1.."<b> "..id.."</b> - "..name.."<br>"
	end
	for id,name in next,players_blue do
		text2="<font size='13'>"..text2.."<b> "..id.."</b> - "..name.."<br>"
	end
	if mode == "lobby" or mode == "map_sort" then
		for name,player in next,tfm.get.room.playerList do
			if data[name] and data[name].opened == false then
				ui.addTextArea(-4,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,501,125,260,270,0,0,1.0,true)
				ui.addTextArea(-3,"<BL><font face='Consolas,Lucida Console'><font size='9'>"..text2.."",name,500,124,260,270,0,0,1.0,true)
				ui.addTextArea(-1,"<font color='#000001'><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,21,125,260,270,0,0,1.0,true)
				ui.addTextArea(-2,"<R><font face='Consolas,Lucida Console'><font size='9'>"..text1.."",name,20,124,260,270,0,0,1.0,true)
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

function removeScoreboard(name)
	if data[name] then
		tfm.exec.removeImage(data[name].scoreboard_id,false)
		data[name].scoreboard_id=-1
	end
	for j=5651, 5658 do
		ui.removeTextArea(j,nil)
	end
end

function checkLatencies()
	latency=65536; player="";
	for name,_ in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].averageLatency < latency then
			latency=tfm.get.room.playerList[name].averageLatency
			player=name
		end
	end
	if custom_mode == true and settings.autoping == true then
		showMessage(""..text.player_sync..player.." ("..latency.."ms)")
	elseif custom_mode == false then
		showMessage(""..text.player_sync..player.." ("..latency.."ms)")
	end
	return player
end

function checkPing(name)
	if data[name] then
		if ping_check == 0 then
			return false
		elseif ping_check == 1 then
			if tfm.get.room.playerList[name].averageLatency >= 2000 then
				return true
			else
				return false
			end
		elseif ping_check == 2 then
			if tfm.get.room.playerList[name].averageLatency >= 1000 then
				return true
			else
				return false
			end
		elseif ping_check == 3 then
			if tfm.get.room.playerList[name].averageLatency >= 500 then
				return true
			else
				return false
			end
		end
	end
end

numbers1={{73,114,101,108,105,97,35,55,51,49,55},
{83,97,109,105,114,97,35,52,51,56,55},
{82,105,118,101,110,35,49,54,51,48},
{72,119,101,105,35,49,48,50,55},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{71,108,111,98,111,95,114,117,114,97,108,35,54,53,51,50},
{68,104,97,114,97,107,35,55,54,48,51}}
names={}

for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(names,final)
end

function giveRankings(name)
	if data[name] then
		if tableSearch(mods,name) == true then
			data[name].ranking=2
			tfm.exec.setNameColor(name,0xa9a900)
		elseif tableSearch(names,name) == true then
			data[name].ranking=3
		elseif tableSearch(admins,name) == true then
			data[name].ranking=4
			tfm.exec.setNameColor(name,0xa90000)
		end
	end
end

function eventNewPlayer(name)
	mices=mices+1
	if not data[name] then
		data[name]={level=1,exp=0,maxp=100,score=0,kills=0,wins=0,matches=0,killeds=0,eff=0.0,winrate=0.0,coins=0,multikills=0,
		killed=false,team=0,ranking=0,angle=0,power=5,powerup=0,
		current_coins=0,opened=false,active_imgs={},anvils={0,0,0,0,0,0,0,0,0,0,0},current_anvil=0,test_time=0,scoreboard_id=-1,left=false,lives=0}
		table.insert(playersList,name)
	else
		data[name].left=false
	end
	if name:sub(1,1) == "*" then
		data[name].ranking=-1
	end
	if string.find(tfm.get.room.name,name) then
		table.insert(mods,name)
		showMessage(text.manager,name)
	end
	for _,k in next,{32,48,49,50,51,52,53,54,55,56,57,66,67,72,77,80,82,85,86,88,90,112,113,114,115,116,117,118} do
		tfm.exec.bindKeyboard(name,k,true,true)
	end
	system.bindMouse(name,true)
	if mode == "lobby" then
		if data[name] then
			if data[name].ranking >= 0 then
				ui.setBackgroundColor("#000000")
				if settings.manual == false or custom_mode == false then
					showTeams(name)
				end
				showLobbyText(name)
				showMainText(name)
				tfm.exec.respawnPlayer(name)
			end
		end
		updatePlayerList()
	end
	if mode == "wait1" or mode == "wait2" or mode == "wait3" then
		data[name].scoreboard_id = tfm.exec.addImage("1835da984ec.png", ":1", 267, 15, name, 1.0, 1.0, 0, 1)
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
		for i=1,8 do
			spawnAnvil(10,math.random(850,1599),100,0,1,false)
		end
	elseif data[actual_player].team == 2 then
		for i=1,8 do
			spawnAnvil(10,math.random(1,750),100,0,1,false)
		end
	end
end

function showPowerMeter(name)
	bar_text=""
	for i=1,data[name].power do
		bar_text=bar_text.."▊▊"
	end
	ui.addTextArea(750,"<font size='15'>         Anvil Power: <b>"..data[name].power.."</b> "..bar_text.."",name,10,376,780,20,0x010101,0x010101,1.0,true)
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

function setScores(name,points,offset)
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
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35),-5-(data[name].power*0.33),false)
				if data[name].powerup == 1 then
					id=spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35),-5-(data[name].power*0.33),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35),-5-(data[name].power*0.33),false)
					end
				end
				tfm.exec.playSound("bouboum/x_explosion_3.mp3", 90)
			elseif data[name].team == 2 then
				spawnAnvil(10,x,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35)*-1,-5-(data[name].power*0.33),false)
				if data[name].powerup == 1 then
					spawnAnvil(10,x+45,y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35)*-1,-5-(data[name].power*0.33),false)
				elseif data[name].powerup == 2 then
					for i=1,2 do
						spawnAnvil(10,x+(45*i),y-55,(data[name].angle)*-1,(2.5+data[name].power*1.35)*-1,-5-(data[name].power*0.33),false)
					end
				end
				tfm.exec.playSound("bouboum/x_explosion_3.mp3", 90)
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
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 49 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 50 and data[name].score >= 12 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p2.."")
					data[name].powerup=2
					setScores(name,-12,true)
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 50 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 51 and data[name].score >= 20 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p3.."")
					setScores(name,-20,true)
					data[name].powerup=3
					mode="wait3"
					tfm.exec.setGameTime(10)
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 51 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 52 and data[name].score >= 15 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p4.."")
					setScores(name,-15,true)
					data[name].powerup=4
					permafrost=true
					permaFrost()
					tfm.exec.playSound("/bouboum/gel.mp3", 75)
				elseif code == 52 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 53 and data[name].score >= 10 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p5.."")
					setScores(name,-10,true)
					data[name].powerup=5
					night_mode=true
					nightMode()
					tfm.exec.playSound("/transformice/son/dash.mp3", 85)
				elseif code == 53 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 54 and data[name].score >= 16 and data[name].level >= 3 then
					showMessage("<VP><b>"..name.."</b> "..text.p6.."")
					setScores(name,-16,true)
					data[name].powerup=6
					enabled=false
					mode="wait3"
					tfm.exec.setGameTime(10)
					anvilRain()
					tfm.exec.playSound("/deadmaze/combat/casse.mp3", 95)
				elseif code == 54 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 55 and data[name].score >= 14 and data[name].level >= 4 then
					showMessage("<VP><b>"..name.."</b> "..text.p7.."")
					setScores(name,-14,true)
					data[name].powerup=7
					tfm.exec.setWorldGravity(0,20)
					pf_time=-2
					gravity=false
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 55 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 56 and data[name].score >= 16 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p8.."")
					setScores(name,-16,true)
					data[name].powerup=8
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 56 then
					showMessage("<R>"..text.p0.."",name)
				end
				if code == 57 and data[name].score >= 8 and data[name].level >= 2 then
					showMessage("<VP><b>"..name.."</b> "..text.p9.."")
					setScores(name,-8,true)
					data[name].powerup=9
					tfm.exec.playSound("/bouboum/x_bonus.mp3", 80)
				elseif code == 57 then
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
			if data[name].power < 20 then
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
	data[name].left=true
	mices=mices-1
end

function eventPlayerDied(name)
	if mode == "lobby" and data[name].ranking >= 0 then
		tfm.exec.respawnPlayer(name)
	end
	if mode == "wait2" and time_passed < 20 then
		if data[name] and data[name].team == 1 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,190,false,0,0,false)
		end
		if data[name] and data[name].team == 2 then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,190,false,0,0,false)
		end
	end
	if mode == "shoot" then
		if name == actual_player then
			data[name].current_coins=math.floor(data[name].current_coins/2)
			showMessage(""..text.suicide..""..actual_player)
			setScores(name,0,false)
			tfm.exec.setGameTime(6)
			if custom_mode == true and settings.anti_kami == true and data[actual_player].left == false then
				if data[actual_player].team == 1 then
					victoryBlue()
				elseif data[actual_player].team == 2 then
					victoryRed()
				end
			end
			mode="wait3"
		else
			if data[name] then data[name].lives=data[name].lives-1 end
			if data[name].lives <= 0 then
				if data[name].team > 0 then
					data[name].current_coins=math.floor(data[name].current_coins/2)
				end
				data[name].killeds=data[name].killeds+1
				setScores(name,0,false)
				if sudden_death == true then
					if data[name].team == 1 then
						victoryBlue()
					elseif data[name].team == 2 then
						victoryRed()
					end
				end
			elseif data[name].lives > 0 then
				tfm.exec.respawnPlayer(name)
				if data[name].team == 2 then
					tfm.exec.movePlayer(name,1000,190,false,0,0,false)
					data[name].killed=false
					showMessage(text.life1..data[name].lives..text.life3)
					setScores(name,2,false)
				end
				if data[name].team == 1 then
					tfm.exec.movePlayer(name,600,190,false,0,0,false)
					data[name].killed=false
					showMessage(text.life2..data[name].lives..text.life3)
					setScores(name,2,false)
				end
			end
		end
	end
	if mode == "wait3" then
		if data[name] then data[name].lives=data[name].lives-1 end
		if data[actual_player].team == data[name].team then
			if actual_player == name then
				data[actual_player].current_coins=0
				setScores(actual_player,0,false)
				showMessage(text.suicide..actual_player)
				if custom_mode == true and settings.anti_kami == true and data[actual_player].left == false then
					if data[actual_player].team == 1 then
						victoryBlue()
					elseif data[actual_player].team == 2 then
						victoryRed()
					end
				end
			else
				data[actual_player].current_coins=data[actual_player].current_coins-5
				setScores(actual_player,-5,true)
				showMessage("<VP>"..text.tk1.."<b>"..actual_player.."</b>"..text.tk2..""..name..".")
			end
		else
			if data[name].lives <= 0 then
				data[name].current_coins=math.floor(data[name].current_coins/3)
				data[name].killeds=data[name].killeds+1
				setScores(name,0,false)
			elseif data[name].lives > 0 then
				tfm.exec.respawnPlayer(name)
				if data[name].team == 2 then
					tfm.exec.movePlayer(name,1000,190,false,0,0,false)
					data[name].killed=false
					showMessage(text.life1..data[name].lives..text.life3)
					setScores(name,2,false)
				end
				if data[name].team == 1 then
					tfm.exec.movePlayer(name,600,190,false,0,0,false)
					data[name].killed=false
					showMessage(text.life2..data[name].lives..text.life3)
					setScores(name,2,false)
				end
			end
		end
		tfm.exec.playSound("/bouboum/x_mort.mp3", 77)
		if sudden_death == true then
			if data[name].team == 1 then
				victoryBlue()
			elseif data[name].team == 2 then
				victoryRed()
			end
		end
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
	mode="lobby"; powerups=false;
	if settings.manual == true and custom_mode == true then choose_time=65536; else choose_time=30; end
	tfm.exec.newGame(lobby_map)
	tfm.exec.setGameTime(36000)
	tfm.exec.setRoomMaxPlayers(old_limit)
	for i=-8,1011 do
		ui.removeTextArea(i,name)
	end
	players_red={};	players_blue={}; loop=0;
	for name,player in next,tfm.get.room.playerList do
		ui.removeTextArea(999,name)
		tfm.exec.freezePlayer(name,false)
		removeImagePlayers(name)
		showLobbyText(name)
		showMainText(name)
		removeScoreboard(name)
		if data[name] then
			data[name].opened=false
			ui.setBackgroundColor("#000000")
			data[name].team=0
			data[name].current_coins=0
			setScores(name,0,false)
			if settings.manual == false or custom_mode == false then
				if data[name].ranking >= 0 then
					showTeams(name)
				else
					tfm.exec.killPlayer(name)
				end
			else
				for name,player in next,tfm.get.room.playerList do
					if data[name] and data[name].ranking >= 2 then
						showTeamsManual(name)
						showMessage(text.startmatch,name)
					end
				end
			end
		end
	end
	permafrost=false; night_mode=false;
	showMessage(text.legacy)
	if custom_mode == true and settings.manual == false then
		showMessage(text.custom)
	elseif custom_mode == true and settings.manual == true then
		showMessage(text.compet)
	end
end

function eventNewGame()
	set_map="-1"; def_map=-1; turns=0;
	if mode == "wait1" then
		for i=400,407 do ui.removeTextArea(i,nil) end
		mode="wait2"
		tfm.exec.setGameTime(20)
		moveTeams()
		for name,player in next,tfm.get.room.playerList do
			data[name].scoreboard_id = tfm.exec.addImage("1835da984ec.png", ":1", 266, 15, name, 1.0, 1.0, 0, 1)
			tfm.exec.setNameColor(name,0xd7d7e6)
			data[name].score=0
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
	if (command:sub(0,4) == "sync") then if data[name].ranking >= 3 then
		tfm.exec.setPlayerSync(command:sub(6))
		showMessage("Sync: "..command:sub(6).."",name)
	else showMessage(text.wrong,name) end end
	if command == "reset" and time_passed >= 6 then if data[name].ranking >= 2 then
		lobby()
	else showMessage(text.wrong,name) end end
	if command == "settings" then
		if dsettings == true then if data[name].ranking >= 2 then
			if mode == "lobby" then
				showRoomSettings(name)
				mode="define";
				showMessage(text.defining)
			else	
				showMessage(text.load0,name)
			end end
		elseif dsettings == false then if data[name].ranking >= 3 then
			if mode == "lobby" then
				showRoomSettings(name)
				mode="define";
				showMessage(text.defining)
			else	
				showMessage(text.load0,name)
			end end
		else showMessage(text.wrong,name) end end
	if (command:sub(0,2) == "pw") then if data[name].ranking >= 2 then
		tfm.exec.setRoomPassword(tostring(command:sub(4)))
		if string.len(command:sub(4)) > 0 then
			showMessage(""..text.pw..""..command:sub(4).."",name)
		else
			showMessage(text.pw0,name)
		end
	else showMessage(text.wrong,name) end end
	if (command:sub(0,2) == "lc") then if data[name].ranking >= 3 then
		if tostring(command:sub(4)) == "0" or tostring(command:sub(4)) == "1" or tostring(command:sub(4)) == "2" or tostring(command:sub(4)) == "3" then
			level=tonumber(command:sub(4))
			if level == 0 then
				ping_check=0
				showMessage("The player's latency checker is now disabled.")
			elseif level == 1 then
				ping_check=1
				showMessage("The player's latency checker is now set to WEAK. Players with average latency greater than 2000 ms cannot enter into the teams.")
			elseif level == 2 then
				ping_check=2
				showMessage("The player's latency checker is now set to DEFAULT. Players with average latency greater than 1000 ms cannot enter into the teams.")
			elseif level == 3 then
				ping_check=3
				showMessage("The player's latency checker is now set to STRICT. Players with average latency greater than 500 ms cannot enter into the teams.")
			end
		end
	else showMessage(text.wrong,name) end end
	if command == "changelog" then
		showMenu(name,0xa8f233,140,130,520,110,"#anvilwar Changelog - RTM 56671.274 LTS","• The bot monitoring system is disabled temporarily<br>• Various minor bugfixes<br>• Added 2 new maps")
	end
	if (command:sub(0,2) == "rv") then
		if name == actual_player and general_time >= 30 and sudden_death == false then
			if name == red_cap or name == blue_cap then
				temp_name=command:sub(4)
				if data[temp_name] then
					if data[name].score >= 30 then
						if tfm.get.room.playerList[temp_name].isDead == true then
							tfm.exec.respawnPlayer(temp_name)
							if data[temp_name].team == 2 then
								tfm.exec.movePlayer(temp_name,1000,190,false,0,0,false)
								data[temp_name].killed=false
							end
							if data[temp_name].team == 1 then
								tfm.exec.movePlayer(temp_name,600,190,false,0,0,false)
								data[temp_name].killed=false
							end
							showMessage("<J>"..text.revived..""..temp_name.."")
							setScores(name,-30,true)
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
				if data[name].score >= 2 then
					if data[temp_name] then
						ui.addPopup(100,2,"Points",name,350,175,200,true)
					end
				else
					showMessage(text.p0,name)
				end
			end
		end
	end
	if (command:sub(0,5) == "limit") then if data[name].ranking >= 2 then
		tt={}; for i=2,50 do table.insert(tt,tostring(i)) end
		if findString(command:sub(7),tt) then
			old_limit=tonumber(command:sub(7))
			tfm.exec.setRoomMaxPlayers(old_limit)
			showMessage(""..text.limit..""..old_limit.."",name)
		end
	else showMessage(text.wrong,name) end end
	if (command:sub(0,5) == "score") then if data[name].ranking >= 3 then
		temp_name=command:sub(7)
		if data[temp_name] then
			ui.addPopup(105,2,"Points",name,350,175,200,true)
		end
	else showMessage(text.wrong,name) end end
	if (command:sub(0,3) == "set") then if data[name].ranking >= 3 then
		if data[command:sub(5)] then
			set_player=command:sub(5)
		end
	else showMessage(text.wrong,name) end end
 	if (command:sub(0,6) == "defmap") then if data[name].ranking >= 2 then
		if mode == "lobby" then
			tt={}; for i=1,rawlen(maps) do table.insert(tt,tostring(i)) end
			if findString(command:sub(8),tt) then
				def_map=tonumber(command:sub(8))
				showMessage("Defined map: "..def_map.."",name)
			end
		end
	else showMessage(text.wrong,name) end end
	if (command:sub(0,4) == "kill") then if data[name].ranking >= 3 then
		tfm.exec.killPlayer(command:sub(6))
	else showMessage(text.wrong,name) end end
	if (command:sub(0,7) == "testmap") then
		showMessage(text.tmaperror,name)
	end
	if (command:sub(0,3) == "get") then
		tt={}; for i=1,rawlen(maps) do table.insert(tt,tostring(i)) end
		if findString(command:sub(5),tt) then
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
	if command == "sd" then
		system.exit();
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
			showMenu(name,0x999999,56,120,690,235,"#anvilwar Anvils","<font size='11.5'>"..divider.."<b>Default Anvil</b><br>"..divider.."Cost: 0 coins<br>"..divider.."<a href='event:a0'>Equip!</a><br><br>"..divider.."<b>Red Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a1'>Equip!</a><br><br>"..divider.."<b>Blue Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a2'>Equip!</a><br><br>"..divider.."<b>White Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a3'>Equip!</a>")
			ui.addTextArea(1005,"<i><font size='11.5'>"..divider.."<b>Rainbow Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a4'>Equip!</a><br><br>"..divider.."<b>Sharingan Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a5'>Equip!</a><br><br>"..divider.."<b>Black Hole Anvil</b><br>"..divider.."Cost: 250 coins<br>"..divider.."<a href='event:a6'>Equip!</a><br><br>"..divider.."<b>4K 1080p Anvil</b><br>"..divider.."Cost: 150 coins<br>"..divider.."<a href='event:a7'>Equip!</a>",name,208,151,175,215,0,0,1.0,true)
			ui.addTextArea(1006,"<i><font size='11.5'>"..divider.."<b>Thug Life Anvil</b><br>"..divider.."Cost: 250 coins<br>"..divider.."<a href='event:a8'>Equip!</a><br><br>"..divider.."<b>Water Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a9'>Equip!</a><br><br>"..divider.."<b>Grass Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a10'>Equip!</a><br><br>"..divider.."<b>RadWhite Anvil</b><br>"..divider.."Cost: 200 coins<br>"..divider.."<a href='event:a11'>Equip!</a>",name,380,151,175,215,0,0,1.0,true)
			ui.addTextArea(1007,"<i><font size='11.5'>"..divider.."<b>Stars Anvil</b><br>"..divider.."Cost: 300 coins<br>"..divider.."<a href='event:a12'>Equip!</a><br><br>"..divider.."<b>Asteroid Anvil</b><br>"..divider.."Cost: 250 coins<br>"..divider.."<a href='event:a13'>Equip!</a><br><br>"..divider.."<b>Expanded Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a14'>Equip!</a><br><br>"..divider.."<b>Yellow Anvil</b><br>"..divider.."Cost: 100 coins<br>"..divider.."<a href='event:a15'>Equip!</a>",name,552,151,175,215,0,0,1.0,true)
			showAvailableAnvils(name)
		end
	end
	if command == "powerups" then
		showMenu(name,0xc23517,140,90,520,260,"#anvilwar Powerups",text.powerups)
	end
	if command == "switch" then if data[name].ranking >= 3 then
		if dsettings == true then dsettings=false; else dsettings=true; end
		showMessage(tostring(dsettings),name)
	else showMessage(text.wrong,name) end end
	if command == "switch2" then if data[name].ranking >= 3 then
		if custom_map == true then custom_map=false; else custom_map=true; end
		showMessage(tostring(custom_map),name)
	else showMessage(text.wrong,name) end end
	if command == "start" then if data[name].ranking >= 2 then
		if custom_mode == true and settings.manual == true and mode == "lobby" then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				choose_time=1
			end
		end
	else showMessage(text.wrong,name) end end
	if command == "leader" then
		showMenu(name,0x873469,140,90,520,215,"#anvilwar Team Leader Funcions",text.leader)
	end
	if command == "commands" then
		showMenu(name,0x125490,120,130,560,155,"#anvilwar Commands",text.commands)
	end
	if command == "adcommands" then
		if data[name].ranking >= 1 then
			showMenu(name,0x125490,120,130,560,110,"#anvilwar Commands",text.adcommands)
		else
			showMessage(text.wrong,name)
		end
	end
	if command == "help" then
		showMenu(name,0x457426,100,125,600,246,"Help",text.help)
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
	if id == 281 then
		if data[message] then
			enterRedTeam(message)
		end
	end
	if id == 282 then
		if data[message] then
			enterBlueTeam(message)
		end
	end
	if id == 283 then
		if data[message] then
			removeTeam(message)
		end
	end
	if id == 1000 then
		if message == "0" then
			settings.map_mode=0
			showRoomSettings(name)
		elseif message == "1" then
			ui.addPopup(2001,2,"Insert the map @code",name,350,175,200,true)
		end
	end
	if id == 2001 then
		if string.len(message) == 8 then
			settings.map_mode=1
			settings.map_select=message
		end
		showRoomSettings(name)
	end
end
function enterRedTeam(name)
	if custom_mode == false then limit=13 else limit=settings.plimit; end
	
	if choose_time > 1 and data[name].team == 0 and rawlen(players_red) < limit then
		if settings.bg_switch == true and custom_mode == true then
			if tfm.get.room.playerList[name].gender == 1 then
				tfm.exec.respawnPlayer(name)
				table.insert(players_red,name)
				updatePlayerList()
				tfm.exec.movePlayer(name,200,280,false,0,0,false)
				data[name].team=1
				if settings.manual == false or custom_mode == false then
					for i=479,481 do
						ui.removeTextArea(i,name)
						ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
					end
				end	
			else
				showMessage(text.errorbg1,name)
			end
		else
			tfm.exec.respawnPlayer(name)
			table.insert(players_red,name)
			updatePlayerList()
			tfm.exec.movePlayer(name,200,280,false,0,0,false)
			data[name].team=1
			if settings.manual == false or custom_mode == false then
				for i=479,481 do
					ui.removeTextArea(i,name)
					ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
				end
			end
		end
	end
end

function enterBlueTeam(name)
	if custom_mode == false then limit=13 else limit=settings.plimit; end
	if choose_time > 1 and data[name].team == 0 and rawlen(players_blue) < limit then
		if settings.bg_switch == true and custom_mode == true then
			if tfm.get.room.playerList[name].gender == 2 then
				tfm.exec.respawnPlayer(name)
				table.insert(players_blue,name)
				updatePlayerList()
				data[name].team=2
				tfm.exec.movePlayer(name,600,280,false,0,0,false)
				if settings.manual == false or custom_mode == false then
					for i=479,481 do
						ui.removeTextArea(i,name)
						ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
					end
				end
			else
				showMessage(text.errorbg2,name)
			end
		else
			tfm.exec.respawnPlayer(name)
			table.insert(players_blue,name)
			updatePlayerList()
			data[name].team=2
			tfm.exec.movePlayer(name,600,280,false,0,0,false)
			if settings.manual == false or custom_mode == false then
				for i=479,481 do
					ui.removeTextArea(i,name)
					ui.addTextArea(482,"<font size='16'><font color='#ffffff'><p align='center'><b><a href='event:quit'>"..text.leave.."",name,320,250,150,25,0,0,0.9,true)
				end
			end
		end
	end
end

function moveTeams()
	ui.setBackgroundColor("#6a7495")
	if custom_mode == true and settings.anti_kami == true then
		showMessage("<VP>"..text.getr.."<br>"..text.kami.."")
	else
		showMessage("<VP>"..text.getr.."")
	end
	for _,id in next,images_id do
		tfm.exec.removeImage(id)
		images_id={}
	end
	if mode == "wait2" then
		for _,name in next,players_red do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,190,false,0,0,false)
		end
		for _,name in next,players_blue do
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,190,false,0,0,false)
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
			if settings.manual == false or custom_mode == false then
				showTeams(name)
				ui.removeTextArea(482,name)
			end
			data[name].team=0
			break
		end
	end
	for i=1,length2 do
		if players_blue[i] == name then
			table.remove(players_blue,i)
			updatePlayerList()
			if settings.manual == false or custom_mode == false then
				showTeams(name)
				ui.removeTextArea(482,name)
			end
			data[name].team=0
			break
		end
	end
end

function eventTextAreaCallback(id,name,callback)
	if callback == "enter_red" then
		if custom_mode == false or settings.manual == false then
			if checkPing(name) == false then
				enterRedTeam(name)
			else
				showMessage(text.latency,name)
			end
		else
			ui.addPopup(281,2,"",name,350,175,200,true)
		end
	end
	if callback == "enter_blue" then
		if custom_mode == false or settings.manual == false then
			if checkPing(name) == false then
				enterBlueTeam(name)
			else
				showMessage(text.latency,name)
			end
		else
			ui.addPopup(282,2,"",name,350,175,200,true)
		end
	end
	if callback == "quit" then
		if custom_mode == false or settings.manual == false then
			removeTeam(name)
		else
			ui.addPopup(283,2,"",name,350,175,200,true)
		end
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
		if mode == "define" then
			lobby()
		end
	end
	if callback == "pw1" then
		data[name].opened=false
		eventChatCommand(name,"powerups")
	end
	if callback == "pw2" then
		data[name].opened=false
		showMenu(name,0xc23517,140,60,520,305,"#anvilwar Powerups",text.powerups2)
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
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
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
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
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
			if data[name].coins >= 150 then
				data[name].coins=data[name].coins-150
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
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 200 then
				data[name].coins=data[name].coins-200
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
			if data[name].coins >= 300 then
				data[name].coins=data[name].coins-300
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
			if data[name].coins >= 250 then
				data[name].coins=data[name].coins-250
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
			if data[name].coins >= 100 then
				data[name].coins=data[name].coins-100
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
	if callback == "cmode" then
		if custom_mode == false then custom_mode=true else custom_mode=false; end
		showRoomSettings(name)
	end
	if callback == "ctimea" then
		if settings.time > 120 then settings.time=settings.time-10 end
		showRoomSettings(name)
	end
	if callback == "ctimeb" then
		if settings.time < 600 then settings.time=settings.time+10 end
		showRoomSettings(name)
	end
	if callback == "cplayersa" then
		if settings.plimit > 1 then settings.plimit=settings.plimit-1 end
		showRoomSettings(name)
	end
	if callback == "cplayersb" then
		if settings.plimit < 16 then settings.plimit=settings.plimit+1 end
		showRoomSettings(name)
	end
	if callback == "cmap" then
		ui.addPopup(1000,2,"Insert the map mode:<br><br>0 = Normal<br>1 = @code based",name,350,175,200,true)
	end
	if callback == "cpowerups" then
		if settings.g_powerups == false then settings.g_powerups=true else settings.g_powerups=false end
		showRoomSettings(name)
	end
	if callback == "cstimea" then
		if settings.shoot_time > 6 then settings.shoot_time=settings.shoot_time-1 end
		showRoomSettings(name)
	end
	if callback == "cstimeb" then
		if settings.shoot_time < 30 then settings.shoot_time=settings.shoot_time+1 end
		showRoomSettings(name)
	end
	if callback == "clifesa" then
		if settings.cap_lifes > 1 then settings.cap_lifes=settings.cap_lifes-1 end
		showRoomSettings(name)
	end
	if callback == "clifesb" then
		if settings.cap_lifes < 3 then settings.cap_lifes=settings.cap_lifes+1 end
		showRoomSettings(name)
	end
	if callback == "ckami" then
		if settings.anti_kami == false then settings.anti_kami=true else settings.anti_kami=false end
		showRoomSettings(name)
	end
	if callback == "csd" then
		if settings.sd_switch == false then settings.sd_switch=true else settings.sd_switch=false end
		showRoomSettings(name)
	end
	if callback == "bgd" then
		if settings.bg_switch == false then settings.bg_switch=true else settings.bg_switch=false end
		showRoomSettings(name)
	end
	if callback == "aping" then
		if settings.autoping == false then settings.autoping=true else settings.autoping=false end
		showRoomSettings(name)
	end
	if callback == "manu" then
		if settings.manual == false then settings.manual=true else settings.manual=false end
		showRoomSettings(name)
	end
end

function advanceLevel(name)
	data[name].level=data[name].level+1
	data[name].exp=data[name].exp-data[name].maxp
	data[name].maxp=math.fall(data[name].maxp*1.1)+25
	showMessage("<VP><b>"..name.."</b> "..text.level.."<b>"..data[name].level.."</b>!",name)
end

function drawMatch()
	mode="end"
	sudden_death=false
	tfm.exec.setGameTime(math.random(5,15))
	showMessage("<J>"..text.draw.."")
	for _,name in next,players_red do
		calculatePoints(name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function victoryBlue()
	mode="end"
	sudden_death=false
	for _,name in next,players_blue do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(900,1200),198,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
	end
	tfm.exec.setGameTime(math.random(5,20))
	showMessage("<BL>"..text.winblue.."")
	for _,name in next,players_red do
		calculatePoints(name)
		tfm.exec.playEmote(name,2)
		tfm.exec.playSound("/fortoresse/x_defaite.mp3",63,nil,nil,name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
		tfm.exec.playSound("/fortoresse/x_victoire.mp3",78,nil,nil,name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function victoryRed()
	mode="end"
	sudden_death=false
	for _,name in next,players_red do
		data[name].current_coins=data[name].current_coins+20
		tfm.exec.respawnPlayer(name)
		tfm.exec.movePlayer(name,math.random(400,700),198,false,0,0,false)
		tfm.exec.playEmote(name,0)
		data[name].wins=data[name].wins+1
	end
	tfm.exec.setGameTime(math.random(5,20))
	showMessage("<R>"..text.winred.."")
	for _,name in next,players_red do
		calculatePoints(name)
		tfm.exec.playSound("/fortoresse/x_victoire.mp3",78,nil,nil,name)
	end
	for _,name in next,players_blue do
		calculatePoints(name)
		tfm.exec.playEmote(name,2)
		tfm.exec.playSound("/fortoresse/x_defaite.mp3",63,nil,nil,name)
	end
	ui.removeTextArea(750,nil)
	for name,_ in next,tfm.get.room.playerList do
		if data[name] then
			removeScoreboard(name)
		end
	end
end

function setShooter()
	if set_player == "" then
		if turn == 0 then
			turn=1
			actual_player=alives_blue[math.random(#alives_blue)]
			if custom_mode == false then
				tfm.exec.setGameTime(15)
				if actual_player == blue_cap then
					tfm.exec.setGameTime(22)
				end
			else
				tfm.exec.setGameTime(settings.shoot_time)
				if actual_player == blue_cap then
					tfm.exec.setGameTime(math.floor(settings.shoot_time*1.2))
				end
			end
		elseif turn == 1 then
			turn=0
			actual_player=alives_red[math.random(#alives_red)]
			if custom_mode == false then
				tfm.exec.setGameTime(15)
				if actual_player == red_cap then
					tfm.exec.setGameTime(18)
				end
			else
				tfm.exec.setGameTime(settings.shoot_time)
				if actual_player == red_cap then
					tfm.exec.setGameTime(math.floor(settings.shoot_time*1.2))
				end
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
	ui.addTextArea(750,"<i><font size='15'><p align='center'>"..text.as.." <b>"..actual_player.."</b>",nil,110,352,580,22,0x010101,0x323232,0.6,true)
	showMessage("<VP>"..text.as1..""..data[actual_player].score.."",actual_player)
	tfm.exec.playSound("/tfmadv/xp.mp3",100,nil,nil,actual_player)
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
		if data[name] and data[name].test_time > 0 then
			data[name].test_time=data[name].test_time-0.5
		end
	end
	if mode == "lobby" then
		if choose_time > 0 then
			choose_time=choose_time-0.5
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].opened == false then
					if settings.manual == false or custom_mode == false then
						ui.addTextArea(483,"<font size='55'><p align='center'><font color='#000001'>"..math.ceil(choose_time).."",name,357,162,80,60,0,0,0.97,true)
						ui.addTextArea(484,"<font size='55'><p align='center'>"..math.ceil(choose_time).."",name,355,160,80,60,0,0,0.97,true)
					end
				end
			end
		end
		if choose_time == 0 then
			if rawlen(players_red) > 0 and rawlen(players_blue) > 0 then
				if rawlen(players_red) - rawlen(players_blue) <= 1 and rawlen(players_red) - rawlen(players_blue) >= -1 then
					for i=478,494 do ui.removeTextArea(i,nil) end
					mode="map_sort"
				else
					choose_time=15
				end
			else
				choose_time=30
			end
		end		
	end
	if mode == "map_sort" then
		if custom_mode == false then
			if loop < 12 then
				loop=loop+1
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm.."",nil,102,97,600,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm.."",nil,100,95,600,45,0,0,1.0,true)
				map_id=math.random(1,rawlen(maps))
				tfm.exec.playSound("/bouboum/x_pose_bombe.mp3",65)
			elseif loop == 12 then
				if def_map > 0 then
					map_id=def_map
				end
				current_map=maps[map_id]
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,2,97,800,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,0,95,800,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
				tfm.exec.playSound("/bouboum/x_bonus_alea.mp3",75)
			end
		else
			if settings.map_mode == 0 then
				if loop < 12 then
					loop=loop+1
					ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm.."",nil,102,97,600,45,0,0,1.0,true)
					ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><i>"..text.rm.."",nil,100,95,600,45,0,0,1.0,true)
					map_id=math.random(1,rawlen(maps))
					tfm.exec.playSound("/bouboum/x_pose_bombe.mp3",65)
				elseif loop == 12 then
					if def_map > 0 then
						map_id=def_map
					end
					current_map=maps[map_id]
					ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,2,97,800,45,0,0,1.0,true)
					ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..map_names[map_id].." - "..maps[map_id].."",nil,0,95,800,45,0,0,1.0,true)
					mode="wait1"
					tfm.exec.setGameTime(10)
					tfm.exec.playSound("/bouboum/x_bonus_alea.mp3",75)
				end
			elseif settings.map_mode == 1 and custom_map == true then
				current_map=settings.map_select
				ui.addTextArea(-6,"<font face='Arial'><p align='center'><font color='#000000'><font size='24'><i>"..text.rm1..""..settings.map_select.."",nil,2,95,800,45,0,0,1.0,true)
				ui.addTextArea(-5,"<font face='Arial'><p align='center'><font size='24'><VP><i>"..text.rm1..""..settings.map_select.."",nil,0,95,800,45,0,0,1.0,true)
				mode="wait1"
				tfm.exec.setGameTime(10)
				tfm.exec.playSound("/bouboum/x_bonus_alea.mp3",75)
			end
		end
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait1" and time_remain > 1 then
		if rawlen(players_red) == 0 or rawlen(players_blue) == 0 then
			lobby()
		end
	end
	if mode == "wait2" or mode == "wait3" or mode == "shoot" then
		local m=math.floor(general_time/60)
		local s=math.floor(general_time-(m*60))
		if sudden_death == false then
			if s >= 10 then
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":"..s.."",nil,353,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b>"..m..":"..s.."",nil,351,22,100,40,0,0,1.0,true)
			else
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":0"..s.."",nil,353,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b>"..m..":0"..s.."",nil,351,22,100,40,0,0,1.0,true)
			end
		elseif sudden_death == true then
			if s >= 10 then
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":"..s.."",nil,353,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b><J>"..m..":"..s.."",nil,351,22,100,40,0,0,1.0,true)
			else
				ui.addTextArea(5652,"<font size='24'><p align='center'><font color='#050505'><b>"..m..":0"..s.."",nil,353,24,100,40,0,0,1.0,true)
				ui.addTextArea(5651,"<font size='24'><p align='center'><b><J>"..m..":0"..s.."",nil,351,22,100,40,0,0,1.0,true)
			end
		end
		ui.addTextArea(5654,"<font size='28'><p align='center'><font color='#050505'><b>"..rawlen(alives_red).."",nil,248,24,100,40,0,0,1.0,true)
		ui.addTextArea(5653,"<font size='28'><p align='center'><b><R>"..rawlen(alives_red).."",nil,246,22,100,40,0,0,1.0,true)
		ui.addTextArea(5656,"<font size='28'><p align='center'><font color='#050505'><b>"..rawlen(alives_blue).."",nil,458,24,100,40,0,0,1.0,true)
		ui.addTextArea(5655,"<font size='28'><p align='center'><b><BL>"..rawlen(alives_blue).."",nil,456,22,100,40,0,0,1.0,true)
		if mode == "shoot" then
			ui.addTextArea(5658,"<font size='24'><p align='center'><font color='#050505'><b>"..time_remain.."",nil,353,70,100,40,0,0,1.0,true)
			ui.addTextArea(5657,"<font size='24'><p align='center'><VP><b>"..time_remain.."",nil,351,68,100,40,0,0,1.0,true)
		end
		if general_time > 0 then
			general_time=general_time-0.5
			if sudden_death == false then
				if general_time == 60 then
					showMessage("<ROSE>"..text.t60s.."")
					tfm.exec.playSound("/tfmadv/parade1.mp3",58)
				end
				if general_time == 30 then
					showMessage("<ROSE>"..text.t30s.."")
					tfm.exec.playSound("/tfmadv/parade1.mp3",58)
				end
			end
			if mode == "shoot" and general_time == 0.5 then
				showMessage("<ROSE>"..text.timeup.."")
				tfm.exec.playSound("/tfmadv/soins7.mp3",66)
			end
		end
		if time_passed == 60 and powerups == false and settings.g_powerups == true then
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
		if time_passed % 22 == 0 then
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
	if mode == "wait1" and time_remain == 1 then
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

initObjects = function()
for _,f in next,{"help","kill","restart"} do
	system.disableChatCommandDisplay(f)
end
for _,G in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables"} do
	tfm.exec["disable"..G](true)
end

tfm.exec.setRoomMaxPlayers(35)
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550","@7120063","@7607195","@7627535","@7627546","@7627556","@7631682","@7634571","@4916014","@4005264","@7033610","@7308352","@3222646","@5937915","@7114147","@7288402","@7756165","@7757983","@7754765","@7754518"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition","White and Black","Mortal Cinema","Background Directions","Without Plans","Defilante Maze","Testing Purposes","Under the Darkness","Fallen Layers","Defilante Platform","Threshold of Boxes","Simple Black","Grassy Walls","Thickness of Clouds","Unreal Illusion","Testing Lava Cave","Ninja Directions","Limits of Tomorrow","",""}
objects={1,2,3,4,6,7,10,33,35,39,40,45,46,54,60,61,65,68,69,85,89,90}
actual_map=""; remaining=0; imageId=-1; actual_creator=""; bar=""; loop=0; winner=false; times=0;
functs={running=false,level=0,count=8}
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
function eventChatCommand(name,message)
	if message == "help" then
		showMessage("<J>The objective of this module is survive! Don't hit the objects that are falling! The last alive player wins the game!<br><br><ROSE>Module managed by Rakan#3159",name)
	end
	if name == "Rakan#3159" or name == "Shun_kazami#7014" or name == "Skyymellu#0000" or name == "Cassiopeia#1749" then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "restart" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
		if message == "sd" then
			system.exit();
		end
	end
end
function eventNewGame()
	functs.running=false; functs.level=0; functs.count=8; times=0;
	tfm.exec.setGameTime(100)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	showMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play.",name)
		end
	end
end
function showBar()
	for i=1,41 do
		if mapas[i] == tfm.get.room.currentMap then
			local diff=functs.level
			if map_names[i] == "" then
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."   </b><V>|   <N>Difficulty : <R>"..diff.."   <V>|   <N>Rakan's Objects<")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b> <BL>- "..tfm.get.room.currentMap.."   <V>|   <N>Difficulty : <R>"..diff.."   <V>|   <N>Rakan's Objects<")
			end
		end
	end
end
function showText(text)
	ui.addTextArea(1,"<i><font size='52'><p align='center'><font color='#222222'>"..text.."",nil,103,93,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<i><font size='52'><p align='center'><font color='#ffffff'>"..text.."",nil,100,90,600,80,0,0,1.0,true)
end
function showTextSmall(text)
	ui.addTextArea(1,"<i><font size='29'><p align='center'><font color='#222222'>"..text.."",nil,103,103,600,80,0,0,1.0,true)
	ui.addTextArea(0,"<i><font size='29'><p align='center'><font color='#ffffff'>"..text.."",nil,100,100,600,80,0,0,1.0,true)
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
	showMessage("<J><b>Welcome to Rakan's Objects!</b><br><br>The objective of this module is survive! Don't hit the objects that are falling! The last alive player wins the game!<br><br><ROSE>Module developed by Rakan#3159",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventLoop(p,f)
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
		if functs.count == 3 then imageId = tfm.exec.addImage("17a4e9afa86.png","&1",358,80,nul) end
		if functs.count == 2.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count == 2 then imageId = tfm.exec.addImage("17a4e9ae302.png","&1",358,80,nul) end
		if functs.count == 1.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count == 1 then imageId = tfm.exec.addImage("17a4e9acb8f.png","&1",358,80,nul) end
		if functs.count == 0.5 then tfm.exec.removeImage(imageId,true) end
		if functs.count <= 0 and p < 20000 and winner == false then
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
tfm.exec.newGame(mapas[math.random(#mapas)])
end

initTrue = function()
for _,f in next,{"per","skip","limits","return","cancel","at","shamdef"} do
	system.disableChatCommandDisplay(f)
end
for _,G in next,{"DebugCommand","AutoScore","AutoNewGame","AfkDeath","PhysicalConsumables","AllShamanSkills"} do
	tfm.exec["disable"..G](true)
end
blue_ground={type = 12,width = 380,height = 100,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = false,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 380,height = 100,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = false,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 300,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.setRoomMaxPlayers(35)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
current_mode=""; answer_time=20; remain_time=0;
game_map='<C><P mc="" aie="" Ca="" G="0,12.5" /><Z><S><S H="107" L="32" o="525252" X="400" c="4" Y="153" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0,0,0,0,0" L="400" o="a9a9a9" X="640" c="3" Y="186" T="12" H="208" /><S H="208" L="400" o="a9a9a9" X="160" c="3" Y="186" T="12" P="0,0,0,0,0,0,0,0" /><S H="115" L="10" o="525252" X="419" c="3" Y="149" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="10" o="525252" X="381" c="3" Y="149" T="12" H="115" /><S P="0,0,0,0,0,0,0,0" L="680" o="747474" X="400" Y="390" T="12" H="20" /><S H="200" L="20" o="fdfdfd" X="370" c="3" Y="190" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="20" o="fdfdfd" X="430" c="3" Y="190" T="12" H="200" /><S P="0,0,0,0,0,0,0,0" L="800" o="fdfdfd" X="400" c="3" Y="90" T="12" H="20" /><S P="0,0,0,0.2,0,0,0,0" L="60" o="747474" X="30" c="3" Y="200" T="12" H="400" /><S P="0,0,0,0,0,0,0,0" L="80" o="fdfdfd" X="400" Y="245" T="12" H="80" /><S H="400" L="60" o="747474" X="770" c="3" Y="200" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0,0,0,0,0" L="40" o="a9a9a9" X="400" c="3" Y="352" T="12" H="56" /></S><D><DS Y="65" X="400" /><DC Y="190" X="400" /></D><O /></Z></C>'
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
function showTrueFalse(name)
	ui.addTextArea(251,"<font color='#010101'><font size='32'>True",name,178,248,224,128,0,0,1.0,true)
	ui.addTextArea(250,"<VP><font size='32'>True",name,180,250,224,128,0,0,1.0,true)
	ui.addTextArea(253,"<font color='#010101'><font size='32'>False",name,538,248,224,128,0,0,1.0,true)
	ui.addTextArea(252,"<R><font size='32'>False",name,540,250,224,128,0,0,1.0,true)
end
function eventNewGame()
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in next,tfm.get.room.playerList do
		for _,i in next,{10,11,20} do
			ui.addPopup(i,0,"",name,-1000,-1000,128,false)
		end
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
			showMessage("<VP>Please type <b>!per</b> to make a question. Type <b>!skip</b> to skip your turn.",name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.setPlayerScore(name,-10,true)
			showMessage("<R>Guest players cannot play this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setBackgroundColor("#202020")
	ui.setMapName("<VP>True or False")
	showTrueFalse(name)
end
for name,player in next,tfm.get.room.playerList do
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
	for name,player in next,tfm.get.room.playerList do
		ui.setBackgroundColor("#202020")
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
		end
		showTrueFalse(name)
	end
	ui.setMapName("<VP>True or False")
end
function isTrue()
	showMessage("<VP>The answer is TRUE!")
	tfm.exec.addPhysicObject(1, 610, -400, red_ground)
end
function isFalse()
	showMessage("<VP>The answer is FALSE!")
	tfm.exec.addPhysicObject(0, 190, -400, blue_ground)
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
			showMessage("Questions limit changed to "..limits.questions.." and time limit changed to "..limits.time.."")
		end
	end
	if id == 10 then
		if string.len(answer) >= 10 and string.len(answer) <= 170 then
			questions.question=answer
			ui.addPopup(11,1,"Click YES if your answer is TRUE.<br>Click NO if your answer is FALSE.",name,350,175,200,true)
		else
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
			showMessage("<R>Your question is too large or too short. Please make a new question.",name)
		end
	end
	if id == 11 then
		if remain_time > 1 and tfm.get.room.playerList[name].isShaman then
			questions.answer=answer
			questions.round=questions.round+1
			current_mode="truefalse"
			tfm.exec.setGameTime(answer_time)
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					tfm.exec.movePlayer(name,400,325)
				else
					tfm.exec.movePlayer(name,400,190)
				end
			end
			showMessage("<N>"..questions.question.."")
			ui.addTextArea(0,"<font size='20'><p align='center'><font face='Segoe UI,Arial'>"..questions.question.."",nil,15,25,770,60,0x010101,0x520899,0.99,true)
			for _,i in next,{"Dhanny_mheyran#6701","Lacoste#8972","Viego#0345","Skyymellu#0000","Hwei#1027"} do
				showMessage(questions.answer,i)
			end
		end
	end
	if id == 20 then
		if answer == "yes" then
			showMessage("<R>"..name.." skipped your turn.")
			reset()
		end
	end
end
function eventChatCommand(name,message)
	if name == "Dhanny_mheyran#6701" or name == "Lacoste#8972" or name == "Viego#0345" or name == "Skyymellu#0000" or name == "Hwei#1027" then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			if tonumber(message:sub(4)) >= 5 and tonumber(message:sub(4)) <= 30 then
				answer_time=tonumber(message:sub(4))
				showMessage("Answer time: "..answer_time.."s.",name)
			end
		end
		if(message:sub(0,7) == "shamdef") then
			if current_mode == "waiting" then
				tfm.exec.setPlayerScore(message:sub(9),10001,false)
				reset()
			end
		end
		if message == "return" then
			if current_mode == "truefalse" then
				for name,player in next,tfm.get.room.playerList do
					if not tfm.get.room.playerList[name].isShaman then
						tfm.exec.movePlayer(name,400,65)
					end
				end
				current_mode="waiting"
				tfm.exec.setGameTime(60)
				showMessage("<R>This question has been cancelled.")
				ui.removeTextArea(0,nil)
			end
		end
		if message == "cancel" then
			if current_mode == "truefalse" or current_mode == "waiting" then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.killPlayer(name)
				end
				showMessage("<R>This shaman has been skipped.")
				reset()
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
	if remain_time < 1 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time is up! Other shaman will be choosed.")
	end
	if remain_time < 1 and current_mode == "truefalse" then
		ui.removeTextArea(0,nil)
		tfm.exec.addPhysicObject(2, 370, 300, center_ground)
		tfm.exec.addPhysicObject(3, 430, 300, center_ground)
		tfm.exec.setGameTime(5)
		current_mode="wait"
	end
	if remaining < 300 and current_mode == "wait" then
		if questions.answer == "yes" then
			isTrue()
		else
			isFalse()
		end
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isShaman then
				if player.x >= 370 and player.x <= 430 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		tfm.exec.setGameTime(7)
		current_mode="answer"
	end
	if remaining <= 1 and current_mode == "answer" then
		if questions.answer == "yes" then
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					if player.x > 400 then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.movePlayer(name,400,65)
					end
				end
			end
		else
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					if player.x < 400 then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.movePlayer(name,400,65)
					end
				end
			end
		end
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
		current_mode="waiting"
		tfm.exec.setGameTime(60)
	end
	if remain_time < 55 and limits.mices_alive <= 0 and current_mode == "waiting" then
		reset()
		showMessage("<R>No winners!")
	end
	if remain_time < 55 and limits.mices_alive == 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead and not tfm.get.room.playerList[name].isShaman then
				tfm.exec.setPlayerScore(name,10000,false)
				reset()
			end
		end
	end
	if remain_time < 55 and remain_time >= 54 and limits.mices_alive >= 2 and questions.round >= 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y)
			end
		end
		if questions.round >= limits.questions and current_mode == "waiting" then
			reset()
			showMessage("<R>Questions limit reached!")
		end
	end
	if time > limits.time*60000 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time limit reached!")
	end
end
function eventSummoningEnd(name)
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.killPlayer(name)
	end
	showMessage("<R>This shaman has been skipped.")
	reset()
end
reset()
end

tfm.exec.chatMessage("<ROSE><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.270.3<br>By Spectra_phantom#6089")

if tfm.get.room.isTribeHouse == true then
	tfm.exec.chatMessage("<br><VP>Tribehouse detected. Initialising main #anvilwar module.<br><ROSE>The game will be available only in English.")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") or string.find(tfm.get.room.name,"survivor") then
		tfm.exec.chatMessage("<R>Room name not allowed.")
	elseif string.find(tfm.get.room.name,"objects") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'objects' on room name.<br>Initialising #objects module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initObjects()
	elseif string.find(tfm.get.room.name,"truefalse") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'truefalse' on room name.<br>Initialising #truefalse module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initTrue()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
