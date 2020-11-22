-- Transformice #anvilwar module loader - Version 2.143.1
-- By Spectra_phantom#6089 / Nasus_assassin#1534
-- Included sub-modules: #truefalse, #objects.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.143.1",
	_MAINV = "28205.181",
	_DEVELOPER = "Spectra_phantom#6089" }

initAnvilwar = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.setRoomMaxPlayers(30)
powerups={choosed="",r_azul=false,r_vermelho=false,multi_count=0,int_azul=2,int_vermelho=2,immortal=false,immortal2=false,double=false,triple=false,objeto=false,explosion=false,sequence=false,giant1=false,giant2=false}
objetos={1,2,3,4,6,7,10,23,32,34,35,39,45,46,54,60,61,62,65,67,68,69,89,90,95}
play_azul={}
players_table={}
caps={azul="",vermelho=""}
play_vermelho={}
banned_list={}
mods_list={"Marichamex#0000","Ddniemo#0000","Gmctf#0000","Liviliviah#0000","Ork#0015","Sorreltail#7677"}
managers_list={"Shun_kazami#7014","Rakan_raster#0000"}
admins_list={"Spectra_phantom#6089","Reksai_void2600#6638"}
ninjas_list={"Forzaldenon#0000","Akaliswayner#0000","Caitlyndma7#0000"}
scoreloop=0
sudden_death=false
local temp_name=""; local temp_name2=""; local temp_name3="";
actual_player=""; count_int=20; tempo=0; players=0; time_limit=10; team=1; kills=0;
data={}
ratos=0; loop=12; power=5; valendo=false; anvil_launched=false; set=false; object=10; set_name=""; reset=false; intervalo=false;
count=0
count_azul=0
count_vermelho=0
for _,f in next,{"help","powerups","set","tc","p","score","kill","tt","rv","cap","cmd","ban","unban","rodar","pw","TC","run"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7581524","@7494251","@7804689","@7804694","@7804362","@6759094","@4431434"}
map_names={"The Dual-Sided Fight Area","","Inside the Castle","Hell and Water","A very simple waterfall","","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","","The first #anvilwar map","The Beach Test Map 2","","","The Six Attributes","Inside the Ocean","","","","","","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","","","On the Seabed","The Palace of Swords","The Castle of Fire","","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","","","","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas #1","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","","","Do Not Hit The Anvil","","","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain"}
lang = {}
lang.br = {
	win_vermelho = "<R><b>GG Time Vermelho!</b><br>A próxima partida será iniciada em 15 segundos.",
	win_azul = "<BL><b>GG Time Azul!</b><br>A próxima partida será iniciada em 15 segundos.",
	sudden_death = "<VP><b>Morte Súbita!</b><br>A equipe que conseguir eliminar qualquer um adversário será declarada a vencedora.",
	empate_text = "<J><b>Houve um empate!</b><br>A próxima partida será iniciada em 15 segundos.",
	instructions = "Use as teclas de 1 a 9 para alterar a potência da bigorna e barra de espaço para atirar. Para ajuda digite !help.",
	timeout = "<J>Tempo esgotado! O atirador será alterado.",
	enter_vermelho = "Entrar",
	enter_azul = "Entrar",
	exit = "Sair do time",
	inv3 = "Sua habilidade Modo Imortal expirou.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar <b>quando for a sua vez</b> e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br>Os turnos dos atiradores serão definidos aleatoriamente.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Reksai_void2600#6638<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) e Star#6725 (TR)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>Faltam 60 segundos!",
	seconds30 = "<ROSE>Faltam 30 segundos!<br><br>Não é mais permitido reviver jogadores nos 30 segundos finais.",
	seconds10 = "<ROSE>Faltam 10 segundos!",
	teamchat = "<J>Você pode usar o comando !tc [mensagem] para falar apenas com o seu time.",
	menu_bar = "<p align='center'><a href='event:help'>Ajuda</a><br><a href='event:profile'>Perfil</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitão</a><br><a href='event:cmd'>Comandos</a>",
	powerupslist = "Lista de Poderes",
	profile = "Use o comando !p para ver o seu perfil. Use !p [nome] para ver o perfil de outra pessoa.",
	starting = "<VP>A partida está prestes a começar. Preparem-se!",
	suicide = "O seguinte jogador cometeu suicídio: ",
	ban = " foi banido da sala #anvilwar por ",
	unban = " teve seu banimento removido da sala.",
	caps = " foi escolhido para ser o capitão da equipe.",
	cap = "Este tipo de jogador (escolhido aleatoriamente) receberá 50% a mais de pontuação que os outros e poderá transferir seus pontos para outro jogador de sua equipe usando o comando !tt [nome].<br>Ele também poderá utilizar o comando !rv [nome] para reviver UM membro morto de sua equipe.",
	cap_text = "<br><VP>Você é o capitão da sua equipe.<br>Digite !cap para saber das funções dos capitães das equipes.",
	score30 = "<R>Você precisa de 40 pontos para usar isto.",
	advanced = " acaba de avançar para o nível ",
	tag_text = "<J>Não se esqueça de colocar a #tag no final do nome desejado! Caso contrário, o comando não irá funcionar!",
	revivetext = "<J>O seguinte jogador reviveu: ",
	yturn = "É a vez de: ",
	level_error = "<R>Você não possível nível suficiente para usar isto.",
	funct = "Função não permitida. (Você colocou a #tag no nome?)",
	cmds = "Comandos do Jogo",
	commands = "• !help = Exibe as instruções de como jogar.<br>• !p [jogador] = Exibe o perfil do jogador escolhido. Digite !p sem argumentos para ver o seu perfil.<br>• !tc [mensagem] = Fala apenas com os jogadores do seu time.<br><ROSE>* <N>!rv [jogador] = Revive um jogador morto de sua equipe.<br><ROSE>* <N>!tt [jogador] = Transfere seus pontos para outro jogador<br><br>Os comandos marcados com <ROSE>* <N>são de uso exclusivo do capitão da equipe. Para saber mais sobre isso, digite !cap.",
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
}
lang.en = {
	win_vermelho = "<R><b>The RED team wins!</b><br>The next match will start in 15 seconds.",
	win_azul = "<BL><b>The BLUE team wins!</b><br>The next match will start in 15 seconds.",
	sudden_death = "<VP><b>SUDDEN DEATH!</b><br>The team that kill anyone of other team will won the match.",
	empate_text = "<J><b>There was a draw!</b><br>The next match will start in 15 seconds.",
	instructions = "Use the 1 to 9 keys to change the intensity of anvil and SPACEBAR to throw a anvil.",
	timeout = "<J>Time is over! The shooter will be changed.",
	enter_vermelho = "Enter",
	enter_azul = "Enter",
	exit = "Leave this team",
	inv3 = "Your immortality has ended.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "When is your turn, press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br>The turns will be sorted randomly.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Reksai_void2600#6638<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	seconds = "<ROSE>60 seconds remaining!",
	seconds30 = "<ROSE>30 seconds remaining!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>10 seconds remaining!",
	teamchat = "<J>You can use the command !tc [message] to speak with your team.<br><br>You can see your profile typing !p and the temporary tanking typing !rank.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a><br><a href='event:profile'>Profile</a><br><a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitain</a><br><a href='event:cmd'>Commands</a>",
	powerupslist = "Powerups List",
	profile = "Use the !p command to view your profile and use !p [username] to view the profile of another user.",
	starting = "<VP>The match will start on a few seconds. Get ready!",
	suicide = "The following player committed suicide: ",
	ban = " was banned of room by ",
	unban = " was unbanned of room.",
	caps = " was choosed to be the team capitain.",
	cap = "This type of player (that is choosed randomly) will receive 50% more points and will get the ability of transfer your points to other players alive on the match using the !tt [name] command. You can use the !rv [name] command to revive ONE team player dead.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>You need 40 points to use this.",
	advanced = " reached the level ",
	tag_text = "<J>Don't forget to insert the #tag on the target nickname, else this command don't will work!",
	revivetext = "<J>The following player has been revived: ",
	yturn = "Actual player: ",
	level_error = "<R>You don't have level to use this. To view your level use the !p command.",
	funct = "Function not allowed",
	cmds = "Game commands",
	commands = "• !help = Show the game help.<br>• !p [player] = Show the profile of selected player. Type !p without arguments to show your profile.<br>• !tc [message] = Chat with other members of your team.<br><ROSE>* <N>!rv [player] = Revive a dead player of your team.<br><ROSE>* <N>!tt [player] = Transfer your points to another team member.<br><br>The commands marked with <ROSE>* <N>are of exclusive use of the team capitains. To see more info about this, use the !cap command.",
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
}
lang.ar = {
	win_vermelho = "<R><b>فاز الفريق الأحمر!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
	win_azul = "<BL><b>فاز الفريق الأزرق!</b><br>ستبدأ المعركة التالية في غضون 15 ثانية!",
	sudden_death = "<VP><b>المعركة النهائية!</b><br>إذا قام أي أحد بقتل عضو في أي فريق أخر، سوف يفوز الفريق الذي قتل!",
	empate_text = "<J><b>تعادل!</b><br>ستبدأ المباراة التالية في غضون 15 ثانية!",
	instructions = "إستخدم مفاتيح لوحة التحكم من 1 الى 9 للتحكم في سرعة وقوة السندان.",
	timeout = "<J>إنتهى الوقت! سيتم تغيير الضارب",
	enter_vermelho = "بالدخول",
	enter_azul = "بالدخول",
	exit = "قم بالخروج من هذا الفريق",
	bomba1 = "إستخدم فرقعة الزمن، إحترس من الإنفجار!",
	bomba2 = "<br>في هذه القوة، سوف يحدث إنفجار في بقعة مختلفة في مكان العدو",
	objeto1 = "إستخدم الضربة العشوائية! قد يقوم بضرب أي شيئ الأن!",
	objeto2 = "<br>في هذه القوة، يمكنك ضرب أداة شامان بدلآ من السندان، إذا قمت بإختيار السندان المزدوج، سيتم ضرب اداتان شامان بدلآ من سندان",
	inv3 = "قوة عدم موتك قد إنتهت، أصبحت قابلآ للموت الأن!.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "قوة الضرب وسرعته",
	your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
	help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Reksai_void2600#6638<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "أوه لا!! ",
	teamKill2 = "قام بقتل عضو من فريقه!",
	ajuda = "المساعدة",
	credits = "Credits",
	mostrar = "أظهر",
	seconds = "<ROSE>60 ثانية متبقية!",
	seconds30 = "<ROSE>30 ثانية متبقية!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>10 ثوانٍ متبقية!",
	teamchat = "<J>إستخم الإيعاز !tc [msg] للتكلم مع أعضاء فريقك",
	menu_bar = "<p align='center'><a href='event:help'>Help</a> | <a href='event:profile'>Profile</a> | <a href='event:powerups'>Powerups</a> | <a href='event:cap'>Capitain</a> | <a href='event:cmd'>Commands</a>",
	powerupslist = "Powerups List",
	profile = "إستخدم !p لرؤية ملفك وأستخدم !p name لرؤية ملف لاعب أخر ",
	starting = "<VP>ستبدأ المباراة غي غضون بضعة ثواني، إستعد!",
	suicide = "قام بالإنتحار ",
	ban = " تم حظره من الغرفة من قبل ",
	unban = " تم فك حظره من الغرفة من قبل",
	caps = " تم إختياره ليصبح قائد الفريق. لرؤية المزيد عن هذا أكتب !cap أو استخدم قسم القائد في القائمة, ",
	cap = "الكابتن هو قائد الفريق، يتم إختياره عشوائيآ، سوف يحصل على نقاط بنسبة 50% أكثر من اللاعبين، اي جَني النقاط بسرعة!يمكنه تحويل النقاط للاعب أخر عن طريق الإيعاز ويمكنه إحياء لاعب مات من فريقه بإستخدام !rv [name] ولكن يتطلب 30 نقطة لذلك",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>تحتاج 40 نقطة للقيام بهذا",
	advanced = " reached the level ",
	tag_text = "<J>لا تنسى بوضع الهاشتاج على الإسم الذي تم إختياره, أو لن يعمل هذا الإيعاز",
	revivetext = "<J>هذا اللاعب قام بإستقبال : ",
	yturn = "اللاعب الحالي: ",
	level_error = "<R>لا تملك المستوى المطلوب لفعل هذا، لترى مستواك إكتب !p",
	funct = "الإيعاز غير مسموح",
	cmds = "إيعازات اللعبة : ",
	commands = "• !help لرؤية المساعدة<br>• !p [player] = لرؤية ملف لاعب، أكتب !p بدون أي شيئ لرؤية ملفك<br>• !tc [message] = المحادثة مع أعضاء فريقك<br><ROSE>* <N>!rv [player] = إحياء لاعب مات من فريقك، تطلب ان تكون القائد ومعك 30 نقطة<br><ROSE>* <N>!tt [player] = تقوم بنقل نقاطك للاعب أخر في الغرفة<br><br>الإيعازات المُعلمة بـ <ROSE>* <N> إيعازات فقط للقائد، لرؤية المزيد أكتب !cap",
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
}
lang.es = {
	win_vermelho = "<R><b>¡Ha ganado el equipo ROJO!</b><br>La próxima ronda comenzará en 15 segundos.",
	win_azul = "<BL><b>¡Ha ganado el equipo AZUL!</b><br>La próxima ronda comenzará en 15 segundos.",
	sudden_death = "<VP><b>MUERTE SÚBITA!</b><br>El equipo que mate a alguien del otro equipo ganará esta ronda.",
	empate_text = "<J><b>Hubo un empate!</b><br>La próxima ronda comenzará en 15 segundos.",
	instructions = "Usa las teclas 1 al 9 para cambiar la intensidad del yunque y ESPACIO para lanzarlo.",
	timeout = "<J>El tiempo ha terminado. El tirador será cambiado.",
	enter_vermelho = "Unirse",
	enter_azul = "Unirse",
	exit = "Abandonar este equipo",
	inv3 = "Tu inmortalidad ha terminado.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) y Star#6725 (TR)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	seconds = "<ROSE>¡Quedan 60 segundos!",
	seconds30 = "<ROSE>¡Quedan 30 segundos!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>¡Quedan 10 segundos!",
	teamchat = "<J>Puedes usar el comando !tc [mensaje] para hablar con tu equipo.",
	menu_bar = "<p align='center'><a href='event:help'>Ayuda</a><br><a href='event:profile'>Perfil</a> | <a href='event:powerups'>Powerups</a><br><a href='event:cap'>Capitán</a><br><a href='event:cmd'>Comandos",
	powerupslist = "Lista de Powerups",
	profile = "Usa el comando !p para ver tu perfil y usa !p [apodo] para ver el de otra persona.",
	starting = "<VP>La ronda comenzará en unos segundos. ¡Prepárate!",
	suicide = "El siguiente jugador cometió suicidio: ",
	ban = " fue baneado de la sala por ",
	unban = " fue desbaneado de la sala.",
	caps = " fue elegido para ser el capitán del equipo. Para ver más información acerca de esto, escribe el comando !cap o usa la sección de Capitán en el menú.",
	cap = "En esta compilación fue incluido la funcionalidad de jugador capitán. Este tipo de jugador (es elegido aleatoriamente) recibirá un 50% más de puntos y la posibilidad de transferir tus puntos a otros jugadores vivos en la ronda usando el comando !tt [apodo]. Puedes usar el comando !rv [apodo] para revivir UN jugador muerto del equipo.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Necesitas 40 puntos para usar esto.",
	advanced = " alcanzado el nivel ",
	tag_text = "<J>No te olvides de colocar el #tag en el apodo del objetivo, o este comando no funcionará.",
	revivetext = "<J>El siguiente jugador ha sido revivido: ",
	yturn = "Jugador actual: ",
	level_error = "<R>No tienes el nivel para usar esto. Para ver tu nivel usa el comando !p.",
	funct = "Función no permitido",
	cmds = "Comandos del juego",
	commands = "• !help = Mostrar la ayuda del juego.<br>• !p [apodo] = Mostrar el perfil de un determinado jugador. Escribe !p solamente para mostrar tu perfil.<br>• !tc [mensaje] = Hablar con otros miembros de tu equipo.<br><ROSE>* <N>!rv [apodo] = Revivir a un jugador muerto de tu equipo.<br><ROSE>* <N>!tt [apodo] = Transferir tus puntos a otro miembro de tu equipo.<br><br>Los comandos marcados con <ROSE>* <N>son de uso exclusivo para capitanes de equipos. Para saber más de esto, usa el comando !cap.",
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
	gi1 = "used the powerup Giant Transformation!",
	gi2 = "<br>On this powerup, during your shooting turn, you will increase in 50% the size of all mices of enemy team. This powerup also cancels all the mices with the 'Decrease Size' powerup.",
	ar1 = "used the powerup Anvil Rain!",
	ar2 = "<br>On this powerup, a lot of anvils will fall from top of the map on the enemy area. When you use of this powerup, you will lose your shooting turn.",
}
lang.de = {
	win_vermelho = "<R><b>Das ROTE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	win_azul = "<BL><b>Das BLAUE Team gewinnt!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	sudden_death = "<VP><b>PLÖTZLICHER TOD!</b><br>Das Team, das jemanden aus einem anderen Team tötet, gewinnt das Spiel.",
	empate_text = "<J><b>Es gab ein Unentschieden!</b><br>Das nächste Spiel beginnt in 15 Sekunden.",
	instructions = "Verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern und die Leertaste, um einen Amboss zu werfen.",
	timeout = "<J>Die Zeit ist vorbei! Der Schütze wird gewechselt.",
	enter_vermelho = "Betreten",
	enter_azul = "Betreten",
	exit = "Dieses Team verlassen",
	inv3 = "Deine Unsterblichkeit ist vorbei.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Reksai_void2600#6638<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) Puiguirata#0000 (DE) und Star#6725 (TR)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	seconds = "<ROSE>Noch 60 Sekunden!",
	seconds30 = "<ROSE>Noch 30 Sekunden!<br>Isn't allowed to revive players at 30 final seconds.",
	seconds10 = "<ROSE>Noch 10 Sekunden!",
	teamchat = "<J>Du kannst den Befehl !tc [message] um mit Ihrem Team zu sprechen.",
	menu_bar = "<p align='center'><a href='event:help'>Help</a><br><a href='event:powerups'>Powerups</a><br><a href='event:profile'>Profile</a><br><a href='event:cap'>Capitain</a><br><a href='event:cmd'>Commands",
	powerupslist = "Powerups List",
	profile = "Verwenden Sie die !p Befehl, um Ihr Profil anzusehen und zu verwenden !p [username] um das Profil eines anderen Benutzers anzuzeigen.",
	starting = "<VP>Das Spiel beginnt in wenigen Sekunden. Macht euch bereit!",
	suicide = "Der folgende Spieler beging Selbstmord: ",
	ban = " wurde aus dem Zimmer verbannt von ",
	unban = " wurde nicht aus dem Zimmer verbannt.",
	caps = " wurde als Teamchef ausgewählt. Um mehr Informationen darüber zu erhalten, geben Sie Folgendes ein !cap Befehl oder verwenden Sie den Abschnitt Capitain im Menü des Moduls.",
	cap = "Auf dieser Zusammenstellung wurde die Funktionalität eines Capitain-Players integriert. Diese Art von Spieler (die zufällig ausgewählt wird) erhält 50% mehr Punkte und die Möglichkeit, Ihre Punkte auf andere Spieler zu übertragen, die im Spiel leben. !tt [name] Befehl. Sie können die Funktion !rv [name] Befehl, EINE Teamspielerin wiederzubeleben, die tot is.",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Du brauchst 40 Punkte, um das zu benutzen.",
	advanced = " hast das Level erreicht ",
	tag_text = "<J>Vergiss nicht, das #Tag auf dem Ziel-Nicknamen einzufügen, sonst funktioniert dieser Befehl nicht!",
	revivetext = "<J>Der folgende Spieler wurde wiederbelebt: ",
	yturn = "Aktueller Spieler: ",
	level_error = "<R>Du hast kein Level, um das hier zu benutzen. Um dein Level zu sehen, benutze den !p Befehl.",
	funct = "Funktion nicht erlaubt",
	cmds = "Spielbefehle",
	commands = "• !help = Zeigen Sie die Spielhilfe an.<br>• !p [player] = Zeigt das Profil des ausgewählten Spielers an. Typ !p ohne Argumente, um Ihr Profil anzuzeigen.<br>• !tc [message] = Chat Sie mit anderen Mitgliedern Ihres Teams.<br><ROSE>* <N>!rv [player] = Erwecke einen toten Spieler deines Teams zum Leben.<br><ROSE>* <N>!tt [player] = Übertragen Sie Ihre Punkte auf ein anderes Teammitglied.<br><br>Die * mit gekennzeichneten Befehle  <ROSE>* <N>sind ausschließlich für die Teammitglieder bestimmt. Um weitere Informationen dazu zu erhalten, verwenden Sie die Option !cap Befehl.",
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
}
lang.tr = {
	win_vermelho = "<R> <b> KIRMIZI takım kazanır! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	win_azul = "<BL> <b> MAVİ takım kazanıyor! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	sudden_death = "<VP> <b> SUDDEN ÖLÜM! </b> <br> Başka takımlardan herhangi birini öldüren takım maçı kazanacak.",
	empate_text = "<J> <b> Beraberlik oldu! </b> <br> Bir sonraki maç 15 saniye içinde başlayacak.",
	instructions = "Örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını ve örs atmak için Ara Çubuğu'nu kullanın.",
	timeout = "<J> Zaman bitti! Atıcı değiştirilecek.",
	enter_vermelho = "Giriş",
	enter_azul = "Giriş",
	exit = "Bu takımdan ayrıl",
	inv3 = "Ölümsüzlüğünüz sona erdi.",
	bar = "<b>#anvilwar</b> RTM 28205.181",
	intensity = "Yoğunluk",
	your_turn = "<J> Çekim sırası sizde. Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın.",
	help = "Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın. Düşman takımını ortadan kaldıran takım oyunu wons yapıyor. <br> <br> Tüm oyun komutlarını göstermek için !cmd yazın. <br> <br> <b> Krediler: </b> <br> Geliştirme: Spectra_phantom#6089 ve Reksai_void2600#6638 <br> Çeviriler: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) ve Star#6725 (TR) ",
	teamkill1 = "Oh hayır! ",
	teamKill2 = "takımının bir oyuncusunu öldürdü",
	ajuda = "Yardım",
	credits = "Kredi",
	mostrar = "Göster",
	seconds = "<ROSE> 60 saniye kaldı!",
	seconds30 = "<ROSE> 30 saniye kaldı! <br> 60 son saniyede oyuncuları canlandırmasına izin verilmiyor.",
	seconds10 = "<ROSE> 10 saniye kaldı! ",
	teamchat = "<J> Ekibinizle konuşmak için !tc [message] komutunu kullanabilirsiniz..",
	menu_bar = "<p align = 'center'> <a href='event:help'> Yardım </a><br><a href='event:profile'> Profil </a<br><a href='event:powerups'> Güçlendirmeler </a><br><a href='event:cap'> Kişi Kişi </a><br><a href='event:cmd'> Komutlar </a>",
	powerupslist = "Powerups Listesi",
	profile = "Profilinizi görüntülemek için !p komutunu kullanın ve başka bir kullanıcının profilini görüntülemek için !p [kullanıcı adı] kullanın.",
	starting = "<VP> Maç birkaç saniye içinde başlayacak. Hazırlan!",
	suicide = "Aşağıdaki oyuncu intihar etti: ",
	ban = " tarafından oda yasaklandı ",
	unban = " oda yasaklandı.",
	caps = " ekip kişi olarak seçildi.",
	cap = "(Rastgele seçilen) bu oyuncu türü %50 daha fazla puan alır ve puanlarınızı !tt [name] komutunu kullanarak maçta canlı olan diğer oyunculara aktarabilir. BİR takım oyuncusunu ölü olarak canlandırmak için !rv [name] komutunu kullanabilirsiniz. ",
	cap_text = "<br><VP>You are the team capitain.<br>Type !cap to see all the functions of the team capitains.",
	score30 = "<R>Bunu kullanmak için 40 puana ihtiyacınız var.",
	advanced = " seviyeye ulaştı ",
	tag_text = "<J># Etiketini hedef takma ada eklemeyi unutmayın, aksi takdirde bu komut çalışmaz! ",
	revivetext = "<J> Aşağıdaki oyuncu canlandı: ",
	yturn = "Gerçek oyuncu: ",
	level_error = "<R> Bunu kullanacak seviyen yok. Seviyenizi görüntülemek için !p komutunu kullanın. ",
	funct = "Fonksiyona izin verilmiyor ",
	cmds = "Oyun komutları ",
	commands = "• !help = Oyun yardımını göster. <br> • !p [player] = Seçili oyuncunun profilini göster. Profilinizi göstermek için argüman olmadan !p yazın. <br> •!tc [message] = Takımınızın diğer üyeleri ile sohbet edin. <br> <ROSE> * <N> !rv [player] = Takımınızın ölü bir oyuncusunu canlandırın <br> <ROSE> * <N> !tt [player] = Puanlarınızı başka bir takım üyesine aktarın. <br> <br> <ROSE> * <N> ile işaretlenmiş komutlar ekibin özel kullanımı içindir. capitains. Bununla ilgili daha fazla bilgi görmek için !caps komutunu kullanın. ",
	red_int_text = "<R> Kırmızı takım bir mola istedi.",
	blue_int_text = "<BL> Mavi takım bir mola istedi.",
	double = "powerup çift örs kullanılır!",
	double2 = "",
	triple = "powerup üçlü örs kullanılır!",
	triple2 = "",
	objeto1 = "powerup kullanılır Random Shoot!",
	objeto2 = "<br> Bu powerup üzerinde örs yerine rastgele bir şaman nesnesi çekeceksiniz. Çift Örs açılışını kullandıysanız, biri yerine 2 nesne çekebilirsiniz. ",
	exp1 = "powerup Patlama kullandım! ",
	exp2 = "<br> Bu açılışta, farenizle düşman alanını tıklatarak patlamaya neden olabilirsiniz. <br> Patlamanıza neden olacak 5 saniyeniz var. ",
	inv1 = "güçlendirme Ölümsüz Modu kullandı! ",
	inv2 = "<br>Bu powerup üzerinde, sonraki 4 tur boyunca ölümsüz olacaksınız. Bu powerup oyun başına sadece 1 kez kullanılabilir. ",
	rs1 = "powerup kullanılır Boyutu Azalt!",
	rs2 = "<br> Bu açılışta, farelerinizin boyutu maç bitene kadar küçülecek. ",
}
if string.find(tfm.get.room.name,"*") then
	text = lang.en
else
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	elseif tfm.get.room.community == "ar" then
		text = lang.ar
	elseif tfm.get.room.community == "es" then
		text = lang.es
	elseif tfm.get.room.community == "de" then
		text = lang.de
	elseif tfm.get.room.community == "tr" then
		text = lang.tr
	else
		text = lang.en
	end
end
function changeMap()
	tfm.exec.newGame(mapas[math.random(#mapas)])
end
function showText1(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,108,360,25,0x521202,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,108,360,25,0,0,0.99,true)
end
function showText2(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,108,360,25,0x021252,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,108,360,25,0,0,0.99,true)
end
function menuShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,150,130,500,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,150,165,500,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,620,130,30,27,0,0,1.0,true)
end
function profileShow(name,title,content,height)
	ui.addTextArea(9000,"<B><J><font size='15'><font face='Verdana'><p align='center'>"..title.."",name,250,130,300,30,0x212121,0x363634,1.0,true)
	ui.addTextArea(9007,"<font size='12'><font face='Verdana'>"..content.."",name,250,165,300,height,0x151515,0x3F3F3D,1.0,true)
	ui.addTextArea(9006,"<font size='16'><font face='Verdana'><p align='center'><R><a href='event:closep'>X</a>",name,520,130,30,27,0,0,1.0,true)
end
function showPowerMeter(name)
	ui.addTextArea(3500,"<font size='12'><font face='Verdana'><b><p align='center'>Anvil Power",name,250,350,290,19,0x010101,0x010101,0.75,true)
	if power >= 1 then ui.addTextArea(3501,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp1'>1</a>",name,250,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3501,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp1'>1</a>",name,250,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 2 then ui.addTextArea(3502,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp2'>2</a>",name,283,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3502,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp2'>2</a>",name,283,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 3 then ui.addTextArea(3503,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp3'>3</a>",name,316,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3503,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp3'>3</a>",name,316,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 4 then ui.addTextArea(3504,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp4'>4</a>",name,349,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3504,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp4'>4</a>",name,349,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 5 then ui.addTextArea(3505,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp5'>5</a>",name,382,377,23,20,0x008000,0x004000,0.95,true)
	else ui.addTextArea(3505,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp5'>5</a>",name,382,377,23,20,0x000500,0x004000,0.95,true) end
	if power >= 6 then ui.addTextArea(3506,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp6'>6</a>",name,415,377,23,20,0x808000,0x404000,0.95,true)
	else ui.addTextArea(3506,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp6'>6</a>",name,415,377,23,20,0x050500,0x404000,0.95,true) end
	if power >= 7 then ui.addTextArea(3507,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp7'>7</a>",name,448,377,23,20,0x808000,0x404000,0.95,true)
	else ui.addTextArea(3507,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp7'>7</a>",name,448,377,23,20,0x050500,0x404000,0.95,true) end
	if power >= 8 then ui.addTextArea(3508,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp8'>8</a>",name,481,377,23,20,0x800000,0x400000,0.95,true)
	else ui.addTextArea(3508,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp8'>8</a>",name,481,377,23,20,0x050000,0x400000,0.95,true) end
	if power >= 9 then ui.addTextArea(3509,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp9'>9</a>",name,514,377,23,20,0x800000,0x400000,0.95,true)
	else ui.addTextArea(3509,"<font size='16'><font face='Consolas'><p align='center'><a href='event:sp9'>9</a>",name,514,377,23,20,0x050000,0x400000,0.95,true) end
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
			profileShow(name,nome,"<font size='12'><b>Level: "..data[nome].nivel.."</b><br><br>Experience: "..data[nome].exp.."/"..data[nome].maxp.."<br><br><br>Score: "..data[nome].score.."<br>Matchs played: "..data[nome].matchs.."<br><br>Kills: "..data[nome].kills.."<br>Wins: "..data[nome].wins.."<br>Max Killing Spree: "..data[nome].max.."<br>Multi Kills: "..data[nome].mks.."",180)
			ui.addTextArea(9008,"",name,265,223,((data[nome].exp/data[nome].maxp)*260)+3,6,0xffffff,0x000001,nil,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,4) == "kill") then
		if data[name].level >= 3 then
			tfm.exec.killPlayer(message:sub(6))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,2) == "pw") then
		if data[name].level >= 4 then
			tfm.exec.setRoomPassword(message:sub(4))
			if message:sub(4) == "" then
				tfm.exec.chatMessage("Password cleared.",name)
			else
				tfm.exec.chatMessage("Password changed to: "..message:sub(4).."",name)
			end
		end
	end
	if(message:sub(0,5) == "rodar") then
		if data[name].level >= 3 then
			tfm.exec.newGame(mapas[tonumber(message:sub(7))])
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "run") then
		if data[name].level >= 3 then
			tfm.exec.newGame(message:sub(5))
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "ban") then
		if data[name].level >= 3 then
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
		if data[name].level >= 3 then
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
					tfm.exec.chatMessage("<font color='#0080ff'>• <b>["..typer.."]</b> "..message:sub(4).."",name)
				end
			end
			tfm.exec.chatMessage("<font color='#0080ff'>• <b>["..typer.."]</b> "..message:sub(4).."","Spectra_phantom#6089")
		elseif data[typer].team == "vermelho" then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].team == "vermelho" then
					tfm.exec.chatMessage("<font color='#fF7000'>• <b>["..typer.."]</b> "..message:sub(4).."",name)
				end
			end
			tfm.exec.chatMessage("<font color='#fF7000'>• <b>["..typer.."]</b> "..message:sub(4).."","Spectra_phantom#6089")
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "set") then
		if data[name].level >= 4 then
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
				ui.addPopup(1201,2,"1 = 5pts<br>2 = 10pts<br>3 = 20pts",name,350,225,200,true)
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
			if data[temp_name3] and tempo >= 35 and sudden_death == false then
				if tfm.get.room.playerList[name].score >= 40 then
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
					tfm.exec.setPlayerScore(name,-40,true)
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
		if data[name].level >= 4 then
			temp_name=message:sub(7)
			ui.addPopup(906,2,"Score",name,350,175,200,true)
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if message == "help" then
		menuShow(name,text.ajuda,text.help,160)
	end
	if message == "cmd" then
		menuShow(name,text.cmds,text.commands,166)
	end
	if message == "cap" then
		menuShow(name,text.cmds,text.cap,100)
	end
	if message == "powerups" then
		menuShow(name,text.powerupslist,"F1 (Double Anvil) - Cost: 5pt - Required Level: 1 - Function: <a href='event:power1'>Show</a><br>F2 (Triple Anvil) - Cost: 15pt - Required Level: 2 - Function: <a href='event:power2'>Show</a><br>F3 (Random Shoot) - Cost: 7pt - Required Level: 2 - Function: <a href='event:power3'>Show</a><br>F4 (Explosion) - Cost: 30pt - Required Level: 3 - Function: <a href='event:power4'>Show</a><br>F5 (Immortal Mode) - Cost: 30pt - Required Level: 5 - Function: <a href='event:power5'>Show</a><br>F6 (Decrease Size) - Cost: 15pt - Required Level: 4 - Function: <a href='event:power6'>Show</a>",105)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 906 then
		tfm.exec.setPlayerScore(temp_name,tonumber(message),true)
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
			ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 378, 240, 20, 0x800000, 0x600000,1.0,true)
			ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 378, 240, 20, 0x80, 0x60,1.0,true)
		end
	end
end
function eventLoop(passado,faltando)
	showBar()
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
	local minutos=math.floor(tempo/60)
	local segundos=math.floor((minutos*60)-tempo) * -1
	if valendo == true and tempo < 60 and tempo > 59 and sudden_death == false then
		tfm.exec.chatMessage(text.seconds,nil)
	end
	if valendo == true and tempo < 30 and tempo > 29 and sudden_death == false then
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
		if scoreloop >= 26 then
			for name,player in pairs(tfm.get.room.playerList) do
				if data[name].killed == 0 then
					tfm.exec.setPlayerScore(name,1,true)
					data[name].score=data[name].score+1
					data[name].exp=data[name].exp+1
					if name == caps.vermelho or name == caps.azul then
						tfm.exec.setPlayerScore(name,1,true)
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
		for a,i in pairs({41,42,51,52}) do
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
							tfm.exec.setPlayerScore(name,5,false)
						elseif data[name].team == "vermelho" then
							data[name].matchs=data[name].matchs+1
							tfm.exec.respawnPlayer(name)
							tfm.exec.movePlayer(name,600,180,false,0,0,false)
							table.insert(play_vermelho,name)
							tfm.exec.setPlayerScore(name,5,false)
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
				tempo=180+(players*4)
				for a,i in pairs({41,42,51,52}) do
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
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
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
	if valendo == true and reset == false and tempo >= 0 and anvil_launched == false then
		showPowerMeter(actual_player)
		ui.addTextArea(4600,"<font size='60'><p align='center'>"..math.floor(time_limit).."",actual_player,5,310,95,85,0x101010,0x101010,0.85,true)
	else
		for i=3500,3509 do
			ui.removeTextArea(i,nil)
		end
		ui.removeTextArea(4600,nil)
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
		for i=4001,4004 do
			ui.removeTextArea(i,nil)
		end
	end
	if valendo == true and reset == false then
		local minutos=math.floor(tempo/60)
		local segundos=math.floor(tempo-(minutos*60))
		if faltando > 10000 then
			if sudden_death == false then
				ui.addTextArea(2228,"",nil,230,14,340,85,0x010101,0x010101,0.9,true)
			else
				ui.addTextArea(2228,"",nil,230,14,340,85,0x500101,0x400101,0.9,true)
			end
			ui.addTextArea(2221,"<p align='center'><font color='#000000'><font size='36'><font face='Verdana'><font color='#320000'>"..count_vermelho.."  <font color='#323232'>-  <font color='#000032'>"..count_azul.."",nil,312,20,180,60,0,0,1.0,true)
			ui.addTextArea(2220,"<p align='center'><font color='#ff0000'><font size='36'><font face='Verdana'>"..count_vermelho.."  <N>-  <font color='#0000ff'>"..count_azul.."",nil,310,18,180,60,0,0,1.0,true)
			ui.addTextArea(2225,"<p align='center'><font color='#321200'><font size='14'>TO: <b>"..powerups.int_vermelho.."</b>",nil,239,41,70,24,0,0,1.0,true)
			ui.addTextArea(2224,"<p align='center'><font color='#f13811'><font size='14'>TO: <b>"..powerups.int_vermelho.."</b>",nil,240,43,70,24,0,0,1.0,true)
			ui.addTextArea(2227,"<p align='center'><font color='#001232'><font size='14'>TO: <b>"..powerups.int_azul.."</b>",nil,481,41,70,24,0,0,1.0,true)
			ui.addTextArea(2226,"<p align='center'><font color='#1138f1'><font size='14'>TO: <b>"..powerups.int_azul.."</b>",nil,480,43,70,24,0,0,1.0,true)
			if segundos >= 10 then
				ui.addTextArea(2223,"<p align='center'><font color='#121212'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":"..segundos.."</b>",nil,341,63,120,36,0,0,1.0,true)
				ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":"..segundos.."</b>",nil,340,62,120,36,0,0,1.0,true)
			else
				ui.addTextArea(2223,"<p align='center'><font color='#121212'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":0"..segundos.."</b>",nil,341,63,120,36,0,0,1.0,true)
				ui.addTextArea(2222,"<p align='center'><font color='#dfd8ce'><font size='26'><font face='Segoe UI Symbol'>⏰ <font face='Consolas'><b>"..minutos..":0"..segundos.."</b>",nil,340,62,120,36,0,0,1.0,true)
			end
		elseif faltando >= 8000 and faltando < 10000 then
			for i=2220,2228 do
				ui.removeTextArea(i,nil)
			end
		end
	else
		ui.removeTextArea(14,nil)
		for i=2220,2228 do
			ui.removeTextArea(i,nil)
		end
	end
end
function eventMouse(name,x,y)
	if powerups.explosion == true and actual_player == name then
		tfm.exec.explosion(x,y,30,120,true)
		tfm.exec.displayParticle(12,x,y,0,0,0,0,nil)
		powerups.explosion=false
	end
	if data[name].clicked == false then
		data[name].clicked=true
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
			tfm.exec.setPlayerScore(actual_player,2,true)
			if actual_player == caps.vermelho or actual_player == caps.azul then
				tfm.exec.setPlayerScore(actual_player,2,true)
				data[actual_player].score=data[actual_player].score+3
				data[actual_player].exp=data[actual_player].exp+5
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
		if actual_player == name and valendo == true and reset == false then
			tfm.exec.chatMessage(""..text.suicide..""..actual_player.."")
			tfm.exec.setPlayerScore(actual_player,-1,false)
			data[actual_player].score=data[actual_player].score-12
			data[actual_player].exp=data[actual_player].exp-8
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
	if reset == true then
		tfm.exec.respawnPlayer(name)
		if data[name].team == "azul" then
			tfm.exec.movePlayer(name,1000,200,false,0,0,false)
		elseif data[name].team == "vermelho" then
			tfm.exec.movePlayer(name,600,200,false,0,0,false)
		end
		tfm.exec.playEmote(name,0)
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
	for i=1,114 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<VP>"..mapas[i].." ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			else
				ui.setMapName("<VP><b>“"..map_names[i].."”</b> ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			end
		end
	end
end
function eventNewPlayer(name)
	ratos=ratos+1
	if not data[name] then
		table.insert(players_table,name)
		data[name]={wins=0,matchs=0,kills=0,max=0,score=0,mks=0,killed=-1,team="",immortal=false,imatchs=0,immortal2=false,level=0,nivel=1,exp=0,maxp=50,clicked=false}
		data[name].clicked=false
	end
	showTeams(name)
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
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
	if name == "Spectra_phantom#6089" or name == "Reksai_void2600#6638" then
		data[name].level=6
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
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,(2+power*2.5)*-1,-5-(power*0.5))
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,(2+power*2.5)*-1,-5-(power*0.5))
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x+40,y-60,0,(2+power*2.5)*-1,-5-(power*0.5))
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x+80,y-60,0,(2+power*2.5)*-1,-5-(power*0.5))
								powerups.triple=false
							end
						end
					elseif data[name].team == "vermelho" then
						if powerups.objeto == true then
							tfm.exec.addShamanObject(objetos[math.random(#objetos)],x,y-60,0,2+power*2.5,-5-(power*0.5))
							powerups.objeto=false
						else
							tfm.exec.addShamanObject(10,x,y-60,0,2+power*2.5,-5-(power*0.5))
							if powerups.double == true then
								tfm.exec.addShamanObject(10,x-40,y-60,0,2+power*2.5,-5-(power*0.5))
								powerups.double=false
							end
							if powerups.triple == true then
								tfm.exec.addShamanObject(10,x-80,y-60,0,2+power*2.5,-5-(power*0.5))
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
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 5 then
					if data[name].nivel >= 1 then
						powerups.double=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.double.."")
						tfm.exec.setPlayerScore(name,-5,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 113 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 15 then
					if data[name].nivel >= 2 then
						powerups.double=true
						powerups.triple=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.triple.."")
						tfm.exec.setPlayerScore(name,-15,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 114 then
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 7 then
					if data[name].nivel >= 2 then
						powerups.objeto=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.objeto1.."")
						tfm.exec.setPlayerScore(name,-7,true)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 115 then
				if valendo == true and actual_player == name and powerups.objeto == false and powerups.explosion == false and tfm.get.room.playerList[name].score >= 30 then
					if data[name].nivel >= 3 then
						powerups.explosion=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.exp1.."")
						tfm.exec.setPlayerScore(name,-30,true)
						anvil_launched=true
						loop=12
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 116 then
				if valendo == true and actual_player == name and data[name].immortal2 == false and tfm.get.room.playerList[name].score >= 30 then
					if data[name].nivel >= 5 then
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
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 15 then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-15,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.rs1.."")
						tfm.exec.chatMessage(text.rs2,name)
						tfm.exec.changePlayerSize(actual_player,0.6)
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
	for a,i in pairs({41,42,51,52}) do
		ui.removeTextArea(i,nil)
	end
	sudden_death=false
	for i=6001,6004 do
		ui.removeTextArea(i,nil)
	end
	time_limit=15; reset=false; count_azul=0; count_vermelho=0; tempo=0; power=5; count=0;
	powerups.int_azul=2; powerups.int_vermelho=2; powerups.double=false; powerups.triple=false; powerups.objeto=false; powerups.explosion=false;
	kills=0
	play_azul={}
	play_vermelho={}
	valendo=false
	loop=12
	resetPowers()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
			tfm.exec.changePlayerSize(name,1)
			data[name].killed=-1; data[name].team=""; data[name].immortal=false; data[name].immortal2=false; data[name].imatchs=0; data[name].skip=0;
			tfm.exec.setNameColor(name,0xd7d7e6)
			giveCargos(name,data[name].level)
			for i=32,123 do
				tfm.exec.bindKeyboard(name,i,true,true)
			end
			showTeams(name)
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
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b><br><N><ROSE>As avaliações de mapas para o #anvilwar estão abertas!<br>https://atelier801.com/topic?f=880459&t=939384")
	else
		tfm.exec.chatMessage("<VP><b>You can see all the available #anvilwar rooms on /room #anvilwar00rooms.</b><br><N><ROSE>The #anvilwar map submissions are now open!<br>https://atelier801.com/topic?f=880459&t=939384")
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,text.menu_bar,name,2,60,100,74,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
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
	if callback == "profile" then
		tfm.exec.chatMessage(text.profile,name)
	end
	if callback == "sp1" then power=1 end
	if callback == "sp2" then power=2 end
	if callback == "sp3" then power=3 end
	if callback == "sp4" then power=4 end
	if callback == "sp5" then power=5 end
	if callback == "sp6" then power=6 end
	if callback == "sp7" then power=7 end
	if callback == "sp8" then power=8 end
	if callback == "sp9" then power=9 end
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
			ui.addTextArea(51,"<p align='center'><a href='event:sair_vermelho'>"..text.exit.."",name,280,180,240,20,0x505050,0x323232,1.0,true)
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
			ui.addTextArea(52,"<p align='center'><a href='event:sair_azul'>"..text.exit.."",name,280,180,240,20,0x505050,0x323232,1.0,true)
		end
	end
	if callback == "sair_azul" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_azul=count_azul-1
		ui.removeTextArea(52,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 165, 240, 20, 0x800000, 0x600000,1.0,true)
		ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 165, 240, 20, 0x80, 0x60,1.0,true)
	end
	if callback == "sair_vermelho" then
		data[name].team=""
		data[name].killed=-1
		tfm.exec.killPlayer(name)
		count_vermelho=count_vermelho-1
		ui.removeTextArea(51,name)
		ui.addTextArea(41, "<p align='center'><a href='event:enter_vermelho'>"..text.enter_vermelho.."</a></p>",name, 0, 378, 240, 20, 0x800000, 0x600000,1.0,true)
		 ui.addTextArea(42, "<p align='center'><a href='event:enter_azul'>"..text.enter_azul.."</a></p>",name, 560, 378, 240, 20, 0x80, 0x60,1.0,true)
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
		else
			tfm.exec.playEmote(name,2)
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
		else
			tfm.exec.playEmote(name,2)
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
				tfm.exec.chatMessage("<VP><b>"..name..""..text.advanced.."</b>"..data[name].nivel.."!")
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
objects={1,2,3,6,10,17,23,35,39,40,45,46,54,60,61,68,85,89,90}
actual_map=""
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
		if message == "shutdown" then
			system.exit()
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
	changeBar()
	for name,player in pairs(tfm.get.room.playerList) do
		if name:sub(1,1) == "*" then
		   	tfm.exec.killPlayer(name)
		   	tfm.exec.chatMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play Objects.",name)
		end
	end
	if tfm.get.room.community == "br" then
		tfm.exec.chatMessage("<VP><b>Você pode ver todas as salas que compõem o module #anvilwar na /sala #anvilwar00rooms.</b>")
	end
end
function showBar()
	for i=1,41 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "" then
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."</b>  <BL>|   <N>Difficulty : "..bar.."  <BL>|  <N>#objects RTM 7552.036<")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b>  <BL>|   <N>Difficulty : "..bar.."  <BL>|  <N>#objects RTM 7552.036<")
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
		bar="<font face='Segoe UI Symbol'><VP>▁   <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 2 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂  <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 3 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃ <J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 4 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>  <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 5 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅ <font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 6 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>  <font face='Verdana'>"
	elseif functs.level == 7 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>▇ <font face='Verdana'>"
	elseif functs.level >= 8 then
		bar="<font face='Segoe UI Symbol'><VP>▁▂▃▄<J>▅▆<font color='#ff0000'>▇█<font face='Verdana'>"
	else
		bar="<font face='Segoe UI Symbol'><VP>    <J>  <font color='#ff0000'>  <font face='Verdana'>"
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
	tfm.exec.chatMessage("<J><b>Welcome to #objects!</b><br><br>The objective of this module is survive! Don't hit the objects that is falling! The last alive player wins the game!<br><br><ROSE>Module made by Spectra_phantom#6089.",name)
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
	ui.setMapName("True or False II revision 3 Remaked by Spectra_phantom#6089<")
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
	ui.setMapName("True or False II revision 3 Remaked by Spectra_phantom#6089<")
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

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7803705")
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00truefalse<br>/room #anvilwar00objects<br><br>Do you want to see your module here? Please contact Spectra_phantom#6089 or Rakan_raster#0000.")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00truefalse<br>/room #anvilwar00objects<br><br>Do you want to see your module here? Please contact Spectra_phantom#6089 or Rakan_raster#0000.")
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.143.1<br>By Spectra_phantom#6089 and Nasus_assassin#1534")
if string.find(tfm.get.room.name,"*") then
	tfm.exec.chatMessage("<ROSE><b>Tribehouse detected. Only #anvilwar will be available in English.</b>")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
		tfm.exec.chatMessage("<R>Not allowed")
	elseif string.find(tfm.get.room.name,"truefalse") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'truefalse' on room name.<br>Initialising submodule #true...")
		initTrue()
	elseif string.find(tfm.get.room.name,"objects") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'objects' on room name.<br>Initialising submodule #objects...")
		initObjects()
	elseif string.find(tfm.get.room.name,"rooms") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'rooms' on room name.<br>Showing available #anvilwar rooms.")
		Rooms()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
