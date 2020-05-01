--[[ Script contendo o module #anvilwar, #mestre, #truefalse, #objects, #pistas, #forca e #watercatch. Compilado às 14h09 (UTC) 01/05/2020. ]]--

local modulo = {
	_NOME = "anvilwar",
	_VERSION = "1.106",
	_AUTHOR = "Spectra_phantom#6089"
}

active = ""

initAnvilwar = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
powerups={choosed="",r_azul=false,r_vermelho=false,multi_count=0,int_azul=2,int_vermelho=2,immortal=false,immortal2=false,double=false,triple=false,objeto=false,explosion=false,sequence=false}
objetos={1,2,3,4,6,7,10,23,32,34,35,39,45,46,54,60,61,62,65,67,68,69,89,90,95}
play_azul={}
players_table={}
caps={azul="",vermelho=""}
play_vermelho={}
avs_list={}
banned_list={}
mods_list={"Nasus_assassin#1534","Aquawings#2537","Dhanny_mheyran#6701"}
managers_list={"Reksai_void2600#6638","Shun_kazami#7014"}
admins_list={"Spectra_phantom#6089"}
ninjas_list={"Karthus#2280","Aphelios#1910"}
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
for _,f in next,{"help","powerups","set","tc","p","score","kill","tt","rv","cap","cmd","ban","unban","rodar","pw","TC","shutdown","run"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v2)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","The Darkness Abyss","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","","","","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage"}
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
	bar = "#anvilwar - RTM 18412.131",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Reksai_void2600#6638<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) e Puiguirata#0000 (DE)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!",
	seconds30 = "<ROSE>Faltam 30 segundos!<br><br>Não é mais permitido reviver jogadores nos 30 segundos finais.",
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
	rs1 = "acionou o powerup Reduzir Tamanho!",
	rs2 = "<br>Neste powerup, você reduzirá o tamanho do seu rato até o término da partida.",
	sq1 = "acionou o powerup Sequência de Bigornas!",
	sq2 = "<br>Neste powerup, você vai atirar várias bigornas em sequência.",
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
	bar = "#anvilwar - RTM 18412.131",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Reksai_void2600#6638<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!",
	seconds30 = "<ROSE>30 seconds remaining!<br>Isn't allowed to revive players at 60 final seconds.",
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
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
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
bar = "#anvilwar - RTM 18412.131",
intensity = "قوة الضرب وسرعته",
your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Reksai_void2600#6638<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) and Puiguirata#0000 (DE)",
teamkill1 = "أوه لا!! ",
teamKill2 = "قام بقتل عضو من فريقه!",
ajuda = "المساعدة",
credits = "Credits",
mostrar = "أظهر",
seconds = "<ROSE>60 ثانية متبقية!",
seconds30 = "<ROSE>30 ثانية متبقية!<br>Isn't allowed to revive players at 30 final seconds.",
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
rs1 = "used the powerup Decrease Size!",
rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
sq1 = "used the powerup Anvil Sequence!",
sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "#anvilwar - RTM 18412.131",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES) y Puiguirata#0000 (DE)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!",
	seconds30 = "<ROSE>¡Quedan 30 segundos!<br>Isn't allowed to revive players at 30 final seconds.",
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
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "#anvilwar - RTM 18412.131",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) und Puiguirata#0000 (DE)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!",
	seconds30 = "<ROSE>Noch 30 Sekunden!<br>Isn't allowed to revive players at 30 final seconds.",
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
	rs1 = "used the powerup Decrease Size!",
	rs2 = "<br>On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "<br>On this powerup, you will shoot a lot of anvils in sequence.",
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
		if data[name].level >= 3 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			tfm.exec.killPlayer(message:sub(6))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "pw") then
		if data[name].level >= 4 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			tfm.exec.setRoomPassword(message:sub(4))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
	end
	if(message:sub(0,5) == "rodar") then
		if data[name].level >= 3 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			tfm.exec.newGame(mapas[tonumber(message:sub(7))])
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "run") then
		if data[name].level >= 4 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			tfm.exec.newGame(message:sub(5))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "ban") then
		if data[name].level >= 3 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
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
		if data[name].level >= 3 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
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
	if(message:sub(0,2) == "tc") or (message:sub(0,2) == "TC") then
		local typer=name
		if data[typer].team == "azul" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "azul" then
					tfm.exec.chatMessage("<font color='#0080ff'>• ["..typer.."] "..message:sub(4).."",name)
					tfm.exec.chatMessage("<font color='#0080ff'>• ["..typer.."] "..message:sub(4).."","Spectra_phantom#6089")
				end
			end
		elseif data[typer].team == "vermelho" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "vermelho" then
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."",name)
					tfm.exec.chatMessage("<font color='#fF7000'>• ["..typer.."] "..message:sub(4).."","Spectra_phantom#6089")
				end
			end
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "set") then
		if data[name].level >= 4 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
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
				ui.addPopup(1201,2,"1 = 5pts<br>2 = 10pts<br>3 = 15pts<br>4 = 20pts<br>5 = 25pts",name,350,225,200,true)
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
			if data[temp_name3] and tempo >= 30 and sudden_death == false then
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
		if data[name].level >= 4 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			temp_name=message:sub(7)
			ui.addPopup(906,2,"Score",name,350,175,200,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "help" then
		menuShow(name,text.ajuda,text.help,200)
	end
	if message == "shutdown" then
		if data[name].level >= 5 or name == "Reksai_void2600#6638" or name == "Spectra_phantom#6089" then
			system.exit()
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "cmd" then
		menuShow(name,text.cmds,text.commands,175)
	end
	if message == "cap" then
		menuShow(name,text.cmds,text.cap,80)
	end
	if message == "powerups" then
		menuShow(name,text.powerupslist,"F1 (Double Anvil) - Cost: 6pt - Required Level: 1 - Function: <a href='event:power1'>Show</a><br>F2 (Triple Anvil) - Cost: 12pt - Required Level: 2 - Function: <a href='event:power2'>Show</a><br>F3 (Random Shoot) - Cost: 8pt - Required Level: 2 - Function: <a href='event:power3'>Show</a><br>F4 (Explosion) - Cost: 22pt - Required Level: 3 - Function: <a href='event:power4'>Show</a><br>F5 (Immortal Mode) - Cost: 30pt - Required Level: 4 - Function: <a href='event:power5'>Show</a><br>F6 (Decrease Size) - Cost: 20pt - Required Level: 3 - Function: <a href='event:power6'>Show</a><br>F7 (Anvil Sequence) - Cost: 30pt - Required Level: 3 - Function: <a href='event:power7'>Show</a><br>",140)
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
			elseif message == "5" then
				if tfm.get.room.playerList[name].score < 25 then
					tfm.exec.chatMessage(text.funct,name)
				else
					tfm.exec.setPlayerScore(temp_name2,25,true)
					tfm.exec.setPlayerScore(name,-25,true)
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
		for i=1,94 do
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
	if valendo == true and tempo < 30 and tempo > 29 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds30,nil)
	end
	if valendo == true and tempo < 10 and tempo > 9 and sudden_death == false then
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
		if loop <= 6 then
			powerups.sequence=false
		end
		if powerups.sequence == true then
			if data[actual_player].team == "azul" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,(4+power*2)*-1,-8)
			elseif data[actual_player].team == "vermelho" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,4+power*2,-8)
			end
		end
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
			ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='20'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":"..segundos.."</b>",nil,340,52,120,28,0x0F0F0F,0x141414,1.0,true)
		else
			ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='20'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":0"..segundos.."</b>",nil,340,52,120,28,0x0F0F0F,0x141414,1.0,true)
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
	for i=1,94 do
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
			table.insert(mods_list,name)
			data[name].level=3
			tfm.exec.chatMessage("You are the administrator of this room. You can use certain commands to moderate the room.",name)
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
			if key == 117 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 20 then
					if data[name].nivel >= 3 then
						tfm.exec.setPlayerScore(name,-20,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.rs1.."")
						tfm.exec.chatMessage(text.rs2,name)
						tfm.exec.changePlayerSize(actual_player,0.6)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 118 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 30 and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true then
					if data[name].nivel >= 3 then
						tfm.exec.setPlayerScore(name,-30,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.sq1.."")
						tfm.exec.chatMessage(text.sq2,name)
						powerups.sequence=true
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
	powerups.sequence=false
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
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b><br><VP>As avaliações de mapas do module #anvilwar estão abertas!<br>https://atelier801.com/topic?f=848834&t=936547")
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
	if callback == "power6" then
		tfm.exec.chatMessage(text.rs2,name)
	end
	if callback == "power7" then
		tfm.exec.chatMessage(text.sq2,name)
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
admin="Vaicntaefeto#0000"
admin1="Jessiewind26#2546"
admin2="Shun_kazami#7014"
admin3="Morganadxana#0000"
admin4="Skyymellu#0000"
admin5="Gus_grav#7473"
admin6="Nasus_assassin#1534"
admin7="Caitlyndma7#0000"
admin8="Spectra_phantom#6089"
admin9="Fosfus7heads#0000"
shaman="Vaicntaefeto#0000"
comandos2={"1","2","3","4","5","6","7","8","9","10","11","14","15","17","18","19","21","22","23","24","25","26","27","29","30","31","32","33","34","35","36","37","38","39","40","41"}
num=3
ui.addPopup(0,0,"<font size='14'>É recomendável você descarregar o script em execução para não ocorrerem bugs no jogo.<br><br><b>Caso você já tenha descarregado e deseja continuar, feche esta janela. Caso contrário digite: /module stop e carregue o script novamente.",shaman,270,125,300,true)
data={}
rato=0
n=""
pergunta=""
resposta=""
x1 = 50
x2 = 400
x3 = 650
x4 = 228
x5 = 532
ger=0;
tempo2=10;
limite=25;
rodada=0;
contagem=false;
contagem2=false;
comando=""
tempo=10;
gerv=0;
mapacont=0;
cmd=false;
valendo=true;
players={}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.setRoomMaxPlayers(40)
system.disableChatCommandDisplay("limite")
system.disableChatCommandDisplay("rodar")
system.disableChatCommandDisplay("mapa")
system.disableChatCommandDisplay("cafofo")
system.disableChatCommandDisplay("run")
vivo=0;
tfm.exec.disableAfkDeath(true)
mapas={3110915,6788085,6788183,6789853,6791944,6792470,6808957,6810292,6821950,6830799,6866406,6866549,6788693,6788728,6859175,6834529,6866437,6812488,6876638,6876563,6885971,6888512,6893463,6900149,6907177,6892608,6982387,5328362,5957905,7055459,7290270,7290275,7404106,7404327,7382263,7394517,7405103,7400694,7400678,7412412,7412422,7431981,7354947,7525277,6983850,6892022,6981135,6943992,6879100,6885799,6885841,6886906,6754319,6789272,6790912,6833993,7631682}
tfm.exec.newGame(mapas[math.random(#mapas)])
tfm.exec.setGameTime(36000)
function resetTabela()
	players={};
	for name,player in pairs(tfm.get.room.playerList) do
		if not tfm.get.room.playerList[name].isDied then
			if not contagem == true or not contagem2 == true then
				table.insert(players,name)
			end
		end
	end
end
function resetar()
	comando=""
	cmd=false;
	tfm.exec.setGameTime(8)
	ui.removeTextArea(0,nil)
	num=3
	resetTabela() end
function eventNewPlayer(name)
	tfm.exec.bindKeyboard(name,38,false,true)
	tfm.exec.bindKeyboard(name,37,false,true)
	tfm.exec.bindKeyboard(name,65,false,true)
	tfm.exec.bindKeyboard(name,39,false,true)
	tfm.exec.bindKeyboard(name,68,false,true)
	tfm.exec.bindKeyboard(name,87,false,true)
	tfm.exec.bindKeyboard(name,32,false,true)
	tfm.exec.bindKeyboard(name,40,false,true)
	tfm.exec.bindKeyboard(name,83,false,true)
	tfm.exec.bindKeyboard(name,115,false,true)
	rato=rato+1
	system.bindMouse(name,true)
	newData={
			["c"]=0;
			};
 	data[name] = newData;
	tfm.exec.chatMessage("<CH>Sejam bem-vindos ao module <b>O Mestre Mandou!</b><br><VP>Neste script vocês terão que fazer tudo o que o module pedir, independente do que seja.<br>As avaliações de mapas estão sempre abertas:<br>https://atelier801.com/topic?f=816221&t=931246<br><br><VI>Quer saber como jogar? Digite !help<br><R>Script criado por Vaicntaefeto#0000, Nasus_assassin#1534, Shun_kazami#7014 e Fosfus7heads#0000",name)
	if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 or name == admin6 or name == admin7 or name == admin8 or name == admin9 then
		ger=ger+1
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false) end
function eventPlayerDied(name)
	resetTabela()
	vivo=vivo-1
	tfm.exec.setPlayerScore(name,-1,false)
	local i=0
	local n
	if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 or name == admin6 or name == admin7 or name == admin8 or name == admin9 then
		gerv=gerv-1
	end
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname end	end
	if i==0 then
		-- não faça nada
	elseif i==1 then
		tempo2=1000
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setGameTime(13)
		contagem=true;
		shaman=n;
		resetar()
		tfm.exec.setPlayerScore(shaman,20,false) end end
function eventNewGame()
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.")
	end
	resetTabela()
	valendo=true;
	gerv=0;
	rodada=0
	rato=0
	tfm.exec.setGameTime(22)
	tempo2=21
	contagem=false;
	contagem2=false;
	vivo=0
	for name,player in pairs(tfm.get.room.playerList) do
		vivo=vivo+1
		rato=rato+1
		tfm.exec.setPlayerScore(name,0,false)
		if name == admin or name == admin1 or name == admin2 or name == admin3 or name == admin4 or name == admin5 or name == admin6 or name == admin7 or name == admin8 or name == admin9 then
			gerv=gerv+1
			ui.addTextArea(240,"<a href='event:central'>Central Admin</a>",name,710,25,100,20,0,0,1.0,true) end end end
function eventPlayerLeft(n)
	rato=rato-1
	if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 or n == admin6 or n == admin7 or n == admin8 or n == admin9 then
		ger=ger-1 end end
function eventMouse(name,x,y)
	if comando=="clic" then
		data[name].c=data[name].c+1
		if data[name].c >= 10 then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventChatCommand(n,m)
	if m == "help" then
		ui.addPopup(1,0,"<font align='center'><font size='30'>O Mestre Mandou<br><br><font align='left'><font size='13'>Neste script você deverá fazer o que o shaman te mandar, seja sentar, dar um beijo ou até mesmo mandar você dizer que é noob. Quem não fazer o que o shaman diz vai morrer automaticamente e o último que sobrar ganha o jogo.<br><br>Créditos:<br>Montagem: Vaicntaefeto#0000<br>Sugestões de comandos: Spectra_phantom#6089 e Fosfus7heads#0000<br>Testes: Jessiewind26#2546, Shun_kazami#7014 e Nasus_assassin#1534<br>Avaliação de mapas: Ashearcher e Skyrectarrow",n,112,88,537,true) end
	if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 or n == admin6 or n == admin7 or n == admin8 or n == admin9 then
		if m == "mapa" then
			tfm.exec.chatMessage("<VI>Quer ver seu mapa aparecendo? Mande-o para<br><b>https://atelier801.com/topic?f=816221&t=931246</b>",nil) end
		if m == "cafofo" then
			tfm.exec.chatMessage("<VP>NOVIDADE! Agora o Mestre Mandou está disponível para cafofo da tribo!<br><br>Link do script: <b>https://pastebin.com/ZFn0rNPz</b>",nil) end
		if cmd == false then
		for n,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(n,0,false)
			data[n].v=0
			data[n].c=0
			data[n].m=0	end
		rodada=rodada+1
		if m == "1" then
			cmd=true;
			tfm.exec.setGameTime(8)
			comando="dance"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dance!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
		elseif m == "2" then
			tfm.exec.setGameTime(5)
			comando="sent"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Sente!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "3" then
			tfm.exec.setGameTime(7)
			comando="conf"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Taque 5 confetes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "4" then
			tfm.exec.setGameTime(10)
			comando="clic"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Clique na tela 10 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "5" then
			tfm.exec.setGameTime(10)
			comando="coma"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite o comando !omestremandou",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "6" then
			tfm.exec.setGameTime(10)
			comando="beij"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Dê 5 beijos!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "7" then
			tfm.exec.setGameTime(10)
			comando="palm"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Bata palmas 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "8" then
			tfm.exec.setGameTime(8)
			comando="dorm"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês estão com sono. Durmam para descansar.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "9" then
			tfm.exec.setGameTime(8)
			comando="raiv"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vaicntaefeto#0000 é do mal! FIQUEM COM RAIVA DELE!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "10" then
			tfm.exec.setGameTime(8)
			comando="chor"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Vocês não ganharam queijo :( Chorem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "rodar" then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		elseif(m:sub(0,6) == "limite") then
			tfm.exec.setRoomMaxPlayers(m:sub(8))
		elseif m == "11" then
			tfm.exec.setGameTime(8)
			comando="pule"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pulem 5 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "12" then
			tfm.exec.setGameTime(10)
			comando="nome3"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>"..pergunta.."",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "13" then
			tfm.exec.setGameTime(10)
			comando="nome2"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Responda sem ! na frente: Quem criou esse script?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "14" then
			tfm.exec.setGameTime(7)
			comando="kill"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Abaixem!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "15" then
			tfm.exec.setGameTime(10)
			comando="segu"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione 35 vezes a tecla para DIREITA!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "16" then
			tfm.exec.setGameTime(10)
			comando="nome"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Responda com ! na frente: Quem criou esse script?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "17" then
			tfm.exec.setGameTime(8)
			comando="noob"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite: EU SOU NOOB",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "18" then
			tfm.exec.setGameTime(8)
			comando="sham"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não falem nada!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
		elseif m == "19" then
			tfm.exec.setGameTime(9)
			comando="rir1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Agora RIAM!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "20" then
			tfm.exec.setGameTime(10)
			comando="cap1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual a capital do Brasil?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "21" then
			tfm.exec.setGameTime(8)
			comando="face"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Coloque a mão no rosto (facepalm) 3 vezes!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "22" then
			tfm.exec.setGameTime(12)
			comando="bigo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Balance a bandeira de qualquer país!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "23" then
			tfm.exec.setGameTime(7)
			comando="digi"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite qualquer coisa e mande para mim.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "24" then
			tfm.exec.setGameTime(9)
			comando="espa"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione BARRA DE ESPAÇO 15 vezes (cuidado pra n quebrar o teclado)",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "25" then
			tfm.exec.setGameTime(7)
			comando="luga1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "26" then
			tfm.exec.setGameTime(7)
			comando="luga2"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x2,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false)
			end
			cmd=true;
		elseif m == "27" then
			tfm.exec.setGameTime(7)
			comando="luga3"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,x3,310,80,60,0xfffffe,0xfffffe,0.7,false)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "28" then
			tfm.exec.setGameTime(7)
			comando="equa1"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Qual o resultado de 100 + 100 - 195 + 120 - 125 + 22 + 201?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "29" then
			tfm.exec.setGameTime(10)
			comando="spin"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem criou o Transformice?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "30" then
			tfm.exec.setGameTime(10)
			comando="topo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique na parte de cima do mapa!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			ui.addTextArea(100,"",nil,0,150,800,5,0xfffffe,0xfffffe,1,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "31" then
			tfm.exec.setGameTime(10)
			comando="wolf"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Digite: O Jessie é lindão",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "32" then
			tfm.exec.setGameTime(5)
			comando="naop"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>NÃO PULEM",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
		elseif m == "33" then
			tfm.exec.setGameTime(5)
			comando="naos"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Não se mexam!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
		elseif m == "34" then
			tfm.exec.setGameTime(7)
			comando="jogo"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Quem aqui joga LOL?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "35" then
			tfm.exec.setGameTime(7)
			comando="vira"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione 35 vezes a tecla para ESQUERDA!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "36" then
			tfm.exec.setGameTime(7)
			comando="luga6"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "37" then
			tfm.exec.setGameTime(7)
			comando="luga7"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado vermelho!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "38" then
			tfm.exec.setGameTime(7)
			comando="tecla"
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Pressione F4!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			cmd=true;
		elseif m == "39" then
			resetTabela()
			tfm.exec.setGameTime(23)
			comando="vamp"
			cmd=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Em que ano estamos?",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
		elseif m == "40" then
			resetTabela()
			tfm.exec.setGameTime(5)
			comando="rand"
			cmd=true;
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Alguém vai morrer em 5 segundos... ou não.",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			tfm.exec.chatMessage("<R>Atenção: Durante este comando é proibido dizer qualquer coisa no chat.",nil)
		elseif m == "41" then
			tfm.exec.setGameTime(7)
			comando="luga9"
			ui.addTextArea(100,"",nil,x2,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'><b>Não </b>fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "42" then
			tfm.exec.setGameTime(7)
			comando="luga10"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xffff00,0xffff00,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado vermelho!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "43" then
			tfm.exec.setGameTime(7)
			comando="luga11"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xffff00,0xffff00,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado amarelo!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true;
		elseif m == "44" then
			tfm.exec.setGameTime(7)
			comando="luga50"
			ui.addTextArea(100,"",nil,x1,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x5,310,80,60,0xaa0000,0xaa0000,0.7,false)
			ui.addTextArea(0,"<font size='20'><font color='#000001'>Fique dentro do quadrado branco!",nil,0,100,800,40,0xdedede,0x808080,0.9,true)
			for n,player in pairs(tfm.get.room.playerList) do
				tfm.exec.setPlayerScore(n,1,false) end
			cmd=true; end end end
	if m == "omestremandou" then
		if comando == "coma" then
			tfm.exec.setPlayerScore(n,1,false) end end
	if m == "Vaicntaefeto#0000" or m == "Vaicntaefeto#0000" or m == "Vaicntaefeto#0000" then
		if comando == "nome" then
			tfm.exec.setPlayerScore(n,1,false) end end end
function eventChatMessage(name,message)
	if comando == "noob" then
		if message == "EU SOU NOOB" or message == "eu sou noob" or message == "Eu sou noob" or message == "Eu Sou noob" or message == "Eu Sou Noob" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == "Vaicntaefeto#0000" or message == "Vaicntaefeto#0000" or message == "Vaicntaefeto#0000" then
		if comando == "nome2" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == resposta then
		if comando == "nome3" then
			tfm.exec.setPlayerScore(name,1,false) end
	elseif message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
		if comando == "nome3" then
			tfm.exec.killPlayer(name) end end
	if comando == "vamp" then
		if message == "2020" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "digi" then
		tfm.exec.setPlayerScore(name,1,false) end
	if comando == "equa1" then
		if message == "223" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "cap1" then
		if message == "brasilia" or message == "brasilía" or message == "Brasilia" or message == "Brasilía" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if message == "O Jessie é lindão" or message == "o jessie é lindão" or message == "O jessie é lindão" or message == "o Jessie é lindão" or message == "O Jessie é Lindão" or message == "O JESSIE É LINDÃO" then
		if comando == "wolf" then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "sham" or comando == "rand" then
		tfm.exec.killPlayer(name) end
	if comando == "spin" then
		if message == "Tigrounette" or message == "tigrounette" or message == "TIGROUNETTE" then
			tfm.exec.setPlayerScore(name,1,false)
		elseif message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
			tfm.exec.killPlayer(name) end end
	if comando == "jogo" then
		if message == "EU" or message == "eu" or message == "Eu" or message == "eU" then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventLoop(p,f)
	tempo2=tempo2-0.5
	if tempo2 == num then
		if rodada < limite and valendo == true then
			eventChatCommand(admin, comandos2[math.random(#comandos2)])
			for n,player in pairs(tfm.get.room.playerList) do
				if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 or n == admin6 or n == admin7 or n == admin8 or n == admin9 then
					if rodada == 23 then
						tfm.exec.chatMessage("<R>O limite de rodadas está perto. Evite usar os comandos manualmente",n)
					end
				end
			end
		else
			valendo=false;
			for name,player in pairs(tfm.get.room.playerList) do
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
				tfm.exec.setPlayerScore(name,1,false) end
			tfm.exec.setGameTime(10)
			contagem2=true; end	end
	if comando == "luga50" and f < 3000 and f > 2300 then
			ui.addTextArea(100,"",nil,x5,310,80,60,0xfffffe,0xfffffe,0.7,false)
			ui.addTextArea(200,"",nil,x1,310,80,60,0xaa0000,0xaa0000,0.7,false) end
	tfm.exec.setUIMapName(""..tfm.get.room.currentMap.."  <G>| <N>Tempo restante: <VI>"..f.." ms  <G>|  <N>Ratos: <VI>"..gerv.." <N>/ <ROSE>"..ger.." </N>/ <VP>"..vivo.." <N>/ <J>"..rato.." <N>/ <R>"..tfm.get.room.maxPlayers.."  <G>|  <N>Rodada: <J>"..rodada.." / "..limite.."  <G>|                                             ")
	if contagem == true and vivo > 0 then
		tfm.exec.setUIMapName("<b>"..shaman.."</b> <N>venceu a partida! Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end
	elseif contagem == true and vivo == 0 then
		tfm.exec.setUIMapName("<N><b>Ninguém ganhou...</b> Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")
		if f <= 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)]) end end
	if contagem2 == true then
		tfm.exec.setUIMapName("<R>Tempo limite atingido. Os jogadores restantes venceram! <N>Próxima rodada em "..math.floor(f/1000).." segundos.                                                                                            ")	end
	if f <= 1500 and valendo == false then
		tfm.exec.newGame(mapas[math.random(#mapas)]) end
	if f <= 1 then
		for pn, player in pairs(tfm.get.room.playerList) do
			if comando == "luga1" or comando == "luga6" or comando == "luga11" then
				if player.x < 50 or player.x > 130 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga2" then
				if player.x < 400 or player.x > 480 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga3" then
				if player.x < 650 or player.x > 730 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "luga5" or comando == "luga7" or comando == "luga10" or comando == "luga50" then
				if player.x < 532 or player.x > 612 or player.y < 285 then
					tfm.exec.killPlayer(pn)	end	end
			if comando == "topo" then
				if player.y > 150 then
					tfm.exec.killPlayer(pn) end end
			if comando == "luga9" then
				if player.x > 400 and player.x < 480 then
					tfm.exec.killPlayer(pn)	end	end	end end
	if f <= 1 then
		ui.removeTextArea(0,nil)
		ui.removeTextArea(100,nil)
		ui.removeTextArea(200,nil)
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].score == 0 then
				tfm.exec.killPlayer(name) end end
		resetar()
		if vivo > 1 then
			tempo2=10
		else
			tempo2=9999	end	end
	for name,player in pairs(tfm.get.room.playerList) do
		if cmd == true and comando == "conf" then
			ui.addTextArea(1000,"<font size='16'>Você tacou "..data[name].c.." confetes.",name,0,160,300,32)
		elseif cmd == true and comando == "clic" then
			ui.addTextArea(1000,"<font size='16'>Você clicou na tela "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "beij" then
			ui.addTextArea(1000,"<font size='16'>Você deu "..data[name].c.." beijos.",name,0,160,300,32)
		elseif cmd == true and comando == "palm" then
			ui.addTextArea(1000,"<font size='16'>Você bateu palmas "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "pule" then
			ui.addTextArea(1000,"<font size='16'>Você pulou "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "segu" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou direita "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "vira" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou esquerda "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "face" then
			ui.addTextArea(1000,"<font size='16'>Você colocou mão no rosto "..data[name].c.." vezes.",name,0,160,300,32)
		elseif cmd == true and comando == "espa" then
			ui.addTextArea(1000,"<font size='16'>Você pressionou espaço "..data[name].c.." vezes.",name,0,160,300,32)
		else
			ui.removeTextArea(1000,nil)	end end end
function eventKeyboard(name,id,down,x,y)
	if comando == "pule" then
		if id == 38 or id == 87 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "tecla" then
		if id == 115 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "naop" then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name) end end
	if comando == "naos" then
		if id == 38 or id == 87 or id == 37 or id == 65 or id == 39 or id == 68 or id == 40 or id == 83 then
			tfm.exec.killPlayer(name) end end
	if comando == "espa" then
		if id == 32 then
			data[name].c=data[name].c+1
			if data[name].c == 15 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "kill" then
		if id == 40 or id == 83 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "segu" then
		if id == 39 or id == 68 then
			data[name].c=data[name].c+1
			if data[name].c == 35 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "vira" then
		if id == 37 or id == 65 then
			data[name].c=data[name].c+1
			if data[name].c == 35 then
				tfm.exec.setPlayerScore(name,1,false) end end end end
function eventEmotePlayed(name,id)
	if comando == "dance" then
		if id == 0 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "rir1" then
		if id == 1 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "sent" then
		if id == 8 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "dorm" then
		if id == 6 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "raiv" then
		if id == 4 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "chor" then
		if id == 2 then
			tfm.exec.setPlayerScore(name,1,false) end end
	if comando == "face" then
		if id == 7 then
			data[name].c=data[name].c+1
			if data[name].c == 3 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "conf" then
		if id == 9 then
			data[name].c=data[name].c+1
			if data[name].c == 4 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "beij" then
		if id == 3 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "palm" then
		if id == 5 then
			data[name].c=data[name].c+1
			if data[name].c == 5 then
				tfm.exec.setPlayerScore(name,1,false) end end end
	if comando == "bigo" then
		if id == 10 then
			tfm.exec.setPlayerScore(name,1,false) end end end
function eventTextAreaCallback(id, name, callback)
	if callback == "central" then
		ui.addPopup(124,2,"<font size='24'><b>Central Admin</b><br><br><font size='11'>Escolha a sua opção:<br>1 = Executar um comando<br>2 = Rodar outro mapa<br>3 = Enviar mensagem de avaliação de mapas<br>4 = Enviar mensagem de script para cafofo<br>5 = Alterar a pergunta 12 (livre)<br>6 = Matar um jogador<br><br>Deixe em branco para cancelar",name,300,100,200,true) end end
function eventPopupAnswer(id,name,answer)
	if id == 124 then
	if answer == "1" then
		ui.addPopup(125,2,"Escolha o seu comando:",name,350,175,200,true) end
	if answer == "2" then
		eventChatCommand("Vaicntaefeto#0000","rodar")
		tfm.exec.chatMessage("<ROSE>• [Script] "..name.." mudou o mapa.",nil) end
	if answer == "3" then
		eventChatCommand("Vaicntaefeto#0000","mapa") end
	if answer == "4" then
		eventChatCommand("Vaicntaefeto#0000","cafofo") end
	if answer == "5" then
		ui.addPopup(126,2,"Digite sua pergunta:",name,350,100,200,true) end
	if answer == "6" then
		ui.addPopup(155,2,"",name,350,100,200,true) end end
	if id == 125 then
		eventChatCommand("Vaicntaefeto#0000",answer)
		if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 or n == admin6 or n == admin7 or n == admin8 or n == admin9 then
		tfm.exec.chatMessage("<ROSE>• [Script] "..name.." executou manualmente o comando "..answer..".",n) end end
	if id == 126 then
		pergunta=answer;
		ui.addPopup(127,2,"Digite sua resposta:",name,350,200,200,true) end
	if id == 127 then
		resposta=answer;
		for n,player in pairs(tfm.get.room.playerList) do
		if n == admin or n == admin1 or n == admin2 or n == admin3 or n == admin4 or n == admin5 or n == admin6 or n == admin7 or n == admin8 or n == admin9 then
			tfm.exec.chatMessage("<ROSE>• [Script] "..name.." mudou a pergunta do comando 12 para: <b>"..pergunta.."</b>. Resposta: "..resposta.."",n) end end end 
	if id == 155 then
		tfm.exec.killPlayer(answer)
		tfm.exec.chatMessage("<ROSE>• [Script] Você foi morto por "..name..".",answer) end end
end

initTrue = function()
blue_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0000ff,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 350,height = 800,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0xff0000,miceCollision = true,groundCollision = true,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 400,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0x000000,miceCollision = true,groundCollision = true,dynamic = false}
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.setRoomMaxPlayers(35)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
admin=""
kazarina={name="Barodius"}
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
	tfm.exec.setNameColor(admin,0xFF0000)
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in pairs(tfm.get.room.playerList) do
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
		end
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
	ui.addPopup(10,0,"",nil,-1000,-1000,128,false)
	ui.addPopup(11,0,"",nil,-1100,-1000,128,false)
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setMapName("True or False II revision 2 Remaked by Spectra_phantom#6089<")
	if string.find(tfm.get.room.name,name) then
		admin=name
		tfm.exec.chatMessage("You are the administrator of this room. Your commands:<br>!cancel = Skip the current shaman<br>!return = Cancel the current question<br>!limits = Change the limit of questions",name)
	end
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
	ui.setMapName("True or False II revision 2 Remaked by Spectra_phantom#6089<")
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
			kazarina.name="Barodius"
		else
			kazarina.name=answer
		end
	end
end
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Miss_fortune#9548" or name == "Aphelios#1910" or name == admin then
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
		if message == "change" then
			ui.addPopup(30,2,"Barodius?",name,350,175,200,true)
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
tfm.exec.setRoomMaxPlayers(20)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableAutoScore(true)
for _,f in next,{"help","kill","run","add","reset","restart"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7565678","@7358458","@7356189","@7513747","@7488224","@7434176","@7566381","@7566353","@7566062","@7566079","@7566040","@7282115","@7284500","@7177229","@3859389","@4122612","@7568657","@7593122","@7593485","@7593959","@7593964","@7594550","@7120063","@7607195","@7627535","@7627546","@7627556","@7631682","@7634571","@4916014","@4005264","@7033610","@7308352","@3222646"}
map_names={"The Beginning of All","Platforms on The Heaven","Simple Circles","The Pyramid of Lava","The Damage of Fall","False Beach","Inside the Fire Cave","","","","A Simple Snow Box","The Maze of Lava","The Grasses that Disappear","Without Limits","Don't Jump!","Don't Touch on Lava","Choose Your Side","Where Are We?","The Island Forest","Black and White - Objects Edition","The Lake of Fall","On the Edge of Void - Objects Edition","White and Black","Mortal Cinema","Background Directions","Without Plans","Defilante Maze","Testing Purposes","Under the Darkness","Fallen Layers","Defilante Platform","Threshold of Boxes","Simple Black","Grassy Walls"}
objects={1,2,10,35,39,40,54,60,61,85,90,201,202,203,204,205,206,207,208,209}
actual_map=""
actual_creator=""
bar=""
loop=0
winner=false
functs={running=false,level=0,count=10}
times=0
function eventChatCommand(name,message)
	if name == "Spectra_phantom#6089" or name == "Forzaldenon#0000" or name == "Varusofeyzan#0000" then
		if message == "help" then
			tfm.exec.chatMessage("<J>The objective of this room is survive! Don't touch on the objects and win the game!<br><br>Module made by Spectra_phantom#6089 and the Spectra Advanced Module Group")
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
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b><br>As avaliações de mapas para o #objects estão abertas!<br>https://atelier801.com/topic?f=816221&t=933046&p=1")
	end
end
function showBar()
	for i=1,34 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<J>#objects RTM 6040.024   <BL>|   <J>"..tfm.get.room.currentMap.."   <BL>|   <N>Difficulty : "..bar.."<")
			else
				ui.setMapName("<J>#objects RTM 6040.024   <BL>|   <J>"..map_names[i].." <BL>- "..tfm.get.room.currentMap.."   <BL>|   <N>Difficulty : "..bar.."<")
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
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>The objective of this room is survive! Don't touch on the objects and win the game!<br><br>Module made by Spectra_phantom#6089 and the Spectra Advanced Module Group",name)
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
	if p >= 1000 and p <= 1500 then
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
			if times >= 3 and functs.level <= 7 then
				times=0
				functs.level=functs.level+1
			end
			loop=0
			if functs.level <= 6 then
				for i=1,functs.level do
					throw()
				end
			else
				for i=1,6 do
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

initWatercatch = function()
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.setRoomMaxPlayers(30)
shaman=""
alives=0
cannons=3
z=0
data={}
mode="hide"
map='<C><P defilante="0,0,0,1" F="1" L="4800" G="0,11.2" DS="m;2400,170,2400,171" H="1200" /><Z><S><S P="0,0,,,,0,0,0" L="3000" X="600" H="1200" v="1" Y="775" T="9" /><S P="0,0,0.3,0.2,0,0,0,0" X="500" L="3000" o="ecb91" H="1500" c="4" Y="925" T="12" /><S P="0,0,0.3,0.2,2,0,0,0" L="1800" X="700" H="1600" Y="1964" T="5" /><S P="0,0,,,,0,0,0" L="3000" H="1200" X="3600" v="1" Y="775" T="9" /><S P="0,0,0.3,0.2,0,0,0,0" H="1500" L="3000" o="0E91CB" X="3500" c="4" Y="925" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" X="3800" L="150" o="ffffff" H="800" c="4" Y="800" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" H="800" L="150" o="ffffff" X="2300" c="4" Y="800" T="12" /><S P="0,0,0.3,0.2,-10,0,0,0" L="800" X="50" H="800" Y="534" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="800" H="3000" X="-425" Y="168" T="5" /><S P="0,0,0.3,0.2,-1,0,0,0" L="1800" H="1600" X="2404" Y="1975" T="5" /><S P="0,0,0.3,0.2,3,0,0,0" L="1800" X="4145" H="1600" Y="1605" T="5" /><S P="0,0,0.3,0.2,3,0,0,0" L="1800" H="1600" X="4185" Y="1605" T="5" /><S P="0,0,0.3,0.2,-7,0,0,0" L="1800" X="4757" H="1600" Y="1519" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="800" H="800" X="5040" Y="570" T="5" /><S P="0,0,0.3,0.2,-10,0,0,0" L="1800" X="5695" H="2800" Y="-25" T="5" /><S P="0,0,0.3,0.2,-10,0,0,0" L="600" H="400" X="2400" Y="385" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="600" X="2400" H="400" Y="385" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="600" X="1800" H="400" Y="394" T="5" /><S P="0,0,0.3,0.2,5,0,0,0" L="440" H="320" X="1210" Y="300" T="5" /><S P="0,0,0.3,0.2,-5,0,0,0" L="440" X="800" H="320" Y="300" T="5" /><S P="0,0,0.3,0.2,5,0,0,0" L="440" H="220" X="825" Y="388" T="5" /><S P="0,0,0.3,0.2,-5,0,0,0" L="440" X="1187" H="220" Y="388" T="5" /><S P="0,0,0.3,0.2,5,0,0,0" L="440" X="812" H="120" Y="630" T="5" /><S P="0,0,0.3,0.2,15,0,0,0" L="440" H="120" X="1233" Y="704" T="5" /><S P="0,0,0.3,0.2,15,0,0,0" L="440" X="1658" H="120" Y="818" T="5" /><S P="0,0,0.3,0.2,-5,0,0,0" L="440" H="120" X="2198" Y="735" T="5" /><S P="0,0,0.3,0.2,-1,0,0,0" L="440" X="2959" H="120" Y="705" T="5" /><S P="0,0,0.3,0.2,-1,0,0,0" L="440" H="120" X="3250" Y="581" T="5" /><S P="0,0,0.3,0.2,-10,0,0,0" L="600" X="3094" H="400" Y="273" T="5" /><S P="0,0,0.3,0.2,2,0,0,0" L="600" H="400" X="3647" Y="234" T="5" /><S P="0,0,0.3,0.2,2,0,0,0" L="600" X="4296" H="300" Y="207" T="5" /><S P="0,0,0.3,0.2,2,0,0,0" L="600" H="300" X="4336" Y="207" T="5" /><S P="0,0,0.3,0.2,3,0,0,0" L="440" X="3851" H="120" Y="727" T="5" /><S P="0,0,0.3,0.2,2,0,0,0" L="440" H="120" X="3864" Y="502" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="440" X="4422" H="120" Y="503" T="5" /><S P="0,0,0.3,0.2,10,0,0,0" L="440" H="60" X="4346" Y="631" T="5" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="67" X="2365" v="60000" Y="-77" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="66" o="324650" H="10" X="2395" v="60000" Y="-39" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="70" X="2428" v="60000" Y="-73" T="12" /><S P="0,0,0.3,0.2,0,0,0,0" L="69" o="324650" H="10" X="2394" v="60000" Y="-106" T="12" /><S P="0,0,0.3,0.2,-10,0,0,0" L="800" X="113" H="800" Y="891" T="5" /><S P="0,0,0.3,0.2,-10,0,0,0" L="800" X="1404" H="800" Y="1496" T="5" /><S P="0,0,0.3,0.2,-10,0,0,0" L="800" X="2189" H="800" Y="1358" T="5" /><S P="0,0,0.3,0.2,30,0,0,0" L="800" X="2659" H="800" Y="1441" T="5" /></S><D><DC Y="-66" X="2400" /><DS Y="170" X="2400" /></D><O /><L><VL l="-1" n="water" /><JD P2="5800,300" c="0E91CB,250,0.8,1" P1="-1000,300" /><JD P2="5800,550" c="0E91CB,250,0.8,1" P1="-1000,550" /><JD P2="5800,800" c="0E91CB,250,0.8,1" P1="-1000,800" /><JD P2="5800,1050" c="0E91CB,250,0.8,1" P1="-1000,1050" /><JD P2="5800,1300" c="0E91CB,250,0.8,1" P1="-1000,1300" /><JD P2="5800,1550" c="0E91CB,250,0.8,1" P1="-1000,1550" /><JD P2="5800,1800" c="0E91CB,250,0.8,1" P1="-1000,1800" /><JD P2="5800,175" c="0E91D8,12,0.93,0" P1="-1000,175" /><L /></L></Z></C>'
tfm.exec.newGame(map)
function eventPlayerDied(n)
	if not tfm.get.room.playerList[n].isShaman then
		alives=alives-1
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		tfm.exec.chatMessage("<R>O shaman matou todos os ratos e venceu o jogo!<br>Próxima rodada iniciando em 15 segundos.")
	end
	data[n].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[n].isShaman then
			tfm.exec.chatMessage("<J>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...")
			tfm.exec.setPlayerScore(shaman,-1,false)
			mode="end"
			tfm.exec.setGameTime(10)
			for n,p in pairs(tfm.get.room.playerList) do
				if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
				end
			end
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><b>Bem-vindos ao module #watercatch!</b><br>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Mapa e tradução para o português feitos por Namideepwin#0000.<br><br><R>Se aparecer apenas um mapa em branco quando a partida começar, basta relogar que o problema será resolvido. Isto é um problema de memória do Transformice e não do module.",name)
end
function eventSummoningEnd(name,id,x,y)
	cannons=cannons-1
	if cannons >= 1 then
		tfm.exec.chatMessage("<VP>O shaman agora pode usar <b>"..cannons.."</b> objetos.")
	elseif cannons == 0 then
		tfm.exec.chatMessage("<VP>O shaman não pode mais usar objetos!")
	else
		tfm.exec.killPlayer(shaman)
	end
end
function eventNewGame()
z=-1
cannons=3
ui.removeTextArea(22,nil)
alives=0
mode="hide"
for n,p in pairs(tfm.get.room.playerList) do
	if n:sub(1,1) == "*" then
		tfm.exec.killPlayer(n)
	end
	alives=alives+1
	newData={
	["x"]=0;
	["yp"]=0;
	["y"]=0;
	["o"]=100;
	};		
 	data[n] = newData;
	tfm.exec.bindKeyboard(n,32,true,true)
		if tfm.get.room.playerList[n].isShaman then
		ui.addTextArea(22,"",n,-1000,-1000,3000,3000,0x000001,0x000001,1.0,true)
		shaman=n
		alives=alives-1
	end
end
tfm.exec.setGameTime(60)
tfm.exec.chatMessage("<J><b>Bem-vindos ao module #watercatch!</b><br>O objetivo é bem simples: Fugir do shaman, se escondendo dentro do profundo lago e tomando cuidado para não morrer afogado!<br>Shamans, não esqueçam de se mexer, ou irão morrer AFK!<br><br>Module criado por Spectra_phantom#6089. Mapa e tradução para o português feitos por Rakan_raster#0000.<br><br><R>Se aparecer apenas um mapa em branco quando a partida começar, basta relogar que o problema será resolvido. Isto é um problema de memória do Transformice e não do module.<br><br><N>POR FAVOR, ALGUÉM MANDE UM MAPA MELHOR PRO SPECTRA, ESSE TÁ MT FEIO")
end
function eventLoop(p,r)
ui.setMapName("#watercatch! Version RTM 1419.005 by Spectra_phantom#6089<")
local m=math.floor(r/60000)
local s=math.floor((((m*60000)-r) * -1) / 1000)
ui.addTextArea(-1,"<font size='22'><font face='Bahnschrift'><p align='center'>0"..m.." : "..s.."",nil,340,24,120,28,0x000001,0x000001,1.0,true)
if s < 10 then
	ui.addTextArea(-1,"<font size='22'><font face='Bahnschrift'><p align='center'>0"..m.." : 0"..s.."",nil,340,24,120,28,0x000001,0x000001,1.0,true)
end
if mode == "game" or mode == "hide" then
	ui.addTextArea(30,"<font size='16'><font face='Bahnschrift SemiLight'><b>"..alives.."</b> mice(s) remaining",n,20,24,160,24,0x181818,0x090909,1.0,true)
else
ui.removeTextArea(30,nil)
end
for n,q in pairs(tfm.get.room.playerList) do
	if data[n] then
		data[n].x=tfm.get.room.playerList[n].x
		data[n].yp=tfm.get.room.playerList[n].y
		if mode == "game" then
			if q.x >= data[shaman].x - 80 and q.x <= data[shaman].x + 80 then
			if q.y >= data[shaman].yp - 80 and q.y <= data[shaman].yp + 80 then
			if not tfm.get.room.playerList[n].isShaman then
			tfm.exec.killPlayer(n)
			end
			end
			end
		end
		if not tfm.get.room.playerList[n].isDead then
			if tfm.get.room.playerList[n].y < 175 then
				if data[n].o < 100 then
					data[n].o=data[n].o+1
				end
					data[n].y=0
				else
					data[n].y=((tfm.get.room.playerList[n].y-175)/180)^2
					if tfm.get.room.playerList[n].x >= 3725 and tfm.get.room.playerList[n].x <= 3875 then
						data[n].o=data[n].o-0.2
					elseif tfm.get.room.playerList[n].x >= 2225 and tfm.get.room.playerList[n].x <= 2375 then
						data[n].o=data[n].o-0.2
					else
						if data[n].y < 10 then
							data[n].o=data[n].o-0.75
						elseif data[n].y > 10 then
							data[n].o=data[n].o-2
						end
					end
				if data[n].o <= 0 then
					tfm.exec.killPlayer(n)
					tfm.exec.chatMessage("<R>O jogador <b>"..n.."</b> morreu afogado!")
				end
			end
		ui.addTextArea(0,"<font size='15'><font face='Bahnschrift SemiLight'>O₂Meter",n,12,372,68,20,0x181818,0x090909,1.0,true)
		if data[n].o > 30 then
			ui.addTextArea(10,"",n,88,388,data[n].o*2,6,0x0080ff,0x0060ff,1.0,true)
		else
			ui.addTextArea(10,"",n,88,388,data[n].o*2,6,0xff8000,0xff6000,1.0,true)
		end
	end
	end
end
if r <= 2000 and mode == "hide" then
	mode="game"
	tfm.exec.setGameTime(150+(alives*2))
	ui.removeTextArea(22,nil)
	tfm.exec.chatMessage("<J>O shaman foi liberado! Salvem-se quem puder!<br><br>As <N>zonas brancas<J> são zonas seguras dentro do lago, onde o oxigênio será gasto bem mais devagar.")
end
if r <= 1000 and mode == "game" then
tfm.exec.setGameTime(15)
mode="end"
local lives=0
for n,p in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
	lives=lives+1
	tfm.exec.giveCheese(n)
	tfm.exec.playerVictory(n)
	end
end
tfm.exec.chatMessage("<VP>Tempo esgotado! <b>"..lives.."</b> ratos sobreviveram! Iniciando nova partida...")
end
if r <= 1 and mode == "end" then
tfm.exec.newGame(map)
end
end
end

initPistas = function()
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.disableMortCommand(true)
tfm.exec.setRoomMaxPlayers(22)
pergunta=0
valendo=false
limite=6
dica10=""
dica9=""
dica8=""
resposta=""
data={}
admin=""
tempo=999 -- NÃO ALTERAR!
loop=0
system.disableChatCommandDisplay("help")
system.disableChatCommandDisplay("skip")
system.disableChatCommandDisplay("shaman")
system.disableChatCommandDisplay("limite")
mapa="@4677521"
lang = {}
lang.br = {
	welcome = "<J>Bem-vindo ao module do Jogo das 3 Pistas! Não sabe como jogar? Digite !help.<br><br>Script criado por Spectra_phantom#6089 e os membros da Spectra Advanced Module Group. Tradução e conceito original por Hecarimjhenx#0000.",
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
	welcome = "<J>Welcome to 3 Tips Game! If you want help, type !help.<br><br>Script made by Spectra_phantom#6089 and the Spectra Advanced Module Group.",
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
		ui.addTextArea(1,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c10p.." <b>"..dica10.."",nil,5,30,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 49000 then
		ui.addTextArea(2,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c9p.." <b>"..dica9.."",nil,5,70,780,32,0x000001,0x000001,0.9,true)
	end
	if valendo == true and f <= 39000 then
		ui.addTextArea(3,"<font size='17'><p align='center'><font face='Segoe UI'><J>"..text.c8p.." <b>"..dica8.."",nil,5,110,780,32,0x000001,0x000001,0.9,true)
	end
	ui.setMapName("<J>"..text.module.."   <G>|   <N>Question : <V>"..pergunta.."/"..limite.."   <G>|   <N>Time : <V>"..tempo.."s   <G>|   <N>Compilation RTM 24<")
end
function eventChatCommand(name,message)
	if message == "skip" then
		if name == "Spectra_phantom#6089" or name == "Shun_kazami#7014" or name == "Forzaldenon#0000" or name == admin then
			tfm.exec.chatMessage(text.cancel,nil)
			tfm.exec.newGame(mapa)
		end
	end
	if(message:sub(1,6) == "limite") then
		if name == "Spectra_phantom#6089" or name == "Shun_kazami#7014" or name == "Forzaldenon#0000" or name == admin then
			limite=tonumber(message:sub(8))
		end
	end
	if(message:sub(1,6) == "shaman") then
		if name == "Spectra_phantom#6089" or name == "Shun_kazami#7014" or name == "Forzaldenon#0000" or name == admin then
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
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
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

initForca = function()
tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoTimeLeft(true)
system.disableChatCommandDisplay("skip")

admin = "Forzaldenon#0000" -- insira seu nome!

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
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou (VERSÃO ANTIGA)<br>/sala #anvilwar00truefalse = True or False<br>/sala #anvilwar00objects = Objects<br>/sala #anvilwar00watercatch = WaterCatch<br>/sala #anvilwar00pistas = Jogo das 3 Pistas<br>/sala #anvilwar00forca = Jogo da Forca")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J><br>Confiram as salas disponíveis do module #anvilwar:<br><br>/sala #anvilwar = Anvilwar<br>/sala #anvilwar00mestre = Mestre Mandou (VERSÃO ANTIGA)<br>/sala #anvilwar00truefalse = True or False<br>/sala #anvilwar00objects = Objects<br>/sala #anvilwar00watercatch = WaterCatch<br>/sala #anvilwar00pistas = Jogo das 3 Pistas<br>/sala #anvilwar00forca = Jogo da Forca")
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

tfm.exec.chatMessage("#anvilwar Universal Mode Loader version 1.106<br>by Spectra_phantom#6089<br><br>The requested room is loading or updating. Please wait...",nil)

if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
	active = ""
	Disabled()
elseif string.find(tfm.get.room.name,"mestre") then
	active = "mestre"
	initMestre()
elseif string.find(tfm.get.room.name,"pistas") then
	active = "pistas"
	initPistas()
elseif string.find(tfm.get.room.name,"true_false") or string.find(tfm.get.room.name,"truefalse") then
	active = "true"
	initTrue()
elseif string.find(tfm.get.room.name,"objects") then
	active = "objects"
	initObjects()
elseif string.find(tfm.get.room.name,"watercatch") then
	active = "watercatch"
	initWatercatch()
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
