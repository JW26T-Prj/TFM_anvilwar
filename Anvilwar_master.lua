--[[ Script contendo o module #anvilwar, #mestre, #pistas, #objects e #true_false. Compilado às 14h27 (UTC) 08/04/2019. ]]--

local modulo = {
	_NOME = "anvilwar",
	_VERSION = "1.48",
	_AUTHOR = "Jessiewind26#2546"
}

active = ""

initAnvilwar = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(35)
powerups={double=false,chuva=false,count=0,choosed="",bomba=false,objeto=false,explosion=false,triple=false,selective=false,r_azul=false,r_vermelho=false,multiple=false,multi_count=0,int_azul=2,int_vermelho=2}
play_azul={}
players_table={}
objetos={1,2,3,4,6,7,10,23,28,29,30,31,32,33,34,35,39,40,45,46,54,59,60,61,62,65,67,68,69,80,85,89,90,95,201,202,203,301,302,303,401,402,403,601,604}
caps={azul="",vermelho=""}
play_vermelho={}
avs_list={}
mods_list={"Flaysama#5935","Ashearcher#0000","Leonardodsss#0000","Jarvanfender#0000","Marcelohacki#0000","Felipe#0799"}
managers_list={"Nasus_assassin#1534","Spectra_phantom#6089"}
admins_list={"Jessiewind26#2546","Zed#9431"}
level6_list={"Forzaldenon#0000","Jhinsword350#0000",""}
scoreloop=0
sudden_death=false
local temp_name=""
local temp_name2=""
local temp_name3=""
actual_player=""
count_int=20
tempo=0
players=0
time_limit=10
team=1
kills=0
data={}
ratos=0
loop=8
power=5
valendo=false
anvil_launched=false
set=false
object=10
select_obj=0
set_name=""
reset=false
intervalo=false
count=0
count_azul=0
count_vermelho=0
for _,f in next,{"help","powerups","set","tc","p","rank","data_score","score","kill","tt","rv","cap","cmd","acmd","ban","unban","rodar","reset","so"} do
	system.disableChatCommandDisplay(f)
end
anvils={10,1002,1003,1004,1005}
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495501","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","The Stone of Driftblade",""}
lang = {}
lang.br = {
	win_vermelho = "<R><b>GG Time Vermelho!</b><br>A próxima partida será iniciada em 15 segundos.",
	win_azul = "<BL><b>GG Time Azul!</b><br>A próxima partida será iniciada em 15 segundos.",
	sudden_death = "<VP><b>Morte Súbita!</b><br>A equipe que conseguir eliminar qualquer um adversário será declarada a vencedora.",
	empate_text = "<J><b>Houve um empate!</b><br>A próxima partida será iniciada em 15 segundos.",
	instructions = "Use as teclas de 1 a 9 para alterar a potência da bigorna e barra de espaço para atirar. Para ajuda digite !help. Para ver poderes especiais digite !powerups.",
	turn = "<VP>É a vez de",
	timeout = "<J>Tempo esgotado! O atirador será alterado.",
	enter_vermelho = "Entrar no time vermelho",
	enter_azul = "Entrar no time azul",
	exit = "Sair do time",
	double = "acionou o powerup Bigorna Dupla!",
	double2 = "<br>Neste powerup, você atira 2 bigornas de uma vez.",
	triple = "acionou o powerup Bigorna Tripla!",
	triple2 = "<br>Neste powerup, você atira 3 bigornas de uma vez.",
	bomba1 = "acionou o powerup Bomba Relógio!",
	bomba2 = "<br>Neste powerup, uma explosão em um lugar aleatório do time adversário ocorrerá.",
	objeto1 = "acionou o powerup Tiro Aleatório!",
	objeto2 = "<br>Neste powerup, ao pressionar a barra de espaço, você vai atirar um objeto aleatório de shaman. Caso você tenha usado a habilidade Bigorna Dupla, você irá atirar 2 objetos ao invés de um.",
	exp1 = "acionou o powerup Olha a Explosão!",
	exp2 = "<br>Neste powerup, você pode gerar uma explosão clicando em um local do time inimigo.<br>Você possui 5 segundos para explodir!",
	fly1 = "acionou o powerup Rato Pequeno!",
	fly2 = "<br>Neste powerup, seu rato diminuirá 50% de tamanho. Esta habilidade só pode ser usada uma vez por jogador.",
	inv1 = "acionou o powerup Modo Imortal!",
	inv2 = "<br>Neste powerup, você ficará imortal durante 4 turnos do seu time. Esta habilidade só pode ser utilizada uma vez por partida.",
	inv3 = "Sua habilidade Modo Imortal expirou.",
	invi1 = "acionou o powerup Meteoro de Bigornas!",
	invi2 = "<br>Neste powerup, você terá 5 segundos para clicar em um local do time inimigo. Várias bigornas cairão do céu na coordenada selecionada.",
	bar = "#anvilwar - RTM 9981.096",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna. Use as teclas F1 a F7 para usar poderes especiais.",
	help = "Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna. Use as teclas de F1 a F7 para usar poderes especiais (para saber quais são, digite !powerups). A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Jessiewind26#2546 e Zed#9431<br>Powerups: Jhinsword350#0000 e Vidaloka9999#0000<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) e Puiguirata#0000 (DE)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!",
	seconds30 = "<ROSE>Faltam 30 segundos!",
	seconds10 = "<ROSE>Faltam 10 segundos!",
	powerups1 = "F1 = Bigorna Dupla<br>F2 = Bigorna Tripla<br>F3 = Bomba Relógio<br>F4 = Tiro Aleatório<br>F5 = Olha a Explosão<br>F6 = Rato Pequeno<br>F7 = Modo Imortal",
	powerups2 = "6pts<br>12pts<br>10pts<br>4pts<br>18pts<br>10pts<br>24pts",
	powerups3 = "<a href='event:power1'>Mostrar</a><br><a href='event:power2'>Mostrar</a><br><a href='event:power3'>Mostrar</a><br><a href='event:power4'>Mostrar</a><br><a href='event:power5'>Mostrar</a><br><a href='event:power6'>Mostrar</a><br><a href='event:power7'>Mostrar</a>",
	powerups4 = "1<br>2<br>2<br>2<br>4<br>3<br>5",
	teamchat = "<J>Você pode usar o comando !tc [mensagem] para falar apenas com o seu time.<br><br>Você pode ver seu perfil no jogo digitando !p e o ranking temporário digitando !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ajuda</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:profile'>Perfil</a>  |  <a href='event:ranking'>Ranking</a>  |  <a href='event:cap'>Capitão</a>  |  <a href='event:cmd'>Comandos</a>",
	powerupslist = "Lista de Poderes",
	profile = "Use o comando !p para ver o seu perfil. Use !p [nome] para ver o perfil de outra pessoa.",
	starting = "<VP>A partida está prestes a começar. Preparem-se!",
	suicide = "O seguinte jogador cometeu suicídio: ",
	ban = " foi banido da sala #anvilwar por ",
	unban = " teve seu banimento removido da sala.",
	caps = " foi escolhido para ser o capitão da equipe.",
	cap = "Este tipo de jogador (escolhido aleatoriamente) receberá 50% a mais de pontuação que os outros e poderá transferir seus pontos para outro jogador de sua equipe usando o comando !tt [nome].<br>Você também poderá utilizar o comando !rv [nome] para reviver UM membro morto de sua equipe.",
	cap_text = "<br><VP>Você é o capitão da sua equipe.<br><br>Você irá receber 50% mais pontos por tempo vivo e poderá transferir pontos para outros jogadores usando o comando !tt [nome].<br>Você também poderá utilizar o comando !rv [nome] para reviver UM membro morto de sua equipe. Você também pode usar a tecla END no teclado para pedir até 2 intervalos de 20 segundos cada.",
	score30 = "<R>Você precisa de 30 pontos para usar isto.",
	advanced = "<VP>Você acaba de avançar para o nível ",
	tag_text = "<J>Não se esqueça de colocar a #tag no final do nome desejado! Caso contrário, o comando não irá funcionar!",
	revivetext = "<J>O seguinte jogador reviveu: ",
	yturn = "É a vez de: ",
	level_error = "<R>Você não possível nível suficiente para usar isto.",
	funct = "Função não permitida. (Você colocou a #tag no nome?)",
	cmds = "Comandos do Jogo",
	commands = "• !help = Exibe as instruções de como jogar.<br>• !p [jogador] = Exibe o perfil do jogador escolhido. Digite !p sem argumentos para ver o seu perfil.<br>• !rank = Exibe o ranking temporário de quem está na sala.<br>• !tc [mensagem] = Fala apenas com os jogadores do seu time.<br><ROSE>* <N>!rv [jogador] = Revive um jogador morto de sua equipe.<br><ROSE>* <N>!tt [jogador] = Transfere seus pontos para outro jogador<br><br>Os comandos marcados com <ROSE>* <N>são de uso exclusivo do capitão da equipe. Para saber mais sobre isso, digite !cap.",
	admin_commands = "<BL>• <N>!pw [texto] = Adiciona uma senha na sala.<br><BL>• <N>!rodar [mapa] = Executa o mapa especificado.<br><J>• <N>!kill [nome] = Mata o jogador especificado.<br><R>• <N>!limit [número] = Limita a quantidade de ratos na sala.<br><br>Você só pode usar os comandos correspondentes a cor do seu nome.<br><br>Por motivos de segurança e estabilidade, nem todos os comandos especiais foram adicionados aqui.",
	playingmap = "Rodando mapa",
	created = "criado por",
	red_int_text = "<R>A equipe vermelha pediu tempo.",
	blue_int_text = "<BL>A equipe azul pediu tempo.",
	points_text1 = "<N>Você agora possui ",
	points_text2 = "<N> pontos para gastar com powerups.",
}
lang.en = {
	win_vermelho = "<R><b>The RED team wins!</b><br>The next match will start in 15 seconds.",
	win_azul = "<BL><b>The BLUE team wins!</b><br>The next match will start in 15 seconds.",
	sudden_death = "<VP><b>SUDDEN DEATH!</b><br>The team that kill anyone of other team will won the match.",
	empate_text = "<J><b>There was a draw!</b><br>The next match will start in 15 seconds.",
	instructions = "Use the 1 to 9 keys to change the intensity of anvil and SPACEBAR to throw a anvil.",
	turn = "<VP>It's turn of",
	timeout = "<J>Time is over! The shooter will be changed.",
	enter_vermelho = "Enter on RED team",
	enter_azul = "Enter on BLUE team",
	exit = "Leave this team",
	double = "used the powerup Double Anvil!",
	triple = "used the powerup Triple Anvil!",
	bomba1 = "used the powerup Time Bomb!",
	bomba2 = "<br>On this powerup, a explosion will occur on a random place of enemy area.",
	objeto1 = "used the powerup Random Shoot!",
	objeto2 = "<br>On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<br>On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	fly1 = "used the powerup Small Mice!",
	fly2 = "<br>On this powerup, the size of your mice will be reduced at 50%. This powerup can be used only 1 time per player.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "<br>On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
	inv3 = "Your immortality has ended.",
	invi1 = "used the powerup Anvil Meteor!",
	invi2 = "<br>On this powerup, you can click with the mouse on a area of enemy team. A lot of anvils will drop at selected point.",
	bar = "#anvilwar - RTM 9981.096",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. Use the F1 to F7 keys to use powerups.",
	help = "Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. Use the F1 to F7 keys to use powerups (type !powerups). The team that eliminates the enemy team wons the game.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Jessiewind26#2546 and Zed#9431<br>Powerups: Jhinsword350#0000 and Vidaloka9999#0000<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!",
	seconds30 = "<ROSE>30 seconds remaining!",
	seconds10 = "<ROSE>10 seconds remaining!",
	powerups1 = "F1 = Double Anvil<br>F2 = Triple Anvil<br>F3 = Time Bomb<br>F4 = Random Shoot<br>F5 = Explosion<br>F6 = Small Mice<br>F7 = Immortal Mode",
	powerups2 = "6pt<br>12pt<br>10pt<br>4pt<br>18pt<br>10pt<br>24pt",
	powerups3 = "<a href='event:power1'>Show</a><br><a href='event:power2'>Show</a><br><a href='event:power3'>Show</a><br><a href='event:power4'>Show</a><br><a href='event:power5'>Show</a><br><a href='event:power6'>Show</a><br><a href='event:power7'>Show</a>",
	powerups4 = "1<br>2<br>2<br>2<br>4<br>3<br>5",
	teamchat = "<J>You can use the command !tc [message] to speak with your team.<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:profile'>Profile</a>  |  <a href='event:ranking'>Ranking</a>  |  <a href='event:cap'>Capitain</a>  |  <a href='event:cmd'>Commands</a>",
	powerupslist = "Powerups List",
	profile = "Use the !p command to view your profile and use !p [username] to view the profile of another user.",
	starting = "<VP>The match will start on a few seconds. Get ready!",
	suicide = "The following player committed suicide: ",
	ban = " was banned of room by ",
	unban = " was unbanned of room.",
	caps = " was choosed to be the team capitain.",
	cap = "This type of player (that is choosed randomly) will receive 50% more points and will get the ability of transfer your points to other players alive on the match using the !tt [name] command. You can use the !rv [name] command to revive ONE team player dead.",
	cap_text = "<br><VP>You are the team capitain.<br><br>You will receive 50% more points than other team players and can transfer your points to other team players using the !tt [name] command. You can use the !rv [name] command to revive ONE team player dead. You also can use the END key on the keyboard to request up to 2 timeouts.",
	score30 = "<R>You need 30 points to use this.",
	advanced = "<VP>You reached the level ",
	tag_text = "<J>Don't forget to insert the #tag on the target nickname, else this command don't will work!",
	revivetext = "<J>The following player has been revived: ",
	yturn = "Actual player: ",
	level_error = "<R>You don't have level to use this. To view your level use the !p command.",
	funct = "Function not allowed",
	cmds = "Game commands",
	commands = "• !help = Show the game help.<br>• !p [player] = Show the profile of selected player. Type !p without arguments to show your profile.<br>• !rank = Show the temporary room ranking.<br>• !tc [message] = Chat with other members of your team.<br><ROSE>* <N>!rv [player] = Revive a dead player of your team.<br><ROSE>* <N>!tt [player] = Transfer your points to another team member.<br><br>The commands marked with <ROSE>* <N>are of exclusive use of the team capitains. To see more info about this, use the !cap command.",
	admin_commands = "<BL>• <N>!pw [texto] = Add a password on the room. Type only !pw to remove the password.<br><BL>• <N>!rodar [mapa] = Run the specified map.<br><J>• <N>!kill [nome] = Kill the specified player.<br><R>• <N>!limit [número] = Set a limit of mices on this room.<br><br>You only can use the commands that match with your name color.",
	playingmap = "Playing map",
	created = "created by",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	points_text1 = "<N>You now have ",
	points_text2 = "<N> points to use powerups.",
}
lang.ar = {
	win_vermelho = "<R><b>فاز الفريق الأحمر!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
win_azul = "<BL><b>فاز الفريق الأزرق!</b><br>ستبدأ المعركة التالية في غضون 15 ثانية!",
sudden_death = "<VP><b>المعركة النهائية!</b><br>إذا قام أي أحد بقتل عضو في أي فريق أخر، سوف يفوز الفريق الذي قتل!",
empate_text = "<J><b>تعادل!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
instructions = "إستخدم مفاتيح لوحة التحكم من 1 الى 9 للتحكم في سرعة وقوة السندان.",
turn = "<VP>إنه دور",
timeout = "<J>إنتهى الوقت! سيتم تغيير الضارب",
enter_vermelho = "قم بالدخول للفريق الأحمر",
enter_azul = "قم بالدخول للفريق الأزرق",
exit = "قم بالخروج من هذا الفريق",
double = "إستخدم السندان المزدوج!",
triple = "إستخدم السندان الثلاثي، إحترس!",
bomba1 = "إستخدم فرقعة الزمن، إحترس من الإنفجار!",
bomba2 = "<br>في هذه القوة، سوف يحدث إنفجار في بقعة مختلفة في مكان العدو",
objeto1 = "إستخدم الضربة العشوائية! قد يقوم بضرب أي شيئ الأن!",
objeto2 = "<br>في هذه القوة، يمكنك ضرب أداة شامان بدلآ من السندان، إذا قمت بإختيار السندان المزدوج، سيتم ضرب اداتان شامان بدلآ من سندان",
exp1 = "قام بإستخدام قوة الإنفجار!",
exp2 = "<br>بإستخدام هذه القوة، يمكنك إحداث إنفجار في منطقة العدو بإستخدام الفأرة (الماوس)، لديك 5 ثوانٍ فقط للقيام بإنفجار",
fly1 = "used the powerup Small Mice!",
fly2 = "<br>On this powerup, the size of your mice will be reduced at 50%. This powerup can be used only 1 time per player.",
inv1 = "إستخدم قوة عدم الموت",
inv2 = "<br>بإستخدام هذه القوة، لن يمكنك الموت لمدة 4 جولات من الضرب، يمكنك إستخدامها مرة واحدة فقط في الجولة الواحدة",
inv3 = "قوة عدم موتك قد إنتهت، أصبحت قابلآ للموت الأن!.",
invi1 = "used the powerup Anvil Meteor!",
invi2 = "<br>On this powerup, you can click with the mouse on a area of enemy team. A lot of anvils will drop at selected point.",
bar = "#anvilwar - RTM 9981.096",
intensity = "قوة الضرب وسرعته",
your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 9 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 9 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Jessiewind26#2546 and Zed#9431<br>نظام القوة: Jhinsword350#0000 and Vidaloka9999#0000<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
teamkill1 = "أوه لا!! ",
teamKill2 = "قام بقتل عضو من فريقه!",
ajuda = "المساعدة",
credits = "Credits",
mostrar = "أظهر",
seconds = "<ROSE>60 ثانية متبقية",
seconds30 = "<ROSE>30 ثانية متبقية!",
seconds10 = "<ROSE>10 ثوانٍ متبقية!",
powerups1 = "F1 = سندان مزدوج<br>F2 =سندان ثلاثي <br>F3 =فرقعة بالفأرة<br>F4 = ضربة أداة شامان عشوائية<br>F5 = تفجير!<br>F6 = Small Mice<br>F7 = وضع عديم الموت",
powerups2 = "6pt<br>12pt<br>10pt<br>4pt<br>18pt<br>10pt<br>24pt",
powerups3 = "<a href='event:power1'>Show</a><br><a href='event:power2'>Show</a><br><a href='event:power3'>Show</a><br><a href='event:power4'>Show</a><br><a href='event:power5'>Show</a><br><a href='event:power6'>Show</a><br><a href='event:power7'>Show</a>",
powerups4 = "1<br>2<br>2<br>2<br>4<br>3<br>5<br>3",
teamchat = "<J>إستخم الإيعاز !tc [msg] للتكلم مع أعضاء فريقك<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
menu_bar = "<p align='center'><a href='event:help'>Help</a> | <a href='event:powerups'>Powerups</a> | <a href='event:profile'>Profile</a> | <a href='event:ranking'>Ranking</a> | <a href='event:cap'>Capitain</a> | <a href='event:cmd'>Commands</a>",
powerupslist = "Powerups List",
profile = "إستخدم !p لرؤية ملفك وأستخدم !p name لرؤية ملف لاعب أخر ",
starting = "<VP>ستبدأ المباراة غي غضون بضعة ثواني، إستعد!",
suicide = "قام بالإنتحار ",
ban = " تم حظره من الغرفة من قبل ",
unban = " تم فك حظره من الغرفة من قبل",
caps = " تم إختياره ليصبح قائد الفريق. لرؤية المزيد عن هذا أكتب !cap أو استخدم قسم القائد في القائمة, ",
cap = "الكابتن هو قائد الفريق، يتم إختياره عشوائيآ، سوف يحصل على نقاط بنسبة 50% أكثر من اللاعبين، اي جَني النقاط بسرعة!يمكنه تحويل النقاط للاعب أخر عن طريق الإيعاز ويمكنه إحياء لاعب مات من فريقه بإستخدام !rv [name] ولكن يتطلب 30 نقطة لذلك",
cap_text = "<br><VP>أنت قائد الفريق<br><br>سوف تحصل على نقاط زائدة بنسبة 50% ويمكنك نق لنقاطك للاعب أخر بإستخدام !tt name أو إحياء لاعب أخر بإستخدام !rv name يتطلب الإحياء 30 نقطة",
score30 = "<R>تحتاج 30 نقطة للقيام بهذا",
advanced = "<VP>وصلت للستوى ",
tag_text = "<J>لا تنسى بوضع الهاشتاج على الإسم الذي تم إختياره, أو لن يعمل هذا الإيعاز",
revivetext = "<J>هذا اللاعب قام بإستقبال : ",
yturn = "اللاعب الحالي: ",
level_error = "<R>لا تملك المستوى المطلوب لفعل هذا، لترى مستواك إكتب !p",
funct = "الإيعاز غير مسموح",
cmds = "إيعازات اللعبة : ",
commands = "• !help لرؤية المساعدة<br>• !p [player] = لرؤية ملف لاعب، أكتب !p بدون أي شيئ لرؤية ملفك<br>• !rank لرؤية الرتبة الحالية.<br>• !tc [message] = المحادثة مع أعضاء فريقك<br><ROSE>* <N>!rv [player] = إحياء لاعب مات من فريقك، تطلب ان تكون القائد ومعك 30 نقطة<br><ROSE>* <N>!tt [player] = تقوم بنقل نقاطك للاعب أخر في الغرفة<br><br>الإيعازات المُعلمة بـ <ROSE>* <N> إيعازات فقط للقائد، لرؤية المزيد أكتب !cap",
admin_commands = "<BL>• <N>!pw [text] = وضع كلمة سر للغرفة أكتب !pw لإزالة الباسورد<br><BL>• <N>!set_map [map] = تشغيل الخريطة المحددة<br><J>• <N>!kill [name] = قتل اللاعب المختار<br><R>• <N>!limit [number] = وضع حد للفئران في الغرفة<br><br>يمكنك إستخدام هذه الإيعازات عندما يكون إسمك باللون :.",
playingmap = "Playing map",
created = "created by",
red_int_text = "<R>The red team requested a timeout.",
blue_int_text = "<BL>The blue team requested a timeout.",
points_text1 = "<N>You now have ",
points_text2 = "<N> points to use powerups.",
}
lang.es = {
	win_vermelho = "<R><b>¡Ha ganado el equipo ROJO!</b><br>La próxima ronda comenzará en 15 segundos.",
win_azul = "<BL><b>¡Ha ganado el equipo AZUL!</b><br>La próxima ronda comenzará en 15 segundos.",
	sudden_death = "<VP><b>MUERTE SÚBITA!</b><br>El equipo que mate a alguien del otro equipo ganará esta ronda.",
	empate_text = "<J><b>Hubo un empate!</b><br>La próxima ronda comenzará en 15 segundos.",
	instructions = "Usa las teclas 1 al 9 para cambiar la intensidad del yunque y ESPACIO para lanzarlo.",
	turn = "<VP>Es el turno de",
	timeout = "<J>El tiempo ha terminado. El tirador será cambiado.",
	enter_vermelho = "Unirse al equipo ROJO",
	enter_azul = "Unirse al equipo AZUL",
	exit = "Abandonar este equipo",
	double = "usó el powerup Doble Yunque!",
	triple = "usó el powerup Triple Yunque!",
	bomba1 = "usó el powerup Bomba de Tiempo!",
	bomba2 = "<br>Con este powerup se producirá una explosión en un lugar aleatorio del área enemigo.",
	objeto1 = "usó el de powerup Tiro Aleatorio!",
	objeto2 = "<br>Con este powerup lanzarás un objeto de chamán aleatorio en lugar de un yunque. Si has usado el powerup Doble Yunque puedes lanzar 2 objetos en vez de 1.",
	exp1 = "usó el powerup Explosión!",
	exp2 = "<br>Con este powerup puedes provocar una explosión clicando en área enemigo con tu ratón.<br>Tienes 5 segundos para provocar la explosión.",
	fly1 = "used the powerup Small Mice!",
	fly2 = "<br>On this powerup, the size of your mice will be reduced at 50%. This powerup can be used only 1 time per player.",
	inv1 = "usó el powerup Modo Inmortal!",
	inv2 = "<br>Con este powerup serás inmortal durante los próximos 4 turnos. Solo puedes usarlo 1 vez por ronda.",
	inv3 = "Tu inmortalidad ha terminado.",
	invi1 = "used the powerup Anvil Meteor!",
	invi2 = "<br>On this powerup, you can click with the mouse on a area of enemy team. A lot of anvils will drop at selected point.",
	bar = "#anvilwar - RTM 9981.096",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. Usa las teclas F1 al F7 para usar los powerups.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. Usa las teclas F1 al F7 para usar los powerups (escribe !powerups). El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Jessiewind26#2546 y Zed#9431<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) y Puiguirata#0000 (DE)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!",
	seconds30 = "<ROSE>¡Quedan 30 segundos!",
	seconds10 = "<ROSE>¡Quedan 10 segundos!",
	powerups1 = "F1 = Doble Yunque<br>F2 = Triple Yunque<br>F3 = Bomba de Tiempo<br>F4 = Tiro Aleatorio<br>F5 = Explosión<br>F6 = Small Mice<br>F7 = Modo Inmortal",
	powerups2 = "6pt<br>12pt<br>10pt<br>4pt<br>18pt<br>10pt<br>24pt",
	powerups3 = "<a href='event:power1'>Mostrar</a><br><a href='event:power2'>Mostrar</a><br><a href='event:power3'>Mostrar</a><br><a href='event:power4'>Mostrar</a><br><a href='event:power5'>Mostrar</a><br><a href='event:power6'>Mostrar</a><br><a href='event:power7'>Mostrar</a>",
	powerups4 = "1<br>2<br>2<br>2<br>4<br>3<br>5<br>3",
	teamchat = "<J>Puedes usar el comando !tc [mensaje] para hablar con tu equipo.<br><br>Puedes ver tu perfil escribiendo !p y el ranking temporal escribiendo !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ayuda</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:profile'>Perfil</a>  |  <a href='event:ranking'>Ranking</a>  |  <a href='event:cap'>Capitán</a>  |  <a href='event:cmd'>Comandos</a>",
	powerupslist = "Lista de Powerups",
	profile = "Usa el comando !p para ver tu perfil y usa !p [apodo] para ver el de otra persona.",
	starting = "<VP>La ronda comenzará en unos segundos. ¡Prepárate!",
	suicide = "El siguiente jugador cometió suicidio: ",
	ban = " fue baneado de la sala por ",
	unban = " fue desbaneado de la sala.",
	caps = " fue elegido para ser el capitán del equipo. Para ver más información acerca de esto, escribe el comando !cap o usa la sección de Capitán en el menú.",
	cap = "En esta compilación fue incluido la funcionalidad de jugador capitán. Este tipo de jugador (es elegido aleatoriamente) recibirá un 50% más de puntos y la posibilidad de transferir tus puntos a otros jugadores vivos en la ronda usando el comando !tt [apodo]. Puedes usar el comando !rv [apodo] para revivir UN jugador muerto del equipo.",
	cap_text = "<br><VP>Eres el capitán del equipo.<br><br>Recibirás un 50% más de puntos y la posibilidad de transferir tus puntos a otros jugadores del equipo usando el comando !tt [apodo]. Puedes usar el comando !rv [apodo] command para revivir UN jugador muerto del equipo.",
	score30 = "<R>Necesitas 30 puntos para usar esto.",
	advanced = "<VP>Has alcanzado el nivel ",
	tag_text = "<J>No te olvides de colocar el #tag en el apodo del objetivo, o este comando no funcionará.",
	revivetext = "<J>El siguiente jugador ha sido revivido: ",
	yturn = "Jugador actual: ",
	level_error = "<R>No tienes el nivel para usar esto. Para ver tu nivel usa el comando !p.",
	funct = "Función no permitido",
	cmds = "Comandos del juego",
	commands = "• !help = Mostrar la ayuda del juego.<br>• !p [apodo] = Mostrar el perfil de un determinado jugador. Escribe !p solamente para mostrar tu perfil.<br>• !rank = Mostrar el ranking temporal de la sala.<br>• !tc [mensaje] = Hablar con otros miembros de tu equipo.<br><ROSE>* <N>!rv [apodo] = Revivir a un jugador muerto de tu equipo.<br><ROSE>* <N>!tt [apodo] = Transferir tus puntos a otro miembro de tu equipo.<br><br>Los comandos marcados con <ROSE>* <N>son de uso exclusivo para capitanes de equipos. Para saber más de esto, usa el comando !cap.",
	admin_commands = "<BL>• <N>!pw [texto] = Agregar una contraseña a la sala. Escribe !pw nuevamente para remover la contraseña.<br><BL>• <N>!set_map [mapa] = Cargar un mapa en específico.<br><J>• <N>!kill [apodo] = Matar a un jugador en específico.<br><R>• <N>!limit [número] = Limitar el número de ratones en la sala.<br><br>Solo puedes utilizar los comandos que coincidan con el color de tu nombre.",
	playingmap = "Jugando mapa",
	created = "creado por",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	points_text1 = "<N>You now have ",
	points_text2 = "<N> points to use powerups.",
}
lang.de = {
	win_vermelho = "<R><b>Das ROTE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	win_azul = "<BL><b>Das BLAUE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	sudden_death = "<VP><b>PLÖTZLICHER TOD!</b><br>Das Team, das jemanden aus einem anderen Team tötet, gewinnt das Spiel.",
	empate_text = "<J><b>Es gab ein Unentschieden!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	instructions = "Verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern und die Leertaste, um einen Amboss zu werfen.",
	turn = "<VP>Es ist die Wende von",
	timeout = "<J>Die Zeit ist vorbei! Der Schütze wird gewechselt.",
	enter_vermelho = "Betreten Sie das ROTE Team",
	enter_azul = "Betreten Sie das BLAUE Team",
	exit = "Dieses Team verlassen",
	double = "benutzte den Powerup Double Anvil!.",
	triple = "benutzte den Powerup Triple Anvil!",
	bomba1 = "benutzte den Powerup Time Bomb!",
	bomba2 = "<br>Bei diesem Powerup kommt es zu einer Explosion an einem beliebigen Ort im feindlichen Gebiet.",
	objeto1 = "benutzte den Powerup Random Shoot!",
	objeto2 = "<br>Bei diesem Powerup schießt du ein zufälliges Schamanenobjekt anstelle eines Ambosses. Wenn du das Double Anvil Powerup benutzt hast, kannst du 2 Objekte anstelle von einem aufnehmen.",
	exp1 = "benutzte den Powerup Explosion!",
	exp2 = "<br>Bei diesem Powerup kannst du eine Explosion verursachen, indem du mit der Maus auf den gegnerischen Bereich klickst.<br>Sie haben 5 Sekunden Zeit, um deine Explosion zu verursachen.",
	fly1 = "used the powerup Small Mice!",
	fly2 = "<br>On this powerup, the size of your mice will be reduced at 50%. This powerup can be used only 1 time per player.",
	inv1 = "benutzte den Powerup Immortal Mode!",
	inv2 = "<br>Bei diesem Powerup bist du in den nächsten 4 Runden unsterblich. Dieses Powerup kann nur einmal pro Spiel verwendet werden.",
	inv3 = "Deine Unsterblichkeit ist vorbei.",
	invi1 = "used the powerup Anvil Meteor!",
	invi2 = "<br>On this powerup, you can click with the mouse on a area of enemy team. A lot of anvils will drop at selected point.",
	bar = "#anvilwar - RTM 9981.096",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Verwenden Sie die Tasten F1 bis F7, um Powerups zu verwenden.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Verwenden Sie die Tasten F1 bis F7, um Powerups zu verwenden (Typ !powerups). Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Jessiewind26#2546 und Zed#9431<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) und Puiguirata#0000 (DE)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!",
	seconds30 = "<ROSE>Noch 30 Sekunden!",
	seconds10 = "<ROSE>Noch 10 Sekunden!",
	powerups1 = "F1 = Double Anvil<br>F2 = Triple Anvil<br>F3 = Time Bomb<br>F4 = Random Shoot<br>F5 = Explosion<br>F6 = Small Mice<br>F7 = Immortal Mode",
	powerups2 = "6pt<br>12pt<br>10pt<br>4pt<br>18pt<br>10pt<br>24pt",
	powerups3 = "<a href='event:power1'>Show</a><br><a href='event:power2'>Show</a><br><a href='event:power3'>Show</a><br><a href='event:power4'>Show</a><br><a href='event:power5'>Show</a><br><a href='event:power6'>Show</a><br><a href='event:power7'>Show</a>",
	powerups4 = "1<br>2<br>2<br>2<br>3<br>4<br>3<br>5<br>3<br>3",
	teamchat = "<J>Du kannst den Befehl !tc [message] um mit Ihrem Team zu sprechen.<br><br>Du kannst deine Profiltypisierung sehen !p und die Typisierung des temporären Tankens !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:profile'>Profile</a>  |  <a href='event:ranking'>Ranking</a>  |  <a href='event:cap'>Capitain</a>  |  <a href='event:cmd'>Commands</a>",
	powerupslist = "Powerups List",
	profile = "Verwenden Sie die !p Befehl, um Ihr Profil anzusehen und zu verwenden !p [username] um das Profil eines anderen Benutzers anzuzeigen.",
	starting = "<VP>Das Spiel beginnt in wenigen Sekunden. Macht euch bereit!",
	suicide = "Der folgende Spieler beging Selbstmord: ",
	ban = " wurde aus dem Zimmer verbannt von ",
	unban = " wurde nicht aus dem Zimmer verbannt.",
	caps = " wurde als Teamchef ausgewählt. Um mehr Informationen darüber zu erhalten, geben Sie Folgendes ein !cap Befehl oder verwenden Sie den Abschnitt Capitain im Menü des Moduls.",
	cap = "Auf dieser Zusammenstellung wurde die Funktionalität eines Capitain-Players integriert. Diese Art von Spieler (die zufällig ausgewählt wird) erhält 50% mehr Punkte und die Möglichkeit, Ihre Punkte auf andere Spieler zu übertragen, die im Spiel leben. !tt [name] Befehl. Sie können die Funktion !rv [name] Befehl, EINE Teamspielerin wiederzubeleben, die tot is.",
	cap_text = "<br><VP>Du bist der Teamchef.<br><br>Du bekommst 50% mehr Punkte als andere Teammitglieder und kannst deine Punkte auf andere Teammitglieder übertragen !tt [name] Befehl. Sie können die Funktion !rv [name] Befehl, EINE Teamspielerin wiederzubeleben, die tot is.",
	score30 = "<R>Du brauchst 30 Punkte, um das zu benutzen.",
	advanced = "<VP>Du hast das Level erreicht ",
	tag_text = "<J>Vergiss nicht, das #Tag auf dem Ziel-Nicknamen einzufügen, sonst funktioniert dieser Befehl nicht!",
	revivetext = "<J>Der folgende Spieler wurde wiederbelebt: ",
	yturn = "Aktueller Spieler: ",
	level_error = "<R>Du hast kein Level, um das hier zu benutzen. Um dein Level zu sehen, benutze den !p Befehl.",
	funct = "Funktion nicht erlaubt",
	cmds = "Spielbefehle",
	commands = "• !help = Zeigen Sie die Spielhilfe an.<br>• !p [player] = Zeigt das Profil des ausgewählten Spielers an. Typ !p ohne Argumente, um Ihr Profil anzuzeigen.<br>• !rank = Anzeige der Rangfolge der temporären Zimmer.<br>• !tc [message] = Chat Sie mit anderen Mitgliedern Ihres Teams.<br><ROSE>* <N>!rv [player] = Erwecke einen toten Spieler deines Teams zum Leben.<br><ROSE>* <N>!tt [player] = Übertragen Sie Ihre Punkte auf ein anderes Teammitglied.<br><br>Die * mit gekennzeichneten Befehle  <ROSE>* <N>sind ausschließlich für die Teammitglieder bestimmt. Um weitere Informationen dazu zu erhalten, verwenden Sie die Option !cap Befehl.",
	admin_commands = "<BL>• <N>!pw [text] = Füge ein Passwort für den Zimmer hinzu. Geben Sie nur !pw ein, um das Passwort zu entfernen.<br><BL>• <N>!set_map [map] = Ausführen der angegebenen Karte.<br><J>• <N>!kill [name] = Töten des angegebenen Spielers.<br><R>• <N>!limit [number] = Setzen Sie ein Limit für Mäuse in diesem Zimmer.<br><br>Du kannst nur die Befehle verwenden, die mit deiner Namensfarbe übereinstimmen.",
	playingmap = "Wiedergabekarte",
	created = "erstellt von",
	red_int_text = "<R>The red team requested a timeout.",
	blue_int_text = "<BL>The blue team requested a timeout.",
	points_text1 = "<N>You now have ",
	points_text2 = "<N> points to use powerups.",
}

if tfm.get.room.community == "br" then
	text = lang.br
elseif tfm.get.room.community == "ar" then
	text = lang.ar
elseif tfm.get.room.community == "es" then
	text = lang.es
elseif tfm.get.room.community == "de" then
	text = lang.de
else
	text = lang.en
end
function changeMap()
	tfm.exec.newGame(mapas[math.random(#mapas)])
end
function resetPowers()
	ui.removeTextArea(701,nil)
	powerups.double=false
	powerups.objeto=false
	powerups.count=2
	kills=0
	powerups.bomba=false
	powerups.explosion=false
	powerups.fly=false
	anvil_launched=false
	powerups.triple=false
	powerups.r_vermelho=false
	powerups.r_azul=false
	powerups.multi_count=2
	powerups.multiple=false
	set=false
	advanceLevel()
end
changeMap()
function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end
function eventRanking(name)
	local sc = {}
	for id, name in pairs(players_table) do
		sc[#sc+1] = {n=name,s=data[name].score,f=data[name].kills,l=data[name].nivel}
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
				str5=str5.."<br><N>"..v.l..""
			else
				str1="<J>"..k.."° | <VP>"..v.n..""
				str2="<J><b>"..v.s.."</b>"
				str3="<J>"..v.f..""
				str5="<J>"..v.l..""
			end
		end
	end
	ui.addTextArea(8000,'<B><J><font size="13"><p align="center">Temporary Ranking',name,100,100,600,30,nil,0x2e424d,nil,true)
	ui.addTextArea(8001,"<B><font size='13'><font face='Consolas'>#	  Name								 Score	   Kills			   Level",name,110,110,580,20,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(8002,"<B><font size='16'><font face='Consolas'>"..str1,name,110,130,580,220,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(8003,"<p align='right'><font size='16'><font face='Consolas'>"..str2,name,400,130,60,220,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(8004,"<p align='right'><font size='16'><font face='Consolas'>"..str3,name,485,130,60,220,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(8007,"<p align='right'><font size='16'><font face='Consolas'>"..str5,name,635,130,45,220,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(8006,"<p align='center'><font size='16'><R><a href='event:close'>Close</a>",name,300,350,210,20,0x3c5063,0x3c5063,nil,true)
end
function loadPowerups(name)
	ui.addTextArea(9000,"<B><J><font size='13'><p align='center'>"..text.powerupslist.."",name,100,80,600,30,nil,0x2e424d,nil,true)
	ui.addTextArea(9001,"<font size='14'><font face='Consolas'>Powerup Name						  Score	 Funct.   Min Level",name,110,110,580,20,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(9002,"<font size='14'><font face='Consolas'>"..text.powerups1.."",name,110,135,580,155,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(9003,"<font size='14'><font face='Consolas'>"..text.powerups2.."",name,420,135,60,155,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(9004,"<font size='14'><font face='Consolas'>"..text.powerups3.."",name,500,135,60,155,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(9005,"<font size='14'><font face='Consolas'>"..text.powerups4.."",name,570,135,60,155,0x0e232b,0x0e232b,nil,true)
	ui.addTextArea(9006,"<font size='14'><R><a href='event:closep'>Close</a>",name,300,300,190,20,0x3c5063,0x3c5063,nil,true)
end
function eventChatCommand(name,message)
	local arg = split(message, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end

		if tfm.get.room.playerList[nome] then
			ui.addTextArea(8003,'<B><J><font size="17"><p align="center">'..nome,name,245,95,315,30,nil,0x2e424d,nil,true)
			ui.addTextArea(8004,"<font size='12'><b>Level: "..data[nome].nivel.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Score: "..data[nome].score.."<br>Matchs played: "..data[nome].matchs.."<br><br>Kills: "..data[nome].kills.."<br>Wins: "..data[nome].wins.."<br>Max Killing Spree: "..data[nome].max.."<br>Multi Kills: "..data[nome].mks.."",name,255,125,290,200,0x0e232b,0x0e232b,nil,true)
			ui.addTextArea(8006,"",name,260,178,((data[nome].exp/data[nome].maxp)*270)+3,6,0xffffff,0x000001,nil,true)
			ui.addTextArea(8005,"<R><p align='center'><B><a href='event:fechar'>Close</a>",name,255,320,290,20,0x3c5063,0x3c5063,nil,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end

	if message == "rank" then
		eventRanking(name)
	end
	if(message:sub(0,4) == "kill") then
		if data[name].level >= 3 or name == "Jessiewind26#2546" or name == "Zed#9431"  then
			tfm.exec.killPlayer(message:sub(6))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "rodar") then
		if data[name].level >= 4 or name == "Jessiewind26#2546" or name == "Zed#9431"  then
			tfm.exec.newGame(message:sub(7))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "ban") then
		if data[name].level >= 3 or name == "Jessiewind26#2546" or name == "Zed#9431" then
			if data[message:sub(5)] then
				tfm.exec.killPlayer(message:sub(5))
				data[message:sub(5)].level=-1
				tfm.exec.chatMessage(""..message:sub(5)..""..text.ban..""..name..".")
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "unban") then
		if data[name].level >= 4 or name == "Jessiewind26#2546" or name == "Zed#9431" then
			if data[message:sub(7)] then
				data[message:sub(7)].level=0
				tfm.exec.chatMessage(""..message:sub(7)..""..text.unban.."")
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "tc") then
		local typer=name
		if data[typer].team == "azul" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "azul" then
					tfm.exec.chatMessage("<font color='#0080ff'>• ["..typer.."] "..message:sub(4).."",name)
					tfm.exec.chatMessage("<font color='#0080ff'>• ["..typer.."] "..message:sub(4).."","Jessiewind26#2546")
				end
			end
		elseif data[typer].team == "vermelho" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "vermelho" then
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."",name)
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."","Jessiewind26#2546")
				end
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "reset" then
		if data[name].level >= 2 or name == "Jessiewind26#2546" or name == "Zed#9431"  then
			changeMap()
		end
	end
	if(message:sub(0,3) == "set") then
		if data[name].level >= 4 or name == "Jessiewind26#2546" or name == "Zed#9431" then
			if data[message:sub(5)] then
				set_name=message:sub(5)
				set=true
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "so") then
		if data[name].level >= 4 or name == "Jessiewind26#2546" or name == "Zed#9431" then
			select_obj=tonumber(message:sub(4))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "tt") then
		if name == caps.azul or name == caps.vermelho and valendo == true and reset == false then
			temp_name2=message:sub(4)
			if data[temp_name2] then
				ui.addPopup(1201,2,"1 = 5pts<br>2 = 10pts<br>3 = 15pts<br>4 = 20pts",name,350,225,200,true)
				tfm.exec.chatMessage(text.tag_text,name)
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "rv") then
		if name == caps.azul or name == caps.vermelho and valendo == true and reset == false then
			temp_name3=message:sub(4)
			if data[temp_name3] then
				ui.addPopup(1204,1,"Revive "..temp_name3.."?",name,350,225,200,true)
				tfm.exec.chatMessage(text.tag_text,name)
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "score") then
		if data[name].level >= 3 or name == "Jessiewind26#2546" or name == "Zed#9431" then
			temp_name=message:sub(7)
			ui.addPopup(906,2,"Score",name,350,175,200,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "help" then
		ui.addTextArea(9000,"<B><J><font size='13'><p align='center'>"..text.ajuda.."",name,100,90,600,30,nil,0x2e424d,nil,true)
		ui.addTextArea(9005,"<font size='13'><font face='Consolas'>"..text.help.."",name,150,125,500,205,0x0e232b,0x0e232b,nil,true)
		ui.addTextArea(9006,"<font size='13'><R><a href='event:closep'>Close</a>",name,300,337,190,20,0x3c5063,0x3c5063,nil,true)
	end
	if message == "cmd" then
		ui.addTextArea(9000,"<B><J><font size='13'><p align='center'>"..text.cmds.."",name,100,90,600,30,nil,0x2e424d,nil,true)
		ui.addTextArea(9005,"<font size='13'><font face='Consolas'>"..text.commands.."",name,150,125,500,200,0x0e232b,0x0e232b,nil,true)
		ui.addTextArea(9006,"<font size='13'><R><a href='event:closep'>Close</a>",name,300,334,190,20,0x3c5063,0x3c5063,nil,true)
	end
	if message == "acmd" then
		ui.addTextArea(9000,"<B><J><font size='13'><p align='center'>"..text.cmds.."",name,100,90,600,30,nil,0x2e424d,nil,true)
		ui.addTextArea(9005,"<font size='13'><font face='Consolas'>"..text.admin_commands.."",name,150,125,500,190,0x0e232b,0x0e232b,nil,true)
		ui.addTextArea(9006,"<font size='13'><R><a href='event:closep'>Close</a>",name,300,324,190,20,0x3c5063,0x3c5063,nil,true)
	end
	if message == "cap" then
		ui.addTextArea(9000,"<B><J><font size='13'><p align='center'>"..text.cmds.."",name,100,110,600,30,nil,0x2e424d,nil,true)
		ui.addTextArea(9005,"<font size='13'><font face='Consolas'>"..text.cap.."",name,150,145,500,100,0x0e232b,0x0e232b,nil,true)
		ui.addTextArea(9006,"<font size='13'><R><a href='event:closep'>Close</a>",name,300,254,160,20,0x3c5063,0x3c5063,nil,true)
	end
	if message == "powerups" then
		loadPowerups(name)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 901 then
		data[temp_name].score=tonumber(message)
		return name
	elseif id == 902 then
		data[temp_name].kills=tonumber(message)
		return name
	elseif id == 903 then
		data[temp_name].wins=tonumber(message)
		return name
	elseif id == 904 then
		data[temp_name].matchs=tonumber(message)
		return name
	elseif id == 906 then
		tfm.exec.setPlayerScore(temp_name,tonumber(message),true)
		return name
	elseif id == 1201 then
		if data[temp_name2] then
			if message == "1" then
				if tfm.get.room.playerList[name].score < 5 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,5,true)
					tfm.exec.setPlayerScore(name,-5,true)
					return name
				end
			elseif message == "2" then
				if tfm.get.room.playerList[name].score < 10 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,10,true)
					tfm.exec.setPlayerScore(name,-10,true)
					return name
				end
			elseif message == "3" then
				if tfm.get.room.playerList[name].score < 15 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,15,true)
					tfm.exec.setPlayerScore(name,-15,true)
					return name
				end
			elseif message == "4" then
				if tfm.get.room.playerList[name].score < 20 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,20,true)
					tfm.exec.setPlayerScore(name,-20,true)
					return name
				end
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	elseif id == 1204 then
		if message == "yes" then
			if data[temp_name3] then
				if tfm.get.room.playerList[name].score >= 30 then
					tfm.exec.respawnPlayer(temp_name3)
					if data[temp_name3].team == "azul" and powerups.r_azul == false then
						powerups.r_azul=true
						tfm.exec.movePlayer(temp_name3,math.random(850,1200),200,false,0,0,false)
						data[temp_name3].killed=0
					elseif data[temp_name3].team == "vermelho" and powerups.r_vermelho == false then
						powerups.r_vermelho=true
						tfm.exec.movePlayer(temp_name3,math.random(400,750),200,false,0,0,false)
						data[temp_name3].killed=0
					end
					tfm.exec.setPlayerScore(name,-30,true)
					tfm.exec.chatMessage(""..text.revivetext..""..temp_name3.."")
				else
					tfm.exec.chatMessage(text.score30,name)
				end
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		end
	end
end
function showTeams(name)
	if valendo == false then
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>You must be connected to a Transformice account to play #anvilwar.",name)
		elseif data[name].level <= -1 then
			tfm.exec.killPlayer(name)
			tfm.exec.chatMessage("<R>This account was banned of #anvilwar room.",name)
		else
			ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 300, 165, 200, 20, 0x800000, 0x600000,1.0,true)
			ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 300, 195, 200, 20, 0x80, 0x60,1.0,true)
		end
	end
end
function eventLoop(passado,faltando)
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].team == "azul" then
				if tfm.get.room.playerList[name].x < 805 then
					tfm.exec.killPlayer(name)
				end
			end 
			if data[name].team == "vermelho" then
				if tfm.get.room.playerList[name].x > 795 then
					tfm.exec.killPlayer(name)
				end
			end 
		end
	end
	if intervalo == true then
		tfm.exec.setGameTime(15)
		anvil_launched=true
		count_int=count_int-0.5
		if count_int <= 0 then
			intervalo=false
			anvil_launched=false
			count_int=20
		end
	end
	if passado > 1200 and passado < 1700 then
		for i=1,70 do
		if mapas[i] == tfm.get.room.currentMap then
			tfm.exec.chatMessage(""..text.playingmap.." <J>"..tfm.get.room.currentMap.."<BL> "..text.created.." <J>"..tfm.get.room.xmlMapInfo.author)
		end
		end
	end
	local minutos=math.floor(tempo/60)
	local segundos=math.floor((minutos*60)-tempo) * -1
	if valendo == true and tempo < 60 and tempo > 59 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds,nil)
	end
	if valendo == true and tempo < 30 and tempo > 29 then
		tfm.exec.chatMessage(text.seconds30,nil)
	end
	if valendo == true and tempo < 10 and tempo > 9 then
		tfm.exec.chatMessage(text.seconds10,nil)
	end
	if valendo == true and reset == false and intervalo == false then
		tempo=tempo-0.5
		if tempo < 0 then
			tempo=0
		end
		scoreloop=scoreloop+1
		if scoreloop >= 40 then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].killed == 0 then
					tfm.exec.setPlayerScore(name,2,true)
					data[name].score=data[name].score+1
					data[name].exp=data[name].exp+1
					if name == caps.vermelho or name == caps.azul then
						tfm.exec.setPlayerScore(name,2,true)
						data[name].score=data[name].score+1
					end
				end
			end
			scoreloop=0
		end
	end
	if anvil_launched == false and valendo == true and intervalo == false then
		ui.addTextArea(501,"<font size='40'><p align='center'>"..math.ceil(faltando/1000).."",nil,360,65,80,55,0x000001,0x000001,1.0,true)
	else
		ui.removeTextArea(501,nil)
	end
	if valendo == true and reset == false and tempo <= 0 and sudden_death == true then
		if count_vermelho > count_azul then
			tfm.exec.chatMessage(text.win_vermelho)
		elseif count_vermelho < count_azul then
			tfm.exec.chatMessage(text.win_azul)
		else
			tfm.exec.chatMessage(text.empate_text)
		end
		count_azul=0
		count_vermelho=0
		valendo=false
		reset=true
		tfm.exec.setGameTime(15)
	end
	if reset == true then
		if faltando < 1 then
			changeMap()
		end
	end
	if valendo == true and reset == false and anvil_launched == false then
		time_limit=time_limit-0.5
		if time_limit == 0 then
			anvil_launched=true
			time_limit=15
			tfm.exec.chatMessage(text.timeout)
		end
	end
	if valendo == false and reset == false and faltando < 1888 and count_azul > 0 and count_vermelho > 0 then
		for i=11,297 do
			ui.removeTextArea(i,nil)
		end
	end
	if valendo == false and reset == false and faltando <= 1 then
		if count_azul > 0 and count_vermelho > 0 then
			if count == 0 then
				for name,player in pairs(tfm.get.room.playerList) do
					tfm.exec.chatMessage(text.starting,name)
					if data[name].team == "azul" then
						data[name].matchs=data[name].matchs+1
						tfm.exec.respawnPlayer(name)
						tfm.exec.movePlayer(name,1000,180,false,0,0,false)
						table.insert(play_azul,name)
						tfm.exec.setPlayerScore(name,0,false)
					elseif data[name].team == "vermelho" then
						data[name].matchs=data[name].matchs+1
						tfm.exec.respawnPlayer(name)
						tfm.exec.movePlayer(name,600,180,false,0,0,false)
						table.insert(play_vermelho,name)
						tfm.exec.setPlayerScore(name,0,false)
					else
						tfm.exec.movePlayer(name,800,-2000,false,0,0,false)
						tfm.exec.setPlayerScore(name,-1,false)
						kills=0
					end
				end
			end
			kills=0
			count=count+0.5
			if count >= 10 then
				caps.azul=play_azul[math.random(#play_azul)]
				caps.vermelho=play_vermelho[math.random(#play_vermelho)]
				for name,player in pairs(tfm.get.room.playerList) do
					if data[name].team == "azul" then
						tfm.exec.chatMessage(""..caps.azul..""..text.caps.."",name)
					elseif data[name].team == "vermelho" then
						tfm.exec.chatMessage(""..caps.vermelho..""..text.caps.."",name)
					end
					if name == caps.azul or name == caps.vermelho then
						tfm.exec.chatMessage(text.cap_text,name)
						tfm.exec.setNameColor(name,0x8000ff)
					end
				end
				valendo=true
				players=count_azul+count_vermelho
				tempo=120+(players*6)
				for i=11,297 do
					ui.removeTextArea(i,nil)
				end
				if team == 2 then
					team=1
					if set == false then
						actual_player=play_vermelho[math.random(#play_vermelho)]
					else
						actual_player=set_name
					end
				else
					team=2
					if set == false then
						actual_player=play_azul[math.random(#play_azul)]
					else
						actual_player=set_name
					end
				end
				loop=10
				anvil_launched=false
				tfm.exec.setGameTime(15)
				time_limit=15
				if valendo == true and reset == false then
					if data[actual_player] then
						tfm.exec.chatMessage(text.your_turn,actual_player)
						tfm.exec.chatMessage("<br>"..text.points_text1..""..tfm.get.room.playerList[actual_player].score..""..text.points_text2.."",actual_player)
					end
				end
			end
		else
			tfm.exec.setGameTime(15)
		end
	end
	if valendo == true and anvil_launched == true and intervalo == false then
		loop=loop-1
		if loop == 0 then
			if kills >= 3 then
				data[actual_player].mks=data[actual_player].mks+1
			end
			if tfm.get.room.community == "br" then
				if kills == 2 then
					tfm.exec.chatMessage("<ROSE>Double Kill de "..actual_player.."!")
				elseif kills >= 3 then
					tfm.exec.chatMessage("<ROSE>Multi Kill: "..kills.." kills de "..actual_player.."!")
				end
			else
				if kills == 2 then
					tfm.exec.chatMessage("<ROSE>Double Kill of "..actual_player.."!")
				elseif kills >= 3 then
					tfm.exec.chatMessage("<ROSE>Multi Kill: "..kills.." kills of "..actual_player.."!")
				end
			end
			kills=0
			play_azul={}
			play_vermelho={}
			count_azul=0
			count_vermelho=0
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "azul" then
					if data[name].killed == 0 then
						table.insert(play_azul,name)
						count_azul=count_azul+1
					end
				end
				if data[name].team == "vermelho" then
					if data[name].killed == 0 then
						table.insert(play_vermelho,name)
						count_vermelho=count_vermelho+1
					end
				end
				if data[name].immortal == true then
					data[name].imatchs=data[name].imatchs+1
					if data[name].imatchs >= 9 then
						data[name].immortal=false
						tfm.exec.chatMessage(text.inv3,name)
						tfm.exec.setNameColor(name,0xd7d7e6)
					end
				end
			end
			if team == 2 then
				team=1
				if set == false then
					actual_player=play_vermelho[math.random(#play_vermelho)]
				else
					actual_player=set_name
				end
			else
				team=2
				if set == false then
					actual_player=play_azul[math.random(#play_azul)]
				else
					actual_player=set_name
				end
			end
			loop=8
			resetPowers()
			if valendo == true and reset == false then
				if count_azul == 0 and count_vermelho == 0 then
					tfm.exec.chatMessage(text.empate_text)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				elseif count_azul == 0 then
					winRed()
					tfm.exec.chatMessage(text.win_vermelho)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				elseif count_vermelho == 0 then
					winAzul()
					tfm.exec.chatMessage(text.win_azul)
					valendo=false
					reset=true
					tfm.exec.setGameTime(15)
				end
			end
			tfm.exec.setGameTime(15)
			time_limit=15
			if valendo == true and reset == false then
				tfm.exec.chatMessage(text.your_turn,actual_player)
				tfm.exec.chatMessage("<br>"..text.points_text1..""..tfm.get.room.playerList[actual_player].score..""..text.points_text2.."",actual_player)
			end
		end
	end
	if valendo == true and reset == false and tempo <= 0 and sudden_death == false and anvil_launched == false then
		if count_vermelho > count_azul then
			tfm.exec.chatMessage(text.win_vermelho)
			winRed()
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
		elseif count_vermelho < count_azul then
			tfm.exec.chatMessage(text.win_azul)
			winAzul()
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
		elseif count_vermelho == count_azul and count_vermelho >= 2 and count_azul >= 2 then
			tfm.exec.setGameTime(90)
			tempo=90
			tfm.exec.chatMessage(text.sudden_death)
			sudden_death=true
		elseif count_vermelho == count_azul and count_vermelho <= 1 and count_azul <= 1 then
			valendo=false
			reset=true
			tfm.exec.setGameTime(15)
			count_azul=0
			count_vermelho=0
			tfm.exec.chatMessage(text.empate_text)
		end
	end
	if powerups.bomba == true then
		if data[actual_player] then
			powerups.count=powerups.count+1
			if powerups.count == 3 then
				local x_position=0
				if data[actual_player].team == "azul" then
					x_position=math.random(100,750)
					tfm.exec.explosion(x_position,200,30,120,true)
					tfm.exec.displayParticle(12,x_position,200,0,0,0,0,nil)
				elseif data[actual_player].team == "vermelho" then
					x_position=math.random(850,1500)
					tfm.exec.explosion(x_position,200,30,120,true)
					tfm.exec.displayParticle(12,x_position,200,0,0,0,0,nil)
				end
				powerups.count=2
				powerups.bomba=false
			end
		end
	end
	if valendo == true and reset == false and faltando > 10000 then
		if data[actual_player].team == "azul" then
			ui.addTextArea(2204,"<p align='center'><font size='14'>"..text.yturn.."<b><font color='#0197f3'>"..actual_player.."",nil,200,332,400,27,0x000001,0x000001,1.0,true)
		elseif data[actual_player].team == "vermelho" then
			ui.addTextArea(2204,"<p align='center'><font size='14'>"..text.yturn.."<b><font color='#f32202'>"..actual_player.."",nil,200,332,400,27,0x000001,0x000001,1.0,true)
		end
	else
		ui.removeTextArea(2204,nil)
	end
	if valendo == true and reset == false then
		if powerups.int_vermelho >= 1 then
			ui.addTextArea(6001,"",nil,20,24,32,8,0xff0000,0x000001,1.0,true)
		else
			ui.addTextArea(6001,"",nil,20,24,32,8,0x000001,0x000001,1.0,true)
		end
		if powerups.int_vermelho >= 2 then
			ui.addTextArea(6002,"",nil,70,24,32,8,0xff0000,0x000001,1.0,true)
		else
			ui.addTextArea(6002,"",nil,70,24,32,8,0x000001,0x000001,1.0,true)
		end
		if powerups.int_azul >= 1 then
			ui.addTextArea(6003,"",nil,748,24,32,8,0xff,0x000001,1.0,true)
		else
			ui.addTextArea(6003,"",nil,748,24,32,8,0x000001,0x000001,1.0,true)
		end
		if powerups.int_azul >= 2 then
			ui.addTextArea(6004,"",nil,698,24,32,8,0xff,0x000001,1.0,true)
		else
			ui.addTextArea(6004,"",nil,698,24,32,8,0x000001,0x000001,1.0,true)
		end
		ui.addTextArea(2201,"<p align='center'><font color='#000001'><font size='35'><font face='Trebuchet MS'>"..count_vermelho.."",nil,200,24,64,48,0x990000,0xff0000,1.0,true)
		ui.addTextArea(2202,"<p align='center'><font color='#aaaaaa'><font size='35'><font face='Trebuchet MS'>"..count_azul.."",nil,536,24,64,48,0x000099,0x0000ff,1.0,true)
		if sudden_death == false then
			if segundos < 10 and tempo > 29.5 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <b>"..minutos..":0"..segundos.."</b>",nil,350,24,100,34,0x000001,0x000001,1.0,true)
			elseif segundos >= 10 and tempo > 29.5 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <b>"..minutos..":"..segundos.."</b>",nil,350,24,100,34,0x000001,0x000001,1.0,true)
			elseif segundos < 10 and tempo <= 29.5 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <font color='#ff0000'><b>"..minutos..":0"..segundos.."</b>",nil,350,24,100,34,0x000001,0x000001,1.0,true)
			elseif segundos >= 10 and tempo <= 29.5 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <font color='#ff0000'><b>"..minutos..":"..segundos.."</b>",nil,350,24,100,34,0x000001,0x000001,1.0,true)
			end
		else
			if segundos < 10 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <b>"..minutos..":0"..segundos.."</b>",nil,350,24,100,34,0x400000,0x300000,1.0,true)
			elseif segundos >= 10 then
				ui.addTextArea(14,"<p align='center'><font size='24'><font face='Segoe UI Symbol'><font face='Arial'> <b>"..minutos..":"..segundos.."</b>",nil,350,24,100,34,0x400000,0x300000,1.0,true)
			end
		end
	else
		ui.removeTextArea(14,nil)
		ui.removeTextArea(2201,nil)
		ui.removeTextArea(2202,nil)
	end
end
function eventPlayerDied(name)
	if count < 10 then
		if data[name].team == "azul" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,900,180,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,700,180,false,0,0,false)
		end
	end
	if data[name].immortal == false then
		if valendo == true and reset == false then
			tfm.exec.setPlayerScore(name,-1,false)
			tfm.exec.setPlayerScore(actual_player,2+kills,true)
			if actual_player == caps.vermelho or name == actual_player then
				tfm.exec.setPlayerScore(actual_player,1,true)
				data[actual_player].score=data[actual_player].score+1
				data[actual_player].exp=data[actual_player].exp+1
			end
			data[actual_player].kills=data[actual_player].kills+1
			data[actual_player].score=data[actual_player].score+5
			loop=loop+1
			data[name].killed=1
			kills=kills+1
			data[actual_player].exp=data[actual_player].exp+4+kills
			if kills > data[actual_player].max then
				data[actual_player].max=kills
				data[actual_player].exp=data[actual_player].exp+2*kills
			end
			if data[name].team == data[actual_player].team and anvil_launched == true then
				tfm.exec.chatMessage("<J>"..text.teamkill1..""..actual_player.." "..text.teamKill2..": <b>"..name.."</b>.")
				tfm.exec.setPlayerScore(actual_player,-2,true)
				kills=kills-2
				data[actual_player].kills=data[actual_player].kills-1
				data[actual_player].score=data[actual_player].score-15
				data[actual_player].exp=data[actual_player].exp-10
			end
		end
		if name == actual_player and valendo == true and reset == false then
			tfm.exec.chatMessage(""..text.suicide..""..actual_player.."")
			tfm.exec.setPlayerScore(actual_player,-1,false)
			data[actual_player].score=data[actual_player].score-5
			data[actual_player].exp=data[actual_player].exp-5
		end
	else
		tfm.exec.respawnPlayer(name)
		tfm.exec.setNameColor(name,0x00ff00)
		if data[name].team == "azul" then
			tfm.exec.movePlayer(name,1000,200,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.movePlayer(name,600,200,false,0,0,false)
		end
	end
	if sudden_death == true then
		if data[name].team == "azul" and data[name].immortal == false then
			winRed()
			tfm.exec.chatMessage(text.win_vermelho)
			count_azul=0
		elseif data[name].team == "vermelho" and data[name].immortal == false then
			winAzul()
			tfm.exec.chatMessage(text.win_azul)
			count_vermelho=0
		end
		valendo=false
		reset=true
		tfm.exec.setGameTime(15)
		sudden_death=false
	end
	if actual_player == name then
		anvil_launched=true
		actual_palayer=""
	end
end
function eventPlayerLeft(name)
	ratos=ratos-1
	data[name].killed=-1
	data[name].team=""
end
function showBar()
	for i=1,70 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName(""..mapas[i].." - "..tfm.get.room.xmlMapInfo.author.." - "..text.bar.."<")
			else
				ui.setMapName("“"..map_names[i].."” "..mapas[i].." - "..tfm.get.room.xmlMapInfo.author.." - "..text.bar.."<")
			end
		end
	end
end
function eventNewPlayer(name)
	showBar()
	ratos=ratos+1
	if not data[name] then
		table.insert(players_table,name)
		data[name]={wins=0,matchs=0,kills=0,max=0,score=0,mks=0,killed=-1,team="",immortal=false,imatchs=0,immortal2=false,level=0,nivel=1,exp=0,maxp=50}
	end
	showTeams(name)
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,376,70,24,0x000001,0x000001,0.75,true)
		for i=32,123 do
			tfm.exec.bindKeyboard(name,i,true,true)
			system.bindMouse(name,true)
		end
	end
	if name:sub(1,1) == "*" then
		data[name].level=-1
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventKeyboard(name,key,down,x,y)
	if anvil_launched == false then
		if actual_player == name then
			if key == 32 then
				if valendo == true then
					powerups.fly=false
					set=false
					set_name=""
					ui.removeTextArea(4003,nil)
					if powerups.objeto == true then
						if select_obj == 0 then
							if data[name].team == "azul" then
								tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,(4+power*2)*-1,-8)
							elseif data[name].team == "vermelho" then
								tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,4+power*2,-8)
							end
						else
							if data[name].team == "azul" then
								tfm.exec.addShamanObject(select_obj,x,y-60,0,(4+power*2)*-1,-8)
							elseif data[name].team == "vermelho" then
								tfm.exec.addShamanObject(select_obj,x,y-60,0,4+power*2,-8)
							end
						end
					else
					if powerups.selective == false then
						if data[name].team == "azul" then
							tfm.exec.addShamanObject(anvils[math.random(#anvils)],x,y-60,0,(4+power*2)*-1,-8)
						elseif data[name].team == "vermelho" then
							tfm.exec.addShamanObject(anvils[math.random(#anvils)],x,y-60,0,4+power*2,-8)
						end
						if powerups.double == true then
							if data[name].team == "azul" then
								tfm.exec.addShamanObject(anvils[math.random(#anvils)],x+40,y-60,0,(4+power*2)*-1,-8)
							elseif data[name].team == "vermelho" then
								tfm.exec.addShamanObject(anvils[math.random(#anvils)],x-40,y-60,0,4+power*2,-8)
							end
						end
						if powerups.triple == true then
							if data[name].team == "azul" then
								tfm.exec.addShamanObject(anvils[math.random(#anvils)],x+80,y-60,0,(4+power*2)*-1,-8)
							elseif data[name].team == "vermelho" then
								tfm.exec.addShamanObject(anvils[math.random(#anvils)],x-80,y-60,0,4+power*2,-8)
							end
						end
						powerups.multi_count=powerups.multi_count+1
						if powerups.multi_count >= 3 then
							anvil_launched=true
						end
					end
					end
					select_obj=0
					anvil_launched=true
				end
			end
			if key >= 49 and key <= 57 then
				power=key-48
				ui.addTextArea(4003,"<font size='13'><p align='center'>"..text.intensity..": "..power.."",name,320,376,160,24,0x000001,0x000001,1.0,true)
			end
			if key == 48 then
				power=10
				ui.addTextArea(4003,"<font size='13'><p align='center'>"..text.intensity..": "..power.."",name,320,376,160,24,0x000001,0x000001,1.0,true)
			end
			if key == 35 and anvil_launched == false then
				if name == caps.azul or name == caps.vermelho then
					if name == caps.azul then
						if powerups.int_azul > 0 then
							tfm.exec.chatMessage(text.blue_int_text)
							intervalo=true
							powerups.int_azul=powerups.int_azul-1			
						else
							tfm.exec.chatMessage(text.funct,name)
						end
					end
					if name == caps.vermelho then
						if powerups.int_vermelho > 0 then
							tfm.exec.chatMessage(text.red_int_text)
							intervalo=true
							powerups.int_vermelho=powerups.int_vermelho-1					
						else
							tfm.exec.chatMessage(text.funct,name)
						end
					end
				else
					tfm.exec.chatMessage(text.funct,name)
				end
			end
			if valendo == true and reset == false then
			if key == 112 then
				if tfm.get.room.playerList[name].score >= 6 and powerups.double == false and powerups.triple == false and powerups.multiple == false and powerups.objeto == false then
					if data[name].nivel >= 1 then
						powerups.double=true
						tfm.exec.setPlayerScore(name,-6,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.double.."")
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 113 then
				if tfm.get.room.playerList[name].score >= 12 and powerups.double == false and powerups.triple == false and powerups.multiple == false and powerups.objeto == false then
					if data[name].nivel >= 2 then
						powerups.double=true
						powerups.triple=true
						tfm.exec.setPlayerScore(name,-12,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.triple.."")
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 114 then
				if tfm.get.room.playerList[name].score >= 10 and powerups.bomba == false and powerups.double == false and powerups.objeto == false then
					if data[name].nivel >= 2 then
						powerups.bomba=true
						tfm.exec.setPlayerScore(name,-10,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.bomba1.."")
						tfm.exec.chatMessage(text.bomba2,name)
						anvil_launched=true
						loop=12
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 115 then
				if tfm.get.room.playerList[name].score >= 4 and powerups.objeto == false and powerups.double == false and powerups.triple == false then
					if data[name].nivel >= 2 then
						powerups.objeto=true
						tfm.exec.setPlayerScore(name,-4,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.objeto1.."")
						tfm.exec.chatMessage(text.objeto2,name)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 116 then
				if tfm.get.room.playerList[name].score >= 18 and powerups.explosion == false and powerups.bomba == false and powerups.double == false and powerups.objeto == false then
					if data[name].nivel >= 4 then
						powerups.explosion=true
						tfm.exec.setPlayerScore(name,-18,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.exp1.."")
						tfm.exec.chatMessage(text.exp2,name)
						anvil_launched=true
						loop=12
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 117 then
				if tfm.get.room.playerList[name].score >= 10 then
					if data[name].nivel >= 3 then
						tfm.exec.setPlayerScore(name,-10,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.fly1.."")
						tfm.exec.chatMessage(text.fly2,name)
						tfm.exec.changePlayerSize(actual_player,0.5)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 118 then
				if tfm.get.room.playerList[name].score >= 24 and data[name].immortal2 == false then
					if data[name].nivel >= 5 then
						data[name].immortal=true
						data[name].immortal2=true
						tfm.exec.setNameColor(name, 0x00ff00)
						tfm.exec.setPlayerScore(name,-20,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.inv1.."")
						tfm.exec.chatMessage(text.inv2,name)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			end
		end
	end
end
function eventMouse(name,x,y)
	if powerups.explosion == true and actual_player == name then
		tfm.exec.explosion(x,y,30,120,true)
		tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
		powerups.explosion=false
	end
end
function eventNewGame()
	advanceLevel()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Confiram os sub-modos disponíveis da sala #anvilwar:<br><br>/sala #anvilwar0true_false = Verdadeiro ou Falso<br>/sala #anvilwar0mestre = Mestre Mandou<br>/sala #anvilwar0pistas = Jogo das 3 Pistas<br>/sala #anvilwar0objects = Objects<br><br><VP>As avaliações de mapas estão abertas!<br>https://atelier801.com/topic?f=816221&t=924786<br>")
	end
	ui.removeTextArea(501,nil)
	for i=11,297 do
		ui.removeTextArea(i,nil)
	end
	sudden_death=false
	for i=6001,6004 do
		ui.removeTextArea(i,nil)
	end
	time_limit=15
	reset=false
	count_azul=0
	count_vermelho=0
	tempo=0
	power=5
	count=0
	powerups.int_azul=2
	powerups.int_vermelho=2
	kills=0
	play_azul={}
	play_vermelho={}
	valendo=false
	loop=8
	resetPowers()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			tfm.exec.changePlayerSize(name,1)
			data[name].killed=-1
			data[name].team=""
			data[name].immortal=false
			data[name].immortal2=false
			data[name].imatchs=0
			data[name].skip=0
			tfm.exec.setNameColor(name,0xd7d7e6)
			giveCargos(name,data[name].level)
			for i=32,123 do
				tfm.exec.bindKeyboard(name,i,true,true)
			end
			showTeams(name)
			for id,name in pairs(avs_list) do
				if data[name] then
					giveCargos(name,2)
				end
			end
			for id,name in pairs(mods_list) do
				if data[name] then
					giveCargos(name,3)
				end
			end
			for id,name in pairs(managers_list) do
				if data[name] then
					giveCargos(name,4)
				end
			end
			for id,name in pairs(level6_list) do
				if data[name] then
					giveCargos(name,5)
				end
			end
			for id,name in pairs(admins_list) do
				if data[name] then
					giveCargos(name,6)
				end
			end
		end
	end
	tfm.exec.setGameTime(30)
	showBar()
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,376,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,text.menu_bar,name,200,345,400,20,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,376,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "ranking" then
		eventChatCommand(name,"rank")
	end
	if callback == "cap" then
		eventChatCommand(name,"cap")
	end
	if callback == "cmd" then
		eventChatCommand(name,"cmd")
	end
	if callback == "powerups" then
		loadPowerups(name)
	end
	if callback == "power1" then
		tfm.exec.chatMessage(text.double2,name)
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "power2" then
		tfm.exec.chatMessage(text.triple2,name)
	end
	if callback == "power3" then
		tfm.exec.chatMessage(text.bomba2,name)
	end
	if callback == "power4" then
		tfm.exec.chatMessage(text.objeto2,name)
	end
	if callback == "power5" then
		tfm.exec.chatMessage(text.exp2,name)
	end
	if callback == "power6" then
		tfm.exec.chatMessage(text.chuva2,name)
	end
	if callback == "power7" then
		tfm.exec.chatMessage(text.inv2,name)
	end
	if callback == "profile" then
		tfm.exec.chatMessage(text.profile,name)
	end
	if callback == "fechar" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
		end
	end
	if callback == "close" then
		for id=8000,8010 do
			ui.removeTextArea(id,name)
			ui.removeTextArea(6969+id,name)
			ui.removeTextArea(7979+id,name)
		end
	end
	if callback == "closep" then
		for id=9000,9010 do
			ui.removeTextArea(id,name)
		end
	end
	if callback == "enter_vermelho" then
		if data[name].killed == -1 and data[name].team == "" then
			data[name].team="vermelho"
			data[name].killed=0
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,700,180,false,0,0,false)
			count_vermelho=count_vermelho+1
			ui.removeTextArea(41,name)
			ui.removeTextArea(42,name)
			ui.addTextArea(51,"<p align='center'><a href='event:sair_vermelho'>"..text.exit.."",name,300,180,200,20,0x505050,0x323232,1.0,true)
		end
	end
	if callback == "enter_azul" then
		if data[name].killed == -1 and data[name].team == "" then
			data[name].team="azul"
			data[name].killed=0
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,900,180,false,0,0,false)
			count_azul=count_azul+1
			ui.removeTextArea(41,name)
			ui.removeTextArea(42,name)
			ui.addTextArea(52,"<p align='center'><a href='event:sair_azul'>"..text.exit.."",name,300,180,200,20,0x505050,0x323232,1.0,true)
		end
	end
	if callback == "sair_azul" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_azul=count_azul-1
		ui.removeTextArea(52,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>", name, 300, 165, 200, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>", name, 300, 195, 200, 20, 0x80, 0x60,1.0,true)
	end
	if callback == "sair_vermelho" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_vermelho=count_vermelho-1
		ui.removeTextArea(51,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>", name, 300, 165, 200, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>", name, 300, 195, 200, 20, 0x80, 0x60,1.0,true)
	end
end
function winRed()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].team == "vermelho" then
			data[name].exp=data[name].exp+20
			data[name].wins=data[name].wins+1
			data[name].score=data[name].score+15
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,math.random(225,775),170,false,0,0,false)
			tfm.exec.playEmote(name,0)
			for i=6001,6004 do
				ui.removeTextArea(i,nil)
			end
		end
	end
	advanceLevel()
end
function winAzul()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name].team == "azul" then
			data[name].exp=data[name].exp+20
			data[name].wins=data[name].wins+1
			data[name].score=data[name].score+15
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,math.random(825,1375),170,false,0,0,false)
			tfm.exec.playEmote(name,0)
			for i=6001,6004 do
				ui.removeTextArea(i,nil)
			end
		end
	end
	advanceLevel()
end
function advanceLevel()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			if data[name].exp >= data[name].maxp then
				data[name].exp=data[name].exp-data[name].maxp
				data[name].maxp=data[name].maxp+50
				data[name].nivel=data[name].nivel+1
				tfm.exec.chatMessage(""..text.advanced..""..data[name].nivel.."!",name)
			end
		end
	end
end
function giveCargos(name,type)
	if type == 2 and data[name] then
		data[name].level=2
		tfm.exec.setNameColor(name,0x0076FF)
	elseif type == 3 and data[name] then
		data[name].level=3
		tfm.exec.setNameColor(name,0xFFFB00)
	elseif type == 4 and data[name] then
		data[name].level=4
		tfm.exec.setNameColor(name,0xFF7100)
	elseif type == 5 and data[name] then
		data[name].level=5
	elseif type == 6 and data[name] then
		data[name].level=6
		tfm.exec.setNameColor(name,0xFF0000)
	end
end
end
initTrue = function()
for _,f in next,{"AutoScore","AutoNewGame","AutoTimeLeft","AllShamanSkills","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(25)
t=false;
f=false;
tempa=20	
ratos=0
loop=0
temp2=3
resposta="0"
players={}
votos=0
rcount=0
vivo=0;
min1=0
seg1=0
seg2=0
lt=0
segundos=0
lock=false;
pergunta=""
shaman=""
lock=false
minutos=6;
modo="desativado"
for _,f in next,{"admin77","admin78","limite","return","kill","kazarina","modo"} do
	system.disableChatCommandDisplay(f)
end
mapa="@7417328"
mapa2="@7345757"
mod=0
lang = {}

lang.br = {
  textFalse = "A resposta era FALSO!",
  textTrue = "A resposta era VERDADEIRO!",
  textRandom = "Um shaman aleatório foi escolhido.",
  textSkip = "O shaman passou a vez.",
  textPergunta = "Insira a sua pergunta:<br><br>NÃO USE SÍMBOLOS ESPECIAIS NA PERGUNTA!",
  textTime = "Tempo esgotado!",
  textNothingWins = "Ninguém venceu esta partida. :(",
  textWinner = " venceu a partida!",
  textNothing = "Não tivemos vencedor nessa partida.",
  textTimeOut = "O tempo da partida acabou! Outro shaman será escolhido.",
  textTimeLeave = "Tempo esgotado! Outro shaman será escolhido.",
  textTrueFalse = "Envie SIM se a resposta for verdadeira ou NÃO se a resposta for falsa.",
  textEnter = "<b>Bem-vindo ao module True or False!</b><br><BL>Para maiores informações sobre o jogo, digite !help.<br><br><VP>Atualização RTM 1.138:<br>- Correção de pequenos bugs",
  textHelp = "<J>Quando o shaman fizer uma pergunta, você deverá ir no campo TRUE se a resposta for verdadeira ou no campo FALSE se a resposta for falsa. Aqueles que errarem serão eliminados da partida. O processo continua até que sobre um vencedor, que será o novo shaman.<br>Se você for o shaman, digite !per para fazer uma pergunta.<br><br>- Script desenvolvido atualmente por Forzaldenon#0000.",
  textGotShaman = "<J>Você é o shaman. Digite <b>!per</b> para fazer uma pergunta.<br>Você tem 1 minuto para fazer sua pergunta, ou outro shaman entrará em seu lugar.<br><br>Digite <b>!skip</b> para pular sua vez de shaman.",
  textLowTime = "O tempo da partida está acabando.",
  mices = "São necessários pelo menos 3 jogadores para jogar True or False",
  textLongQuestion = "Sua pergunta é muito longa. Tente usar uma pergunta menor.",
  textShortQuestion = "Sua pergunta é muito curta ou não é permitida.",
  textCmd = "<VP>Comandos do jogo:<br><br>!per = faz uma pergunta (quando você é shaman)<br>!skip = pula a sua vez (quando você é shaman)",
  textLt = "<J>Use o comando /ban [nome] para reportar alguém que esteja infrigindo as regras da sala.",
}
lang.en = {
  textFalse = "The answer was FALSE!",
  textTrue = "The answer was TRUE!",
  textRandom = "A random shaman has been choosed.",
  textSkip = "The shaman skipped your turn.",
  textPergunta = "Type your question here:",
  textTime = "Time is up!",
  textNothingWins = "Nothing wins the game. :(",
  textWinner = " wons the game!",
  textNothing = "Aren't winners on this game.",
  textTimeOut = "The game time is gone! Other shaman has been choosed.",
  textTimeLeave = "Time is up! Other shaman has been choosed.",
  textTrueFalse = "Send YES if the answer is TRUE or send NO if the answer is FALSE.",
  textEnter = "<b>Welcome to module True or False!</b><br><V>For more information of the game, type !help.<br><br><VP>Update RTM 1.138:<br>- Small bug corrections",
  textHelp = "<J>When the shaman make the question, You must go to the TRUE side if the answer is true or go to the FALSE side if the answer is false. If you err the answer, you will be eliminated of the game. The process continue until someone win the game, which will be the new shaman.<br>If you are the shaman, type !per to make a question.<br><br>Suggestions and problems report to Forzaldenon#0000.",
  textGotShaman = "<J>You are the shaman. Type <b>!per</b> to make a question.<br>You have 1 minute to make the question, or other shaman will enter in your place.<br><br>Type <b>!skip</b> to skip your shaman turn.",
  textLowTime = "The match time is ending.",
  mices = "Are needed at least 3 players to play True or False.",
  textLongQuestion = "Your question is very long. Try to use a short question.",
  textShortQuestion = "Your question is very short or isn't allowed.",
  textCmd = "<VP>Game commands:<br><br>!per = make a question (only for shaman)<br>!skip = skip your shaman turn (only for shaman)",
  textLt = ""
}
if tfm.get.room.community == "br" then
	text = lang.br
else
	text = lang.en
end
function obterJogadores()
	players={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(players,name)
	end
	end
end
function eventNewPlayer(name)
	ratos=ratos+1;
	tfm.exec.chatMessage("<J>"..text.textEnter.."",name)
	obterJogadores()
end
for name,player in pairs(tfm.get.room.playerList) do
	tfm.exec.setPlayerScore(name,0,false)
	eventNewPlayer(name)
end
function eventPlayerLeft(name)
	ratos=ratos-1;
	obterJogadores()
end
function eventChatCommand(name,message)
	if tfm.get.room.currentMap == "@7417328" or tfm.get.room.currentMap == "@7345757" then
	if message == "f5" then
		if name == "Forzaldenon#0000" then
			t=true;
			tfm.exec.chatMessage("<R>"..text.textFalse.."",nil)
			modo="desativado" end
	elseif message == "skip" then
		if tfm.get.room.playerList[name].isShaman then
			obterJogadores()
			tfm.exec.chatMessage("<R>"..text.textSkip.."",nil)
			eventChatCommand("Forzaldenon#0000","admin77") end			
	elseif message == "v5" then
		if name == "Forzaldenon#0000" then
			f=true;
			tfm.exec.chatMessage("<VP>"..text.textTrue.."",nil)
			modo="desativado" end
	elseif message == "per" then
		if tfm.get.room.playerList[name].isShaman then
			if modo == "desativado" then
				ui.removeTextArea(27,nil)
				ui.addPopup(1,2,""..text.textPergunta.."",name,250,125,350,true)
			end
		end
	elseif message == "admin77" then
		if modo == "desativado" then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			changeMap()
			tfm.exec.setShaman(message:sub(50))
		end end
	elseif message == "return" then
		if modo == "pergunta" then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			tempa=20
			temp2=3
			modo="desativado"
			tfm.exec.setGameTime(63)
			ui.removeTextArea(27,nil)
			pergunta=""
			resposta="0"
			rcount=rcount+1
			tfm.exec.chatMessage("This question has been cancelled",nil)
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.movePlayer(name,400,1,false,1,1,false)
			end
			if rcount == 3 then
				eventChatCommand("Forzaldenon#0000","admin77")
				rcount=0
			end
		end end
	elseif(message:sub(1,7) == "admin78") then
		if modo == "desativado" then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			tfm.exec.setPlayerScore(message:sub(9),8001,false)
			changeMap()
		end end
	elseif(message:sub(0,4) == "kill") then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			tfm.exec.killPlayer(message:sub(6))
		end
	elseif(message:sub(0,6) == "limite") then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			minutos=tonumber(message:sub(8))
			if minutos > 15 then
				tfm.exec.chatMessage("Time limit: 15 minutes.",nil)
				minutos=15
			else
				tfm.exec.chatMessage("Time limit: "..minutos.." minutes.",nil)
			end
		end
	elseif(message:sub(0,8) == "kazarina") then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			local texto=message:sub(10)
			if not tfm.get.room.currentMap == "@7345757" then
				tfm.exec.chatMessage("<J><b>• [Kazarina] </b>"..texto.."")
			else
				tfm.exec.chatMessage("<font color='#00ffff'><b>• [Lissandra] </b>"..texto.."")
			end
		end
	elseif message == "modo" then
		if name == "Forzaldenon#0000" or name == "Dhanny_mheyran#6701" then
			if mod == 0 then
				mod=1
			else
				mod=0
			end
		end
	elseif message == "help" then
		tfm.exec.chatMessage("<N>"..text.textHelp.."",name)
	elseif message == "cmd" then
		tfm.exec.chatMessage("<N>"..text.textCmd.."",name)
	end
	end
end
function eventNewGame()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Confiram os sub-modos disponíveis da sala #anvilwar:<br><br>/sala #anvilwar0true_false = Verdadeiro ou Falso<br>/sala #anvilwar0mestre = Mestre Mandou<br>/sala #anvilwar0pistas = Jogo das 3 Pistas<br>/sala #anvilwar0objects = Objects<br><br>")
	end
	if mod == 1 then
		tfm.exec.snow(800,800)
	else
		tfm.exec.snow(0,0)
	end
	ui.removeTextArea(27,nil)
	tfm.exec.setGameTime(63)
	vivo=0;
	modo="desativado"
	tempa=19
	votos=0;
	t=false;
	f=false;
	segundos=0;
	min1=0
	rcount=0
	min3=0
	seg1=0
	seg2=0
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play True or False.",name)
		end
		vivo=vivo+1
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-2,false)
			vivo=vivo-1
		end
	end
	obterJogadores()
end
function eventSummoningEnd(name,type,x,y,angle,vx,vy,obj)
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.chatMessage("<ROSE>Isn't allowed the use of shaman objects in this module.",nil)
			eventChatCommand("Forzaldenon#0000","admin77")
		end
	end
end
function eventLoop(pass,tempo)
	local pass2=tempo/1000
	lt=lt+1
	if lt >= 1200 then
		if tfm.get.room.community == "br" then
			tfm.exec.chatMessage("<R>"..text.textLt.."",nil)
			lt=0
		end
	end
	if tfm.get.room.currentMap == "@7277839" then
		tfm.exec.setGameTime(63)
	end
	if lock == true then
		tfm.exec.setGameTime(tempo/950)
	end
	loop=loop+0.5
	if pass >= 3000 and pass <= 179995 then
		if ratos < 3 then
			if tfm.get.room.currentMap == "@7417328" or tfm.get.room.currentMap == "@7345757" then
				tfm.exec.newGame("@7277839")
				tfm.exec.chatMessage("<R>"..text.mices.."",nil)
			end
		end
	end
	if ratos >= 3 then
		if tfm.get.room.currentMap == "@7277839" then
			changeMap()
		end
	end
	if loop == 1 then
		segundos=segundos+1
		seg2=seg2+1
		loop=0
	if seg2 >= 10 then
		seg2=0
		seg1=seg1+1
		if seg1 >= 6 then
			min1=min1+1
			seg1=0
			seg2=0
			end
			if min1 >= minutos then
				for name,player in pairs(tfm.get.room.playerList) do
					if tfm.get.room.playerList[name].isShaman then
						ui.addPopup(1,0,""..text.textTime.."",name,350,175,200,true)
						ui.addPopup(2,0,""..text.textTime.."",name,350,175,200,true)
					end
				end
				tfm.exec.chatMessage("<R>"..text.textTimeOut.."",nil)
				eventChatCommand("Forzaldenon#0000","admin77")
			end
		end
	end
	tfm.exec.setUIMapName("True or False - RTM 1.138")
	if modo == "pergunta" then
		tempa=tempa-0.5
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			if tfm.get.room.currentMap == "@7417328" or tfm.get.room.currentMap == "@7345757" then
				if pass > 450 and pass < 1050 then
					tfm.exec.chatMessage("<VP>"..text.textGotShaman.."",name)
					tfm.exec.setPlayerScore(name,-2,false)
				end
			end
		end
	end
	if tempa < 0.1 then
		modo="resposta"
		tempa=0
		for pn, p in pairs(tfm.get.room.playerList) do
			if p.y <= 220 then
				tfm.exec.killPlayer(pn)
			end
		end
	end
	if f == true then
		for pn, p in pairs(tfm.get.room.playerList) do
			if p.x >= 405 then
				tfm.exec.killPlayer(pn)
				modo="desativado"
			end
		end
		f=false;
	end
	if t == true then
		for pn, p in pairs(tfm.get.room.playerList) do
			if p.x <= 395 then
				tfm.exec.killPlayer(pn)
				modo="desativado"
			end
		end
		t=false;
	end
	if modo == "resposta" then
		tfm.exec.setGameTime(63)
		temp2=temp2-0.5
		if temp2 == 1 then
			modo="desativado"
			if resposta == "yes" then
				eventChatCommand("Forzaldenon#0000","v5")
			else
				eventChatCommand("Forzaldenon#0000","f5")
			end
			tempa=19
			temp2=3
			pergunta=""
			ui.removeTextArea(27,nil)
		end
	end
	if modo == "desativado" then
	if tempo < 60000 and tempo > 59400 then
		if pass > 10000 then
			for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
			end
		end
		end
	end
	if tfm.get.room.currentMap == "@7417328" or tfm.get.room.currentMap == "@7345757" then
	if vivo == 1 then
		if tempo < 59000 then
			tfm.exec.setPlayerScore(shaman,8000,false)
			changeMap()
		end
	end
	if vivo <= 0 then
		tfm.exec.setGameTime(5)
		obterJogadores()
		changeMap()
		tfm.exec.chatMessage("<R>"..text.textNothing.."",nil)
	end
	if tempo < 500 then
		tfm.exec.setPlayerScore(players[math.random(#players)],1,true)
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].isShaman then
				ui.addPopup(1,0,""..text.textTime.."",name,350,175,200,true)
				ui.addPopup(2,0,""..text.textTime.."",name,350,175,200,true)
			end
		end
		tfm.exec.chatMessage("<R>"..text.textTimeLeave.."",nil)
		changeMap()
	end
	end
	end
	if modo == "troca" then
		obterJogadores()
		if tempo < 100 then
			changeMap()
		end
	end
	if vivo == 0 then
		shaman=""
	end
end
function eventPopupAnswer(id,name,answer)
	if id == 1 then
		if tfm.get.room.playerList[name].isShaman then
			if tfm.get.room.currentMap == "@7417328" or tfm.get.room.currentMap == "@7345757" then
				if string.len(answer) >= 230 then
					tfm.exec.chatMessage(""..text.textLongQuestion.."",name)
				elseif string.len(answer) <= 10 then
					tfm.exec.chatMessage(""..text.textShortQuestion.."",name)
				else
					pergunta=answer
					pcall(ui.addPopup(2,1,""..text.textTrueFalse.."",name,350,175,200,true))
				end
			end
		end
	end
	if id == 2 then
		resposta=tostring(answer)
		modo="pergunta"
		ui.addTextArea(27,"<font size='15'><font face='Segoe UI'><p align='center'><font color='#020202'>"..string.gsub(pergunta,"<"," ").."",nil,32,338,720,50,0,0,1.0,true)
		tfm.exec.chatMessage("<CH>"..string.gsub(pergunta,"<"," ").."",nil)
		tfm.exec.chatMessage("<BL>"..answer.."","Forzaldenon#0000")
		tfm.exec.setGameTime(20)
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.movePlayer(name,400,102,false,1,1,false)
			if tfm.get.room.playerList[name].isShaman then
				tfm.exec.movePlayer(name,400,885,false,1,1,false)
			end
		end
	end
end
function eventPlayerDied(name)
	if not tfm.get.room.playerList[name].isShaman then
		vivo=vivo-1
	end
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		-- não faça nada
	elseif i==1 then
		shaman=n;
	end
end
function changeMap()
	if mod == 0 then
		tfm.exec.newGame(mapa)
	elseif mod == 1 then
		tfm.exec.newGame(mapa2)
	end
end
changeMap()
end

initMestre = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(40)
mapas={6788085,6788183,6789853,6791944,6792470,6808957,6810292,6821950,6830799,6866406,6866549,6788693,6788728,6859175,6834529,6866437,6812488,6876638,6876563,6885971,6888512,6893463,6900149,6907177,6892608,6982387,5328362,5957905,7055459,7290270,7290275,7404106,7404327,7382263,7394517,7405103,7400694,7400678,7412412,7412422,7431981,7354947,7525277}
active=0 -- códigos active: -2 = número de ratos insuficiente, -1 = partida encerrada, 0 = partida não iniciada ou intervalo e 1 ou mais = comandos operando
vivo=0 -- número de ratos vivos
rato=0 -- número de ratos na sala
dificuldade=1 -- dificuldade da partida (alterada automaticamente)
rodadas=0 -- o limite de rodadas das partidas é calculado automaticamente
string="" -- variável usada no comando 33
rodada=0 -- número da rodada atual, não altere
number=0 -- variável usada no comando 11
xpos=0 -- variável usada nos comandos 21, 22 e 23
ypos=0 -- variável usada nos comandos 24 e 25
data={} -- variável que define os dados dos jogadores
lang={} -- não alterar, variável que define a linguagem dos textos
pergunta="Interval"
tempo=10
resposta=""
unlocked=true -- bloqueia ou desbloqueia a execução do script
for _,f in next,{"help","mapa","reset","run","limite","q","time"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N>Bem-vindo a sala Mestre Mandou! Nesta sala seu objetivo é fazer tudo o que o script mandar.<ROSE><br><VP>Script criado por Jessiewind26#2546 - Versão RTM Compilação 37<br><br>Agora você pode jogar Mestre Mandou no cafofo de sua tribo!<br>Link do script: https://pastebin.com/raw/ZFn0rNPz",
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
	preesquerda200 = "Pressione 200 vezes a tecla para ESQUERDA!",
	predireita200 = "Pressione 200 vezes a tecla para DIREITA!",
	espaco = "Pressione a barra de espaço 20 vezes!",
	nome = "Digite o seu nome no jogo (com #número).",
	ndance = "Não dance!",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	mices = "Esta sala requer pelo menos 4 ratos.",
	difficulty = "Dificuldade",
	creator = "Module criado por Jessiewind26#2546",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por"
}
lang.en = {
	welcome = "<N>Welcome to script Master Says! On this module you have to do everything that the master says.<ROSE><br><VP>Module created by Jessiewind26#2546 - Version RTM Compilation 37<br><br>Now you can play Master Says on your tribehouse!<br>Link of the script: https://pastebin.com/raw/ZFn0rNPz",
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
	preesquerda200 = "Press 200 times the LEFT key!",
	predireita200 = "Press 200 times the RIGHT key!",
	espaco = "Press 20 times the SPACEBAR!",
	nome = "Type your nickname (with #number)!",
	ndance = "Don't dance!",
	mestre = "Master Says",
	map = "Map",
	time = "Time",
	mice = "Mice",
	round = "Round",
	mices = "This room requires at least 4 players.",
	difficulty = "Difficulty",
	creator = "Module created by Jessiewind26#2546",
	segundos = "seconds.",
	fim = "End of match! The next match will start on ",
	playingmap = "Playing map",
	created = "created by"
}
lang.ar = {
welcome = "<N>مرحبآ في نمط الرئيس! في هذا النمط يجب عليك فعل كل مايقوله الرئيس . <ROSE><br>لو أردت المساعدة قم بِكتابة الامر !help<br><VP>تم صنع النمط عن طريق Jessiewind26#2546 - الإصدار RTM Compilation37<br><br>Now you can play Master Says on your tribehouse!<br>Link of the script: https://pastebin.com/raw/ZFn0rNPz",
dancar = "أرقص!",
sentar = "إجلس!",
confetar = "قُم برمي 5 أوراق!",
mouse = "قم بالضغط على الشاشة 10 مرات!",
beijos = "قم بالتقبيل 10 مرات!",
dormir = "إنهم يشعرون بالنعاس، نام لتستريح!",
raiva = "تايغرونيت شرير! قم بالغَضبِ مِنه!",
chorem = "لم تلتقط أي قطعة من الجبن، إبكي!",
esquerda = "لا تذهب لليسار!",
direita = "لا تذهب لليَمين!",
numero = "أكتب هذا الرقم : ",
digitar = "أكتب اي شيء وأرسله لي",
falar = "لا تتكلم أو تقل أي شيء!",
pular = "لا تقفز!",
mexer = "لا تتَحرك!",
bandeira = "إرفع علم أي دولة!",
ano = "في أي عام نحن؟",
vesquerda = "إبقى مواجهآ للإتجاه الأيسر",
vdireita = "إبقى مواجهآ للإتجاه الأيمن!",
quadradov = "Stay on the red square!",
quadrado = "إبقى في المربع الأبيض",
retangulo = "إبقى في المستطيل الأبيض",
retangulov = "Stay on the red rectangle!",
nretangulo = "لا تبقى في المستطيل الأبيض!",
preesquerda30 = "إضغط 30 مرة على زر السهم الأيسر",
predireita30 = "إضغط 30 مرة على زر السهم الأيمن",
preesquerda60 = "إضغط 60 مرة على زر السهم الأيسر",
predireita60 = "إضغط 60 مرة على زر السهم الأيمن",
preesquerda200 = "إضغط 200 مرة على زر السهم الأيسر",
predireita200 = "إضغط 200 مرة على زر السهم الأيمن",
espaco = "إضغط 20 مرة على زر المسافة",
nome = "إكتب إسمك (مع رقم الهاشتاج #)ـ",
abracar = "أعطِ حُضن لأي فأر!",
beijar = "قُم بتقبيل اي فأر",
ndance = "لا ترقص!",
mestre = "الرئيس يقول",
map = "خريطة",
time = "الوقت",
mice = "الفئران",
round = "الجولة",
mices = "هذه الغرفة تتطلب على الأقل 4 أشخاص.",
difficulty = "الصعوبة",
creator = "صُنع النمط عن طريق اللاعب : Jessiewind26#2546",
segundos = "ثوانٍ",
fim = "إنتهت الجولة، الجولة الجديدة سوف تَبدأ قريبًا! ",
playingmap = "Playing map",
created = "created by"
}
lang.es = {
welcome = "<N> Bienvenido al módulo ¡Simón dice! En este módulo tienes que hacer todo lo que dice simón. <ROSE> <br> <VP> Módulo creado por Jessiewind26#2546 - Versión RTM Compilation 37<br><br>Now you can play Master Says on your tribehouse!<br>Link of the script: https://pastebin.com/raw/ZFn0rNPz",
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
preesquerda200 = "Presione 200 veces la tecla IZQUIERDA!",
predireita200 = "Presione 200 veces la tecla DERECHA!",
espaco = "Presione 20 veces la barra espaciadora!",
nome = "Escribe tu apodo (con #numero incluido)",
ndance = "¡No bailes!",
mestre = "Simón dice",
map = "Mapa",
time = "Hora",
mice = "Ratones",
round = "Redondo",
mices = "Esta sala requiere al menos 4 jugadores",
difficulty = "Dificultad",
creator = "Módulo creado por Jessiewind26#2546",
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
		tfm.exec.chatMessage("<J>Confiram os sub-modos disponíveis da sala #anvilwar:<br><br>/sala #anvilwar0true_false = Verdadeiro ou Falso<br>/sala #anvilwar0mestre = Mestre Mandou<br>/sala #anvilwar0pistas = Jogo das 3 Pistas<br>/sala #anvilwar0objects = Objects<br><br>")
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
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Os envios de mapas para o module #mestre estão liberados!<br><b>https://atelier801.com/topic?f=796133&t=915772&p=1#m8</b>")
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
	if name == "Jessiewind26#2546" or name == "Varusofeyzan#0000" then
		if(message:sub(0,3) == "run") then
				active=tonumber(message:sub(5))
				getCommand()
		end
	end
	if name == "Jessiewind26#2546" or name == "Varusofeyzan#0000" then
		if(message:sub(0,1) == "q") then
			pergunta=message:sub(3)
		end
	end
	if name == "Jessiewind26#2546" or name == "Varusofeyzan#0000" then
		if(message:sub(0,4) == "mapa") then
			tfm.exec.newGame(message:sub(6))
			active=0
		end
	end
	if name == "Jessiewind26#2546" or name == "Varusofeyzan#0000" then
		if message == "reset" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			active=0
		end
	end
	if name == "Jessiewind26#2546" or name == "Varusofeyzan#0000" then
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
			data[name].c=1 -- isto indica que todos permanecerão vivos
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
		number=math.random(1000000,9999999)
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.numero..""..number.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(10)
	end
	if active == 12 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.digitar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 13 then
		number=math.random(100000000,999999999)
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.numero..""..number.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(11)
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
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadrado.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
	end
	if active == 22 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 23 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nretangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 24 then
		ypos=math.random(40,300) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 25 then
		ypos=math.random(40,300) -- calcula aleatoriamente a posição do retângulo branco
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
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..pergunta.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(tempo)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 34 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		local xpos2=math.random(60,650) -- calcula aleatoriamente a posição do quadrado vermelho
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadrado.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		local xpos2=math.random(60,650) -- calcula aleatoriamente a posição do quadrado vermelho
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadradov.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 36 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		local xpos2=math.random(60,650) -- calcula aleatoriamente a posição do quadrado vermelho
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 37 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		local xpos2=math.random(60,650) -- calcula aleatoriamente a posição do quadrado vermelho
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulov.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 38 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.preesquerda200.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(18)
	end
	if active == 39 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.predireita200.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(18)
	end
	if active == 40 then
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
	if active == 34 then
		if id == 37 or id == 65 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 200 then
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
	if active == 35 then
		if id == 39 or id == 68 then
			if data[name].key == 0 then
				data[name].key=id
			end
			data[name].s=data[name].s+1
			if data[name].s >= 200 then
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
	if rato < 4 then
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
	if rato >= 4 then
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
		if rodada == 4 or rodada == 6 or rodada == 8 or rodada == 10 then
			dificuldade=dificuldade+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].key=0
			if data[name].c == 0 then
				tfm.exec.killPlayer(name)
			end
		end
		if vivo > 4 then
			tfm.exec.setGameTime(6-dificuldade)
		else
			tfm.exec.setGameTime(9-dificuldade)
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
system.disableChatCommandDisplay("ratos")
system.disableChatCommandDisplay("skip")
system.disableChatCommandDisplay("shaman")
system.disableChatCommandDisplay("limite")
mapa="@4677521" -- Variável usada para armazenar o mapa do module
lang = {}
lang.br = {
	welcome = "<J>Bem-vindo ao module do Jogo das 3 Pistas! Não sabe como jogar? Digite !help.<br><br>Script criado por Jessiewind26#2546. Créditos adicionais a Hecarimjhenx#0000 e Miss_fortune#9548",
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
	cancelled = "<R>Rodada cancelada! O shaman falou a resposta.",
	responder = "<ROSE>Podem responder agora!"
}
lang.en = {
	welcome = "<J>Welcome to 3 Tips Game! If you want help, type !help.<br><br>Script made by Jessiewind26#2546. Credits to Hecarimjhenx#0000 and Miss_fortune#9548",
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
	cancelled = "<R>The shaman typed the answer! The question will be cancelled.",
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
	ui.setMapName("<J>"..text.module.."   <G>|   <N>Question : <V>"..pergunta.."/"..limite.."   <G>|   <N>Time : <V>"..tempo.."s   <G>|   <N>Compilation RTM 10<")
end
function eventChatCommand(name,message)
	if message == "skip" then
		if name == "Jessiewind26#2546" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			tfm.exec.chatMessage(text.cancel,nil)
			tfm.exec.newGame(mapa)
		end
	end
	if(message:sub(1,6) == "limite") then
		if name == "Jessiewind26#2546" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			limite=tonumber(message:sub(8))
		end
	end
	if(message:sub(1,5) == "ratos") then
		if name == "Jessiewind26#2546" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			tfm.exec.setRoomMaxPlayers(message:sub(7))
		end
	end
	if(message:sub(1,6) == "shaman") then
		if name == "Jessiewind26#2546" or name == "Spectra_phantom#6089" or name == "Miss_fortune#9548"  then
			tfm.exec.setPlayerScore(message:sub(8),9999,false)
			tfm.exec.newGame(mapa)
		end
	end
	if message == "help" then
		tfm.exec.chatMessage(text.help,name)
	end
end
function eventNewGame()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Confiram os sub-modos disponíveis da sala #anvilwar:<br><br>/sala #anvilwar0true_false = Verdadeiro ou Falso<br>/sala #anvilwar0mestre = Mestre Mandou<br>/sala #anvilwar0pistas = Jogo das 3 Pistas<br>/sala #anvilwar0objects = Objects<br><br>")
	end
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
		end
	end
	if string.find(string.upper(message),string.upper(resposta)) then
		if tfm.get.room.playerList[name].isShaman == true then
			tfm.exec.chatMessage(text.cancelled,name)
			valendo=false
			tfm.exec.setGameTime(64)
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

initObjects = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(18)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
for _,f in next,{"help","kill","run","add","reset","restart"} do
	system.disableChatCommandDisplay(f)
end
maps={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612"}
objects={1,2,10,35,39,40,54,60,61,85,90,201,202,203,204,205,206,207,208,209}
actual_map=""
actual_creator=""
bar=""
loop=0
winner=false
functs={running=false,level=0,count=10}
times=0
function eventChatCommand(name,message)
	if name == "Jessiewind26#2546" then
		if message == "help" then
			tfm.exec.chatMessage("<J>The objective of this room is survive! Don't touch on the boxes and win the game!<br><br>Module made by Jessiewind26#2546")
		end
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if (message:sub(0,3) == "run") then
			tfm.exec.newGame(message:sub(5))
		end
		if (message:sub(0,3) == "add") then
			table.insert(maps,tostring(message:sub(5)))
			tfm.exec.chatMessage("<J>The map <b>"..tostring(message:sub(5)).."</b> has been added to the map rotation.")
		end
		if message == "restart" then
			tfm.exec.newGame(maps[math.random(#maps)])
		end
		if message == "reset" then
			maps={}
			maps={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612"}
			tfm.exec.chatMessage("<J>The map rotation has been redefined to default.")
		end
	end
end
function eventNewGame()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<J>Confiram os sub-modos disponíveis da sala #anvilwar:<br><br>/sala #anvilwar0true_false = Verdadeiro ou Falso<br>/sala #anvilwar0mestre = Mestre Mandou<br>/sala #anvilwar0pistas = Jogo das 3 Pistas<br>/sala #anvilwar0objects = Objects<br><br>")
	end
	functs.running=false
	functs.level=0
	functs.count=10
	times=0
	tfm.exec.setGameTime(90)
	removeText()
	winner=false
	actual_map=tfm.get.room.currentMap
	actual_creator=tfm.get.room.xmlMapInfo.author
	changeBar()
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play True or False.",name)
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
function changeBar()
	if functs.level == 1 then
		bar="<font face='Consolas'><VP>█───<J>──<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 2 then
		bar="<font face='Consolas'><VP>██──<J>──<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 3 then
		bar="<font face='Consolas'><VP>███─<J>──<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 4 then
		bar="<font face='Consolas'><VP>████<J>──<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 5 then
		bar="<font face='Consolas'><VP>████<J>█─<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 6 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>──<font face='Verdana'>"
	elseif functs.level == 7 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>█─<font face='Verdana'>"
	elseif functs.level >= 8 then
		bar="<font face='Consolas'><VP>████<J>██<font color='#ff0000'>██<font face='Verdana'>"
	else
		bar="<font face='Consolas'><VP>────<J>──<font color='#ff0000'>──<font face='Verdana'>"
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
	ui.setMapName("<J>#objects RTM 2805.006   <BL>|   <J>"..actual_creator.." <BL>- "..actual_map.."   <BL>|   <N>Difficulty : "..bar.."<")
	if f <= 3000 and functs.running == true and winner == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.giveCheese(name)
			tfm.exec.playerVictory(name)
			functs.running=false
			showText("Time is up!")
		end
	end
	if f <= 1 and functs.running == false then
		tfm.exec.newGame(maps[math.random(#maps)])
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
			if times >= 3 and functs.level <= 7 then
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
tfm.exec.newGame(maps[math.random(#maps)])
end

tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.48<br>by Jessiewind26#2546<br><br>The requested room is loading or updating. Please wait...",nil)

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
else
	active = "anvilwar"
	initAnvilwar()
end
