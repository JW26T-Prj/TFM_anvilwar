--[[ Script contendo o module #anvilwar, #mestre, #waterpark e #fall2. Compilado às 12h48 (UTC) 08/02/2020. ]]--

local modulo = {
	_NOME = "anvilwar",
	_VERSION = "1.92",
	_AUTHOR = "Spectra_phantom#6089"
}

active = ""

initAnvilwar = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
powerups={choosed="",r_azul=false,r_vermelho=false,multi_count=0,int_azul=2,int_vermelho=2,immortal=false,immortal2=false,double=false,triple=false,objeto=false,explosion=false}
objetos={1,2,3,4,6,7,10,23,32,34,35,39,45,46,54,60,61,62,65,67,68,69,89,90,95}
play_azul={}
players_table={}
caps={azul="",vermelho=""}
play_vermelho={}
avs_list={}
banned_list={}
mods_list={"Nasus_assassin#1534"}
managers_list={"Zed#9431"}
admins_list={"Spectra_phantom#6089","Tryndavayron#0000"}
ninjas_list={"Shun_kazami#7014","Dhanny_mheyran#6701","Varusofeyzan#0000"}
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
loop=12
power=5
valendo=false
anvil_launched=false
set=false
object=10
set_name=""
reset=false
intervalo=false
count=0
count_azul=0
count_vermelho=0
for _,f in next,{"help","powerups","set","tc","p","score","kill","tt","rv","cap","cmd","acmd","ban","unban","rodar","reset","so","pw"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","","The Limit of Waters","Black and White","On the Edge of the Space","Above the Sea Level","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","The Darkness Abyss","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","","","","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels"}
lang = {}
lang.br = {
	win_vermelho = "<R><b>GG Time Vermelho!</b><br>A próxima partida será iniciada em 15 segundos.",
	win_azul = "<BL><b>GG Time Azul!</b><br>A próxima partida será iniciada em 15 segundos.",
	sudden_death = "<VP><b>Morte Súbita!</b><br>A equipe que conseguir eliminar qualquer um adversário será declarada a vencedora.",
	empate_text = "<J><b>Houve um empate!</b><br>A próxima partida será iniciada em 15 segundos.",
	instructions = "Use as teclas de 1 a 9 para alterar a potência da bigorna e barra de espaço para atirar. Para ajuda digite !help.",
	turn = "<VP>É a vez de",
	timeout = "<J>Tempo esgotado! O atirador será alterado.",
	enter_vermelho = "Entrar",
	enter_azul = "Entrar",
	exit = "Sair do time",
	inv3 = "Sua habilidade Modo Imortal expirou.",
	bar = "#anvilwar - RTM 17189.118",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Tryndavayron#0000<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) e Puiguirata#0000 (DE)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!<br><br>Não é mais permitido reviver jogadores nos 60 segundos finais.",
	seconds30 = "<ROSE>Faltam 30 segundos!",
	seconds10 = "<ROSE>Faltam 10 segundos!",
	teamchat = "<J>Você pode usar o comando !tc [mensagem] para falar apenas com o seu time.<br><br>Você pode ver seu perfil no jogo digitando !p e o ranking temporário digitando !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ajuda</a>  |  <a href='event:profile'>Perfil</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:cap'>Capitão</a>  |  <a href='event:cmd'>Comandos</a>",
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
	double = "acionou o powerup Bigorna Dupla!",
	double2 = "<br>Neste powerup, você atira 2 bigornas de uma vez.",
	triple = "acionou o powerup Bigorna Tripla!",
	triple2 = "<br>Neste powerup, você atira 3 bigornas de uma vez.",
	objeto1 = "acionou o powerup Tiro Aleatório!",
	objeto2 = "<br>Neste powerup, ao pressionar a barra de espaço, você vai atirar um objeto aleatório de shaman. Caso você tenha usado a habilidade Bigorna Dupla, você irá atirar 2 objetos ao invés de um.",
	exp1 = "acionou o powerup Olha a Explosão!",
	exp2 = "<br>Neste powerup, você pode gerar uma explosão clicando em um local do time inimigo.<br>Você possui 5 segundos para explodir!",
	inv1 = "acionou o powerup Modo Imortal!",
	inv2 = "<br>Neste powerup, você ficará imortal durante 4 turnos do seu time. Esta habilidade só pode ser utilizada uma vez por partida.",
}
lang.en = {
	win_vermelho = "<R><b>The RED team wins!</b><br>The next match will start in 15 seconds.",
	win_azul = "<BL><b>The BLUE team wins!</b><br>The next match will start in 15 seconds.",
	sudden_death = "<VP><b>SUDDEN DEATH!</b><br>The team that kill anyone of other team will won the match.",
	empate_text = "<J><b>There was a draw!</b><br>The next match will start in 15 seconds.",
	instructions = "Use the 1 to 9 keys to change the intensity of anvil and SPACEBAR to throw a anvil.",
	turn = "<VP>It's turn of",
	timeout = "<J>Time is over! The shooter will be changed.",
	enter_vermelho = "Enter",
	enter_azul = "Enter",
	exit = "Leave this team",
	inv3 = "Your immortality has ended.",
	bar = "#anvilwar - RTM 17189.118",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Tryndavayron#0000<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!<br>Isn't allowed to revive players at 60 final seconds.",
	seconds30 = "<ROSE>30 seconds remaining!",
	seconds10 = "<ROSE>10 seconds remaining!",
	teamchat = "<J>You can use the command !tc [message] to speak with your team.<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a>  |  <a href='event:profile'>Profile</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:cap'>Capitain</a>  |  <a href='event:cmd'>Commands</a>",
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
	double = "used the powerup Double Anvil!",
	double2 = "",
	triple = "used the powerup Triple Anvil!",
	triple2 = "",
	objeto1 = "used the powerup Random Shoot!",
	objeto2 = "<br>On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<br>On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "<br>On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
}
lang.ar = {
	win_vermelho = "<R><b>فاز الفريق الأحمر!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
win_azul = "<BL><b>فاز الفريق الأزرق!</b><br>ستبدأ المعركة التالية في غضون 15 ثانية!",
sudden_death = "<VP><b>المعركة النهائية!</b><br>إذا قام أي أحد بقتل عضو في أي فريق أخر، سوف يفوز الفريق الذي قتل!",
empate_text = "<J><b>تعادل!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
instructions = "إستخدم مفاتيح لوحة التحكم من 1 الى 9 للتحكم في سرعة وقوة السندان.",
turn = "<VP>إنه دور",
timeout = "<J>إنتهى الوقت! سيتم تغيير الضارب",
enter_vermelho = "بالدخول",
enter_azul = "بالدخول",
exit = "قم بالخروج من هذا الفريق",
bomba1 = "إستخدم فرقعة الزمن، إحترس من الإنفجار!",
bomba2 = "<br>في هذه القوة، سوف يحدث إنفجار في بقعة مختلفة في مكان العدو",
objeto1 = "إستخدم الضربة العشوائية! قد يقوم بضرب أي شيئ الأن!",
objeto2 = "<br>في هذه القوة، يمكنك ضرب أداة شامان بدلآ من السندان، إذا قمت بإختيار السندان المزدوج، سيتم ضرب اداتان شامان بدلآ من سندان",
inv3 = "قوة عدم موتك قد إنتهت، أصبحت قابلآ للموت الأن!.",
bar = "#anvilwar - RTM 17189.118",
intensity = "قوة الضرب وسرعته",
your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Tryndavayron#0000<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
teamkill1 = "أوه لا!! ",
teamKill2 = "قام بقتل عضو من فريقه!",
ajuda = "المساعدة",
credits = "Credits",
mostrar = "أظهر",
seconds = "<ROSE>60 ثانية متبقية<br>Isn't allowed to revive players at 60 final seconds.",
seconds30 = "<ROSE>30 ثانية متبقية!",
seconds10 = "<ROSE>10 ثوانٍ متبقية!",
teamchat = "<J>إستخم الإيعاز !tc [msg] للتكلم مع أعضاء فريقك<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
menu_bar = "<p align='center'><a href='event:help'>Help</a> | <a href='event:profile'>Profile</a> | <a href='event:powerups'>Powerups</a> | <a href='event:cap'>Capitain</a> | <a href='event:cmd'>Commands</a>",
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
double = "used the powerup Double Anvil!",
double2 = "",
triple = "used the powerup Triple Anvil!",
triple2 = "",
objeto1 = "استخدم powerup عشوائية تبادل لاطلاق النار!",
objeto2 = "<ar>على هذا powerup ، سوف تقوم بتصوير كائن شامان عشوائي بدلا من السندان. إذا كنت قد استخدمت Powerup مزدوج السندان ، يمكنك تبادل اثنين من الأشياء بدلا من واحدة.",
exp1 = "used the powerup Explosion!",
exp2 = "<ar>على هذا powerup ،عندك 5 ثوان لتسبب انفجارك.",
inv1 = "تستخدم powerup وضع الخالد!",
inv2 = "<br> على هذا powerup ، تكون خالدة خلال ال 4 المقبلة. يمكن استخدام هذه الطاقة فقط مرة واحدة لكل لعبة.",
}
lang.es = {
	win_vermelho = "<R><b>¡Ha ganado el equipo ROJO!</b><br>La próxima ronda comenzará en 15 segundos.",
win_azul = "<BL><b>¡Ha ganado el equipo AZUL!</b><br>La próxima ronda comenzará en 15 segundos.",
	sudden_death = "<VP><b>MUERTE SÚBITA!</b><br>El equipo que mate a alguien del otro equipo ganará esta ronda.",
	empate_text = "<J><b>Hubo un empate!</b><br>La próxima ronda comenzará en 15 segundos.",
	instructions = "Usa las teclas 1 al 9 para cambiar la intensidad del yunque y ESPACIO para lanzarlo.",
	turn = "<VP>Es el turno de",
	timeout = "<J>El tiempo ha terminado. El tirador será cambiado.",
	enter_vermelho = "Unirse",
	enter_azul = "Unirse",
	exit = "Abandonar este equipo",
	inv3 = "Tu inmortalidad ha terminado.",
	bar = "#anvilwar - RTM 17189.118",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Tryndavayron#0000<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) y Puiguirata#0000 (DE)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!<br>Isn't allowed to revive players at 60 final seconds.",
	seconds30 = "<ROSE>¡Quedan 30 segundos!",
	seconds10 = "<ROSE>¡Quedan 10 segundos!",
	teamchat = "<J>Puedes usar el comando !tc [mensaje] para hablar con tu equipo.<br><br>Puedes ver tu perfil escribiendo !p y el ranking temporal escribiendo !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Ayuda</a>  |  <a href='event:profile'>Perfil</a> | <a href='event:powerups'>Powerups</a>  |  <a href='event:cap'>Capitán</a>  |  <a href='event:cmd'>Comandos</a>",
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
	double = "usó el powerup Doble Yunque!",
	double2 = "",
	triple = "usó el powerup Triple Yunque!",
	triple2 = "",
	objeto1 = "usó el de powerup Tiro Aleatorio!",
	objeto2 = "<br>Con este powerup lanzarás un objeto de chamán aleatorio en lugar de un yunque. Si has usado el powerup Doble Yunque puedes lanzar 2 objetos en vez de 1.",
	exp1 = "usó el powerup Explosión!",
	exp2 = "<br>Con este powerup puedes provocar una explosión clicando en área enemigo con tu ratón.<br>Tienes 5 segundos para provocar la explosión.",
	inv1 = "usó el powerup Modo Inmortal!",
	inv2 = "<br>Con este powerup serás inmortal durante los próximos 4 turnos. Solo puedes usarlo 1 vez por ronda.",
}
lang.de = {
	win_vermelho = "<R><b>Das ROTE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	win_azul = "<BL><b>Das BLAUE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	sudden_death = "<VP><b>PLÖTZLICHER TOD!</b><br>Das Team, das jemanden aus einem anderen Team tötet, gewinnt das Spiel.",
	empate_text = "<J><b>Es gab ein Unentschieden!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	instructions = "Verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern und die Leertaste, um einen Amboss zu werfen.",
	turn = "<VP>Es ist die Wende von",
	timeout = "<J>Die Zeit ist vorbei! Der Schütze wird gewechselt.",
	enter_vermelho = "Betreten",
	enter_azul = "Betreten",
	exit = "Dieses Team verlassen",
	inv3 = "Deine Unsterblichkeit ist vorbei.",
	bar = "#anvilwar - RTM 17189.118",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Tryndavayron#0000<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) und Puiguirata#0000 (DE)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!<br>Isn't allowed to revive players at 60 final seconds.",
	seconds30 = "<ROSE>Noch 30 Sekunden!",
	seconds10 = "<ROSE>Noch 10 Sekunden!",
	teamchat = "<J>Du kannst den Befehl !tc [message] um mit Ihrem Team zu sprechen.<br><br>Du kannst deine Profiltypisierung sehen !p und die Typisierung des temporären Tankens !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a>  |  <a href='event:powerups'>Powerups</a>  |  <a href='event:profile'>Profile</a>  |  <a href='event:cap'>Capitain</a>  |  <a href='event:cmd'>Commands</a>",
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
	double = "used the powerup Double Anvil!",
	double2 = "",
	triple = "used the powerup Triple Anvil!",
	triple2 = "",
	objeto1 = "used the powerup Random Shoot!",
	objeto2 = "<br>On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "<br>On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "<br>On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
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
function showText1(text)
	ui.addTextArea(4001,"<font size='16'><b><font face='Bahnschrift Semilight'><p align='center'><font color='#400000'>"..text.."",nil,21,372,760,23,0x7C2C02,0xC51907,0.99,true)
	ui.addTextArea(4002,"<font size='16'><b><font face='Bahnschrift Semilight'><p align='center'><font color='#e2e2e2'>"..text.."",nil,20,371,760,23,0,0,0.99,true)
end
function showText2(text)
	ui.addTextArea(4001,"<font size='16'><b><font face='Bahnschrift Semilight'><p align='center'><font color='#000040'>"..text.."",nil,21,372,760,23,0x022C7C,0x0719C5,0.99,true)
	ui.addTextArea(4002,"<font size='16'><b><font face='Bahnschrift Semilight'><p align='center'><font color='#e2e2e2'>"..text.."",nil,20,371,760,23,0,0,0.99,true)
end
function menuShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='18'><font face='Bahnschrift'><p align='center'>"..title.."",name,150,90,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='14'><font face='Bahnschrift Semilight'>"..content.."",name,150,125,500,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='19'><font face='Bahnschrift Semilight'><p align='center'><R><a href='event:closep'>X</a>",name,620,90,30,27,0x3C1817,0xD92800,1.0,true)
end
function resetPowers()
	ui.removeTextArea(701,nil)
	kills=0
	anvil_launched=false
	powerups.r_vermelho=false
	powerups.r_azul=false
	powerups.multi_count=2
	powerups.immortal=false
	powerups.immortal2=false
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
function eventChatCommand(name,message)
	local arg = split(message, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end

		if tfm.get.room.playerList[nome] then
			menuShow(name,nome,"<font size='12'><b>Level: "..data[nome].nivel.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Score: "..data[nome].score.."<br>Matchs played: "..data[nome].matchs.."<br><br>Kills: "..data[nome].kills.."<br>Wins: "..data[nome].wins.."<br>Max Killing Spree: "..data[nome].max.."<br>Multi Kills: "..data[nome].mks.."",180)
			ui.addTextArea(9008,"",name,165,178,((data[nome].exp/data[nome].maxp)*460)+3,6,0xffffff,0x000001,nil,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,4) == "kill") then
		if data[name].level >= 3 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
			tfm.exec.killPlayer(message:sub(6))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "pw") then
		if data[name].level >= 4 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
			tfm.exec.setRoomPassword(message:sub(4))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
	end
	if(message:sub(0,5) == "rodar") then
		if data[name].level >= 3 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
			tfm.exec.newGame(message:sub(7))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "ban") then
		if data[name].level >= 3 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
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
		if data[name].level >= 4 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
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
					tfm.exec.chatMessage("<font color='#0080ff'>• ["..typer.."] "..message:sub(4).."","Tryndavayron#0000")
				end
			end
		elseif data[typer].team == "vermelho" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "vermelho" then
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."",name)
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."","Tryndavayron#0000")
				end
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "reset" then
		if data[name].level >= 2 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
			changeMap()
		end
	end
	if(message:sub(0,3) == "set") then
		if data[name].level >= 4 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
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
			if data[temp_name3] and tempo >= 60 then
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
					data[temp_name3].immortal=true
					data[temp_name3].imatchs=3
					tfm.exec.setNameColor(temp_name3,0xd7d7e6)
					tfm.exec.setPlayerScore(name,-30,true)
					tfm.exec.chatMessage(""..text.revivetext..""..temp_name3.."")
				else
					tfm.exec.chatMessage(text.score30,name)
				end
			else
				tfm.exec.chatMessage(text.funct,name)
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,5) == "score") then
		if data[name].level >= 3 or name == "Tryndavayron#0000" or name == "Spectra_phantom#6089" then
			temp_name=message:sub(7)
			ui.addPopup(906,2,"Score",name,350,175,200,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "help" then
		menuShow(name,text.ajuda,text.help,200)
	end
	if message == "cmd" then
		menuShow(name,text.cmds,text.commands,175)
	end
	if message == "acmd" then
		menuShow(name,text.cmds,text.admin_commands,120)
	end
	if message == "cap" then
		menuShow(name,text.cmds,text.cap,80)
	end
	if message == "powerups" then
		menuShow(name,text.powerupslist,"F1 (Double Anvil) - Cost: 6pt - Required Level: 1 - Function: <a href='event:power1'>Show</a><br>F2 (Triple Anvil) - Cost: 12pt - Required Level: 2 - Function: <a href='event:power2'>Show</a><br>F3 (Random Shoot) - Cost: 8pt - Required Level: 2 - Function: <a href='event:power3'>Show</a><br>F4 (Explosion) - Cost: 22pt - Required Level: 3 - Function: <a href='event:power4'>Show</a><br>F5 (Immortal Mode) - Cost: 30pt - Required Level: 4 - Function: <a href='event:power5'>Show</a><br>",105)
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
			ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 100, 165, 80, 20, 0x800000, 0x600000,1.0,true)
			ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 600, 165, 80, 20, 0x80, 0x60,1.0,true)
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
		for i=1,85 do
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
					if data[name] then
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
					if data[name].imatchs >= 4 then
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
			loop=12
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
	if valendo == true and reset == false and faltando > 10000 then
		if data[actual_player].team == "azul" then
			showText2(""..text.yturn.."<b>"..actual_player.."")
		elseif data[actual_player].team == "vermelho" then
			showText1(""..text.yturn.."<b>"..actual_player.."")
		end
	else
		ui.removeTextArea(4001,nil)
		ui.removeTextArea(4002,nil)
		ui.removeTextArea(4003,nil)
		ui.removeTextArea(4004,nil)
	end
	if valendo == true and reset == false then
		local minutos=math.floor(tempo/60)
		local segundos=math.floor(tempo-(minutos*60))
		ui.addTextArea(2201,"<p align='center'><font color='#000001'><font size='16'><font face='Bahnschrift'><R>"..count_vermelho.."  <N>-  <BL>"..count_azul.."",nil,340,24,120,22,0x0F0F0F,0x141414,1.0,true)
		if segundos >= 10 then
			ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='20'><font face='Consolas'>⏱ <b>"..minutos..":"..segundos.."</b>",nil,340,52,120,28,0x0F0F0F,0x141414,1.0,true)
		else
			ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='20'><font face='Consolas'>⏱ <b>"..minutos..":0"..segundos.."</b>",nil,340,52,120,28,0x0F0F0F,0x141414,1.0,true)
		end	
	else
		ui.removeTextArea(14,nil)
		ui.removeTextArea(2201,nil)
		ui.removeTextArea(2222,nil)
	end
end
function eventMouse(name,x,y)
	if powerups.explosion == true and actual_player == name then
		tfm.exec.explosion(x,y,30,120,true)
		tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
		powerups.explosion=false
	end
end
function eventPlayerDied(name)
	if count < 10 then
		if data[name].team == "azul" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.respawnPlayer(name)
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
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
				kills=kills-1
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
	if data[name] then
		ratos=ratos-1
		data[name].killed=-1
		data[name].team=""
	end
end
function showBar()
	for i=1,85 do
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
		if string.find(tfm.get.room.name,name) then
			managers_list={}
			table.insert(managers_list,name)
			data[name].level=4
			tfm.exec.chatMessage("You are the administrator of this room. Type !acmd to show available commands.",name)
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
					set=false
					set_name=""
					ui.removeTextArea(4003,nil)
					if data[name].team == "azul" then
						if powerups.objeto == true then
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,(4+power*2)*-1,-8)
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,(4+power*2)*-1,-8)
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x+40,y-60,0,(4+power*2)*-1,-8)
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x+80,y-60,0,(4+power*2)*-1,-8)
								powerups.triple=false
							end
						end
					elseif data[name].team == "vermelho" then
						if powerups.objeto == true then
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,4+power*2,-8)
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,4+power*2,-8)
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x-40,y-60,0,4+power*2,-8)
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x-80,y-60,0,4+power*2,-8)
								powerups.triple=false
							end
						end
					end
					anvil_launched=true
				end
			end
			if key >= 49 and key <= 57 then
				power=key-48
			end
			if key == 48 then
				power=10
			end
			if key == 35 and anvil_launched == false and valendo == true then
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
			if key == 112 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 6 then
					if data[name].nivel >= 1 then
						powerups.double=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.double.."")
						tfm.exec.setPlayerScore(name,-6,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 113 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 12 then
					if data[name].nivel >= 2 then
						powerups.double=true
						powerups.triple=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.triple.."")
						tfm.exec.setPlayerScore(name,-12,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 114 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 8 then
					if data[name].nivel >= 2 then
						powerups.objeto=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.objeto1.."")
						tfm.exec.setPlayerScore(name,-8,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 115 then
				if valendo == true and actual_player == name and powerups.explosion == false and tfm.get.room.playerList[name].score >= 22 then
					if data[name].nivel >= 3 then
						powerups.explosion=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.exp1.."")
						tfm.exec.setPlayerScore(name,-22,true)
						anvil_launched=true
						loop=12
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 116 then
				if valendo == true and actual_player == name and data[name].immortal2 == false and tfm.get.room.playerList[name].score >= 30 then
					if data[name].nivel >= 4 then
						data[name].immortal=true
						data[name].immortal2=true
						tfm.exec.setNameColor(name,0x00ff00)
						tfm.exec.setPlayerScore(name,-30,true)
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
function eventNewGame()
	advanceLevel()
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
	powerups.double=false
	powerups.triple=false
	powerups.objeto=false
	powerups.explosion=false
	kills=0
	play_azul={}
	play_vermelho={}
	valendo=false
	loop=12
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
			for id,name in pairs(ninjas_list) do
				if data[name] then
					giveCargos(name,5)
				end
			end
			for id,name in pairs(admins_list) do
				if data[name] then
					giveCargos(name,6)
				end
			end
			for id,name in pairs(banned_list) do
				if data[name] then
					giveCargos(name,-2)
				end
			end
		end
	end
	tfm.exec.setGameTime(30)
	showBar()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,376,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,text.menu_bar,name,200,345,350,20,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,376,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "cap" then
		eventChatCommand(name,"cap")
	end
	if callback == "cmd" then
		eventChatCommand(name,"cmd")
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "power1" then
		tfm.exec.chatMessage(text.double2,name)
	end
	if callback == "power2" then
		tfm.exec.chatMessage(text.triple2,name)
	end
	if callback == "power3" then
		tfm.exec.chatMessage(text.objeto2,name)
	end
	if callback == "power4" then
		tfm.exec.chatMessage(text.exp2,name)
	end
	if callback == "power5" then
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
			tfm.exec.movePlayer(name,600,180,false,0,0,false)
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
			tfm.exec.movePlayer(name,1000,180,false,0,0,false)
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
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>", name, 100, 165, 80, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>", name, 600, 165, 80, 20, 0x80, 0x60,1.0,true)
	end
	if callback == "sair_vermelho" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_vermelho=count_vermelho-1
		ui.removeTextArea(51,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>", name, 100, 165, 80, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>", name, 600, 165, 80, 20, 0x80, 0x60,1.0,true)
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
	elseif type == -2 and data[name] then
		data[name].level=-2
	end
end
end

initMestre = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(35)
mapas={3110915,6788085,6788183,6789853,6791944,6792470,6808957,6810292,6821950,6830799,6866406,6866549,6788693,6788728,6859175,6834529,6866437,6812488,6876638,6876563,6885971,6888512,6893463,6900149,6907177,6892608,6982387,5328362,5957905,7055459,7290270,7290275,7404106,7404327,7382263,7394517,7405103,7400694,7400678,7412412,7412422,7431981,7354947,7525277,6983850,6892022,6981135,6943992,6879100,6885799,6885841,6886906,6754319,6789272,6790912,6833993}
active=0 -- códigos active: -2 = número de ratos insuficiente, -1 = partida encerrada, 0 = partida não iniciada ou intervalo e 1 ou mais = comandos operando
vivo=0 -- número de ratos vivos
rato=0 -- número de ratos na sala
dificuldade=1 -- dificuldade da partida (alterada automaticamente)
rodadas=0 -- o limite de rodadas das partidas é calculado automaticamente
rodada=0 -- número da rodada atual, não altere
number=0
xpos=0
ypos=0
data={} -- variável que define os dados dos jogadores
lang={} -- não alterar, variável que define a linguagem dos textos
admin=""
pergunta=""
tempo=10
resposta=""
unlocked=true -- bloqueia ou desbloqueia a execução do script
for _,f in next,{"run","q","r","mapa","reset","time","pw","kill","rodar"} do
	system.disableChatCommandDisplay(f)
end
lang.br = {
	welcome = "<N>Bem-vindo a sala Mestre Mandou! Nesta sala seu objetivo é fazer tudo o que o script mandar.<ROSE><br><VP>Script criado por Vaicntaefeto#0000 e os membros da Spectra Advanced Module Group - Versão RTM Compilação 61",
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
	creator = "Module criado por Vaicntaefeto#0000",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	playingmap = "Rodando mapa",
	created = "criado por",
	abaixar = "Abaixem!",
	action = "Façam qualquer ação!"
}
lang.en = {
	welcome = "<N>Welcome to script Master Says! On this module you have to do everything that the master says.<ROSE><br><VP>Module created by Vaicntaefeto#0000 and the Spectra Advanced Module Group - Version RTM Compilation 61",
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
	creator = "Module created by Vaicntaefeto#0000",
	segundos = "seconds.",
	fim = "End of match! The next match will start on ",
	playingmap = "Playing map",
	created = "created by",
	abaixar = "Turn down!",
	action = "Do any action!"
}
lang.ar = {
	welcome = "<N>مرحبًا بكم في نمط الرئيس! في هذا النمط، عليك فعل كل مايقوله الرئيس!.<ROSE><br><VP>صُنع النمط عن طريقVaicntaefeto#0000 و the Spectra Advanced Module Group - الإصدار : RTM Compilation 61, تُرجم للغة العربية عن طريق اللاعب : [Vigo#4765]",
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
	espaco = "أضغط على زر المسافة 20 مرة!",
	nome = "اكتب اسمك (مع رقم #الهاشتاج)ـ",
	ndance = "لا ترقص!",
	mestre = "الرئيس يقول",
	map = "الخريطة",
	time = "الوقت",
	mice = "الفئران",
	round = "الجولة",
	mices = "هذه الغرفة تطلب على الأقل 4 لاعبين",
	difficulty = "الصعوبة",
	creator = "صُنع النمط عن طريق Vaicntaefeto#0000",
	segundos = "ثوانٍ.",
	fim = "نهاية الجولة! ستبدأ الجولة التالية في غضون ",
	playingmap = "بدأ الخارطة",
	created = "created by",
	abaixar = "Turn down!",
	action = "Do any action!"
}
lang.es = {
welcome = "<N> Bienvenido al módulo ¡Simón dice! En este módulo tienes que hacer todo lo que dice simón. <ROSE> <br> <VP> Módulo creado por Vaicntaefeto#0000 y los membros de Spectra Advanced Module Group - Versión RTM Compilation 61",
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
creator = "Módulo creado por Vaicntaefeto#0000",
segundos = "segundos.",
fim = "¡Fin del partido! El próximo partido comenzará el ",
playingmap = "Mapa de juego",
created = "creado por",
abaixar = "¡Bajar!",
action = "¡Hacer cualquer acción!"
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
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Use !pw [password] to change the password of the room and !mapa [@code] to run a custom map.",admin)
	end
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
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
	tfm.exec.setNameColor(admin,0xff0000)
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	active=math.random(1,36)
	getCommand()
end
function eventChatCommand(name,message)
	if name == "Vaicntaefeto#0000" or name == "Forzaldenon#0000" or name == admin then
		if(message:sub(0,3) == "run") then
				active=tonumber(message:sub(5))
				getCommand()
		end
		if(message:sub(0,1) == "q") then
			pergunta=message:sub(3)
		end
		if(message:sub(0,1) == "r") then
			resposta=message:sub(3)
		end
		if(message:sub(0,4) == "mapa") then
			tfm.exec.newGame(message:sub(6))
			active=0
		end
		if(message:sub(0,5) == "rodar") then
			tfm.exec.newGame(message:sub(7))
			active=0
		end
		if message == "reset" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
			active=0
		end
		if(message:sub(0,4) == "time") then
			tempo=message:sub(6)
		end
		if(message:sub(0,2) == "pw") then
			tfm.exec.setRoomPassword(tostring(message:sub(4)))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
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
		tfm.exec.setGameTime(5)
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
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1 -- isto indica que todos permanecerão vivos
		end
	end
	if active == 10 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.direita.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 11 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.digitar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 12 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.falar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 13 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.pular.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 14 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.mexer.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 15 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.bandeira.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(8)
	end
	if active == 16 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.ano.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
	end
	if active == 17 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.vesquerda.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 18 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.vdireita.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 19 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do quadrado branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.quadrado.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,320,80,65,0xffffff,0xffffff,0.68,false)
	end
	if active == 20 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 21 then
		xpos=math.random(60,650) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nretangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,xpos,0,80,400,0xffffff,0xffffff,0.68,false)
	end
	if active == 22 then
		ypos=math.random(40,300) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.retangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 23 then
		ypos=math.random(40,300) -- calcula aleatoriamente a posição do retângulo branco
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nretangulo.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(5)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
		ui.addTextArea(1,"",nil,0,ypos,1600,60,0xffffff,0xffffff,0.68,false)
	end
	if active == 24 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.preesquerda30.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 25 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.predireita30.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 26 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.preesquerda60.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 27 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.predireita60.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 28 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.espaco.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 29 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.nome.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(12)
	end
	if active == 30 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.ndance.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(6)
		for name,player in pairs(tfm.get.room.playerList) do
			data[name].c=1
		end
	end
	if active == 31 then
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
	if active == 32 then
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
	if active == 33 then
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
	if active == 34 then
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
	if active == 35 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.abaixar.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(7)
	end
	if active == 36 then
		ui.addTextArea(0,"<font face='Segoe UI'><font color='#e5e5e5'><font size='25'><p align='center'>"..text.action.."",nil,25,20,750,40,0x010101,0x121212,0.96,true)
		tfm.exec.setGameTime(8)
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		data[name].c=1
	end
	if active == 12 or active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2020" then
			data[name].c=1
		elseif message == "2019" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
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
	if active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 15 then
		if id == 10 then
			data[name].c=1
		end
	end
	if active == 30 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 36 then
		data[name].c=1
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
	if active == 13 then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 24 then
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
	if active == 25 then
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
	if active == 26 then
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
	if active == 27 then
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
	if active == 28 then
		if id == 32 then
			data[name].s=data[name].s+1
			if data[name].s >= 15 then
				data[name].c=1
			end
		end
	end
	if active == 35 then
		if id == 40 or id == 83 then
			data[name].c=1
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
		if active == 17 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == true then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 18 then
			for name,player in pairs(tfm.get.room.playerList) do
				if tfm.get.room.playerList[name].isFacingRight == false then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 19 or active == 31 or active == 32 then
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
		if active == 32 then
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
		if active == 20 or active == 33 or active == 34 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x < xpos or player.x > xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 21 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.x > xpos and player.x < xpos+80 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 22 then
			for name,player in pairs(tfm.get.room.playerList) do
				if player.y < ypos-10 or player.y > ypos+70 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		if active == 23 then
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

initFalling = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.setRoomMaxPlayers(22)
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
		if name == "Jhinsword350#0000" or name == "Vaicntaefeto#0000" or name == "Spectra_phantom#6089" then
			objective=tonumber(message:sub(5))
			tfm.exec.chatMessage("<J>Objective changed to: "..objective,name)
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
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.2",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.2! Script made by <b>Vaicntaefeto#0000</b>.<")
		tfm.exec.setGameTime(60)
	end
end
function eventLoop(p,f)
	if p >= 5000 and p <= 6000 and changed == false and enabled == true then
		tfm.exec.newGame(xml2)
		changed=true
		ui.setMapName("<J>#fall 2.2   <BL>|   <J>"..creator.." <BL>- "..map.."   <BL>|   <J>Objective : <J>"..objective.." points<")
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
		tfm.exec.chatMessage("+ "..tostring(10-position).." points",name)
	else
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.chatMessage("+ 1 points",name)
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
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#00ffff'><font size='47'>Fall Racing 2.2",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("Welcome to Fall Racing 2.2! Script made by <b>Vaicntaefeto#0000</b>.<")
	end
	tfm.exec.chatMessage("<J>Welcome to the #fall2 module!<br><br>The objective of this room is fall to the end of the map!<br>The player that score more points will win the game!<br><br><R>WARNING: This script require at least 3GB of RAM to work without problems.<J><br><br>Script made by Vaicntaefeto#0000",name)
end
tfm.exec.newGame(lobby)
end

initForca = function()
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoTimeLeft(true)
system.disableChatCommandDisplay("skip")

admin = "Rakan_raster#0000" -- insira seu nome!

chars = {}

lang = {}

lang.br = {
  ask_word = "<font face='Verdana'><font size='12'>Escolha uma palavra",
  choose_word = "<font face='Verdana'><font size='12'>Escolha a sua palavra:<br>MÁXIMO 13 LETRAS!",
  more_players = "<font face='Verdana'><font size='12'>Deve ter no mínimo <font color='#FF0000'>2</font> jogadores para brincar de forca.",
  next_turn_1 = "<font face='Verdana'><font size='12'>Próximo turno em ",
  next_turn_2 = "<font face='Verdana'><font size='12'> segundos",
  turn_of_1 = "<font face='Verdana'><font size='12'>É a vez de ",
  turn_of_2 = "<font face='Verdana'><font size='12'> | ",
  turn_of_3 = "<font face='Verdana'><font size='12'>O script será reiniciado para a reobtenção dos jogadores presentes na sala.",
  patientez = "<font face='Verdana'><font size='12'>Aguarde o líder escolher a palavra...",
  word_found = "<font face='Verdana'><font size='12'>A palavra foi encontrada!",
  word_not_found = "<font face='Verdana'><font size='12'>Mataram o boneco! A palavra era ",
  time_out = "<font face='Verdana'><font size='12'>Acabou o tempo! ",
  pass_turn = "<font face='Verdana'><font size='12'>Pergunta anulada. ",
  quit = "<font face='Verdana'><font size='12'>O mestre do jogo saiu."
}
text = lang.br

players = {}
master = ""

letters = {}
invertLetters = {}

word = ""
hasDefinedWord = false

timer = 0
bestPlayer = ""
pendu_level = 0

beginReset = false
hasToReset = false
resetTimer = 0

resetModule = false
isTimeOut = false
hasWon = false
hasLost = false
hasSkipped = false
hasQuit = false

lettersEntered = {}

id = {}

id["ask_word_main"] = 1
id["ask_word_button"] = 2
id["ask_word_popup"] = 3
id["pendu"] = 4
id["reset_timer"] = 5
id["reset_timer_label"] = 6
id["turn"] = 7
id["turn_label"] = 8
id["one_player"] = 9
id["one_player_label"] = 10

function eventNewGame()
  updatePlayersList()

  ui.removeTextArea(id["one_player"])
  ui.removeTextArea(id["one_player_label"])

  letters = {}
  invertLetters = {}
  word = ""
  hasDefinedWord = false
  timer = 0

  if getNbPlayers() > 1 then
    master = randomPlayer()
    tfm.exec.movePlayer(master, 400, 90, false, 0, 0, false)

    askWord()
    drawPendu()
  else
    removeAll()

    ui.addTextArea(id["one_player"], "", nil, 5, 110, 800, 25, 0xC0C0C0, 0x595959, 1f)
    ui.addTextArea(id["one_player_label"], "<p align='center'><BL><font color='#000000'>"..text.more_players.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f)

    drawWord()
    drawPendu()
  end
end

function eventPlayerDied(playerName)
  tfm.exec.respawnPlayer(playerName)
end

function eventNewPlayer(playerName)
  table.insert(players, playerName)

  if getNbPlayers() == 2 then
    tfm.exec.newGame('@4677521')
  else
    tfm.exec.respawnPlayer(playerName)
    drawWord()
    drawPendu()
  end
end

function eventPlayerLeft(playerName)
  local toRemove = 0

  for i,p in pairs(players) do
    if p==playerName then
      toRemove = i
    end
  end

  table.remove(players, toRemove)

  if getNbPlayers() == 1 then
    tfm.exec.newGame("@4677521")
  else
    if playerName==master then
      hasQuit = true
      reset()
    end
  end
end

function eventLoop(currentTime, timeRemaining)
	if timeRemaining < 1 then
		isTimeOut = true
   		 reset()
	end
  timer = timer + 0.5
  if beginReset then
    ui.removeTextArea(id["ask_word_main"])
    ui.removeTextArea(id["ask_word_button"])

    resetTimer = resetTimer + 0.5

    ui.addTextArea(id["reset_timer"], "", nil, 5, 110, 800, 25, 0xC0C0C0, 0x595959, 1f)
    if isTimeOut then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.time_out.." <font color='#000000'>"..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
		if ResetModule then ui.addTextArea(id["reset_timer_label"],"<p align='center'><font color='#000000'>O script será reiniciado para a reobtenção dos jogadores presentes na sala.</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
    if hasWon then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.word_found.." <font color='#000000'>"..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
    if hasLost then ui.addTextArea(id["reset_timer_label"], "<p align='center'><font color='#000000'>"..text.word_not_found.."</font><BL>"..word:gsub("^%l", string.upper).."<font color='#000000'> ! "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
    if hasSkiped then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.pass_turn.."<font color='#000000'> "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
    if hasQuit then ui.addTextArea(id["reset_timer_label"], "<p align='center'><BL>"..text.quit.."<font color='#000000'> "..text.next_turn_1.."<font color='#FF0000'>"..math.floor(7 - resetTimer).."</font>"..text.next_turn_2.."</font></p>", nil, 25, 115, 750, 30, 0xC0C0C0, 0xC0C0C0, 0f) end
  end

  checkBestPlayer()

  if timer==25 and not hasDefinedWord and getNbPlayers() > 1 then
    isTimeOut = true
    reset()
  end

  if resetTimer==7 then
    isTimeOut = false
    hasWon = false
    hasLost = false
    hasSkiped = false
    hasQuit = false
		if resetModule == true then
			tfm.exec.newGame('@4677521')
			resetModule = false
		end
    hasToReset = true

    reset()
  end
end

function eventChatCommand(playerName, message)
  local args = {}

  for arg in message:gmatch("[^%s]+") do
    table.insert(args, arg:lower())
  end

  if not hasLost and not hasSkiped and not hasQuit and args[1] ~= nil then
    if args[1]==word and playerName ~= master and not hasWon then
      local score = 0

      for _,letter in pairs(letters) do
        if letter=="_" then score = score + 872 end
      end

      tfm.exec.setPlayerScore(playerName, score, true)

      local i = 1

      while i <= word:len() do
        if letters[i]~="_" then
          invertLetters[i] = letters[i]
          letters[i] = "_"
        end

        i = i + 1
      end

      drawWord()
      hasWon = true
      reset()
    end

    if message == "skip" and playerName==admin and not hasWon and not hasLost and not isTimeOut then
      hasSkiped = true
      reset()
	  tfm.exec.chatMessage("<R>Esta palavra foi anulada: "..word.."",nil)
    end

	if message == "rodar" and playerName==admin then
		tfm.exec.newGame('@4677521')
	end

	if message == "reset" and playerName==admin then
		tfm.exec.chatMessage("<VP>O script será reiniciado para a obtenção dos jogadores.",nil)
		beginReset = true
		resetModule = true
	end

    if args[1]:len()==1 and hasDefinedWord and args[1]~= "_" and args[1]~="-" and args[1]~="'" and playerName ~= master then
      local isEntered = false

      for _,letter in pairs(lettersEntered) do
        if letter==args[1] then
          isEntered = true
        end
      end

      if not isEntered then
        local score = 0
        local idsToRemove = {}
        local isFalse = true

        table.insert(lettersEntered, args[1])

        for id,letter in pairs(letters) do
          if letter==args[1] then
            table.insert(idsToRemove, id)
            isFalse = false
          end
        end

        for _,idToRemove in pairs(idsToRemove) do
          invertLetters[idToRemove] = letters[idToRemove]
          letters[idToRemove] = "_"
        end

        score = #idsToRemove

        if isFalse then
          if tfm.get.room.playerList[playerName].score > 0 then score = -1 end
          pendu_level = pendu_level + 1
        end

        tfm.exec.setPlayerScore(playerName, score, true)

        drawWord()
        drawPendu()
      end
    end
  end
end

function eventTextAreaCallback(textAreaId, playerName, callback)
  if callback=="callbackAskWord" then
    ui.addPopup(id["ask_word_popup"], 2, text.choose_word, master, 300, 175, 200)
  end
end

function eventPopupAnswer(popupId, playerName, answer)
  if popupId==id["ask_word_popup"] and not isTimeOut and master==playerName then
    local choosedWord = tostring(answer)

    if checkWord(choosedWord) then
      defineWord(choosedWord)
      hasDefinedWord = true

      askWord()
		tfm.exec.setGameTime(60)
		tfm.exec.chatMessage("<N>A palavra é: "..word.."",admin)

      ui.removeTextArea(id["turn"])
      ui.removeTextArea(id["turn_label"])
    end
  end
end

function askWord()
  ui.removeTextArea(id["reset_timer"])
  ui.removeTextArea(id["reset_timer_label"])
  ui.removeTextArea(id["ask_word_main"])
  ui.removeTextArea(id["ask_word_button"])

  if not hasDefinedWord then
    ui.addTextArea(id["ask_word_main"], "", master, 5, 110, 800, 35, 0xC0C0C0, 0x595959, 1f)
    ui.addTextArea(id["ask_word_button"], "<p align='center'><a href='event:callbackAskWord'>"..text.ask_word.."</a></p>", master, 300, 120, 190, 16, 0x595959, 0x595959, 1f)
	tfm.exec.chatMessage("<ROSE>Clique em 'Escolha uma palavra' para escolher uma palavra.<br>Não serão permitidas palavras completamente desconhecidas, com números e etc.<br>Você possui 25 segundos para escolher uma palavra, caso contrário sua vez será cancelada e outro entrará em seu lugar.",master)

    for p,_ in pairs(tfm.get.room.playerList) do
      if p~=master then
        ui.addTextArea(id["turn"], "", p, 5, 110, 800, 25, 0xC0C0C0, 0x595959, 1f)
        ui.addTextArea(id["turn_label"], "<p align='center'><font color='#000000'>"..text.turn_of_1.."</font><BL>"..master.."<font color='#000000'>"..text.turn_of_2..text.patientez.."</font></p>", p, 25, 115, 800, 30, 0xC0C0C0, 0xC0C0C0, 0f)
      end
    end
  end
end

function defineWord(new_word)
  word = string.lower(string.gsub(new_word, " ", "-"))

  letters = {}

  local i = 36

  while i < 54 do
    ui.removeTextArea(i)
    i = i + 1
  end

  for letter in new_word:gmatch"." do
    if letter==" " or letter=="-" then
      table.insert(invertLetters, "-")
      table.insert(letters, "_")
    elseif letter=="'" then
      table.insert(invertLetters, "'")
      table.insert(letters, "_")
    else
      table.insert(letters, letter:lower())
      table.insert(invertLetters, "_")
    end
  end

  drawWord()
  drawPendu()
end

function drawWord()
  local textId = 36
  local i = 1
  local ancreX = 40

  if #word==0 then
    local i = 36

    while i < 54 do
      ui.removeTextArea(i)
      i = i + 1
    end
  else
    while i <= word:len() do
      ui.addTextArea(textId, "<font face='Verdana'><p align='center'><font size='40' color='#ededed'>"..invertLetters[i]:upper().."</font></p>", nil, ancreX, 150, 40, 60, 0x010101, 0x010101, 1f)
      ancreX = ancreX + 60
      textId = textId + 1
      i = i + 1
    end

    local finished = true
    local j = 1

    while j <= word:len() do
      if invertLetters[j]=="_" then finished = false end
      j = j + 1
    end

    if finished then
      hasWon = true
      reset()
    end
  end
end

function drawPendu()
  local pendu = ""

  if pendu_level==1 then
    pendu = pendu.."<br /><br /><br /><br /><br /><br /><br /><br /><br /> _________"

  elseif pendu_level==2 then
    pendu = pendu.."<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==3 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==4 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /<br />"
    pendu = pendu.."        |/<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==5 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==6 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/        O<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==7 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/        O<br />"
    pendu = pendu.."        |        /|<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==8 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/        O<br />"
    pendu = pendu.."        |        /|\<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==9 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/        O<br />"
    pendu = pendu.."        |        /|\\<br />"
    pendu = pendu.."        |         |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==10 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /      |<br />"
    pendu = pendu.."        |/        O<br />"
    pendu = pendu.."        |        /|\\<br />"
    pendu = pendu.."        |         |<br />"
    pendu = pendu.."        |        /<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.."        |<br />"
    pendu = pendu.." ____|____"

  elseif pendu_level==11 then
    pendu = pendu.."        __________.__<br />"
    pendu = pendu.."        |  /         |  <br />"
    pendu = pendu.."        |/           O  <br />"
    pendu = pendu.."        |           /|\\ <br />"
    pendu = pendu.."        |            |  <br />"
    pendu = pendu.."        |           / \\ <br />"
    pendu = pendu.."        |               <br />"
    pendu = pendu.."        |               <br />"
    pendu = pendu.."        |               <br />"
    pendu = pendu.." ____|____"

    hasLost = true
    reset()
  end

  ui.addTextArea(id["pendu"], pendu, nil, 323, 235, 135, 138, 0x010101, 0xFFFFFF, 0.5f)
end

function reset()
  beginReset = true

  if hasToReset then
	tfm.exec.setGameTime(25)

    if getNbPlayers() < 2 then
      tfm.exec.newGame('@4677521')
    else
	letters = {}
      invertLetters = {}
      word = ""
      hasDefinedWord = false
      pendu_level = 0
      beginReset = false
      hasToReset = false
      resetTimer = 0
      lettersEntered = {}

      drawWord()
      drawPendu()

      local randX = math.random(750)
      tfm.exec.movePlayer(master, randX, 385, false, 0, 0, false)

      local oldMaster = master

      if getNbPlayers()~=1 then
        if bestPlayer==oldMaster then
          while master==oldMaster do
            master = randomPlayer()
          end
        else
          master = bestPlayer
        end
      else
        master = bestPlayer
      end

      randX = math.random(750)

      tfm.exec.movePlayer(master, randX, 90, false, 0, 0, false)
      tfm.exec.setPlayerScore(master, 0, false)

      timer = 0

      askWord()
    end
  end
end

function removeAll()
  ui.removeTextArea(id["ask_word_main"])
  ui.removeTextArea(id["ask_word_button"])
  ui.removeTextArea(id["ask_word_popup"])
  ui.removeTextArea(id["pendu"])
  ui.removeTextArea(id["reset_timer"])
  ui.removeTextArea(id["reset_timer_label"])
  ui.removeTextArea(id["turn"])
  ui.removeTextArea(id["turn_label"])
  ui.removeTextArea(id["one_player"])
  ui.removeTextArea(id["one_player_label"])
end

function checkWord(word_arg)
  if word_arg:len() >= 2 and word_arg:len() <= 13 then
    for _,c in pairs(chars) do
      if string.match(word_arg, c) then
        return false
      end
    end

    return true
  else
    return false
  end
end

function checkBestPlayer()
  topScore = 0
  bestPlayer = randomPlayer()

  for name,player in pairs(tfm.get.room.playerList) do
    if player.score >= topScore then
      topScore = player.score
      bestPlayer = name
    end
  end
end

function getNbPlayers()
  return #players
end

function updatePlayersList()
  players = {}

  for p,_ in pairs(tfm.get.room.playerList) do
    table.insert(players, p)
  end
end

function randomPlayer()
  return players[math.random(1,#players)]
end

for name,player in pairs(tfm.get.room.playerList) do
  tfm.exec.setPlayerScore(name, 0, false)
end

updatePlayersList()
bestPlayer = randomPlayer()
tfm.exec.newGame('@4677521')
end

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7631682")
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou<br>/sala #anvilwar00forca = Jogo da Forca<br>/sala #anvilwar00fall2 = Fall Racing 2")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou<br>/sala #anvilwar00forca = Jogo da Forca<br>/sala #anvilwar00fall2 = Fall Racing 2")
end
end

Disabled = function()
tfm.exec.newGame("@7631682",true)
tfm.exec.setGameTime(15)
tfm.exec.chatMessage("Due to security reasons, this room is permanently disabled.",nil)
function eventNewPlayer(n)
tfm.exec.chatMessage("Due to security reasons, this room is permanently disabled.",nil)
end
end

tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.92<br>by Spectra_phantom#6089<br><br>The requested room is loading or updating. Please wait...",nil)

if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
	active = ""
	Disabled()
elseif string.find(tfm.get.room.name,"mestre") then
	active = "mestre"
	initMestre()
elseif string.find(tfm.get.room.name,"fall2") then
	active = "fall2"
	initFalling()
elseif string.find(tfm.get.room.name,"forca") then
	active = "forca"
	initForca()
elseif string.find(tfm.get.room.name,"rooms") then
	active = "rooms"
	Rooms()
else
	active = "anvilwar"
	initAnvilwar()
end
