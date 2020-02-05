--[[ Script contendo o module #anvilwar, #mestre, #waterpark e #fall2. Compilado às 02h17 (UTC) 05/02/2020. ]]--

local modulo = {
	_NOME = "anvilwar",
	_VERSION = "1.91",
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
loop=8
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
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","","The Limit of Waters","Black and White","On the Edge of the Space","Above the Sea Level","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","The Darkness Abyss","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","","","","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death"}
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
	bar = "#anvilwar - RTM 16088.117",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Tryndavayron#0000<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) e Puiguirata#0000 (DE)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!",
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
	bar = "#anvilwar - RTM 16088.117",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Tryndavayron#0000<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!",
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
bar = "#anvilwar - RTM 16088.117",
intensity = "قوة الضرب وسرعته",
your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Tryndavayron#0000<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
teamkill1 = "أوه لا!! ",
teamKill2 = "قام بقتل عضو من فريقه!",
ajuda = "المساعدة",
credits = "Credits",
mostrar = "أظهر",
seconds = "<ROSE>60 ثانية متبقية",
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
	bar = "#anvilwar - RTM 16088.117",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Tryndavayron#0000<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) y Puiguirata#0000 (DE)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!",
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
	bar = "#anvilwar - RTM 16088.117",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Tryndavayron#0000<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) und Puiguirata#0000 (DE)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!",
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
		for i=1,83 do
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
		ui.addTextArea(2201,"<p align='center'><font color='#000001'><font size='16'><font face='Bahnschrift'><R>"..count_vermelho.."  <N>-  <BL>"..count_azul.."",nil,340,24,120,22,0x0F0F0F,0x141414,1.0,true)
	else
		ui.removeTextArea(14,nil)
		ui.removeTextArea(2201,nil)
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
	for i=1,83 do
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

initWaterPark = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.newGame('<C><P H="2200" mc="" G="0,8.4" L="8000" /><Z><S><S P="0,0,,,,0,0,0" L="3000" X="1100" H="3000" v="1" Y="2275" T="9" /><S P="0,0,,,,0,0,0" L="3000" H="3000" X="4100" v="1" Y="2275" T="9" /><S P="0,0,,,,0,0,0" L="3000" X="7100" H="3000" v="1" Y="2275" T="9" /><S P="0,0,0.3,0.2,0,0,0,0" L="380" H="25" X="2211" Y="636" T="14" /><S P="0,0,1.2,0.2,82,0,0,0" X="2408" L="180" H="10" c="1" Y="720" T="14" /><S P="1,2800,20,0.2,0,0,0,0" X="6636" L="270" H="18" c="1" Y="785" T="14" /><S P="1,2800,20,0.2,4,0,0,0" L="88" H="18" X="6535" Y="782" T="14" /><S P="1,2800,20,0.2,9,0,0,0" X="6491" L="38" H="22" c="3" Y="767" T="14" /><S P="1,2800,20,0.2,-21,0,0,0" L="58" H="18" X="6764" Y="774" T="14" /><S P="0,0,0.3,0.2,0,0,0,0" L="508" H="22" X="6992" Y="696" T="14" /><S P="0,0,20,0.2,16,0,0,0" X="6706" L="10" H="220" c="3" Y="811" T="14" /><S P="0,0,0.3,0.2,0,0,0,0" L="254" X="7206" H="10" Y="202" T="14" /><S P="0,0,0.1,0.2,-7,0,0,0" L="350" H="10" X="6909" Y="223" T="14" /><S P="0,0,0,0.2,-38,0,0,0" L="460" X="6557" H="10" Y="386" T="14" /><S P="0,0,20,0.2,-102,0,0,0" L="460" H="10" X="7376" Y="422" T="14" /><S P="0,0,1.5,0.2,-15,0,0,0" L="1247" H="2355" X="7008" Y="2022" T="7" /><S P="0,0,1,0.2,-1,0,0,0" L="2247" X="8448" H="2355" Y="1842" T="7" /><S P="0,0,1,0.2,-2,0,0,0" L="1247" X="5898" H="2355" Y="2143" T="7" /><S P="0,0,1,0.2,-2,0,0,0" L="1647" H="2355" X="4458" Y="2193" T="7" /><S P="0,0,1,0.2,-2,0,0,0" L="1647" X="2821" H="2355" Y="2250" T="7" /><S P="0,0,1,0.2,-8,0,0,0" L="1647" H="2355" X="1305" Y="2383" T="7" /><S P="0,0,1,0.2,-10,0,0,0" L="1647" X="-279" H="2355" Y="2634" T="7" /><S P="0,0,1,0.2,29,0,0,0" L="1647" H="2355" X="-1281" Y="2020" T="7" /><S P="0,0,0.3,128,0,0,0,0" X="7800" L="145" o="ffe1b8" H="10" c="3" Y="200" T="13" /><S P="0,0,0.3,128,0,0,0,0" X="7800" L="135" o="ffd864" H="10" c="3" Y="200" T="13" /><S P="0,0,0.3,128,0,0,0,0" H="10" L="125" o="ffcb00" X="7800" c="3" Y="200" T="13" /><S P="0,0,0.3,0.2,0,0,0,0" L="350" H="24" X="239" Y="707" T="14" /><S P="0,0,20,0.2,80,0,0,0" L="140" H="10" X="420" Y="781" T="14" /><S P="0,0,20,0.2,75,0,0,0" L="100" H="10" X="48" Y="647" T="14" /><S P="0,0,20,0.2,-78,0,0,0" L="592" H="10" X="418" Y="369" T="14" /><S P="0,0,0.3,0.2,0,0,0,0" L="510" H="16" X="730" Y="86" T="14" /><S P="0,0,20,0.2,-75,0,0,0" L="100" H="10" X="905" Y="-2" T="14" /><S P="0,0,0.3,0.2,0,0,0,0" L="316" H="10" X="1071" Y="-48" T="14" /><S P="0,0,0.3,0.2,0,0,0,0" L="500" H="24" X="-208" Y="606" T="14" /><S P="1,2600,25,0.2,0,1,0,0" L="320" H="30" X="1830" Y="760" T="14" /></S><D><P X="2072" P="1,0" Y="625" T="67" /><P X="2342" C="48230c" Y="623" T="20" P="1,0" /><P X="2260" P="1,1" Y="625" T="69" /><P X="2134" P="1,0" Y="627" T="106" /><P X="6782" P="1,0" Y="686" T="32" /><P X="6865" P="1,0" Y="686" T="12" /><P X="6917" P="1,0" Y="686" T="12" /><P X="7536" P="1,0" Y="679" T="6" /><P X="7853" P="1,0" Y="674" T="6" /><P X="8122" P="1,0" Y="670" T="6" /><P X="7349" P="1,0" Y="683" T="7" /><P X="7385" P="1,0" Y="686" T="8" /><P X="7436" P="1,0" Y="682" T="10" /><P X="7454" P="1,0" Y="663" T="9" /><P X="7620" P="1,0" Y="681" T="7" /><P X="7646" P="1,0" Y="679" T="31" /><P X="7719" P="1,0" Y="679" T="13" /><P X="7771" P="1,0" Y="677" T="13" /><P X="7929" P="1,0" Y="674" T="7" /><P X="7957" C="92d4ee" Y="680" T="125" P="1,0" /><P X="7035" P="1,0" Y="686" T="69" /><P X="7159" P="1,0" Y="685" T="3" /><P X="7236" P="1,0" Y="685" T="11" /><P X="277" P="1,1" Y="697" T="69" /><P X="191" P="1,0" Y="698" T="67" /><P X="148" P="1,0" Y="697" T="31" /><P X="102" P="1,0" C="48230c" Y="698" T="20" /><P X="-30" P="1,0" C="57703e,e7c3d6" Y="598" T="18" /><P X="-404" P="1,0" Y="601" T="83" /><P X="-321" P="1,0" Y="595" T="83" /><P X="-200" P="1,0" C="714330,23130c" Y="601" T="103" /><P X="-116" P="1,0" C="714330,23130c" Y="600" T="103" /><P X="-116" P="1,0" C="e75082" Y="541" T="91" /><DS Y="668" X="7500" /></D><O><O X="6979" C="6" Y="761" P="0" /></O><L><VL n="heaven"l="-1"/><JD P1="-1000,500"P2="9000,500"c="239DF6,250,1,0"/><JD P1="-1000,750"P2="9000,750"c="239DF6,250,1,0"/><JD P1="-1000,1000"P2="9000,1000"c="239DF6,250,1,0"/><JD P1="-1000,1250"P2="9000,1250"c="239DF6,250,1,0"/><JD P1="-1000,1500"P2="9000,1500"c="239DF6,250,1,0"/><JD P1="-1000,1750"P2="9000,1750"c="239DF6,250,1,0"/><JD P1="-1000,300"P2="9000,300"c="168ee3,150,1,0"/><JD P1="-1000,150"P2="9000,150"c="1084d1,150,1,0"/><JD P1="-1000,0"P2="9000,0"c="0b7cc2,150,1,0"/><JD P1="-1000,-150"P2="9000,-150"c="0973b0,150,1,0"/><JD P1="-1000,-350"P2="9000,-350"c="096a9e,250,1,0"/><JD P1="-1000,-600"P2="9000,-600"c="096a9e,250,1,0"/><VL n="t2"l="34"/><JD P1="1670,730"P2="1990,730"c="4f340a,18,1,0"M1="34"M2="34"/><JD P1="1670,748"P2="1990,748"c="4f340a,18,1,0"M1="34"M2="34"/><JD P1="1670,760"P2="1990,760"c="4f340a,18,1,0"M1="34"M2="34"/><JD P1="1679,735"P2="1761,732"c="30210a,12,1,0"M1="34"M2="34"/><JD P1="1723,759"P2="1771,755"c="30210a,12,1,0"M1="34"M2="34"/><JD P1="1897,755"P2="1947,750"c="30210a,12,1,0"M1="34"M2="34"/><JD P1="1876,729"P2="1802,742"c="30210a,12,1,0"M1="34"M2="34"/><JD P1="1687,755"P2="1739,744"c="634314,8,1,0"M1="34"M2="34"/><JD P1="1804,763"P2="1784,737"c="634314,8,1,0"M1="34"M2="34"/><JD P1="1905,732"P2="1942,730"c="916528,4,1,0"M1="34"M2="34"/><JD P1="1985,763"P2="1925,764"c="916528,4,1,0"M1="34"M2="34"/><JD P1="1833,754"P2="1877,748"c="d9a766,2,1,0"M1="34"M2="34"/><VL n="platform4"l="-1"/><JD P1="478,81"P2="983,81"c="dbdbdb,16,1,0"/><JD P1="983,81"P2="980,125"c="dbdbdb,16,1,0"/><JD P1="980,125"P2="477,88"c="dbdbdb,16,1,0"/><JD P1="477,88"P2="972,95"c="dbdbdb,16,1,0"/><JD P1="709,96"P2="974,110"c="dbdbdb,16,1,0"/><JD P1="584,80"P2="581,94"c="737373,2,1,0"/><JD P1="581,94"P2="571,93"c="737373,2,1,0"/><JD P1="571,92"P2="571,89"c="737373,2,1,0"/><JD P1="635,82"P2="633,97"c="737373,2,1,0"/><JD P1="634,97"P2="649,99"c="737373,2,1,0"/><JD P1="649,99"P2="651,82"c="737373,2,1,0"/><JD P1="696,100"P2="699,82"c="737373,2,1,0"/><JD P1="699,82"P2="706,91"c="737373,2,1,0"/><JD P1="706,91"P2="716,82"c="737373,2,1,0"/><JD P1="716,82"P2="715,100"c="737373,2,1,0"/><JD P1="770,81"P2="767,108"c="737373,2,1,0"/><JD P1="770,81"P2="786,80"c="737373,2,1,0"/><JD P1="786,80"P2="787,94"c="737373,2,1,0"/><JD P1="787,94"P2="770,92"c="737373,2,1,0"/><JD P1="857,80"P2="855,103"c="737373,2,1,0"/><JD P1="853,111"P2="853,112"c="737373,2,1,0"/><JD P1="1230,-53"P2="914,-53"c="dbdbdb,9,1,0"/><JD P1="913,-48"P2="1229,-34"c="dbdbdb,9,1,0"/><JD P1="1229,-34"P2="1230,-47"c="dbdbdb,9,1,0"/><JD P1="1013,-46"P2="1227,-45"c="dbdbdb,9,1,0"/><JD P1="1163,-46"P2="1230,-38"c="dbdbdb,9,1,0"/><JD P1="900,127"P2="900,1500"c="ffffff,7,1,0"/><JD P1="800,119"P2="800,1500"c="ffffff,7,1,0"/><JD P1="700,112"P2="700,1451"c="ffffff,7,1,0"/><JD P1="600,105"P2="600,1451"c="ffffff,7,1,0"/><JD P1="1072,-34"P2="1072,1500"c="ffffff,5,1,0"/><JD P1="1142,-32"P2="1142,1500"c="ffffff,5,1,0"/><JD P1="1211,-28"P2="1211,1500"c="ffffff,5,1,0"/><VL n="platform3"l="-1"/><JD P1="410,676"P2="435,850"c="eb9305,4,1,0"/><JD P1="437,672"P2="465,847"c="eb9305,4,1,0"/><JD P1="432,830"P2="461,829"c="eb9305,4,1,0"/><JD P1="431,807"P2="455,806"c="eb9305,4,1,0"/><JD P1="426,781"P2="453,778"c="eb9305,4,1,0"/><JD P1="422,757"P2="449,754"c="eb9305,4,1,0"/><JD P1="418,729"P2="445,728"c="eb9305,4,1,0"/><JD P1="67,715"P2="460,715"c="eb9305,18,1,0"/><JD P1="460,697"P2="67,697"c="eb9305,18,1,0"/><JD P1="86,704"P2="178,704"c="a66a0a,8,1,0"/><JD P1="224,712"P2="329,712"c="a66a0a,8,1,0"/><JD P1="361,696"P2="450,695"c="a66a0a,8,1,0"/><JD P1="205,698"P2="293,697"c="c98116,12,1,0"/><JD P1="357,716"P2="433,714"c="c98116,12,1,0"/><JD P1="93,717"P2="176,718"c="664413,4,1,0"/><JD P1="63,688"P2="34,572"c="664413,4,1,0"/><JD P1="93,686"P2="64,567"c="664413,4,1,0"/><JD P1="49,623"P2="74,621"c="664413,4,1,0"/><JD P1="55,644"P2="79,641"c="664413,4,1,0"/><JD P1="61,670"P2="86,667"c="664413,4,1,0"/><JD P1="-445,618"P2="110,618"c="664413,24,1,0"/><JD P1="-445,595"P2="110,596"c="664413,24,1,0"/><JD P1="-428,597"P2="-303,597"c="402a0c,14,1,0"/><JD P1="-349,613"P2="-233,613"c="402a0c,14,1,0"/><JD P1="-113,617"P2="-23,618"c="402a0c,14,1,0"/><JD P1="17,599"P2="107,601"c="402a0c,14,1,0"/><JD P1="-216,592"P2="-130,591"c="734a15,9,1,0"/><JD P1="-89,596"P2="-31,596"c="734a15,9,1,0"/><JD P1="-205,612"P2="-140,613"c="a66619,6,1,0"/><JD P1="-437,622"P2="-379,621"c="a66619,6,1,0"/><JD P1="17,624"P2="97,621"c="a66619,6,1,0"/><JD P1="-268,594"P2="-251,592"c="d98320,3,1,0"/><JD P1="-5,611"P2="36,614"c="d98320,3,1,0"/><JD P1="-370,630"P2="-370,1500"c="664413,10,1,0"/><JD P1="-220,630"P2="-220,1500"c="664413,10,1,0"/><JD P1="-70,630"P2="-70,1500"c="664413,10,1,0"/><JD P1="100,722"P2="100,1500"c="eb9305,5,1,0"/><JD P1="180,722"P2="180,1500"c="eb9305,5,1,0"/><JD P1="260,722"P2="260,1500"c="eb9305,5,1,0"/><JD P1="340,722"P2="340,1500"c="eb9305,5,1,0"/><JD P1="99,790"P2="87,805"c="306b03,3,1,0"/><JD P1="103,894"P2="115,906"c="306b03,3,1,0"/><JD P1="96,1002"P2="88,1016"c="306b03,3,1,0"/><JD P1="103,1077"P2="114,1091"c="306b03,3,1,0"/><JD P1="97,1166"P2="84,1183"c="306b03,3,1,0"/><JD P1="103,1250"P2="113,1262"c="306b03,3,1,0"/><JD P1="177,843"P2="168,855"c="306b03,3,1,0"/><JD P1="184,957"P2="199,975"c="306b03,3,1,0"/><JD P1="178,1050"P2="166,1061"c="306b03,3,1,0"/><JD P1="183,1136"P2="194,1149"c="306b03,3,1,0"/><JD P1="177,1221"P2="168,1231"c="306b03,3,1,0"/><JD P1="264,751"P2="280,766"c="306b03,3,1,0"/><JD P1="258,874"P2="243,890"c="306b03,3,1,0"/><JD P1="264,995"P2="273,1008"c="306b03,3,1,0"/><JD P1="257,1099"P2="246,1113"c="306b03,3,1,0"/><JD P1="264,1194"P2="277,1208"c="306b03,3,1,0"/><JD P1="257,1274"P2="243,1290"c="306b03,3,1,0"/><JD P1="344,807"P2="356,822"c="306b03,3,1,0"/><JD P1="337,910"P2="328,922"c="306b03,3,1,0"/><JD P1="343,1041"P2="354,1057"c="306b03,3,1,0"/><JD P1="338,1137"P2="329,1155"c="306b03,3,1,0"/><JD P1="344,1251"P2="357,1270"c="306b03,3,1,0"/><JD P1="-376,775"P2="-390,790"c="77d62f,8,1,0"/><JD P1="-364,919"P2="-350,939"c="77d62f,8,1,0"/><JD P1="-377,1123"P2="-394,1145"c="77d62f,8,1,0"/><JD P1="-363,1325"P2="-349,1342"c="77d62f,8,1,0"/><JD P1="-227,843"P2="-247,862"c="77d62f,8,1,0"/><JD P1="-213,1000"P2="-197,1016"c="77d62f,8,1,0"/><JD P1="-227,1201"P2="-240,1214"c="77d62f,8,1,0"/><JD P1="-61,725"P2="-51,741"c="77d62f,8,1,0"/><JD P1="-79,842"P2="-88,853"c="77d62f,8,1,0"/><JD P1="-63,936"P2="-51,952"c="77d62f,8,1,0"/><JD P1="-75,1070"P2="-82,1081"c="77d62f,8,1,0"/><JD P1="-65,1162"P2="-53,1173"c="77d62f,8,1,0"/><JD P1="-77,1267"P2="-90,1283"c="77d62f,8,1,0"/><JD P1="339,686"P2="443,68"c="ffffff,4,1,0"/><JD P1="473,69"P2="370,686"c="ffffff,4,1,0"/><JD P1="346,652"P2="373,653"c="ffffff,4,1,0"/><JD P1="356,600"P2="380,601"c="ffffff,4,1,0"/><JD P1="364,555"P2="390,558"c="ffffff,4,1,0"/><JD P1="370,506"P2="398,509"c="ffffff,4,1,0"/><JD P1="378,461"P2="405,464"c="ffffff,4,1,0"/><JD P1="384,419"P2="410,423"c="ffffff,4,1,0"/><JD P1="393,374"P2="420,377"c="ffffff,4,1,0"/><JD P1="401,325"P2="429,330"c="ffffff,4,1,0"/><JD P1="406,287"P2="434,292"c="ffffff,4,1,0"/><JD P1="413,247"P2="441,251"c="ffffff,4,1,0"/><JD P1="421,199"P2="450,202"c="ffffff,4,1,0"/><JD P1="429,155"P2="455,157"c="ffffff,4,1,0"/><JD P1="438,115"P2="462,117"c="ffffff,4,1,0"/><JD P1="470,93"P2="989,132"c="ffffff,4,1,0"/><JD P1="473,73"P2="987,73"c="ffffff,4,1,0"/><JD P1="990,74"P2="989,132"c="ffffff,4,1,0"/><JD P1="845,72"P2="881,-72"c="ffffff,3,1,0"/><JD P1="878,70"P2="915,-69"c="ffffff,3,1,0"/><JD P1="853,42"P2="883,44"c="ffffff,3,1,0"/><JD P1="860,11"P2="892,14"c="ffffff,3,1,0"/><JD P1="871,-23"P2="901,-22"c="ffffff,3,1,0"/><JD P1="880,-59"P2="910,-57"c="ffffff,3,1,0"/><JD P1="913,-58"P2="1232,-58"c="ffffff,3,1,0"/><JD P1="910,-44"P2="1234,-29"c="ffffff,3,1,0"/><JD P1="1234,-56"P2="1234,-30"c="ffffff,3,1,0"/><VL n="platform_b"l="-1"/><JD P1="6700,700"P2="7300,700"c="4a3103,20,1,0"/><JD P1="6700,720"P2="7300,720"c="4a3103,20,1,0"/><JD P1="6700,680"P2="7300,680"c="4a3103,20,1,0"/><JD P1="6730,702"P2="6838,704"c="66450c,9,1,0"/><JD P1="6971,683"P2="7083,686"c="66450c,9,1,0"/><JD P1="7131,708"P2="7245,710"c="66450c,9,1,0"/><JD P1="6928,712"P2="7005,713"c="755011,7,1,0"/><JD P1="7174,684"P2="7222,688"c="755011,7,1,0"/><JD P1="6816,684"P2="6910,689"c="755011,11,1,0"/><JD P1="7039,716"P2="7096,717"c="755011,11,1,0"/><JD P1="6872,712"P2="6899,714"c="3b2706,5,1,0"/><JD P1="7250,684"P2="7284,684"c="3b2706,5,1,0"/><JD P1="6724,681"P2="6756,683"c="3b2706,5,1,0"/><JD P1="6750,730"P2="6750,1300"c="4a3103,8,1,0"/><JD P1="6850,730"P2="6850,1300"c="4a3103,8,1,0"/><JD P1="6950,730"P2="6950,1300"c="4a3103,8,1,0"/><JD P1="7050,730"P2="7050,1300"c="4a3103,8,1,0"/><JD P1="7150,730"P2="7150,1300"c="4a3103,8,1,0"/><JD P1="7250,730"P2="7250,1300"c="4a3103,8,1,0"/><JD P1="6714,689"P2="6650,930"c="4a3103,8,1,0"/><JD P1="6739,709"P2="6680,936"c="4a3103,8,1,0"/><JD P1="6660,902"P2="6682,904"c="4a3103,8,1,0"/><JD P1="6670,867"P2="6692,870"c="4a3103,8,1,0"/><JD P1="6679,830"P2="6701,833"c="4a3103,8,1,0"/><JD P1="6690,790"P2="6714,795"c="4a3103,8,1,0"/><JD P1="6699,754"P2="6722,760"c="4a3103,8,1,0"/><JD P1="7246,781"P2="7235,789"c="1c7d15,6,1,0"/><JD P1="7256,846"P2="7267,861"c="1c7d15,6,1,0"/><JD P1="7246,921"P2="7238,930"c="1c7d15,6,1,0"/><JD P1="7155,756"P2="7167,765"c="1c7d15,6,1,0"/><JD P1="7147,826"P2="7137,835"c="1c7d15,6,1,0"/><JD P1="7155,879"P2="7166,889"c="1c7d15,6,1,0"/><JD P1="7144,932"P2="7133,940"c="1c7d15,6,1,0"/><JD P1="7154,994"P2="7165,1003"c="1c7d15,6,1,0"/><JD P1="7047,791"P2="7034,801"c="1c7d15,6,1,0"/><JD P1="7056,855"P2="7067,864"c="1c7d15,6,1,0"/><JD P1="7044,920"P2="7032,932"c="1c7d15,6,1,0"/><JD P1="7055,995"P2="7069,1001"c="1c7d15,6,1,0"/><JD P1="7048,1037"P2="7028,1050"c="1c7d15,6,1,0"/><JD P1="6954,759"P2="6969,769"c="1c7d15,6,1,0"/><JD P1="6944,815"P2="6932,826"c="1c7d15,6,1,0"/><JD P1="6955,878"P2="6969,889"c="1c7d15,6,1,0"/><JD P1="6945,955"P2="6932,966"c="1c7d15,6,1,0"/><JD P1="6955,1022"P2="6971,1035"c="1c7d15,6,1,0"/><JD P1="6946,1085"P2="6934,1095"c="1c7d15,6,1,0"/><JD P1="6844,757"P2="6830,771"c="1c7d15,6,1,0"/><JD P1="6854,816"P2="6867,830"c="1c7d15,6,1,0"/><JD P1="6846,871"P2="6835,885"c="1c7d15,6,1,0"/><JD P1="6856,925"P2="6868,939"c="1c7d15,6,1,0"/><JD P1="6845,976"P2="6836,988"c="1c7d15,6,1,0"/><JD P1="6855,1027"P2="6868,1042"c="1c7d15,6,1,0"/><JD P1="6845,1079"P2="6835,1090"c="1c7d15,6,1,0"/><JD P1="6855,1129"P2="6867,1138"c="1c7d15,6,1,0"/><JD P1="6754,795"P2="6767,809"c="1c7d15,6,1,0"/><JD P1="6745,853"P2="6731,869"c="1c7d15,6,1,0"/><JD P1="6753,922"P2="6766,935"c="1c7d15,6,1,0"/><JD P1="6746,989"P2="6734,1005"c="1c7d15,6,1,0"/><JD P1="6755,1050"P2="6768,1066"c="1c7d15,6,1,0"/><JD P1="6745,1124"P2="6731,1136"c="1c7d15,6,1,0"/><JD P1="6755,1179"P2="6767,1193"c="1c7d15,6,1,0"/><JD P1="7292,733"P2="7290,753"c="229418,11,1,0"/><JD P1="7268,732"P2="7268,740"c="229418,11,1,0"/><JD P1="7236,731"P2="7230,748"c="229418,11,1,0"/><JD P1="7210,732"P2="7210,735"c="229418,11,1,0"/><JD P1="7191,731"P2="7191,753"c="229418,11,1,0"/><JD P1="7169,729"P2="7171,739"c="229418,11,1,0"/><JD P1="7114,735"P2="7116,754"c="229418,11,1,0"/><JD P1="7090,734"P2="7094,746"c="229418,11,1,0"/><JD P1="7138,733"P2="7138,735"c="229418,11,1,0"/><JD P1="7064,731"P2="7063,744"c="229418,11,1,0"/><JD P1="7031,731"P2="7026,737"c="229418,11,1,0"/><JD P1="7008,731"P2="6992,756"c="229418,11,1,0"/><JD P1="6980,730"P2="6978,737"c="229418,11,1,0"/><JD P1="6924,732"P2="6933,755"c="229418,11,1,0"/><JD P1="6901,729"P2="6901,738"c="229418,11,1,0"/><JD P1="6877,732"P2="6882,748"c="229418,11,1,0"/><JD P1="6822,732"P2="6819,746"c="229418,11,1,0"/><JD P1="6792,734"P2="6793,745"c="229418,11,1,0"/><JD P1="6769,731"P2="6770,751"c="229418,11,1,0"/><JD P1="6680,938"P2="6683,949"c="229418,11,1,0"/><JD P1="6694,899"P2="6702,906"c="229418,11,1,0"/><JD P1="6709,836"P2="6714,845"c="229418,11,1,0"/><VL n="trampoline2"l="-1"/><JD P1="6911,235"P2="7326,176"c="7291c2,16,1,0"/><JD P1="7324,177"P2="7339,248"c="7291c2,16,1,0"/><JD P1="7338,248"P2="6826,246"c="7291c2,16,1,0"/><JD P1="6826,246"P2="6987,227"c="7291c2,16,1,0"/><JD P1="6967,238"P2="7314,197"c="7291c2,26,1,0"/><JD P1="7314,197"P2="7318,236"c="7291c2,26,1,0"/><JD P1="7318,236"P2="7062,235"c="7291c2,26,1,0"/><JD P1="7079,235"P2="7307,215"c="7291c2,26,1,0"/><JD P1="6761,251"P2="6848,243"c="7291c2,9,1,0"/><JD P1="6783,252"P2="6853,249"c="7291c2,9,1,0"/><JD P1="7295,174"P2="7249,253"c="324663,6,1,0"/><JD P1="7231,181"P2="7183,250"c="324663,6,1,0"/><JD P1="7157,192"P2="7110,255"c="324663,6,1,0"/><JD P1="7074,204"P2="7033,251"c="324663,6,1,0"/><JD P1="7011,213"P2="6972,252"c="324663,6,1,0"/><JD P1="6918,230"P2="6898,252"c="324663,6,1,0"/><JD P1="6758,250"P2="7339,250"c="324663,6,1,0"/><JD P1="7032,210"P2="7334,210"c="324663,6,1,0"/><JD P1="6382,507"P2="6679,274"c="2298bf,30,1,0"/><JD P1="6680,268"P2="6725,233"c="2298bf,22,1,0"/><JD P1="6678,279"P2="6748,233"c="2298bf,22,1,0"/><JD P1="6730,235"P2="6859,224"c="2298bf,22,1,0"/><JD P1="6734,252"P2="6967,213"c="2298bf,12,1,0"/><JD P1="6863,221"P2="7017,206"c="2298bf,12,1,0"/><JD P1="7008,207"P2="7079,201"c="2298bf,6,1,0"/><VL n="trampoline1"l="-1"/><JD P1="7332,167"P2="7415,637"c="8deafc,5,1,0"/><JD P1="7453,632"P2="7365,162"c="8deafc,5,1,0"/><JD P1="7409,601"P2="7444,593"c="8deafc,5,1,0"/><JD P1="7401,549"P2="7432,541"c="8deafc,5,1,0"/><JD P1="7392,492"P2="7422,487"c="8deafc,5,1,0"/><JD P1="7381,437"P2="7414,429"c="8deafc,5,1,0"/><JD P1="7372,385"P2="7403,378"c="8deafc,5,1,0"/><JD P1="7362,331"P2="7393,322"c="8deafc,5,1,0"/><JD P1="7353,277"P2="7384,271"c="8deafc,5,1,0"/><JD P1="7345,231"P2="7374,223"c="8deafc,5,1,0"/><JD P1="7336,181"P2="7364,176"c="8deafc,5,1,0"/><JD P1="7331,166"P2="6734,253"c="8deafc,5,1,0"/><JD P1="6734,253"P2="6381,526"c="8deafc,5,1,0"/><JD P1="6365,500"P2="6721,225"c="8deafc,5,1,0"/><JD P1="6735,254"P2="7344,254"c="8deafc,5,1,0"/><JD P1="6722,224"P2="7155,192"c="8deafc,5,1,0"/><JD P1="6410,506"P2="6410,1550"c="8deafc,9,1,0"/><JD P1="6460,468"P2="6460,1550"c="8deafc,9,1,0"/><JD P1="6510,429"P2="6510,1550"c="8deafc,9,1,0"/><JD P1="6560,392"P2="6560,1550"c="8deafc,9,1,0"/><JD P1="6365,502"P2="6380,527"c="8deafc,5,1,0"/><VL n="boat_s1"l="23"/><JD P1="6506,764"P2="6602,771"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6602,771"P2="6694,771"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6694,771"P2="6783,764"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6757,765"P2="6789,755"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6789,755"P2="6779,772"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6779,772"P2="6747,777"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6747,777"P2="6623,780"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6623,780"P2="6497,773"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6497,773"P2="6468,752"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6468,752"P2="6467,747"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6467,747"P2="6506,751"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6506,751"P2="6498,766"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6484,751"P2="6497,764"c="1d3809,12,1,1"M1="5"M2="5"/><JD P1="6790,755"P2="6794,753"c="1d3809,10,1,1"M1="5"M2="5"/><JD P1="6477,765"P2="6499,744"c="142606,6,1,1"M1="5"M2="5"/><JD P1="6505,774"P2="6519,761"c="142606,6,1,1"M1="5"M2="5"/><JD P1="6530,776"P2="6543,763"c="142606,6,1,1"M1="5"M2="5"/><JD P1="6555,778"P2="6567,766"c="142606,6,1,1"M1="5"M2="5"/><JD P1="6582,781"P2="6593,768"c="142606,4,1,1"M1="5"M2="5"/><JD P1="6607,782"P2="6618,768"c="142606,4,1,1"M1="5"M2="5"/><JD P1="6628,781"P2="6639,768"c="142606,4,1,1"M1="5"M2="5"/><JD P1="6649,783"P2="6663,767"c="142606,3,1,1"M1="5"M2="5"/><JD P1="6673,782"P2="6684,768"c="142606,3,1,1"M1="5"M2="5"/><JD P1="6697,781"P2="6706,766"c="142606,2,1,1"M1="5"M2="5"/><JD P1="6717,782"P2="6727,765"c="142606,2,1,1"M1="5"M2="5"/><JD P1="6742,781"P2="6755,760"c="142606,1,1,1"M1="5"M2="5"/><JD P1="6766,778"P2="6779,753"c="142606,1,1,1"M1="5"M2="5"/><JD P1="6636,775"P2="6636,776"c="142606,1,1,1"M1="5"M2="5"/><VL n="boat_s2"l="23"/><JD P1="6459,742"P2="6468,760"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6468,760"P2="6480,771"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6480,771"P2="6500,778"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6500,778"P2="6540,781"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6540,781"P2="6589,784"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6589,784"P2="6653,785"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6653,785"P2="6720,785"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6720,785"P2="6763,782"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6763,782"P2="6785,774"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6785,775"P2="6794,760"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6794,760"P2="6801,746"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6460,741"P2="6512,744"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6512,745"P2="6509,758"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6509,758"P2="6550,762"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6550,762"P2="6603,765"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6603,765"P2="6673,766"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6673,766"P2="6735,764"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6735,764"P2="6774,753"c="264a0b,4,1,1"M1="5"M2="5"/><JD P1="6774,753"P2="6799,747"c="264a0b,4,1,1"M1="5"M2="5"/><VL n="platform" l="-1" /><JD c="593d0c,7,1,0" P2="2453,817" P1="2421,608" /><JD c="593d0c,7,1,0" P2="2427,643" P1="2372,645" /><JD c="593d0c,7,1,0" P2="2425,820" P1="2391,610" /><JD c="4a3103,6,1,0" P2="2100,2400" P1="2100,650" /><JD c="4a3103,6,1,0" P2="2200,2400" P1="2200,650" /><JD c="4a3103,6,1,0" P2="2300,2400" P1="2300,650" /><JD c="4a3103,6,1,0" P2="2400,2400" P1="2400,650" /><JD c="4a3103,16,1,0" P2="2440,630" P1="2010,630" /><JD c="4a3103,16,1,0" P2="2440,645" P1="2010,645" /><JD c="593d0c,7,1,0" P2="2188,634" P1="2023,636" /><JD c="593d0c,7,1,0" P2="2293,643" P1="2221,643" /><JD c="593d0c,7,1,0" P2="2406,629" P1="2306,633" /><JD c="593d0c,7,1,0" P2="2445,787" P1="2422,792" /><JD c="593d0c,7,1,0" P2="2443,762" P1="2418,769" /><JD c="593d0c,7,1,0" P2="2436,735" P1="2415,741" /><JD c="593d0c,7,1,0" P2="2431,704" P1="2408,711" /><JD c="593d0c,7,1,0" P2="2430,675" P1="2404,681" /><JD c="4a3103,7,1,0" P2="2012,649" P1="2013,567" /><JD c="4a3103,7,1,0" P2="2359,594" P1="2014,594" /><JD c="4a3103,4,1,0" P2="2056,631" P1="2056,597" /><JD c="4a3103,4,1,0" P2="2106,621" P1="2106,597" /><JD c="4a3103,4,1,0" P2="2156,621" P1="2156,594" /><JD c="4a3103,4,1,0" P2="2206,625" P1="2206,597" /><JD c="4a3103,4,1,0" P2="2256,632" P1="2256,597" /><JD c="4a3103,4,1,0" P2="2306,640" P1="2306,594" /><JD c="4a3103,4,1,0" P2="2356,636" P1="2356,594" /><JD c="468c11,8,1,0" P2="2034,670" P1="2028,655" /><JD c="468c11,8,1,0" P2="2043,660" P1="2042,656" /><JD c="468c11,8,1,0" P2="2062,669" P1="2063,654" /><JD c="468c11,8,1,0" P2="2078,658" P1="2078,653" /><JD c="468c11,8,1,0" P2="2106,667" P1="2103,652" /><JD c="468c11,8,1,0" P2="2121,655" P1="2118,653" /><JD c="468c11,8,1,0" P2="2142,671" P1="2139,653" /><JD c="468c11,8,1,0" P2="2165,656" P1="2163,654" /><JD c="468c11,8,1,0" P2="2188,667" P1="2188,656" /><JD c="468c11,8,1,0" P2="2212,657" P1="2217,654" /><JD c="468c11,8,1,0" P2="2232,669" P1="2241,650" /><JD c="468c11,8,1,0" P2="2259,658" P1="2265,651" /><JD c="468c11,8,1,0" P2="2284,678" P1="2284,655" /><JD c="468c11,8,1,0" P2="2303,661" P1="2304,654" /><JD c="468c11,8,1,0" P2="2327,661" P1="2328,655" /><JD c="468c11,8,1,0" P2="2350,660" P1="2349,653" /><JD c="468c11,8,1,0" P2="2361,677" P1="2367,653" /><JD c="468c11,8,1,0" P2="2386,660" P1="2386,652" /><JD c="468c11,8,1,0" P2="2441,656" P1="2440,653" /><JD c="34690c,4,1,0" P2="2092,830" P1="2097,816" /><JD c="34690c,4,1,0" P2="2110,943" P1="2101,927" /><JD c="34690c,4,1,0" P2="2087,1130" P1="2100,1116" /><JD c="34690c,4,1,0" P2="2112,1259" P1="2105,1244" /><JD c="34690c,4,1,0" P2="2089,1371" P1="2097,1352" /><JD c="34690c,4,1,0" P2="2115,1531" P1="2102,1509" /><JD c="34690c,4,1,0" P2="2190,875" P1="2199,865" /><JD c="34690c,4,1,0" P2="2211,1029" P1="2201,1015" /><JD c="34690c,4,1,0" P2="2185,1165" P1="2199,1154" /><JD c="34690c,4,1,0" P2="2213,1325" P1="2202,1307" /><JD c="34690c,4,1,0" P2="2183,1456" P1="2197,1442" /><JD c="34690c,4,1,0" P2="2286,751" P1="2296,736" /><JD c="34690c,4,1,0" P2="2314,925" P1="2302,908" /><JD c="34690c,4,1,0" P2="2289,1072" P1="2300,1060" /><JD c="34690c,4,1,0" P2="2309,1215" P1="2301,1206" /><JD c="34690c,4,1,0" P2="2291,1373" P1="2298,1363" /><JD c="34690c,4,1,0" P2="2311,1509" P1="2301,1497" /><JD c="34690c,4,1,0" P2="2391,899" P1="2397,888" /><JD c="34690c,4,1,0" P2="2417,996" P1="2404,980" /><JD c="34690c,4,1,0" P2="2387,1130" P1="2399,1117" /><JD c="34690c,4,1,0" P2="2412,1217" P1="2402,1207" /><JD c="34690c,4,1,0" P2="2384,1301" P1="2396,1290" /><JD c="34690c,4,1,0" P2="2415,1435" P1="2403,1424" /><VL n="seabed2"l="-1"/><JD P1="202,1349"P2="195,1321"c="61a60c,10,1,1"/><JD P1="195,1321"P2="211,1284"c="61a60c,10,1,1"/><JD P1="211,1284"P2="194,1241"c="61a60c,10,1,1"/><JD P1="194,1241"P2="214,1191"c="61a60c,10,1,1"/><JD P1="338,1338"P2="329,1313"c="61a60c,10,1,1"/><JD P1="329,1313"P2="339,1293"c="61a60c,10,1,1"/><JD P1="339,1292"P2="329,1267"c="61a60c,10,1,1"/><JD P1="329,1267"P2="333,1256"c="61a60c,10,1,1"/><JD P1="275,1337"P2="265,1297"c="61a60c,10,1,1"/><JD P1="265,1297"P2="277,1268"c="61a60c,10,1,1"/><JD P1="277,1268"P2="267,1235"c="61a60c,10,1,1"/><JD P1="201,1304"P2="192,1308"c="4b7d0a,6,1,1"/><JD P1="204,1260"P2="214,1265"c="4b7d0a,6,1,1"/><JD P1="206,1205"P2="195,1212"c="4b7d0a,6,1,1"/><JD P1="266,1309"P2="258,1312"c="4b7d0a,6,1,1"/><JD P1="276,1273"P2="283,1277"c="4b7d0a,6,1,1"/><JD P1="334,1298"P2="323,1302"c="4b7d0a,6,1,1"/><JD P1="334,1259"P2="343,1262"c="4b7d0a,6,1,1"/><JD P1="807,1307"P2="799,1277"c="61a60c,10,1,1"/><JD P1="799,1277"P2="811,1243"c="61a60c,10,1,1"/><JD P1="811,1243"P2="793,1201"c="61a60c,10,1,1"/><JD P1="793,1201"P2="814,1148"c="61a60c,10,1,1"/><JD P1="814,1148"P2="798,1116"c="61a60c,10,1,1"/><JD P1="914,1293"P2="904,1252"c="61a60c,10,1,1"/><JD P1="904,1252"P2="914,1222"c="61a60c,10,1,1"/><JD P1="914,1222"P2="903,1189"c="61a60c,10,1,1"/><JD P1="903,1189"P2="913,1166"c="61a60c,10,1,1"/><JD P1="1043,1276"P2="1030,1224"c="61a60c,10,1,1"/><JD P1="1030,1224"P2="1045,1198"c="61a60c,10,1,1"/><JD P1="1045,1198"P2="1038,1186"c="61a60c,10,1,1"/><JD P1="1158,1263"P2="1146,1233"c="61a60c,10,1,1"/><JD P1="1146,1233"P2="1154,1211"c="61a60c,10,1,1"/><JD P1="802,1264"P2="790,1270"c="4b7d0a,6,1,1"/><JD P1="798,1210"P2="811,1215"c="4b7d0a,6,1,1"/><JD P1="809,1158"P2="800,1162"c="4b7d0a,6,1,1"/><JD P1="911,1235"P2="920,1239"c="4b7d0a,6,1,1"/><JD P1="904,1199"P2="897,1203"c="4b7d0a,6,1,1"/><JD P1="1033,1242"P2="1026,1245"c="4b7d0a,6,1,1"/><JD P1="1044,1202"P2="1049,1205"c="4b7d0a,6,1,1"/><JD P1="1145,1235"P2="1137,1239"c="4b7d0a,6,1,1"/><JD P1="1417,1231"P2="1406,1177"c="61a60c,10,1,1"/><JD P1="1406,1177"P2="1423,1121"c="61a60c,10,1,1"/><JD P1="1423,1121"P2="1403,1069"c="61a60c,10,1,1"/><JD P1="1504,1219"P2="1497,1179"c="61a60c,10,1,1"/><JD P1="1497,1179"P2="1512,1147"c="61a60c,10,1,1"/><JD P1="1512,1147"P2="1504,1116"c="61a60c,10,1,1"/><JD P1="1605,1206"P2="1598,1179"c="61a60c,10,1,1"/><JD P1="1598,1179"P2="1608,1156"c="61a60c,10,1,1"/><JD P1="1608,1156"P2="1606,1142"c="61a60c,10,1,1"/><JD P1="1407,1194"P2="1398,1200"c="4b7d0a,6,1,1"/><JD P1="1418,1144"P2="1428,1148"c="4b7d0a,6,1,1"/><JD P1="1411,1096"P2="1401,1102"c="4b7d0a,6,1,1"/><JD P1="1500,1186"P2="1511,1194"c="4b7d0a,6,1,1"/><JD P1="1507,1134"P2="1499,1138"c="4b7d0a,6,1,1"/><JD P1="1603,1168"P2="1613,1173"c="4b7d0a,6,1,1"/><JD P1="1976,1180"P2="1966,1137"c="61a60c,10,1,1"/><JD P1="1966,1137"P2="1980,1098"c="61a60c,10,1,1"/><JD P1="1980,1098"P2="1966,1064"c="61a60c,10,1,1"/><JD P1="2081,1169"P2="2072,1135"c="61a60c,10,1,1"/><JD P1="2072,1135"P2="2081,1109"c="61a60c,10,1,1"/><JD P1="2081,1109"P2="2074,1090"c="61a60c,10,1,1"/><JD P1="1965,1142"P2="1957,1148"c="4b7d0a,6,1,1"/><JD P1="1978,1106"P2="1987,1111"c="4b7d0a,6,1,1"/><JD P1="1966,1069"P2="1959,1075"c="4b7d0a,6,1,1"/><JD P1="2075,1128"P2="2085,1133"c="4b7d0a,6,1,1"/><JD P1="2075,1095"P2="2068,1100"c="4b7d0a,6,1,1"/><JD P1="2509,1134"P2="2499,1089"c="61a60c,10,1,1"/><JD P1="2499,1089"P2="2511,1058"c="61a60c,10,1,1"/><JD P1="2511,1058"P2="2493,1021"c="61a60c,10,1,1"/><JD P1="2595,1125"P2="2583,1091"c="61a60c,10,1,1"/><JD P1="2583,1091"P2="2591,1065"c="61a60c,10,1,1"/><JD P1="2591,1065"P2="2579,1042"c="61a60c,10,1,1"/><JD P1="2666,1118"P2="2675,1085"c="61a60c,10,1,1"/><JD P1="2675,1085"P2="2667,1065"c="61a60c,10,1,1"/><JD P1="2667,1065"P2="2675,1042"c="61a60c,10,1,1"/><JD P1="2501,1101"P2="2490,1108"c="4b7d0a,6,1,1"/><JD P1="2509,1066"P2="2524,1069"c="4b7d0a,6,1,1"/><JD P1="2496,1030"P2="2486,1037"c="4b7d0a,6,1,1"/><JD P1="2583,1086"P2="2571,1091"c="4b7d0a,6,1,1"/><JD P1="2585,1051"P2="2594,1044"c="4b7d0a,6,1,1"/><JD P1="2673,1084"P2="2659,1089"c="4b7d0a,6,1,1"/><JD P1="2673,1052"P2="2686,1056"c="4b7d0a,6,1,1"/><JD P1="2995,1090"P2="2983,1031"c="61a60c,10,1,1"/><JD P1="2983,1031"P2="3003,989"c="61a60c,10,1,1"/><JD P1="3003,989"P2="2985,932"c="61a60c,10,1,1"/><JD P1="3095,1086"P2="3109,1035"c="61a60c,10,1,1"/><JD P1="3109,1035"P2="3093,996"c="61a60c,10,1,1"/><JD P1="3093,996"P2="3107,955"c="61a60c,10,1,1"/><JD P1="3204,1077"P2="3213,1035"c="61a60c,10,1,1"/><JD P1="3213,1035"P2="3195,1009"c="61a60c,10,1,1"/><JD P1="2985,1050"P2="2978,1056"c="4b7d0a,6,1,1"/><JD P1="2992,1012"P2="3001,1015"c="4b7d0a,6,1,1"/><JD P1="2991,956"P2="2980,959"c="4b7d0a,6,1,1"/><JD P1="3108,1038"P2="3096,1041"c="4b7d0a,6,1,1"/><JD P1="3094,996"P2="3106,999"c="4b7d0a,6,1,1"/><JD P1="3204,1024"P2="3197,1028"c="4b7d0a,6,1,1"/><JD P1="3212,1053"P2="3221,1054"c="4b7d0a,6,1,1"/><JD P1="3873,1068"P2="3861,1014"c="61a60c,10,1,1"/><JD P1="3861,1014"P2="3877,972"c="61a60c,10,1,1"/><JD P1="3877,972"P2="3862,938"c="61a60c,10,1,1"/><JD P1="3966,1062"P2="3950,1015"c="61a60c,10,1,1"/><JD P1="3950,1015"P2="3957,989"c="61a60c,10,1,1"/><JD P1="3957,989"P2="3950,976"c="61a60c,10,1,1"/><JD P1="4043,1058"P2="4035,1019"c="61a60c,10,1,1"/><JD P1="4035,1019"P2="4042,1005"c="61a60c,10,1,1"/><JD P1="3863,1033"P2="3856,1039"c="4b7d0a,6,1,1"/><JD P1="3871,989"P2="3883,996"c="4b7d0a,6,1,1"/><JD P1="3867,953"P2="3859,957"c="4b7d0a,6,1,1"/><JD P1="3957,1031"P2="3968,1034"c="4b7d0a,6,1,1"/><JD P1="3955,993"P2="3947,998"c="4b7d0a,6,1,1"/><JD P1="4040,1033"P2="4050,1036"c="4b7d0a,6,1,1"/><JD P1="4039,1008"P2="4030,1012"c="4b7d0a,6,1,1"/><JD P1="2493,1021"P2="2474,997"c="4bd411,3,1,1"/><JD P1="2494,1021"P2="2499,987"c="4bd411,3,1,1"/><JD P1="2579,1042"P2="2570,1026"c="4bd411,3,1,1"/><JD P1="2579,1042"P2="2585,1018"c="4bd411,3,1,1"/><JD P1="2675,1041"P2="2669,1023"c="4bd411,3,1,1"/><JD P1="2675,1041"P2="2684,1022"c="4bd411,3,1,1"/><JD P1="2985,932"P2="2976,915"c="4bd411,3,1,1"/><JD P1="2985,933"P2="2993,913"c="4bd411,3,1,1"/><JD P1="3106,954"P2="3098,937"c="4bd411,3,1,1"/><JD P1="3107,955"P2="3120,937"c="4bd411,3,1,1"/><JD P1="3195,1009"P2="3188,990"c="4bd411,3,1,1"/><JD P1="3195,1009"P2="3204,987"c="4bd411,3,1,1"/><JD P1="3862,937"P2="3856,925"c="4bd411,3,1,1"/><JD P1="3862,938"P2="3871,923"c="4bd411,3,1,1"/><JD P1="3950,978"P2="3941,956"c="4bd411,3,1,1"/><JD P1="3950,976"P2="3956,952"c="4bd411,3,1,1"/><JD P1="4041,1004"P2="4034,990"c="4bd411,3,1,1"/><JD P1="4042,1004"P2="4050,990"c="4bd411,3,1,1"/><JD P1="3855,924"P2="3859,914"c="4bd411,3,1,1"/><JD P1="3871,922"P2="3867,911"c="4bd411,3,1,1"/><JD P1="3941,957"P2="3943,943"c="4bd411,3,1,1"/><JD P1="3956,951"P2="3952,940"c="4bd411,3,1,1"/><JD P1="4033,989"P2="4036,979"c="4bd411,3,1,1"/><JD P1="4050,989"P2="4046,977"c="4bd411,3,1,1"/><JD P1="2976,914"P2="2980,902"c="4bd411,3,1,1"/><JD P1="2993,912"P2="2989,899"c="4bd411,3,1,1"/><JD P1="3098,938"P2="3101,924"c="4bd411,3,1,1"/><JD P1="3120,936"P2="3117,923"c="4bd411,3,1,1"/><JD P1="3187,989"P2="3190,971"c="4bd411,3,1,1"/><JD P1="3204,986"P2="3200,972"c="4bd411,3,1,1"/><JD P1="2473,997"P2="2477,975"c="4bd411,3,1,1"/><JD P1="2499,986"P2="2495,972"c="4bd411,3,1,1"/><JD P1="2570,1025"P2="2570,1006"c="4bd411,3,1,1"/><JD P1="2585,1018"P2="2580,1005"c="4bd411,3,1,1"/><JD P1="2668,1022"P2="2670,1006"c="4bd411,3,1,1"/><JD P1="2684,1021"P2="2678,1007"c="4bd411,3,1,1"/><JD P1="1966,1064"P2="1956,1050"c="4bd411,3,1,1"/><JD P1="1966,1063"P2="1973,1050"c="4bd411,3,1,1"/><JD P1="2073,1089"P2="2066,1074"c="4bd411,3,1,1"/><JD P1="2074,1088"P2="2080,1070"c="4bd411,3,1,1"/><JD P1="1606,1141"P2="1596,1124"c="4bd411,3,1,1"/><JD P1="1607,1140"P2="1613,1123"c="4bd411,3,1,1"/><JD P1="1503,1116"P2="1490,1102"c="4bd411,3,1,1"/><JD P1="1503,1116"P2="1509,1101"c="4bd411,3,1,1"/><JD P1="1403,1069"P2="1394,1056"c="4bd411,3,1,1"/><JD P1="1404,1069"P2="1413,1050"c="4bd411,3,1,1"/><JD P1="1153,1212"P2="1144,1196"c="4bd411,3,1,1"/><JD P1="1155,1210"P2="1161,1192"c="4bd411,3,1,1"/><JD P1="1038,1187"P2="1032,1174"c="4bd411,3,1,1"/><JD P1="1038,1186"P2="1044,1171"c="4bd411,3,1,1"/><JD P1="913,1165"P2="909,1149"c="4bd411,3,1,1"/><JD P1="914,1165"P2="922,1151"c="4bd411,3,1,1"/><JD P1="797,1115"P2="788,1104"c="4bd411,3,1,1"/><JD P1="797,1114"P2="805,1096"c="4bd411,3,1,1"/><JD P1="214,1191"P2="203,1168"c="4bd411,3,1,1"/><JD P1="214,1190"P2="226,1167"c="4bd411,3,1,1"/><JD P1="266,1234"P2="261,1219"c="4bd411,3,1,1"/><JD P1="266,1234"P2="276,1214"c="4bd411,3,1,1"/><JD P1="333,1254"P2="327,1236"c="4bd411,3,1,1"/><JD P1="334,1254"P2="342,1234"c="4bd411,3,1,1"/><VL n="seabed3"l="-1"/><JD P1="482,1309"P2="475,1281"c="61a60c,10,1,1"/><JD P1="475,1281"P2="491,1244"c="61a60c,10,1,1"/><JD P1="491,1244"P2="474,1201"c="61a60c,10,1,1"/><JD P1="474,1201"P2="494,1151"c="61a60c,10,1,1"/><JD P1="618,1298"P2="609,1273"c="61a60c,10,1,1"/><JD P1="609,1273"P2="619,1253"c="61a60c,10,1,1"/><JD P1="619,1252"P2="609,1227"c="61a60c,10,1,1"/><JD P1="609,1227"P2="613,1216"c="61a60c,10,1,1"/><JD P1="555,1297"P2="545,1257"c="61a60c,10,1,1"/><JD P1="545,1257"P2="557,1228"c="61a60c,10,1,1"/><JD P1="557,1228"P2="547,1195"c="61a60c,10,1,1"/><JD P1="481,1264"P2="472,1268"c="4b7d0a,6,1,1"/><JD P1="484,1220"P2="494,1225"c="4b7d0a,6,1,1"/><JD P1="486,1165"P2="475,1172"c="4b7d0a,6,1,1"/><JD P1="546,1269"P2="538,1272"c="4b7d0a,6,1,1"/><JD P1="556,1233"P2="563,1237"c="4b7d0a,6,1,1"/><JD P1="614,1258"P2="603,1262"c="4b7d0a,6,1,1"/><JD P1="614,1219"P2="623,1222"c="4b7d0a,6,1,1"/><JD P1="1087,1267"P2="1079,1237"c="61a60c,10,1,1"/><JD P1="1079,1237"P2="1091,1203"c="61a60c,10,1,1"/><JD P1="1091,1203"P2="1073,1161"c="61a60c,10,1,1"/><JD P1="1073,1161"P2="1094,1108"c="61a60c,10,1,1"/><JD P1="1094,1108"P2="1078,1076"c="61a60c,10,1,1"/><JD P1="1194,1253"P2="1184,1212"c="61a60c,10,1,1"/><JD P1="1184,1212"P2="1194,1182"c="61a60c,10,1,1"/><JD P1="1194,1182"P2="1183,1149"c="61a60c,10,1,1"/><JD P1="1183,1149"P2="1193,1126"c="61a60c,10,1,1"/><JD P1="1323,1236"P2="1310,1184"c="61a60c,10,1,1"/><JD P1="1310,1184"P2="1325,1158"c="61a60c,10,1,1"/><JD P1="1325,1158"P2="1318,1146"c="61a60c,10,1,1"/><JD P1="1438,1223"P2="1426,1193"c="61a60c,10,1,1"/><JD P1="1426,1193"P2="1434,1171"c="61a60c,10,1,1"/><JD P1="1082,1224"P2="1070,1230"c="4b7d0a,6,1,1"/><JD P1="1078,1170"P2="1091,1175"c="4b7d0a,6,1,1"/><JD P1="1089,1118"P2="1080,1122"c="4b7d0a,6,1,1"/><JD P1="1191,1195"P2="1200,1199"c="4b7d0a,6,1,1"/><JD P1="1184,1159"P2="1177,1163"c="4b7d0a,6,1,1"/><JD P1="1313,1202"P2="1306,1205"c="4b7d0a,6,1,1"/><JD P1="1324,1162"P2="1329,1165"c="4b7d0a,6,1,1"/><JD P1="1425,1195"P2="1417,1199"c="4b7d0a,6,1,1"/><JD P1="1697,1191"P2="1686,1137"c="61a60c,10,1,1"/><JD P1="1686,1137"P2="1703,1081"c="61a60c,10,1,1"/><JD P1="1703,1081"P2="1683,1029"c="61a60c,10,1,1"/><JD P1="1784,1179"P2="1777,1139"c="61a60c,10,1,1"/><JD P1="1777,1139"P2="1792,1107"c="61a60c,10,1,1"/><JD P1="1792,1107"P2="1784,1076"c="61a60c,10,1,1"/><JD P1="1885,1166"P2="1878,1139"c="61a60c,10,1,1"/><JD P1="1878,1139"P2="1888,1116"c="61a60c,10,1,1"/><JD P1="1888,1116"P2="1886,1102"c="61a60c,10,1,1"/><JD P1="1687,1154"P2="1678,1160"c="4b7d0a,6,1,1"/><JD P1="1698,1104"P2="1708,1108"c="4b7d0a,6,1,1"/><JD P1="1691,1056"P2="1681,1062"c="4b7d0a,6,1,1"/><JD P1="1780,1146"P2="1791,1154"c="4b7d0a,6,1,1"/><JD P1="1787,1094"P2="1779,1098"c="4b7d0a,6,1,1"/><JD P1="1883,1128"P2="1893,1133"c="4b7d0a,6,1,1"/><JD P1="2256,1140"P2="2246,1097"c="61a60c,10,1,1"/><JD P1="2246,1097"P2="2260,1058"c="61a60c,10,1,1"/><JD P1="2260,1058"P2="2246,1024"c="61a60c,10,1,1"/><JD P1="2361,1129"P2="2352,1095"c="61a60c,10,1,1"/><JD P1="2352,1095"P2="2361,1069"c="61a60c,10,1,1"/><JD P1="2361,1069"P2="2354,1050"c="61a60c,10,1,1"/><JD P1="2245,1102"P2="2237,1108"c="4b7d0a,6,1,1"/><JD P1="2258,1066"P2="2267,1071"c="4b7d0a,6,1,1"/><JD P1="2246,1029"P2="2239,1035"c="4b7d0a,6,1,1"/><JD P1="2355,1088"P2="2365,1093"c="4b7d0a,6,1,1"/><JD P1="2355,1055"P2="2348,1060"c="4b7d0a,6,1,1"/><JD P1="2789,1094"P2="2779,1049"c="61a60c,10,1,1"/><JD P1="2779,1049"P2="2791,1018"c="61a60c,10,1,1"/><JD P1="2791,1018"P2="2773,981"c="61a60c,10,1,1"/><JD P1="2875,1085"P2="2863,1051"c="61a60c,10,1,1"/><JD P1="2863,1051"P2="2871,1025"c="61a60c,10,1,1"/><JD P1="2871,1025"P2="2859,1002"c="61a60c,10,1,1"/><JD P1="2946,1078"P2="2955,1045"c="61a60c,10,1,1"/><JD P1="2955,1045"P2="2947,1025"c="61a60c,10,1,1"/><JD P1="2947,1025"P2="2955,1002"c="61a60c,10,1,1"/><JD P1="2781,1061"P2="2770,1068"c="4b7d0a,6,1,1"/><JD P1="2789,1026"P2="2804,1029"c="4b7d0a,6,1,1"/><JD P1="2776,990"P2="2766,997"c="4b7d0a,6,1,1"/><JD P1="2863,1046"P2="2851,1051"c="4b7d0a,6,1,1"/><JD P1="2865,1011"P2="2874,1004"c="4b7d0a,6,1,1"/><JD P1="2953,1044"P2="2939,1049"c="4b7d0a,6,1,1"/><JD P1="2953,1012"P2="2966,1016"c="4b7d0a,6,1,1"/><JD P1="3275,1050"P2="3263,991"c="61a60c,10,1,1"/><JD P1="3263,991"P2="3283,949"c="61a60c,10,1,1"/><JD P1="3283,949"P2="3265,892"c="61a60c,10,1,1"/><JD P1="3375,1046"P2="3389,995"c="61a60c,10,1,1"/><JD P1="3389,995"P2="3373,956"c="61a60c,10,1,1"/><JD P1="3373,956"P2="3387,915"c="61a60c,10,1,1"/><JD P1="3484,1037"P2="3493,995"c="61a60c,10,1,1"/><JD P1="3493,995"P2="3475,969"c="61a60c,10,1,1"/><JD P1="3265,1010"P2="3258,1016"c="4b7d0a,6,1,1"/><JD P1="3272,972"P2="3281,975"c="4b7d0a,6,1,1"/><JD P1="3271,916"P2="3260,919"c="4b7d0a,6,1,1"/><JD P1="3388,998"P2="3376,1001"c="4b7d0a,6,1,1"/><JD P1="3374,956"P2="3386,959"c="4b7d0a,6,1,1"/><JD P1="3484,984"P2="3477,988"c="4b7d0a,6,1,1"/><JD P1="3492,1013"P2="3501,1014"c="4b7d0a,6,1,1"/><JD P1="4153,1028"P2="4141,974"c="61a60c,10,1,1"/><JD P1="4141,974"P2="4157,932"c="61a60c,10,1,1"/><JD P1="4157,932"P2="4142,898"c="61a60c,10,1,1"/><JD P1="4246,1022"P2="4230,975"c="61a60c,10,1,1"/><JD P1="4230,975"P2="4237,949"c="61a60c,10,1,1"/><JD P1="4237,949"P2="4230,936"c="61a60c,10,1,1"/><JD P1="4323,1018"P2="4315,979"c="61a60c,10,1,1"/><JD P1="4315,979"P2="4322,965"c="61a60c,10,1,1"/><JD P1="4143,993"P2="4136,999"c="4b7d0a,6,1,1"/><JD P1="4151,949"P2="4163,956"c="4b7d0a,6,1,1"/><JD P1="4147,913"P2="4139,917"c="4b7d0a,6,1,1"/><JD P1="4237,991"P2="4248,994"c="4b7d0a,6,1,1"/><JD P1="4235,953"P2="4227,958"c="4b7d0a,6,1,1"/><JD P1="4320,993"P2="4330,996"c="4b7d0a,6,1,1"/><JD P1="4319,968"P2="4310,972"c="4b7d0a,6,1,1"/><JD P1="2773,981"P2="2754,957"c="4bd411,3,1,1"/><JD P1="2774,981"P2="2779,947"c="4bd411,3,1,1"/><JD P1="2859,1002"P2="2850,986"c="4bd411,3,1,1"/><JD P1="2859,1002"P2="2865,978"c="4bd411,3,1,1"/><JD P1="2955,1001"P2="2949,983"c="4bd411,3,1,1"/><JD P1="2955,1001"P2="2964,982"c="4bd411,3,1,1"/><JD P1="3265,892"P2="3256,875"c="4bd411,3,1,1"/><JD P1="3265,893"P2="3273,873"c="4bd411,3,1,1"/><JD P1="3386,914"P2="3378,897"c="4bd411,3,1,1"/><JD P1="3387,915"P2="3400,897"c="4bd411,3,1,1"/><JD P1="3475,969"P2="3468,950"c="4bd411,3,1,1"/><JD P1="3475,969"P2="3484,947"c="4bd411,3,1,1"/><JD P1="4142,897"P2="4136,885"c="4bd411,3,1,1"/><JD P1="4142,898"P2="4151,883"c="4bd411,3,1,1"/><JD P1="4230,938"P2="4221,916"c="4bd411,3,1,1"/><JD P1="4230,936"P2="4236,912"c="4bd411,3,1,1"/><JD P1="4321,964"P2="4314,950"c="4bd411,3,1,1"/><JD P1="4322,964"P2="4330,950"c="4bd411,3,1,1"/><JD P1="4135,884"P2="4139,874"c="4bd411,3,1,1"/><JD P1="4151,882"P2="4147,871"c="4bd411,3,1,1"/><JD P1="4221,917"P2="4223,903"c="4bd411,3,1,1"/><JD P1="4236,911"P2="4232,900"c="4bd411,3,1,1"/><JD P1="4313,949"P2="4316,939"c="4bd411,3,1,1"/><JD P1="4330,949"P2="4326,937"c="4bd411,3,1,1"/><JD P1="3256,874"P2="3260,862"c="4bd411,3,1,1"/><JD P1="3273,872"P2="3269,859"c="4bd411,3,1,1"/><JD P1="3378,898"P2="3381,884"c="4bd411,3,1,1"/><JD P1="3400,896"P2="3397,883"c="4bd411,3,1,1"/><JD P1="3467,949"P2="3470,931"c="4bd411,3,1,1"/><JD P1="3484,946"P2="3480,932"c="4bd411,3,1,1"/><JD P1="2753,957"P2="2757,935"c="4bd411,3,1,1"/><JD P1="2779,946"P2="2775,932"c="4bd411,3,1,1"/><JD P1="2850,985"P2="2850,966"c="4bd411,3,1,1"/><JD P1="2865,978"P2="2860,965"c="4bd411,3,1,1"/><JD P1="2948,982"P2="2950,966"c="4bd411,3,1,1"/><JD P1="2964,981"P2="2958,967"c="4bd411,3,1,1"/><JD P1="2246,1024"P2="2236,1010"c="4bd411,3,1,1"/><JD P1="2246,1023"P2="2253,1010"c="4bd411,3,1,1"/><JD P1="2353,1049"P2="2346,1034"c="4bd411,3,1,1"/><JD P1="2354,1048"P2="2360,1030"c="4bd411,3,1,1"/><JD P1="1886,1101"P2="1876,1084"c="4bd411,3,1,1"/><JD P1="1887,1100"P2="1893,1083"c="4bd411,3,1,1"/><JD P1="1783,1076"P2="1770,1062"c="4bd411,3,1,1"/><JD P1="1783,1076"P2="1789,1061"c="4bd411,3,1,1"/><JD P1="1683,1029"P2="1674,1016"c="4bd411,3,1,1"/><JD P1="1684,1029"P2="1693,1010"c="4bd411,3,1,1"/><JD P1="1433,1172"P2="1424,1156"c="4bd411,3,1,1"/><JD P1="1435,1170"P2="1441,1152"c="4bd411,3,1,1"/><JD P1="1318,1147"P2="1312,1134"c="4bd411,3,1,1"/><JD P1="1318,1146"P2="1324,1131"c="4bd411,3,1,1"/><JD P1="1193,1125"P2="1189,1109"c="4bd411,3,1,1"/><JD P1="1194,1125"P2="1202,1111"c="4bd411,3,1,1"/><JD P1="1077,1075"P2="1068,1064"c="4bd411,3,1,1"/><JD P1="1077,1074"P2="1085,1056"c="4bd411,3,1,1"/><JD P1="494,1151"P2="483,1128"c="4bd411,3,1,1"/><JD P1="494,1150"P2="506,1127"c="4bd411,3,1,1"/><JD P1="546,1194"P2="541,1179"c="4bd411,3,1,1"/><JD P1="546,1194"P2="556,1174"c="4bd411,3,1,1"/><JD P1="613,1214"P2="607,1196"c="4bd411,3,1,1"/><JD P1="614,1214"P2="622,1194"c="4bd411,3,1,1"/><VL n="sea" l="-1" /><JD c="0654CD,250,0.96,1" P2="9000,900" P1="-1000,900" /><JD c="0654CD,250,0.96,1" P2="9000,1150" P1="-1000,1150" /><JD c="0654CD,250,0.96,1" P2="9000,1400" P1="-1000,1400" /><JD c="0654CD,250,0.96,1" P2="9000,1650" P1="-1000,1650" /><JD c="0654CD,250,0.96,1" P2="9000,1900" P1="-1000,1900" /><JD c="0654CD,250,0.96,1" P2="9000,2150" P1="-1000,2150" /><JD c="0654CD,250,0.96,1" P2="9000,2400" P1="-1000,2400" /><JD c="0654CD,4,0.64,1" P2="9000,773" P1="-1000,773" /><VL n="clouds1"l="26"/><JD P1="5728,269"P2="5728,270"c="ffffff,96,0.9,1"/><JD P1="5790,269"P2="5790,270"c="ffffff,96,0.9,1"/><JD P1="5858,274"P2="5858,275"c="ffffff,96,0.9,1"/><JD P1="5923,274"P2="5923,275"c="ffffff,96,0.9,1"/><JD P1="5751,219"P2="5751,220"c="ffffff,96,0.9,1"/><JD P1="5810,224"P2="5810,225"c="ffffff,96,0.9,1"/><JD P1="5870,227"P2="5870,228"c="ffffff,96,0.9,1"/><JD P1="6250,117"P2="6250,118"c="ffffff,80,0.95,1"/><JD P1="6297,122"P2="6297,123"c="ffffff,80,0.95,1"/><JD P1="6339,123"P2="6339,124"c="ffffff,80,0.95,1"/><JD P1="6385,125"P2="6385,126"c="ffffff,80,0.95,1"/><JD P1="6277,80"P2="6277,81"c="ffffff,80,0.95,1"/><JD P1="6325,82"P2="6325,83"c="ffffff,80,0.95,1"/><JD P1="6364,81"P2="6364,82"c="ffffff,80,0.95,1"/><JD P1="6561,379"P2="6561,380"c="ffffff,120,0.85,1"/><JD P1="6625,378"P2="6625,379"c="ffffff,120,0.85,1"/><JD P1="6680,376"P2="6680,377"c="ffffff,120,0.85,1"/><JD P1="6745,381"P2="6745,382"c="ffffff,120,0.85,1"/><JD P1="6803,382"P2="6803,383"c="ffffff,120,0.85,1"/><JD P1="6601,314"P2="6601,315"c="ffffff,120,0.85,1"/><JD P1="6665,313"P2="6665,314"c="ffffff,120,0.85,1"/><JD P1="6732,313"P2="6732,314"c="ffffff,120,0.85,1"/><JD P1="6956,108"P2="6956,109"c="ffffff,60,1,1"/><JD P1="6999,110"P2="6999,111"c="ffffff,60,1,1"/><JD P1="7031,112"P2="7031,113"c="ffffff,60,1,1"/><JD P1="7068,114"P2="7068,115"c="ffffff,60,1,1"/><JD P1="6985,82"P2="6985,83"c="ffffff,60,1,1"/><JD P1="7027,85"P2="7027,86"c="ffffff,60,1,1"/><JD P1="7051,87"P2="7051,88"c="ffffff,60,1,1"/><VL n="clouds2"l="26"/><JD P1="3228,309"P2="3228,310"c="ffffff,96,0.9,1"/><JD P1="3290,309"P2="3290,310"c="ffffff,96,0.9,1"/><JD P1="3358,314"P2="3358,315"c="ffffff,96,0.9,1"/><JD P1="3423,314"P2="3423,315"c="ffffff,96,0.9,1"/><JD P1="3251,259"P2="3251,260"c="ffffff,96,0.9,1"/><JD P1="3310,264"P2="3310,265"c="ffffff,96,0.9,1"/><JD P1="3370,267"P2="3370,268"c="ffffff,96,0.9,1"/><JD P1="3750,157"P2="3750,158"c="ffffff,80,0.95,1"/><JD P1="3797,162"P2="3797,163"c="ffffff,80,0.95,1"/><JD P1="3839,163"P2="3839,164"c="ffffff,80,0.95,1"/><JD P1="3885,165"P2="3885,166"c="ffffff,80,0.95,1"/><JD P1="3777,120"P2="3777,121"c="ffffff,80,0.95,1"/><JD P1="3825,122"P2="3825,123"c="ffffff,80,0.95,1"/><JD P1="3864,121"P2="3864,122"c="ffffff,80,0.95,1"/><JD P1="4061,419"P2="4061,420"c="ffffff,120,0.85,1"/><JD P1="4125,418"P2="4125,419"c="ffffff,120,0.85,1"/><JD P1="4180,416"P2="4180,417"c="ffffff,120,0.85,1"/><JD P1="4245,421"P2="4245,422"c="ffffff,120,0.85,1"/><JD P1="4303,422"P2="4303,423"c="ffffff,120,0.85,1"/><JD P1="4101,354"P2="4101,355"c="ffffff,120,0.85,1"/><JD P1="4165,353"P2="4165,354"c="ffffff,120,0.85,1"/><JD P1="4232,353"P2="4232,354"c="ffffff,120,0.85,1"/><JD P1="4456,148"P2="4456,149"c="ffffff,60,1,1"/><JD P1="4499,150"P2="4499,151"c="ffffff,60,1,1"/><JD P1="4531,152"P2="4531,153"c="ffffff,60,1,1"/><JD P1="4568,154"P2="4568,155"c="ffffff,60,1,1"/><JD P1="4485,122"P2="4485,123"c="ffffff,60,1,1"/><JD P1="4527,125"P2="4527,126"c="ffffff,60,1,1"/><JD P1="4551,127"P2="4551,128"c="ffffff,60,1,1"/><JR M1="5" M2="6" /><JR M1="6" M2="7" /><JR M1="5" M2="8" /><L /></L></Z></C>')
ui.setMapName("Super Aqua Park - LUA Map made by Nasus_assassin#1534/Spectra_phantom#6089<")
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	ui.setMapName("Super Aqua Park - LUA Map made by Nasus_assassin#1534/Spectra_phantom#6089<")
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
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

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7631682")
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou<br>/sala #anvilwar00waterpark = Parque Aquático<br>/sala #anvilwar00fall2 = Fall Racing 2")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou<br>/sala #anvilwar00waterpark = Parque Aquático<br>/sala #anvilwar00fall2 = Fall Racing 2")
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

tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.91<br>by Spectra_phantom#6089<br><br>The requested room is loading or updating. Please wait...",nil)

if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
	active = ""
	Disabled()
elseif string.find(tfm.get.room.name,"mestre") then
	active = "mestre"
	initMestre()
elseif string.find(tfm.get.room.name,"waterpark") then
	active = "waterpark"
	initWaterPark()
elseif string.find(tfm.get.room.name,"fall2") then
	active = "fall2"
	initFalling()
elseif string.find(tfm.get.room.name,"rooms") then
	active = "rooms"
	Rooms()
else
	active = "anvilwar"
	initAnvilwar()
end
