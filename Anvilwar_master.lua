-- Transformice #anvilwar module loader - Version 2.160.1
-- By Spectra_phantom#6089
-- Included sub-modules: #cd, #falling, #deadfender.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.160.1",
	_MAINV = "31225.121",
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
mods_list={"Marichamex#0000","Ddniemo#0000","Gmctf#0000","Liviliviah#0000","Ork#0015","Sorreltail#7677","Diadem#9470","Pamots#0095","Reksai_void2600#6638"}
managers_list={"Shun_kazami#7014","Caitlyndma7#0000"}
admins_list={"Spectra_phantom#6089","Morganadxana#0000"}
ninjas_list={"Forzaldenon#0000","Viego#0345"}
scoreloop=0
sudden_death=false
local temp_name=""; local temp_name2=""; local temp_name3="";
actual_player=""; count_int=20; tempo=0; players=0; time_limit=10; team=1; kills=0; game_time=0; map_id=nil;
data={}
ratos=0; loop=12; power=5; valendo=false; anvil_launched=false; set=false; object=10; set_name=""; reset=false; intervalo=false; image_id=-1;
count=0
count_azul=0
count_vermelho=0
for _,f in next,{"help","powerups","set","tc","p","score","kill","tt","rv","cap","cmd","ban","unban","rodar","pw","TC","limit","sync","run"} do
	system.disableChatCommandDisplay(f)
end
mapas={"@7467262","@7463118","@7436867","@7412348","@7467977","@7470456","@7480017","@7433435","@7483583","@7485139","@7486518","@7486596","@7486946","@7487828","@7488212","@7487008","@7493568","@7375714","@7495286","@7495744","@7497388","@7499355","@7501996","@7511352","@7522536","@7522330","@7521998","@7540655","@7532950","@7542639","@7512942","@7114424","@7546132","@7546118","@7545653","@7543543","@7547908","@7544349","@7553313","@7554201","@7554203","@7554206","@7559566","@7560668","@7557788","@7559595","@7560873","@7562374","@7577539","@7596259","@7596249","@7599725","@7600421","@7648431","@7648852","@7648907","@7648899","@7658998","@7659642","@7663560","@7497808","@7494359","@7489867","@5943895","@7666256","@3941375","@3956702","@4550664","@7678628","@3133327","@6947287","@7678921","@7679763","@7684909","@7672711","@3161494","@3996861","@7689921","@7685324","@7685127","@7695537","@7695654","@7693917","@7697503","@7723407","@5358451","@5451175","@6025712","@7727464","@7689192","@6198267","@6201091","@6244376","@6822539","@6879247","@7032584","@7760006","@7690854","@7686080","@7686207","@7685181","@7679443","@7802671","@7736985","@7495020","@7498659","@7543661","@7581524","@7494251","@7804689","@7804694","@7804362","@6759094","@4431434","@7807504","@7808946","@7809120","@7811210","@7811555","@7816639","@7818453","@7823992","@4084781","@7825615","@7826036","@7826050","@7826892"}
map_names={"The Dual-Sided Fight Area","-","Inside the Castle","Hell and Water","A very simple waterfall","-","The Frozen Arena","The Golden Flying Arena","The Beach Test Map 1","Inside the Theasure Cave","A random fall map","-","The first #anvilwar map","The Beach Test Map 2","-","-","The Six Attributes","Inside the Ocean","-","-","-","-","-","The Stone Platforms","Inside the Hell","Let's fly!","Inside the Volcano","The Dance of Anvils on Stone","On the Space Tower","On the Edge of Void (Remaked)","-","-","On the Seabed","The Palace of Swords","The Castle of Fire","-","The Example of Map","Fitting The Anvil","The Beach Test Map 3","Dead Maze Map #1","Dead Maze Map #2","Dead Maze Map #3","The Clouds Under Trampoline","Dead Maze Map #4","-","Anvilwar Prison","The Pyramid of Grass","Arena of Darkness","-","The Limit of Waters","Black and White","On the Edge of the Space (v2)","Above the Sea Level (v3)","Dark Side of The Moon","Stairway to Heaven","Reversed Colors","Underwater Pression","The Darkin Blade","Testing Purposes","Christmas Frozen Cave","-","-","-","Default Water Force","Expert Lava Maze","Lava Links","Time of Revenge","Trampoline Test","Basketball of Death","Football Soccer Anvilwar","Destruction in Two Levels","The Forest","-","Island of Anvils","The Limit of Heaven","Giant and Crazy","Lava Battle Arena","Go and Back","Terrifying Love","Terror Christmas","Ninja Degrees","Chocoland","Cage","-","On the Edge of The Abyss","Pier of Columns","The Floor is Lava","Hybrid Grounds","The Flying Water","Natural Cloud Maze","Winter and Spring","Extended Grass Test","The Palace of Lava","Chocolate Maze","The Beach Test Map 4","Between Liquids","Artistical Ninjas #1","May the force Be with You","Don't Jump!","Autumn","Falling Walnuts","Ancient Egypt","Testing Acid Floors","Above the Earth Level","-","-","Do Not Hit The Anvil","-","-","Natural Landscape","Apocalypse","Look the Explosion!","The Beach Test Map 5","Love in Vain","Acid Revenge","Moving Bridges","This is a Test","Only Two Grounds","Aim of Death","What The Hell","Discover of Seven Seas","Rotating Motors","Ultimate Acid Maze","The Anvils are Strange","Ghost Dimension","Animal Fury","Released Things"}
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "Intensidade",
	your_turn = "<J>É a sua vez de jogar. Pressione ESPAÇO para atirar e use as teclas de 1 a 9 para alterar a potência da bigorna.",
	help = "Pressione ESPAÇO para atirar <b>quando for a sua vez</b> e use as teclas de 1 a 9 para alterar a potência da bigorna. A equipe que conseguir eliminar todos do time adversário vencerá a partida.<br>Os turnos dos atiradores serão definidos aleatoriamente.<br><br>Digite !cmd para ver todos os comandos do jogo.<br><br><b>Créditos:</b><br>Desenvolvimento: Spectra_phantom#6089 e Morganadxana#0000<br>Tradução: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) e Star#6725 (TR)",
	teamkill1 = "Oh não! ",
	teamKill2 = "matou um companheiro de equipe",
	ajuda = "Ajuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	nvr = "Não é mais permitido reviver jogadores nos 45 segundos finais.",
	seconds = "<ROSE>Faltam 60 segundos!",
	seconds30 = "<ROSE>Faltam 30 segundos!",
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
	score30 = "<R>Você precisa de 35 pontos para usar isto.",
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
	double2 = "Neste powerup, você atira 2 bigornas de uma vez.",
	triple = "acionou o powerup Bigorna Tripla!",
	triple2 = "Neste powerup, você atira 3 bigornas de uma vez.",
	objeto1 = "acionou o powerup Tiro Aleatório!",
	objeto2 = "Neste powerup, ao pressionar a barra de espaço, você vai atirar um objeto aleatório de shaman. Caso você tenha usado a habilidade Bigorna Dupla, você irá atirar 2 objetos ao invés de um.",
	exp1 = "acionou o powerup Olha a Explosão!",
	exp2 = "Neste powerup, você pode gerar uma explosão clicando em um local do time inimigo.<br>Você possui 5 segundos para explodir!",
	inv1 = "acionou o powerup Modo Imortal!",
	inv2 = "Neste powerup, você ficará imortal durante 4 turnos do seu time. Esta habilidade só pode ser utilizada uma vez por partida.",
	rs1 = "acionou o powerup Reduzir Tamanho!",
	rs2 = "Neste powerup, você reduzirá o tamanho do seu rato até o término da partida.",
	sq1 = "acionou o powerup Sequência de Bigornas!",
	sq2 = "Neste powerup, você vai atirar várias bigornas em sequência.",
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "Intensity",
	your_turn = "<J>It's your turn to shoot. Press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil.",
	help = "When is your turn, press SPACEBAR to throw a anvil and use the 1 to 9 keys to change the intensity of anvil. The team that eliminates the enemy team wons the game.<br>The turns will be sorted randomly.<br><br>Type !cmd to show all the game commands.<br><br><b>Credits:</b><br>Development: Spectra_phantom#6089 and Morganadxana#0000<br>Translations: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "Oh no! ",
	teamKill2 = "has killed a player of her team",
	ajuda = "Help",
	credits = "Credits",
	mostrar = "Show",
	nvr = "Isn't allowed to revive players at 45 final seconds.",
	seconds = "<ROSE>60 seconds remaining!",
	seconds30 = "<ROSE>30 seconds remaining!",
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
	score30 = "<R>You need 35 points to use this.",
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
	objeto2 = "On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "قوة الضرب وسرعته",
	your_turn = "<J>إنه دورك للضرب! إضغط زر المسافة لإطلاق سندان مع استخدام الزر من 1 الى 5 للتحكم في سرعة السندان لتغيير قوة ضرب السندان، . إستخدم المفتاح إف 1 حتى إف 9 لإطلاق ضربات مختلفة! إكتشف!",
	help = "إضغط زر المسافة لإطلاق سندان وللتحكم بسرعته يمكنك الضغط على زر الوجوه من 1 الى 5 ، إستخدم المفتاح من إف1 حتى إف9 لإطلاق ضربات القوة (أكتب !powerups) الفريق الذي يحطم العدو يفوز بالجولة <br><br>Type لترى جميع إيعازات اللعبة !cmds أكتب<br><br><b>Credits:</b><br>البرمجة والتطوير Spectra_phantom#6089 and Morganadxana#0000<br>الترجمة: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) and Star#6725 (TR)",
	teamkill1 = "أوه لا!! ",
	teamKill2 = "قام بقتل عضو من فريقه!",
	ajuda = "المساعدة",
	credits = "Credits",
	mostrar = "أظهر",
	nvr = "Isn't allowed to revive players at 45 final seconds.",
	seconds = "<ROSE>60 ثانية متبقية!",
	seconds30 = "<ROSE>30 ثانية متبقية!",
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
	score30 = "<R>تحتاج 35 نقطة للقيام بهذا",
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
	objeto2 = "على هذا powerup ، سوف تقوم بتصوير كائن شامان عشوائي بدلا من السندان. إذا كنت قد استخدمت Powerup مزدوج السندان ، يمكنك تبادل اثنين من الأشياء بدلا من واحدة.",
	exp1 = "used the powerup Explosion!",
	exp2 = "على هذا powerup ،عندك 5 ثوان لتسبب انفجارك.",
	inv1 = "تستخدم powerup وضع الخالد!",
	inv2 = "على هذا powerup ، تكون خالدة خلال ال 4 المقبلة. يمكن استخدام هذه الطاقة فقط مرة واحدة لكل لعبة.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "Intensidad",
	your_turn = "<J>Es tu turno de lanzar. Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este.",
	help = "Presiona ESPACIO para lanzar un yunque y usa las teclas 1 al 9 para cambiar la intensidad de este. El equipo que elimine al enemigo ganará la ronda.<br><br>Escribe !cmd para mostrar todos los comandos del juego.<br><br><b>Créditos:</b><br>Desarrollo: Spectra_phantom#6089 y Morganadxana#0000<br>Powerups: Jhinsword350#0000 y Vidaloka9999#0000<br>Traducciones: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) y Star#6725 (TR)",
	teamkill1 = "¡Oh no! ",
	teamKill2 = "ha matado a un jugador de su equipo",
	ajuda = "Ayuda",
	credits = "Créditos",
	mostrar = "Mostrar",
	nvr = "Isn't allowed to revive players at 45 final seconds.",
	seconds = "<ROSE>¡Quedan 60 segundos!",
	seconds30 = "<ROSE>¡Quedan 30 segundos!",
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
	score30 = "<R>Necesitas 35 puntos para usar esto.",
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
	objeto2 = "Con este powerup lanzarás un objeto de chamán aleatorio en lugar de un yunque. Si has usado el powerup Doble Yunque puedes lanzar 2 objetos en vez de 1.",
	exp1 = "usó el powerup Explosión!",
	exp2 = "Con este powerup puedes provocar una explosión clicando en área enemigo con tu ratón.<br>Tienes 5 segundos para provocar la explosión.",
	inv1 = "usó el powerup Modo Inmortal!",
	inv2 = "Con este powerup serás inmortal durante los próximos 4 turnos. Solo puedes usarlo 1 vez por ronda.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "Intensität",
	your_turn = "<J>Du bist dran mit dem Schießen. Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern.",
	help = "Drücken Sie die LEERTASTE, um einen Amboss zu werfen, und verwenden Sie die Tasten 1 bis 9, um die Intensität des Ambosses zu ändern. Das Team, das das gegnerische Team eliminiert, gewinnt das Spiel.<br><br>Geben Sie !cmd ein, um alle Spielbefehle anzuzeigen.<br><br><b>Credits:</b><br>Entwicklung: Spectra_phantom#6089 und Morganadxana#0000<br>Powerups: Jhinsword350#0000 und Vidaloka9999#0000<br>Übersetzungen: Nasus_assassin#1534 (EN) Alexsaky#7307 + Vigo#4765 (AR) Dejavu#2242 (ES) Puiguirata#0000 (DE) und Star#6725 (TR)",
	teamkill1 = "Oh nein! ",
	teamKill2 = "hat einen Spieler ihrer Mannschaft getötet.",
	ajuda = "Hilfe",
	credits = "Credits",
	mostrar = "Zeigen",
	nvr = "Isn't allowed to revive players at 45 final seconds.",
	seconds = "<ROSE>Noch 60 Sekunden!",
	seconds30 = "<ROSE>Noch 30 Sekunden!",
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
	score30 = "<R>Du brauchst 35 Punkte, um das zu benutzen.",
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
	objeto2 = "On this powerup, you will shoot a random shaman object instead of a anvil. If you have used the Double Anvil powerup, you can shoot 2 objects instead of one.",
	exp1 = "used the powerup Explosion!",
	exp2 = "On this powerup, you can cause a explosion clicking on enemy area with your mouse.<br>You have 5 seconds to cause your explosion.",
	inv1 = "used the powerup Immortal Mode!",
	inv2 = "On this powerup, you be immortal during the next 4 turns. This powerup only can be used 1 time per game.",
	rs1 = "used the powerup Decrease Size!",
	rs2 = "On this powerup, the size of your mice will be decreased until the match ends.",
	sq1 = "used the powerup Anvil Sequence!",
	sq2 = "On this powerup, you will shoot a lot of anvils in sequence.",
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
	bar = "<b>#anvilwar</b> RTM 31225.121",
	intensity = "Yoğunluk",
	your_turn = "<J> Çekim sırası sizde. Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın.",
	help = "Örs atmak için ara çubuğuna basın ve örs yoğunluğunu değiştirmek için 1 ila 9 tuşlarını kullanın. Düşman takımını ortadan kaldıran takım oyunu wons yapıyor. <br> <br> Tüm oyun komutlarını göstermek için !cmd yazın. <br> <br> <b> Krediler: </b> <br> Geliştirme: Spectra_phantom#6089 ve Morganadxana#0000 <br> Çeviriler: Nasus_assassin#1534 (EN), Alexsaky#7307 + Vigo#4765 (AR), Dejavu#2242 (ES), Puiguirata#0000 (DE) ve Star#6725 (TR) ",
	teamkill1 = "Oh hayır! ",
	teamKill2 = "takımının bir oyuncusunu öldürdü",
	ajuda = "Yardım",
	credits = "Kredi",
	mostrar = "Göster",
	nvr = "45 son saniyede oyuncuları canlandırmasına izin verilmiyor.",
	seconds = "<ROSE> 60 saniye kaldı!",
	seconds30 = "<ROSE> 30 saniye kaldı!",
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
	score30 = "<R>Bunu kullanmak için 35 puana ihtiyacınız var.",
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
	sq1 = "açılış Örs Sırasını kullandı! ",
	sq2 = "<br> Bu açılışta sırayla birçok örs çekeceksiniz. ",
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
	map_id=math.random(1,112)
	tfm.exec.newGame(mapas[map_id])
end
function showText1(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,68,360,25,0x521202,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,68,360,25,0,0,0.99,true)
end
function showText2(text)
	ui.addTextArea(4001,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#400000'>"..text.."",nil,221,68,360,25,0x021252,0x000001,0.75,true)
	ui.addTextArea(4002,"<font size='15'><b><font face='Verdana'><p align='center'><font color='#d1d5e3'>"..text.."",nil,220,68,360,25,0,0,0.99,true)
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
	powerups.explosion=false
	powerups.sequence=false
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
	if(message:sub(0,5) == "limit") then
		if data[name].level >= 4 then
			tfm.exec.setRoomMaxPlayers(message:sub(7))
		end
	end
	if(message:sub(0,4) == "sync") then
		if data[name].level >= 4 then
			tfm.exec.lowerSyncDelay(message:sub(6))
			tfm.exec.chatMessage("sync: "..message:sub(6).."",name)
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
			map_id=tonumber(message:sub(7))
			tfm.exec.newGame(mapas[map_id])
		else
			tfm.exec.chatMessage(text.funct,name)
		end
	end
	if(message:sub(0,3) == "run") then
		if data[name].level >= 4 then
			map_id=0
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
			if data[temp_name3] and tempo >= 45 and sudden_death == false then
				if tfm.get.room.playerList[name].score >= 35 then
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
					tfm.exec.setPlayerScore(name,-35,true)
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
		menuShow(name,text.cmds,text.commands,150)
	end
	if message == "cap" then
		menuShow(name,text.cmds,text.cap,100)
	end
	if message == "powerups" then
		menuShow(name,text.powerupslist,"<font size='10'><b>F1 (Double Anvil) - Cost: 8pt - Required Level: 1</b><br>"..text.double2.."<br><b>F2 (Triple Anvil) - Cost: 12pt - Required Level: 2</b><br>"..text.triple2.."<br><b>F3 (Random Shoot) - Cost: 8pt - Required Level: 2</b><br>"..text.objeto2.."<br><b>F4 (Explosion) - Cost: 22pt - Required Level: 3</b><br>"..text.exp2.."<br><b>F5 (Immortal Mode) - Cost: 32pt - Required Level: 5</b><br>"..text.inv2.."<br><b>F6 (Decrease Size) - Cost: 15pt - Required Level: 4</b><br>"..text.rs2.."<br><b>F7 (Anvil Sequence) - Cost: 22pt - Required Level: 4</b><br>"..text.sq2.."",222)
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
function eventPopupAnswer(id,name,message)
	if id == 906 then
		tfm.exec.setPlayerScore(temp_name,tonumber(message),true)
	elseif id == 1201 then
		if data[temp_name2] and actual_player == name then
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
			if data[name].imaget > 0 then
				data[name].imaget=data[name].imaget-1
			end
			if data[name].imaget == 0 then
				for i=data[name].imageid-10,data[name].imageid do
					tfm.exec.removeImage(i)
					data[name].imaget=-1
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
	if valendo == true and tempo < 45 and tempo > 44 then
		tfm.exec.chatMessage(text.nvr,nil)
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
			kills=0
		end
	end
	if valendo == false and reset == false and faltando < 1888 and count_azul > 0 and count_vermelho > 0 then
		if count_azul-count_vermelho >= -3 and count_azul-count_vermelho <= 3 then
			for a,i in pairs({41,42,51,52}) do
				ui.removeTextArea(i,nil)
			end
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
						image_id=tfm.exec.addImage("172b36628e4.png","&1",180,100,name)
						data[name].imageid=image_id
						data[name].imaget=6
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
				game_time=tempo
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
		if loop <= 6 then
			powerups.sequence=false
		end
		if powerups.sequence == true then
			if data[actual_player].team == "azul" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,(2+power*2.5)*-1,-5-(power*0.5))
			elseif data[actual_player].team == "vermelho" then
				tfm.exec.addShamanObject(10,tfm.get.room.playerList[actual_player].x,tfm.get.room.playerList[actual_player].y-60,0,2+power*2.5,-5-(power*0.5))
			end
		end
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
			ui.addTextArea(2223,"<font face='MingLiU-ExtB'><p align='left'><font size='18'><p align='center'><font color='#ff0000'> <b>"..count_vermelho.."</b>",nil,272,25,60,22,0x320000,0x010101,alpha,true)
			ui.addTextArea(2224,"<font face='MingLiU-ExtB'><p align='right'><font size='18'><p align='center'><font color='#50ff'><b>"..count_azul.."</b> <font color='#ff'>",nil,468,25,60,22,0x32,0x010101,alpha,true)
			ui.addTextArea(2225,"<font face='MingLiU-ExtB'><p align='left'><font size='16'><font color='#ff2400'>⏳ x<b>"..powerups.int_vermelho.."</b>",nil,220,25,44,18,0x240000,0x010101,alpha,true)
			ui.addTextArea(2226,"<font face='MingLiU-ExtB'><p align='right'><font size='16'><font color='#24ff'>x<b>"..powerups.int_azul.."</b> ⏳",nil,536,25,44,18,0x24,0x010101,alpha,true)
			if tempo < 30 then
		ui.addTextArea(2222,"",nil,340,62,(tempo/game_time)*120,1,0xff0000,0x010101,alpha,true)
			elseif tempo >= 30 then
		ui.addTextArea(2222,"",nil,340,62,(tempo/game_time)*120,1,0x00ff00,0x010101,alpha,true)
			else
		ui.removeTextArea(2222)
			end
			if segundos >= 10 then
				ui.addTextArea(2221,"<font face='MingLiU-ExtB'><p align='center'><font size='28'>⏱ <b>"..minutos..":"..segundos.."</b>",nil,340,25,120,30,0x010101,0x010101,alpha,true)
			else
				ui.addTextArea(2221,"<font face='MingLiU-ExtB'><p align='center'><font size='28'>⏱ <b>"..minutos..":0"..segundos.."</b>",nil,340,25,120,30,0x010101,0x010101,alpha,true)
			end
		elseif faltando >= 8000 and faltando < 10000 then
			for i=2221,2226 do
				ui.removeTextArea(i,nil)
			end
		end
	else
		ui.removeTextArea(14,nil)
		for i=2221,2226 do
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
	for i=1,127 do
		if mapas[i] == tfm.get.room.currentMap then
			if map_names[i] == "-" then
				ui.setMapName("<VP>"..mapas[i].." ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			else
				ui.setMapName("<VP><b>“"..map_names[i].."”</b> ("..tfm.get.room.xmlMapInfo.author..")  <BL>|  <N>Mices : <VP><b>"..ratos.."</b>  <BL>|  <N>"..text.bar.."<")
			end
		end
	end
end
function loadLevels()
	for name,player in pairs(tfm.get.room.playerList) do
		if data[name] then
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
end
function eventNewPlayer(name)
	ratos=ratos+1
	if not data[name] then
		table.insert(players_table,name)
		data[name]={wins=0,matchs=0,kills=0,max=0,score=0,mks=0,killed=-1,team="",immortal=false,imatchs=0,immortal2=false,level=0,nivel=1,exp=0,maxp=50,clicked=false,imageid=-1,imaget=0}
		data[name].clicked=false
	end
	showTeams(name)
	for name,player in pairs(tfm.get.room.playerList) do
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,2,25,70,24,0x000001,0x000001,0.75,true)
		for i=32,123 do
			tfm.exec.bindKeyboard(name,i,true,true)
			system.bindMouse(name,true)
		end
	end
	if name:sub(1,1) == "*" then
		data[name].level=-1
	end
	if name == "Spectra_phantom#6089" or name == "Morganadxana#0000" then
		data[name].level=6
	end
	image_id=tfm.exec.addImage("172b365e290.png","&1",200,100,name)
	data[name].imageid=image_id
	data[name].imaget=10
	loadLevels()
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
						kills=0
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
						kills=0
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
				if valendo == true and actual_player == name and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true and tfm.get.room.playerList[name].score >= 8 then
					if data[name].nivel >= 1 then
						powerups.double=true
						tfm.exec.chatMessage("<VP>"..name.." "..text.double.."")
						tfm.exec.setPlayerScore(name,-8,true)
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
				if valendo == true and actual_player == name and powerups.objeto == false and powerups.explosion == false and tfm.get.room.playerList[name].score >= 22 then
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
				if valendo == true and actual_player == name and data[name].immortal2 == false and tfm.get.room.playerList[name].score >= 32 then
					if data[name].nivel >= 5 then
						data[name].immortal=true
						data[name].immortal2=true
						tfm.exec.setNameColor(name,0x00ff00)
						tfm.exec.setPlayerScore(name,-32,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.inv1.."")
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
						tfm.exec.changePlayerSize(actual_player,0.6)
					else
						tfm.exec.chatMessage(text.level_error,name)
					end
				end
			end
			if key == 118 then
				if valendo == true and actual_player == name and tfm.get.room.playerList[name].score >= 22 and not powerups.double == true and not powerups.triple == true and not powerups.objeto == true then
					if data[name].nivel >= 4 then
						tfm.exec.setPlayerScore(name,-22,true)
						tfm.exec.chatMessage("<VP>"..actual_player.." "..text.sq1.."")
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
	local n=math.random(1,8)
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
			loadLevels()
		end
	end
	tfm.exec.setGameTime(30)
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
		if kills < 2 then
			image_id=tfm.exec.addImage("172b36657c5.png","&1",120,100,name)
			data[name].imageid=image_id
			data[name].imaget=10
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
		if kills < 2 then
			image_id=tfm.exec.addImage("172b365fa02.png","&1",120,100,name)
			data[name].imageid=image_id
			data[name].imaget=10
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
	text5 = "<p align='center'><font size='13px'>Capacidade Máxima de jogadores atingida.",
	text6 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n> (Beta)<br><br><font face='Verdana'><font size='12px'>Vá para:<br><br><font color='#FFE300'>Instruções</font> | <a href='event:cmd'>Comandos</a>",
	text7 = "<font size='15px'><bv>Como jogar<n>:<font size='12px'><br><br><br>1- Impeça que o cannon chegue ao 'gol' com pisos que você mesmo ira colocar no mapa através do click;<br><br>2- o cannon irá spawnar em cima da área verde. Use a área verde para colocar os pisos (Com o click), que irão impedir o cannon de chegar ao chão e impedir que vá ao 'gol';<br><br>3- Você pode colocar 2 ou 3 objetos. Vai depender da rodada em que você está.",
	text8 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n> (Beta)<br><br><font face='Verdana'><font size='12px'>Vá para:<br><br><a href='event:ajuda'>Instruções</a> | <font color='#FFE300'>Comandos</font>",
	text9 = "<font size='15px'><bv>Comandos<n>: -- <rose>*<n> -> Comandos para o admin da sala --<font size='12px'><br><br><br><j>!Resettimer<n> <rose>*<n> - Reseta o tempo de iniciar a partida.<br><j>!lang [BR/EN]<n> - Muda o idioma do jogo.<br><br><br><br><br><br>Programador da ideia: Refletz#6472 (Soristl)<br><br>Agradecimento a todos que colaboraram de alguma forma para a criação deste script ;)",
	text10 = "<p align='center'><font size='12px'><a href='event:vida'>Vida dos jogadores",
	text11 = "<p align='center'><font size='15px'><font color='#D30A0A'>Leia a ajuda para:<br>Instruções | Comandos",
	text12 = "<p align='center'><font size='12px'>Nessa rodada poderá spawnar",
	text13 = "<font size='15px'><font color='#000000'><b>Coloque pisos através do click do mouse, clicando na área <font color='#178E31'>verde<n>.",
	text14 = "<font size='15px'><font color='#000000'><b>Evite que o Cannon caia no gol para não perder <r>uma vida<n>.",
	text15 = "pisos",
	text18 = "<j>É necessário dois jogadores ou mais para iniciar a partida<n>",
	text19 = "O jogador",
	text20 = "morreu!"
}
lang.en = {
	text1 = "<p align='center'><font size='14px'><font color='#000000'><b>The game will start in",
	text2 = "<p align='center'><font size='15px'><a href='event:p'>Press to participate",
	text3 = "<p align='center'><font size='12px'>Players in game:",
	text4 = "<p align='center'><font size='15px'>Participating",
	text5 = "<p align='center'><font size='13px'>Maximum player capacity reached.",
	text6 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n> (Beta)<br><br><font face='Verdana'><font size='12px'>Go to:<br><br><font color='#FFE300'>Instructions</font> | <a href='event:cmd'>Commands</a>",
	text7 = "<font size='15px'><bv>How to play<n>:<font size='12px'><br><br><br>1- Prevent the cannon from reaching the goal by placing the grounds (you can spawn them by clicking on the screen);<br><br>2- The cannon will spawn on the green area. Use the green area to place the grounds by clicking on the screen and prevent the cannon from reaching the goal.;<br><br>3- You'll be able to place 2 or 3 grounds. It depends on the current round.",		
	text8 = "<p align='center'><font size='20px'><font face='soopafresh'><bv>Deadfender<n> (Beta)<br><br><font face='Verdana'><font size='12px'>Go to:<br><br><a href='event:ajuda'>Instructions</a> | <font color='#FFE300'>Commands</font>",
	text9 = "<font size='15px'><bv>Commands<n>: -- <rose>*<n> -> Room admin commands --<font size='12px'><br><br><br><j>!Resettimer<n> <rose>*<n> - The time to start is reset<br><j>!lang [BR/EN]<n> - Change the game language.<br><br><br><br><br><br>Idea programmer: Refletz#6472 (Soristl)<br><br>Thanks to everyone who collaborated in some way to create this script ;)",
	text10 = "<p align='center'><font size='12px'><a href='event:vida'>Players lives ",
	text11 = "<p align='center'><font size='15px'><font color='#D30A0A'>Read the help to:<br>Instructions | Commands",
	text12 = "<p align='center'><font size='12px'>In this round you’ll be able to spawn",
	text13 = "<font size='15px'><font color='#000000'><b>Spawn the grounds by clicking in the <font color='#178E31'>green area.",
	text14 = "<font size='15px'><font color='#000000'><b>Prevent the cannon from reaching the goal to avoid losing <r>one life<n>.",
	text15 = "grounds",
	text18 = "<j>Two or more players are required to start the game<n>",
	text19 = "The player",
	text20 = "died!"
}

if tfm.get.room.community == "br" then
    trad = lang.br
else
	trad = lang.en
end

for name, data in pairs(tfm.get.room.playerList) do
	mice[name] = {v = name, tr = trad}
	table.insert(mice, mice[name])
end

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
	ui.addTextArea(4000, "<p align='center'><font size='15px'><a href='event:ajuda'>?", nil, 5, 25, 20, 20, 0x0e232b, 0x171717, 1, true)
	--system.bindMouse (admin, true)
end

function eventTextAreaCallback(tI, name, c)
	if c == "p" and #tabela <= 8 then
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
				ui.addTextArea(4, mice[vt].tr.text5, nil, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, false)
			end
			for tb = 1, #tabela do
				ui.removeTextArea(4, tabela[tb])
			end
		end
	elseif c == "ajuda" then
		repita(name)
	elseif c == "fecha" then
		ui.removeTextArea(4001, name)
		ui.removeTextArea(4002, name)
		ui.removeTextArea(4003, name)
	elseif c == "cmd" then
		ui.addTextArea(4001, mice[name].tr.text8, mice[name].v, 100, 50, 600, 100, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(4002, mice[name].tr.text9, mice[name].v, 100, 150, 600, 200, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(4003, "<p align='center'><font size='15px'><a href='event:fecha'><r>X<n>", name, 650, 60, 30, 20, 0x0e232b, 0x171717, 1, true)
	elseif c == "vida" then
		lang.br.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Vida dos jogadores</font><p align='left'><font size='14px'><font face='arial'><br><br>Jogador: <r>"..tabela1[1].."<n> | Vida: "..playersOnGame[1].life.."<br>Jogador: <bv>"..tabela1[2].."<n> | Vida: "..playersOnGame[2].life.."<br>Jogador: <j>"..tabela1[3].."<n> | Vida: "..playersOnGame[3].life.."<br>Jogador: <vp>"..tabela1[4].."<n> | Vida: "..playersOnGame[4].life.."<br>Jogador: <ce>"..tabela1[5].."<n> | Vida: "..playersOnGame[5].life.."<br>Jogador: <rose>"..tabela1[6].."<n> | Vida: "..playersOnGame[6].life.."<br>Jogador: <vi>"..tabela1[7].."<n> | Vida: "..playersOnGame[7].life.."<br>Jogador: <ch>"..tabela1[8].."<n> | Vida: "..playersOnGame[8].life..""
		lang.en.text16 = "<p align='center'><font size='15px'><font face='soopafresh'>Players' lives</font><p align='left'><font size='14px'><font face='arial'><br><br>Player: <r>"..tabela1[1].."<n> | Life: "..playersOnGame[1].life.."<br>Player: <bv>"..tabela1[2].."<n> | Life: "..playersOnGame[2].life.."<br>Player: <j>"..tabela1[3].."<n> | Life: "..playersOnGame[3].life.."<br>Player: <vp>"..tabela1[4].."<n> | Life: "..playersOnGame[4].life.."<br>Player: <ce>"..tabela1[5].."<n> | Life: "..playersOnGame[5].life.."<br>Player: <rose>"..tabela1[6].."<n> | Life: "..playersOnGame[6].life.."<br>Player: <vi>"..tabela1[7].."<n> | Life: "..playersOnGame[7].life.."<br>Player: <ch>"..tabela1[8].."<n> | Life: "..playersOnGame[8].life..""
		ui.addTextArea(3001, mice[name].tr.text16, name, 264, 114, 400, 200, 0x0e232b, 0x171717, 1, true)
		ui.addTextArea(3002, "<p align='center'><font size='15px'><a href='event:fecha1'><r>X<n>", name, 620, 124, 30, 20, 0x0e232b, 0x171717, 1, true)	
	elseif c == "fecha1" then
		ui.removeTextArea(3001, name)
		ui.removeTextArea(3002, name)
	end
end

function eventLoop(current, remaining)
	if modo == "espera" then
		local x = math.ceil((time - os.time())/1000)
		c =  string.format("%d", x)
		for vt = 1, #mice do
			ui.addTextArea(0, mice[vt].tr.text1.." "..c.."s", mice[vt].name, 110, 390, 220, 25, 0x0e232b, 0x171717, 0, false)
		end
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
				ui.addTextArea(5000, "<p align='center'><font size='30px'><textformat leading='150'><br>"..colors[lg]..""..twin[1].."</font> won!!!", nil, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
			end
		end
		if x3 == 0 then
			iniciar()
		end
	elseif modo == "empate" then
		local x4 = math.ceil((time - os.time())/1000)
		c = string.format("%d", x4)
		ui.addTextArea(5000, "<p align='center'><font size='30px'><textformat leading='150'><br>Draw", nil, 0, 0, 800, 400, 0x161616, 0x161616, 0.8, true)
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
td = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}
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
	ui.addTextArea(4000, "<p align='center'><font size='15px'><a href='event:ajuda'>?", jogador, 5, 25, 20, 20, 0x0e232b, 0x171717, 1, true)
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
		else
			for gx = 1, #mice do
				if mice[gx].v == jogador then
					ui.addTextArea(1, mice[gx].tr.text5, mice[gx].v, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
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
				for vt = 1, #mice do
					ui.addTextArea(4, mice[vt].tr.text5, mice[vt].v, 250, 370, 300, 25, 0x0e232b, 0x171717, 1, true)
				end
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
	
function maps()
	mapas = {'<C><P D="connexion/x_forteresse/7.jpg, 600, 0, 2;connexion/x_forteresse/7.jpg, 1200, 0, 1;connexion/x_forteresse/7.jpg, 1800, 0, 1;connexion/x_forteresse/7.jpg, 2400, 0, 1;connexion/x_forteresse/7.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="3000" X="1244" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="10" X="2321" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="316" X="-190" /></D><O /></Z></C>', 
			 '<C><P D="connexion/x_forteresse/10.jpg, 600, 0, 2;connexion/x_forteresse/10.jpg, 1200, 0, 1;connexion/x_forteresse/10.jpg, 1800, 0, 1;connexion/x_forteresse/10.jpg, 2400, 0, 1;connexion/x_forteresse/10.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="10" o="d00d0d" X="-1" H="130" Y="205" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="d00d0d" H="800" Y="81" T="12" X="-241" /><S L="10" o="d00d0d" H="130" X="154" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="1c59d9" X="598" Y="141" T="12" H="130" /><S L="10" o="d00d0d" X="354" H="130" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="1c59d9" H="130" Y="206" T="12" X="446" /><S L="10" o="1c59d9" H="406" X="400" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="d00d0d" X="201" Y="141" T="12" H="130" /><S L="10" o="ffe300" X="1042" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="1c59d9" H="130" Y="206" T="12" X="799" /><S L="10" o="ffe300" H="130" X="892" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="ffe300" X="844" Y="81" T="12" H="406" /><S L="10" o="1c59d9" X="645" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ffe300" H="130" N="" Y="141" T="12" X="1089" /><S L="10" o="ffe300" H="130" X="1239" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="19c52e" X="1332" Y="206" T="12" H="130" /><S L="10" o="19c52e" X="1287" H="406" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="19c52e" H="130" Y="141" T="12" X="1489" /><S L="10" o="19c52e" H="130" X="1533" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="19c52e" X="1685" Y="206" T="12" H="130" /><S L="10" o="ff8300" X="1779" H="130" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="ff8300" H="406" Y="81" T="12" X="1731" /><S L="10" o="ff8300" H="130" X="1931" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff8300" X="1977" Y="141" T="12" H="130" /><S L="10" o="ff8300" X="2128" H="130" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="ff00f6" H="130" Y="206" T="12" X="2223" /><S L="10" o="ff00f6" H="406" X="2175" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff00f6" X="2375" Y="141" T="12" H="130" /><S L="10" o="ff00f6" X="2421" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="ff00f6" H="130" Y="206" T="12" X="2576" /><S L="10" o="9100ff" H="130" X="2668" Y="206" T="12" P="0,0,0.3,0.2,-50,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="10" o="9100ff" X="2619" Y="81" T="12" H="406" /><S L="10" o="9100ff" X="2819" H="130" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="9100ff" H="130" Y="141" T="12" X="2865" /><S L="10" o="9100ff" H="130" X="3012" Y="206" T="12" P="0,0,0.3,0.2,50,0,0,0" /><S P="0,0,0.3,0.2,-50,0,0,0" L="10" o="f3f3" X="3104" Y="206" T="12" H="130" /><S L="10" o="f3f3" X="3063" H="406" Y="81" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="f3f3" H="130" Y="141" T="12" X="3263" /><S L="10" o="f3f3" H="130" X="3309" Y="141" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,50,0,0,0" L="10" o="f3f3" X="3443" Y="205" T="12" H="130" /><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="f3f3" H="800" X="3704" Y="80" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="43" X="400" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="845" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="1290" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="2180" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="1730" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" X="2621" H="10" Y="401" T="2" P="0,0,0,1.0,0,0,0,0" /><S L="43" H="10" X="3061" Y="402" T="2" P="0,0,0,1.0,0,0,0,0" /></S><D><DS Y="307" X="-149" /></D><O /></Z></C>',
			 '<C><P L="3463" D="connexion/x_forteresse/3.jpg, 600, 0, 2;connexion/x_forteresse/3.jpg, 1200, 0, 1;connexion/x_forteresse/3.jpg, 1800, 0, 1;connexion/x_forteresse/3.jpg, 2400, 0, 1;connexion/x_forteresse/3.jpg, 3000, 0, 1" /><Z><S><S L="3000" H="10" X="1244" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="2321" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="528" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0,100,0,0,0,0" L="10" X="90" N="" Y="191" T="3" H="10" /><S P="1,0,0,100,0,0,0,0" L="10" X="717" N="" Y="190" T="3" H="10" /><S L="10" H="10" X="272" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S X="178" L="193" H="10" c="4" Y="191" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="622" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="1161" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="975" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="1066" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="1417" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="1605" H="10" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S H="10" L="193" X="1510" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="2049" Y="191" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="1860" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" H="10" c="4" Y="190" T="8" X="1955" /><S L="10" H="10" X="2307" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="2493" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S X="2398" L="193" H="10" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /><S L="10" X="2748" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" H="10" X="2937" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="193" X="2842" c="4" Y="190" T="8" H="10" /><S L="10" H="10" X="3192" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S L="10" X="3381" H="10" Y="190" T="3" P="1,0,0,100,0,0,0,0" /><S H="10" L="193" X="3286" c="4" Y="190" T="8" P="1,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="294" X="-159" /></D><O><O C="12" Y="190" X="178" P="0" /><O C="22" Y="190" X="90" P="0" /><O C="22" Y="190" X="272" P="0" /><O C="12" Y="190" P="0" X="624" /><O C="22" Y="190" P="0" X="718" /><O C="12" Y="190" X="1066" P="0" /><O C="12" Y="190" P="0" X="1509" /><O C="22" Y="190" X="1161" P="0" /><O C="22" Y="192" P="0" X="1605" /><O C="12" Y="191" X="1955" P="0" /><O C="22" Y="192" X="2049" P="0" /><O C="22" Y="190" P="0" X="975" /><O C="22" Y="190" P="0" X="1861" /><O C="22" Y="190" P="0" X="529" /><O C="22" Y="191" X="1418" P="0" /><O C="12" Y="190" P="0" X="2398" /><O C="22" Y="191" X="2307" P="0" /><O C="22" Y="190" P="0" X="2493" /><O C="12" Y="190" X="2842" P="0" /><O C="22" Y="190" P="0" X="2748" /><O C="22" Y="190" X="2938" P="0" /><O C="12" Y="190" P="0" X="3286" /><O C="22" Y="190" X="3192" P="0" /><O C="22" Y="190" P="0" X="3381" /></O></Z></C>',
			 '<C><P D="x_deadmeat/cinematique/106.jpg, 600, 0, 2;x_deadmeat/cinematique/106.jpg, 1200, 0, 1;x_deadmeat/cinematique/106.jpg, 1800, 0, 1;x_deadmeat/cinematique/106.jpg, 2400, 0, 1;x_deadmeat/cinematique/106.jpg, 3000, 0, 1" L="3463" /><Z><S><S L="3000" X="1244" H="10" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="10" X="2321" Y="0" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="d00d0d" X="78" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="d00d0d" H="150" Y="170" T="12" X="278" /><S L="20" H="10" X="83" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="272" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="1c59d9" H="150" Y="170" T="12" X="522" /><S L="10" o="1c59d9" H="150" X="722" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="527" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="716" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="ffe300" H="150" X="966" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ffe300" X="1166" Y="170" T="12" H="150" /><S L="20" H="10" X="971" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="1160" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="19c52e" X="1410" Y="170" T="12" H="150" /><S L="10" o="19c52e" X="1610" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="1415" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="1604" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="ff8300" X="1854" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff8300" H="150" Y="170" T="12" X="2054" /><S L="20" H="10" X="1859" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" X="2048" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ff00f6" H="150" Y="170" T="12" X="2298" /><S L="20" X="2303" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="10" o="ff00f6" H="150" X="2498" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" H="10" X="2492" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S L="10" o="9100ff" H="150" X="2742" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" H="10" X="2747" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="9100ff" X="2942" Y="170" T="12" H="150" /><S L="20" X="2936" H="10" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="f3f3" X="3186" Y="170" T="12" H="150" /><S L="10" o="f3f3" X="3386" H="150" Y="170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="20" X="3191" H="10" Y="246" T="2" P="0,0,0,0.5,45,0,0,0" /><S L="20" H="10" X="3380" Y="246" T="2" P="0,0,0,0.5,-45,0,0,0" /></S><D><DS Y="298" X="-145" /></D><O><O C="3" Y="180" P="0" X="178" /><O C="12" Y="180" P="0" X="180" /><O C="3" Y="180" X="622" P="0" /><O C="12" Y="180" X="622" P="0" /><O C="3" Y="180" P="0" X="1066" /><O C="12" Y="180" P="0" X="1066" /><O C="3" Y="180" X="1510" P="0" /><O C="12" Y="180" X="1510" P="0" /><O C="3" Y="180" P="0" X="1954" /><O C="12" Y="180" P="0" X="1954" /><O C="3" Y="180" X="2398" P="0" /><O C="12" Y="180" X="2398" P="0" /><O C="3" Y="180" P="0" X="2842" /><O C="12" Y="180" P="0" X="2842" /><O C="3" Y="180" X="3286" P="0" /><O C="12" Y="180" X="3286" P="0" /></O></Z></C>'
	}
	map = mapas[math.random(#mapas)]
	cn1 = {}
	cn2 = {}
	cn3 = {}
	cn4 = {}
	cn5 = {}
	cn6 = {}
	cn7 = {}
	cn8 = {}
	cnsy = {}
	if map == mapas[1] then
		pad()
	elseif map == mapas[2] then
		cnsy = {179}
		cn1 = {4, 178, 345}
		cn2 = {448, 622, 789}
		cn3 = {892, 1066, 1233}
		cn4 = {1336, 1510, 1677}
		cn5 = {1780, 1954, 2121}
		cn6 = {2224, 2398, 2565}
		cn7 = {2668, 2842, 3009}
		cn8 = {3112, 3286, 3453}
	elseif map == mapas[3] then
		pad()
	elseif map == mapas[4] then
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
	end
	tfm.exec.newGame(map)
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
	ui.addTextArea(4001, mice[jogador].tr.text6, jogador, 100, 50, 600, 100, 0x0e232b, 0x171717, 1, true)
	ui.addTextArea(4002, mice[jogador].tr.text7, jogador, 100, 150, 600, 200, 0x0e232b, 0x171717, 1, true)
	ui.addTextArea(4003, "<p align='center'><font size='15px'><a href='event:fecha'><r>X<n>", jogador, 650, 60, 30, 20, 0x0e232b, 0x171717, 1, true)
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

initCd = function()
-- NÃO SE ESQUEÇA DE COLOCAR O SEU NOME NA LINHA 3 ANTES DE INICIAR!!
-- Para reiniciar o script em caso de falta de ratos ou de qualquer bug, digite !reiniciar.
admin="" -- colocar seu nome aqui, funcorp!
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} 
do
	tfm.exec["disable"..f](true)
end
tfm.exec.disableAfkDeath(false)
data={}
jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assasinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assasinos=0,detetives=0,medicos=0}
modo="inicial"
mapa="@2684847"
contador=0
tfm.exec.setRoomMaxPlayers(48)
system.disableChatCommandDisplay("reiniciar")
system.disableChatCommandDisplay("help")
function eventChatCommand(name,comando)
	if comando == "reiniciar" and name == admin then
		tfm.exec.newGame(mapa)
	end
	if comando == "help" then
		tfm.exec.chatMessage("Bem-vindo ao module Cidade Dorme. Neste module você deverá descobrir quem são os assasinos e impedir que eles matem todos os detetives ou todas as vítimas. O jogo irá explicar tudo enquanto a partida ocorre.",name)
	end
end
function eventNewGame()
	ui.setMapName("           <b>Cidade Dorme v3</b>  <BL>|  <N>Versão RTM 1311.005 gerenciada por Rakan_raster#0000.<")
	contador=0
	tfm.exec.setGameTime(40)
	jogadores={assasinos={},detetives={},medicos={},vivos=0,lista={}}
	quant={assasinos=0,detetives=0,medicos=0}
	modo="inicial"
	for name,player in pairs(tfm.get.room.playerList) do
		jogadores.vivos=jogadores.vivos+1
		data[string.lower(name)]={type=0,morre=false}
		table.insert(jogadores.lista,string.lower(name))
		if string.find(tfm.get.room.name,name) then
			admin=name
			tfm.exec.chatMessage("<ROSE>Digite !reiniciar quando a sala tiver com 5 ratos ou mais para começar a partida.")
		end
	end
end
function escolherAssasinos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=1
		quant.assasinos=quant.assasinos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como assasino(a). Sua função será matar os outros jogadores. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherMedicos(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=2
		quant.medicos=quant.medicos+1
		tfm.exec.chatMessage("Você foi escolhido(a) como médico(a). Sua função será salvar os jogadores dos assasinos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function escolherDetetives(name)
	if data[string.lower(name)] and data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=3
		quant.detetives=quant.detetives+1
		tfm.exec.chatMessage("Você foi escolhido(a) como detetive. Sua função será descobrir e matar os assasinos vivos. O jogo irá te explicar o processo passo a passo quando a partida iniciar.",name)
	end
end
function eventNewPlayer(name)
	data[string.lower(name)]={type=-1,morre=false}
	tfm.exec.chatMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1311.005<br><p align='left'>",name)
end
function eventPlayerDied(name)
	if data[string.lower(name)].type == 0 then
		data[string.lower(name)].type=-1
	end
	if data[string.lower(name)].type == 1 then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 then
		quant.detetives=quant.detetives-1
	end
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	jogadores.vivos=jogadores.vivos-1
end
function eventPlayerLeft(name)
	jogadores.lista={}
	for name,player in pairs(tfm.get.room.playerList) do
	if not tfm.get.room.playerList[name].isDead then
		table.insert(jogadores.lista,string.lower(name))
	end
	end
	if data[string.lower(name)].type == 1 and not tfm.get.room.playerList[name].isDead then
		quant.assasinos=quant.assasinos-1
	elseif data[string.lower(name)].type == 2 and not tfm.get.room.playerList[name].isDead then
		quant.medicos=quant.medicos-1
	elseif data[string.lower(name)].type == 3 and not tfm.get.room.playerList[name].isDead then
		quant.detetives=quant.detetives-1
	end
	data[string.lower(name)].type=-1
end
function definirLimites()
	if jogadores.vivos < 10 then
		limites.assasinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 10 and jogadores.vivos < 16 then
		limites.assasinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 16 and jogadores.vivos < 22 then
		limites.assasinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 22 and jogadores.vivos < 28 then
		limites.assasinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 28 and jogadores.vivos < 38 then
		limites.assasinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 38 then
		limites.assasinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.detetives do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
	sortearDetetives()
end
function sortearAssasinos()
	for i=1,limites.assasinos do
		local jogador=jogadores.lista[math.random(#jogadores.lista)]
		if data[jogador] and data[jogador].type == 0 then
			escolherAssasinos(jogador)
			jogadores.lista={}
			for name,player in pairs(tfm.get.room.playerList) do
				if data[string.lower(name)].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(jogadores.lista,string.lower(name))
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5	
	if modo == "aguardando" then
		ui.setMapName("<J>Assasinos vivos: <R><b>"..quant.assasinos.."</b>  <BL>|  <J>Detetives vivos: <VP><b>"..quant.detetives.."</b>  <BL>|  <N>Versão RTM 1311.005<")
	end
	if contador == 1 then
		if admin == "" then
			tfm.exec.chatMessage("<VP>O module não pode ser iniciado. <br>Certifique-se de que inseriu seu nome corretamente no nome da sala.<br><br>Exemplo: <b>/sala #anvilwar00cd3#Spectra_phantom#6089</b><br><br>Em caso de un FunCorp, certifique-se que inseriu o nome corretamente no código.<br><br>Script desativado.")
		else
			if jogadores.vivos >= 5 then
				tfm.exec.chatMessage("<br><br><br><p align='center'><N><b>Bem-vindos ao module Cidade Dorme!</b><br>O objetivo deste module é: Descubra quem são os assassinos, desconfie e se divirta!<br><VP>O jogo irá explicar todo seu funcionamento durante a partida.<br><br><J><b>Script desenvolvido por Rakan_raster#0000</b><br>Conceito original por Spectra_phantom#6089<br><br><ROSE>Versão RTM 1311.005<br><p align='left'>")
			else
				tfm.exec.chatMessage("<R>Número insuficiente de jogadores na sala. O script requer pelo menos 5 jogadores.")
				contador=-30
			end
		end
	end
	if contador == 35 then
		if jogadores.vivos >= 5 then
			tfm.exec.chatMessage("<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...<br><R>POR FAVOR, NINGUÉM DIGA QUEM É QUEM PORQUE ESTRAGA O JOGO!!")
			definirLimites()
		else
			tfm.exec.chatMessage("<R>Ratos ativos insuficientes na sala. Reiniciando o código...")
			contador=990
		end
	end
	if contador == 40 then
		sortearAssasinos()
		modo="aguardando"
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)].type == 0 then
				tfm.exec.chatMessage("<J>Você foi escolhido como vítima.",name)
			end
		end
	end
	if contador == 48 then
		tfm.exec.chatMessage("<J>A rodada será iniciada em 10 segundos! SE PREPAREM!")
		jogadores.vitimas=0
	end
	if contador == 58 then
		tfm.exec.chatMessage("<VP>O JOGO COMEÇOU!")
	end
	if contador == 62 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
			end
		end
	end
	if contador == 92 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 1 then
				ui.addPopup(101,0,"",name,-1710,325,20,true)
			end
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 122 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 2 then
				ui.addPopup(102,0,"",name,-1710,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Hora da verdade... VAMOS VER QUEM MORREU")
	end
	if contador == 127 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>Os assasinos mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os assasinos mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>Os assasinos mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
		if jogadores.vitimas == 0 then
			tfm.exec.chatMessage("<VP>Ufa! Ninguém foi morto!")
		end
	end
	if contador == 135 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Agora é hora dos detetives escolherem quem eles acham que são os assasinos.")
		end
	end
	if contador == 140 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
			end
		end
	end
	if contador == 170 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].type == 3 then
				ui.addPopup(103,0,"",name,-1910,325,20,true)
			end
		end
		tfm.exec.chatMessage("<VP>Tempo esgotado! Vamos ver no que deu?")
	end
	if contador == 175 then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[string.lower(name)] and data[string.lower(name)].morre == true and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				if data[string.lower(name)].type == 0 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram a vítima <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 1 then
					tfm.exec.chatMessage("<VP>Os detetives mataram o assasino <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 2 then
					tfm.exec.chatMessage("<R>OH NÃO! Os detetives mataram o médico <b>"..name.."!</b>")
				elseif data[string.lower(name)].type == 3 then
					tfm.exec.chatMessage("<R>FOGO AMIGO! Os detetives mataram o detetive <b>"..name.."!</b>")
				end
			end
		end
	end
	if contador == 180 then
		if quant.assasinos == 0 then
			tfm.exec.chatMessage("<VP><b>Não há mais assasinos vivos! Os jogadores remanescentes venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		elseif quant.detetives == 0 then
			tfm.exec.chatMessage("<R><b>Não há mais detetives vivos! Os assasinos vivos venceram!</b><br><br>Próxima partida começando em 30 segundos.")
			contador=970
		else
			tfm.exec.chatMessage("<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe")
			contador=42
		end
	end
	if contador >= 1000 then
		tfm.exec.newGame(mapa)
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 60 and contador <= 93 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			jogadores.vitimas=jogadores.vitimas-1
			tfm.exec.chatMessage("Você decidiu matar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(101,2,"Quem deseja matar? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!:",name,10,320,780,true)
		end
	end
	if id == 102 and contador >= 90 and contador <= 123 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			if data[string.lower(message)].morre == true then
				data[string.lower(message)].morre=false
				jogadores.vitimas=jogadores.vitimas+1
			end
			tfm.exec.chatMessage("Você decidiu salvar o jogador "..message..".",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou salvar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(102,2,"Quem deseja salvar dos assasinos? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
	if id == 103 and contador >= 138 and contador <= 171 then
		if data[string.lower(message)] and data[string.lower(message)].morre == false then
			data[string.lower(message)].morre=true
			tfm.exec.chatMessage("Você acha que "..message.." é o assasino.",name)
		else
			tfm.exec.chatMessage("<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",name)
			ui.addPopup(103,2,"Quem você acha que é o assasino? POR FAVOR, NÃO SE ESQUEÇA DE POR A #TAG NO NOME!!!",name,10,320,780,true)
		end
	end
end
tfm.exec.newGame(mapa)
end

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7803705")
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00falling<br>/room #anvilwar00deadfender<br>/room #anvilwar00cd<br><br><BL>Do you want to see your module included into #anvilwar rooms? Contact <b>Spectra_phantom#6089</b> on Transformice or <b>BarodiusEleven#2941</b> on Discord.")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00falling<br>/room #anvilwar00deadfender<br>/room #anvilwar00cd<br><br><BL>Do you want to see your module included into #anvilwar rooms? Contact <b>Spectra_phantom#6089</b> on Transformice or <b>BarodiusEleven#2941</b> on Discord.")
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.160.1<br>By Spectra_phantom#6089")
if string.find(tfm.get.room.name,"*") then
	tfm.exec.chatMessage("<ROSE><b>Tribehouse detected. Only #anvilwar will be available in English.</b>")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
		tfm.exec.chatMessage("<R>Room name not allowed. Shutting down...")
	elseif string.find(tfm.get.room.name,"falling") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'falling' on room name.<br>Initialising #falling module...")
		initFalling()
	elseif string.find(tfm.get.room.name,"deadfender") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'deadfender' on room name.<br>Initialising #deadfender module...<br><R><b>WARNING: This module isn't made by #anvilwar developers. Bugs and issues needs to be reported to respective owners.</b>")
		initDeadfender()
	elseif string.find(tfm.get.room.name,"cd") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'cd' on room name.<br>Initialising #cd module...")
		initFalling()
	elseif string.find(tfm.get.room.name,"rooms") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'rooms' on room name.<br>Showing available #anvilwar rooms.")
		Rooms()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
