-- Transformice #anvilwar module loader - Version 2.159
-- By Spectra_phantom#6089
-- Included sub-modules: #fall, #objects, #test.

local anvilwar = {
	_NAME = "anvilwar",
	_VERSION = "2.159",
	_MAINV = "31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	bar = "<b>#anvilwar</b> RTM 31224.120",
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
	if valendo == true and tempo < 45 and tempo > 44 and sudden_death == false then
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
remaining=0
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
				ui.setMapName("<J><b>"..tfm.get.room.currentMap.."</b>  <BL>|   <N>Difficulty : <R><b>"..functs.level.."</b>  <BL>|  <N>#objects RTM 7653.037  <BL>|  <N>Time Left : <J><b>"..remaining.."</b><")
			else
				ui.setMapName("<J><b>"..map_names[i].."</b>  <BL>|   <N>Difficulty : <R><b>"..functs.level.."</b>  <BL>|  <N>#objects RTM 7653.037  <BL>|  <N>Time Left : <J><b>"..remaining.."</b><")
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

initFall = function()
tfm.exec.disableAutoNewGame(true)
winner=""
tfm.exec.disableAllShamanSkills(true)
tfm.exec.disablePhysicalConsumables(true)
tfm.exec.setRoomMaxPlayers(24)
map='<C><P DS="m;200,220,400,220,600,220,800,220,1000,220,1200,220,1400,220" F="4" L="1590" /><Z><S><S X="800" L="1600" H="130" c="4" Y="335" T="3" P="0,0,0,20,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="50" H="400" N="" Y="200" T="10" X="25" /><S P="0,0,0,0.2,0,0,0,0" L="50" X="1565" N="" Y="200" T="10" H="400" /><S L="40" X="800" H="1600" Y="20" T="10" P="0,0,0,0.2,90,0,0,0" /><S L="40" H="1600" X="800" Y="115" T="10" P="0,0,0,0.2,90,0,0,0" /><S L="1600" H="134" X="800" v="1" Y="335" T="9" P="0,0,,,,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="1000" o="6a7495" X="-500" c="4" N="" Y="375" T="12" H="1000" /><S H="1000" L="1000" o="6a7495" X="2100" c="4" N="" Y="375" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S H="1000" L="2000" o="6a7495" X="772" c="4" N="" Y="900" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S c="4" L="424" o="6a7495" H="722" X="1803" N="" Y="302" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DC Y="79" X="800" /><P P="0,0" Y="367" T="45" X="389" /><P P="0,0" Y="367" T="45" X="1185" /><P C="bb5631" Y="402" T="86" P="0,0" X="148" /><P C="bb5631" Y="402" T="86" P="0,0" X="765" /><P P="0,0" Y="407" T="84" X="520" /><P X="309" Y="399" T="87" P="0,0" /><P X="933" Y="400" T="87" P="0,0" /><P X="1054" Y="401" T="88" P="0,0" /><P X="1402" Y="401" T="83" P="0,0" /><P X="1287" Y="404" T="80" P="0,0" /><P X="799" Y="153" T="36" P="0,0" /><P X="1100" Y="147" T="36" P="0,0" /><P X="1404" Y="147" T="36" P="0,0" /><P X="491" Y="154" T="36" P="0,0" /><P X="201" Y="157" T="36" P="0,0" /></D><O><O C="2" Y="300" P="0" X="70" /><O C="2" Y="300" X="130" P="0" /><O C="2" Y="300" P="0" X="190" /><O C="2" Y="300" X="250" P="0" /><O C="2" Y="300" P="0" X="310" /><O C="2" Y="300" X="370" P="0" /><O C="2" Y="300" P="0" X="430" /><O C="2" Y="300" X="490" P="0" /><O C="2" Y="300" P="0" X="550" /><O C="2" Y="300" X="610" P="0" /><O C="2" Y="300" P="0" X="670" /><O C="2" Y="300" X="730" P="0" /><O C="2" Y="300" P="0" X="790" /><O C="2" Y="300" X="850" P="0" /><O C="2" Y="300" P="0" X="910" /><O C="2" Y="300" X="970" P="0" /><O C="2" Y="300" P="0" X="1030" /><O C="2" Y="300" X="1090" P="0" /><O C="2" Y="300" P="0" X="1150" /><O C="2" Y="300" X="1210" P="0" /><O C="2" Y="300" P="0" X="1270" /><O C="2" Y="300" X="1330" P="0" /><O C="2" Y="300" P="0" X="1390" /><O C="2" Y="300" X="1450" P="0" /><O C="2" Y="300" P="0" X="1510" /></O><L><VL n="Layer1" l="-1" /><JD c="cf1f00,134,0.75,1" P2="1600,334" P1="0,334" /><JD c="cf1f00,10,0.35,1" P2="1600,262" P1="0,262" /><L /></L></Z></C>'
unlocked=false
tfm.exec.newGame(map)
function eventNewGame()
	unlocked=false
	tfm.exec.setUIMapName("<J>Tente não cair <b>v1.0.7</b> - Module criado por <VP>Rivenbagassa#0000<")
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.lowerSyncDelay(name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
		end
	end
 tfm.exec.chatMessage("<ROSE>Os shamans precisam alternar para o modo <b>normal</b> de shaman para jogar.")
end
function eventPlayerDied(name)
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead and not player.isShaman then
			i=i+1
			n=pname
		end
		if player.isShaman then
			tfm.exec.setGameTime(5)
		end
	end
	if i==0 then
		tfm.exec.setGameTime(5)
	elseif i==1 then
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		tfm.exec.setPlayerScore(name,1,true)
		tfm.exec.setGameTime(5)
		winner=n
		tfm.exec.chatMessage("<VP><b>"..n.."</b> foi o sobrevivente!")
	end
end
function eventLoop(p,f)
	if f < 2000 and f > 1350 then
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isShaman then
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
			end
		end
	end
	if f < 1000 then
		tfm.exec.newGame(map)
		tfm.exec.setShaman(winner)
	end
	if p > 500 and p < 1500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if tfm.get.room.playerList[name].isShaman then
				if tfm.get.room.playerList[name].shamanMode > 0 then
					tfm.exec.killPlayer(name)
					tfm.exec.chatMessage("<ROSE>Você deve usar o modo <b>normal</b> de shaman para jogar.",name)
				end
			end
		end
	end
	if p > 3000 and unlocked == false then
		unlocked=true
	end
	if p > 3500 and p < 4500 then
		for name,player in pairs(tfm.get.room.playerList) do
			if player.y > 150 and unlocked == true then
				tfm.exec.giveCheese(name)
			end
		end
	end
end
end

initTest = function()
-- Script com diversos mapas de desafio aleatórios para estressar o povo. Alguns são super fáceis, mas outros estão intocados, ninguém passou deles. Boa sorte e boa diversão (sqn). Os mapas são sempre trocados automaticamente a cada 5 minutos. 
-- Script adicionado e atualizado por Shun_kazami#7014.
-- Muitos desses mapas foram criados por Dhanny_mheyran#6701, mas alguns não sei o criador ainda
-- VERSÃO REDUZIDA
reset=0;
txt=""
mapa21='<C><P defilante="0,0,0,1" F="0" L="3200" H="2000" /><Z><S><S L="80" H="80" X="1560" Y="1960" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="21" X="1510" H="287" Y="1855" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="12" X="1593" H="212" Y="1814" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1380" H="125" Y="1655" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="125" X="1200" Y="1555" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1020" H="125" Y="1455" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="125" X="840" Y="1355" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="660" H="125" Y="1255" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="125" X="480" Y="1155" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="300" H="125" Y="1055" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="125" X="125" Y="955" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="60" H="120" Y="953" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="5" H="255" Y="766" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="5" H="89" Y="594" T="3" P="0,0,0.3,10,0,0,0,0" /><S L="800" X="512" H="10" Y="466" T="1" P="0,0,0,0.2,-25,0,0,0" /><S L="880" X="2760" H="40" Y="1980" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="1908" X="1561" /><T Y="547" X="3179" /><F Y="1958" X="2351" /><F Y="1935" X="2352" /><F Y="1912" X="2353" /></D><O><O C="15" Y="1906" P="0" X="2469" /><O C="15" Y="1842" P="0" X="2599" /><O C="15" Y="1772" P="0" X="2728" /><O C="15" Y="1676" P="0" X="2840" /><O C="15" Y="1530" P="0" X="2934" /><O C="15" Y="1357" P="0" X="3020" /><O C="15" Y="1141" P="0" X="3084" /><O C="15" Y="884" P="0" X="3160" /><O C="16" Y="1942" P="0" X="2600" /><O C="16" Y="1877" P="0" X="2731" /><O C="16" Y="1798" P="0" X="2850" /><O C="16" Y="1704" P="0" X="2939" /><O C="16" Y="1588" P="0" X="3028" /><O C="16" Y="1588" P="0" X="3028" /><O C="16" Y="1398" P="0" X="3088" /><O C="16" Y="1398" P="0" X="3088" /><O C="16" Y="1398" P="0" X="3088" /><O C="16" Y="1251" P="0" X="3161" /><O C="16" Y="1251" P="0" X="3161" /><O C="16" Y="1251" P="0" X="3161" /><O C="16" Y="1251" P="0" X="3161" /></O></Z></C>'
mapa22='<C><P Ca="" L="9800" /><Z><S><S L="120" H="200" X="60" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="240" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="420" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="600" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="1460" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="60" X="330" H="10" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" X="330" H="872" Y="-458" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" H="872" X="1500" Y="-458" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="120" X="1640" H="200" Y="299" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="1820" Y="299" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="2000" H="200" Y="299" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="139" H="10" X="2128" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" X="2130" H="872" Y="-458" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="120" X="2860" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="3040" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="3220" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="3400" Y="301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="139" X="2954" H="10" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" H="172" X="2870" Y="-458" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="120" X="4620" H="200" Y="301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="4440" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="4260" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="4800" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="2991" H="177" Y="-461" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" H="600" X="4299" Y="-419" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="61" X="4710" H="10" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" H="600" X="4710" Y="-426" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="120" X="5659" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="5859" Y="301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="6059" H="200" Y="301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="6259" Y="301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="7058" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="7258" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="7458" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="7658" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="8459" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="8659" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="8859" H="200" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="200" X="9059" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="320" X="9641" H="200" Y="300" T="6" P="0,0,0,0,0,0,0,0" /><S L="10" X="5679" H="877" Y="-426" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="121" H="10" X="6378" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" X="6378" H="877" Y="-420" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" H="677" X="7080" Y="-420" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="10" H="677" X="7560" Y="-405" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="121" X="7560" H="10" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" X="8485" H="677" Y="-405" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="121" H="10" X="8958" Y="427" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" H="677" X="8958" Y="-395" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" X="9640" H="777" Y="-395" T="2" P="0,0,0,1.2,-45,0,0,0" /></S><D><DS Y="187" X="63" /><P C="581e17,4a2d10" Y="0" T="117" X="0" P="0,0" /><P C="8000ff,8000ff" Y="1" T="117" P="0,0" X="8399" /><P C="ffff00,ffaa00" Y="0" T="117" X="1400" P="0,0" /><P C="ff,aa" Y="0" T="117" X="2800" P="0,0" /><P C="8000,4000" Y="0" T="117" X="4240" P="0,0" /><P C="151515,151515" Y="1" T="117" X="5639" P="0,0" /><P C="ffffff,ffffff" Y="1" T="117" X="7038" P="0,0" /><F Y="198" X="9636" /><T Y="201" X="9716" /></D><O /></Z></C>'
mapa23='<C><P F="0" L="3000" defilante="0,0,0,1" H="1125" /><Z><S><S c="3" L="40" H="56" X="559" Y="72" T="6" P="0,0,0.3,0.2,5,0,0,0" /><S L="3000" H="793" X="1459" Y="610" T="6" P="0,0,0,0,5,0,0,0" /><S L="160" X="271" H="24" Y="96" T="1" P="1,999,0,0.2,5,0,0,0" /><S L="80" X="2961" H="33" Y="177" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,4,5,0,0,0" L="10" X="2955" c="2" Y="303" T="3" H="80" /><S L="10" X="-5" H="110" Y="56" T="8" P="0,0,9999,0,0,0,0,0" /><S L="3000" H="10" X="1456" Y="183" T="8" P="0,0,0.3,0.2,5,0,0,0" /><S P="0,0,0.3,0.2,5,0,0,0" L="40" X="1020" c="3" Y="112" T="6" H="56" /><S H="56" L="40" X="1977" c="3" Y="194" T="6" P="0,0,0.3,0.2,5,0,0,0" /><S H="56" L="40" X="1483" c="3" Y="154" T="6" P="0,0,0.3,0.2,5,0,0,0" /><S P="0,0,0.3,0.2,5,0,0,0" L="40" H="56" c="3" Y="238" T="6" X="2455" /></S><D><DS Y="145" X="2969" /><F Y="81" X="29" /><T Y="305" X="2931" /></D><O /></Z></C>'
mapa24='<C><P F="2" L="1000" G="0,25" /><Z><S><S L="95" X="117" H="70" Y="385" T="1" P="0,0,0,0.2,15,0,0,0" /><S L="700" H="10" X="579" Y="395" T="4" P="0,0,9999,0,0,0,0,0" /><S L="80" X="960" H="50" Y="375" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="692" X="574" H="50" Y="376" T="9" P="0,0,,,,0,0,0" /><S L="80" X="40" H="63" Y="370" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="67" X="194" H="51" Y="376" T="2" P="0,0,0,1,0,0,0,0" /><S L="192" H="40" X="563" Y="331" T="9" P="0,0,,,,0,0,0" /><S L="192" X="754" H="80" Y="311" T="9" P="0,0,,,,0,0,0" /><S L="70" H="120" X="885" Y="291" T="9" P="0,0,,,,0,0,0" /><S L="36" H="84" X="938" Y="310" T="1" P="0,0,0,0.2,0,0,0,0" /></S><D><F Y="336" X="39" /><T Y="350" X="980" /><DS Y="332" X="42" /></D><O /><L><VL n="Layer1" l="-1" /><JD P1="14,32" c="ffffff,2,1,0" P2="13,95" /><JD P1="51,67" c="ffffff,2,1,0" P2="14,93" /><JD P1="22,34" c="ffffff,2,1,0" P2="52,63" /><JD P1="98,37" c="ffffff,2,1,0" P2="74,38" /><JD P1="72,84" c="ffffff,2,1,0" P2="70,35" /><JD P1="95,85" c="ffffff,2,1,0" P2="72,85" /><JD P1="93,59" c="ffffff,2,1,0" P2="72,58" /><JD P1="156,33" c="ffffff,2,1,0" P2="130,35" /><JD P1="126,63" c="ffffff,2,1,0" P2="128,36" /><JD P1="154,61" c="ffffff,2,1,0" P2="122,59" /><JD P1="144,79" c="ffffff,2,1,0" P2="161,60" /><JD P1="118,81" c="ffffff,2,1,0" P2="140,79" /><JD P1="201,38" c="ffffff,2,1,0" P2="180,82" /><JD P1="209,85" c="ffffff,2,1,0" P2="202,38" /><JD P1="190,71" c="ffffff,2,1,0" P2="208,71" /><JD P1="239,40" c="ffffff,2,1,0" P2="240,83" /><JD P1="276,39" c="ffffff,2,1,0" P2="237,36" /><JD P1="267,62" c="ffffff,2,1,0" P2="242,68" /><JD P1="320,42" c="ffffff,2,1,0" P2="318,88" /><JD P1="354,35" c="ffffff,2,1,0" P2="387,35" /><JD P1="351,89" c="ffffff,2,1,0" P2="350,36" /><JD P1="391,83" c="ffffff,2,1,0" P2="389,34" /><JD P1="360,88" c="ffffff,2,1,0" P2="389,86" /><JD P1="460,32" c="ffffff,2,1,0" P2="460,98" /><JD P1="494,30" c="ffffff,2,1,0" P2="493,92" /><JD P1="467,68" c="ffffff,2,1,0" P2="492,65" /><JD P1="540,37" c="ffffff,2,1,0" P2="514,92" /><JD P1="561,92" c="ffffff,2,1,0" P2="537,39" /><JD P1="529,75" c="ffffff,2,1,0" P2="555,75" /><JD P1="591,37" c="ffffff,2,1,0" P2="629,88" /><JD P1="631,37" c="ffffff,2,1,0" P2="586,88" /><JD P1="696,38" c="000000,2,1,1" P2="724,37" /><JD P1="723,60" c="000000,2,1,1" P2="723,35" /><JD P1="689,66" c="000000,2,1,1" P2="724,65" /><JD P1="689,97" c="000000,2,1,1" P2="685,63" /><JD P1="722,98" c="000000,2,1,1" P2="692,97" /><JD P1="765,61" c="000000,2,1,1" P2="794,64" /><JD P1="790,104" c="000000,2,1,1" P2="798,67" /><JD P1="755,99" c="000000,2,1,1" P2="789,102" /><JD P1="764,23" c="000000,2,1,1" P2="757,99" /><JD P1="222,124" c="ffffff,2,1,0" P2="192,122" /><JD P1="185,166" c="ffffff,2,1,0" P2="186,119" /><JD P1="212,171" c="ffffff,2,1,0" P2="188,169" /><JD P1="281,122" c="ffffff,2,1,0" P2="254,124" /><JD P1="251,181" c="ffffff,2,1,0" P2="256,128" /><JD P1="274,179" c="ffffff,2,1,0" P2="255,179" /><JD P1="286,150" c="ffffff,2,1,0" P2="257,148" /><JD P1="302,182" c="ffffff,2,1,0" P2="303,129" /><JD P1="319,152" c="ffffff,2,1,0" P2="302,127" /><JD P1="327,122" c="ffffff,2,1,0" P2="317,149" /><JD P1="335,179" c="ffffff,2,1,0" P2="327,125" /><JD P1="835,89" c="ffffff,2,1,0" P2="835,90" /><JD P1="836,70" c="ffffff,2,1,0" P2="836,71" /><JD P1="426,123" c="ffffff,2,1,0" P2="402,125" /><JD P1="395,171" c="ffffff,2,1,0" P2="396,127" /><JD P1="425,179" c="ffffff,2,1,0" P2="394,169" /><JD P1="426,153" c="ffffff,2,1,0" P2="426,170" /><JD P1="408,150" c="ffffff,2,1,0" P2="423,150" /><JD P1="440,112" c="ffffff,2,1,0" P2="447,178" /><JD P1="468,122" c="ffffff,2,1,0" P2="442,108" /><JD P1="469,146" c="ffffff,2,1,0" P2="474,125" /><JD P1="451,141" c="ffffff,2,1,0" P2="468,148" /><JD P1="470,171" c="ffffff,2,1,0" P2="446,143" /><JD P1="502,126" c="ffffff,2,1,0" P2="483,170" /><JD P1="510,174" c="ffffff,2,1,0" P2="503,122" /><JD P1="493,158" c="ffffff,2,1,0" P2="505,158" /><JD P1="529,134" c="ffffff,2,1,0" P2="547,178" /><JD P1="572,136" c="ffffff,2,1,0" P2="551,180" /><JD P1="590,134" c="ffffff,2,1,0" P2="593,177" /><JD P1="614,136" c="ffffff,2,1,0" P2="614,179" /><JD P1="637,159" c="ffffff,2,1,0" P2="615,182" /><JD P1="637,150" c="ffffff,2,1,0" P2="613,133" /><JD P1="661,181" c="ffffff,2,1,0" P2="679,136" /><JD P1="697,188" c="ffffff,2,1,0" P2="675,136" /><JD P1="669,169" c="ffffff,2,1,0" P2="687,169" /><JD P1="730,141" c="ffffff,2,1,0" P2="737,184" /><JD P1="763,163" c="ffffff,2,1,0" P2="739,180" /><JD P1="739,140" c="ffffff,2,1,0" P2="762,156" /><JD P1="813,136" c="ffffff,2,1,0" P2="781,137" /><JD P1="777,181" c="ffffff,2,1,0" P2="780,136" /><JD P1="807,184" c="ffffff,2,1,0" P2="781,179" /><JD P1="805,166" c="ffffff,2,1,0" P2="778,155" /><L /></L></Z></C>'
mapa25='<C><P F="0" L="2555" defilante="0,0,0,1" Ca="" H="612" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="600" X="300" c="1" N="" Y="340" T="6" H="80" /><S v="7500" X="700" L="200" H="80" c="2" N="" Y="340" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,,,,0,0,0" L="2555" H="232" v="1" Y="496" T="9" X="1277" /><S L="120" X="60" H="230" Y="185" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="600" X="300" H="233" Y="496" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="208" X="704" H="33" Y="594" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="803" H="10" Y="573" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="103" X="991" H="10" Y="609" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="63" X="1074" H="10" Y="609" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="70" X="1081" H="10" Y="385" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="124" X="1422" H="10" Y="507" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1582" H="10" Y="552" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1691" H="10" Y="581" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1827" H="10" Y="607" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="219" X="1991" H="10" Y="608" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="51" X="2125" H="14" Y="605" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="171" X="1929" H="40" Y="259" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="16" X="1836" H="38" Y="259" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="141" X="1643" H="72" Y="343" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1567" H="65" Y="340" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="53" X="2125" H="10" Y="466" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="87" X="2057" H="231" Y="356" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="87" X="2195" H="10" Y="466" T="3" P="0,0,0,20,0,0,0,0" /><S L="28" X="2254" H="10" Y="466" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S H="10" L="2555" o="6a7495" X="1277" c="4" Y="616" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="169" X="1043" Y="464" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S v="8500" H="235" L="2555" o="6a7495" X="1278" c="2" N="" Y="495" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" N="" L="2555" o="6a7495" X="2077" c="2" v="8500" Y="194" T="12" H="666" /></S><D><F Y="68" X="61" /><DS Y="59" X="62" /><T Y="300" X="779" /></D><O /><L><VL n="Layer1" l="-1" /><JD c="0080ff,250,0.65,1" P1="0,486" P2="2555,486" /><L /></L></Z></C>'
mapa26='<C><P F="8" L="5350" G="0,3.5" H="10000000" /><Z><S><S L="120" H="292" X="60" Y="258" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="98" X="65" /><F Y="149" X="5320" /><T Y="206" X="5319" /></D><O><O C="6" Y="154" P="0" X="260" /><O C="6" Y="150" P="0" X="469" /><O C="6" Y="148" P="0" X="669" /><O C="6" Y="146" P="0" X="857" /><O C="6" Y="146" P="0" X="1073" /><O C="6" Y="141" P="0" X="1308" /><O C="6" Y="143" P="0" X="1586" /><O C="6" Y="142" P="0" X="1864" /><O C="6" Y="143" P="0" X="2167" /><O C="6" Y="148" P="0" X="2504" /><O C="6" Y="148" P="0" X="2871" /><O C="6" Y="151" P="0" X="3301" /><O C="6" Y="151" P="0" X="3742" /><O C="6" Y="149" P="0" X="4248" /><O C="6" Y="143" P="0" X="4798" /><O C="11" Y="163" X="258" P="0" /><O C="11" Y="160" X="469" P="0" /><O C="11" Y="157" X="669" P="0" /><O C="11" Y="154" X="857" P="0" /><O C="11" Y="155" X="1072" P="0" /><O C="11" Y="150" X="1307" P="0" /><O C="11" Y="151" X="1584" P="0" /><O C="11" Y="149" X="1862" P="0" /><O C="11" Y="151" X="2166" P="0" /><O C="11" Y="155" X="2503" P="0" /><O C="11" Y="155" X="2870" P="0" /><O C="11" Y="157" X="3300" P="0" /><O C="11" Y="159" X="3743" P="0" /><O C="11" Y="156" X="4247" P="0" /><O C="11" Y="151" X="4797" P="0" /></O></Z></C>'
mapa27='<C><P F="0" L="8100" H="1500" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="168" X="187" c="1" Y="211" T="8" H="52" /><S P="0,0,0.3,0.2,-70,0,0,0" L="168" H="52" c="1" Y="848" T="8" X="3545" /><S P="0,0,0.3,0.2,-50,0,0,0" L="168" H="52" c="1" Y="1009" T="8" X="3306" /><S P="0,0,0.3,0.2,50,0,0,0" L="168" H="52" c="1" Y="774" T="8" X="2746" /><S P="0,0,0.3,0.2,-40,0,0,0" L="168" H="52" c="1" Y="728" T="8" X="2631" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="829" T="8" X="2378" /><S P="0,0,0.3,0.2,30,0,0,0" L="168" H="52" c="1" Y="891" T="8" X="2084" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="379" T="8" X="1830" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="308" T="8" X="1488" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="146" T="8" X="1290" /><S P="0,0,0.3,0.2,90,0,0,0" L="168" H="52" c="1" Y="142" T="8" X="1049" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="153" T="8" X="813" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="205" T="8" X="646" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="256" T="8" X="479" /><S P="0,0,0.3,0.2,83,0,0,0" L="168" X="4870" c="1" Y="965" T="8" H="52" /><S P="0,0,0.3,0.2,50,0,0,0" L="168" X="4549" c="1" Y="860" T="8" H="52" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" X="4191" c="1" Y="748" T="8" H="52" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" X="3893" c="1" Y="464" T="8" H="52" /><S P="0,0,0.3,0.2,110,0,0,0" L="168" X="3806" c="1" Y="578" T="8" H="52" /><S P="0,0,0.3,0.2,90,0,0,0" L="168" X="3779" c="1" Y="732" T="8" H="52" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="1206" T="8" X="6000" /><S P="0,0,0.3,0.2,-97,0,0,0" L="168" H="52" c="1" Y="1283" T="8" X="5800" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="1374" T="8" X="5608" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="1271" T="8" X="5245" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="1071" T="8" X="4937" /><S P="0,0,0.3,0.2,-70,0,0,0" L="168" X="7351" c="1" Y="821" T="8" H="52" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" X="7100" c="1" Y="926" T="8" H="52" /><S P="0,0,0.3,0.2,-10,0,0,0" L="168" X="6789" c="1" Y="939" T="8" H="52" /><S P="0,0,0.3,0.2,160,0,0,0" L="168" X="6520" c="1" Y="989" T="8" H="52" /><S P="0,0,0.3,0.2,-180,0,0,0" L="168" X="3039" c="1" Y="1125" T="8" H="52" /><S P="0,0,0.3,0.2,90,0,0,0" L="168" X="6263" c="1" Y="1082" T="8" H="52" /><S P="0,0,0.3,0.2,0,0,0,0" L="168" H="52" c="1" Y="312" T="8" X="7966" /><S P="0,0,0.3,0.2,90,0,0,0" L="168" H="52" c="1" Y="366" T="8" X="7794" /><S P="0,0,0.3,0.2,-40,0,0,0" L="168" H="52" c="1" Y="484" T="8" X="7738" /><S P="0,0,0.3,0.2,-70,0,0,0" L="168" H="52" c="1" Y="636" T="8" X="7511" /></S><D><F Y="177" X="115" /><T Y="286" X="8024" /><DS Y="169" X="118" /></D><O /></Z></C>'
mapa28='<C><P F="1" L="2222" H="666" /><Z><S><S L="618" X="310" H="261" Y="267" T="4" P="1,0,20,0.2,0,0,0,0" /><S L="10" X="16" H="10" v="8000" Y="402" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S H="858" L="332" o="6a7495" X="-165" c="3" Y="315" T="12" P="0,0,0,0,0,0,0,0" /><S L="10" X="245" H="10" Y="574" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="625" H="12" X="312" Y="660" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="762" H="86" Y="623" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="92" X="803" H="10" Y="583" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="959" H="183" Y="574" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="63" X="932" H="10" Y="484" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="906" H="120" Y="428" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="917" H="81" Y="425" T="3" P="0,0,0,20,0,0,0,0" /><S L="10" X="1471" H="99" Y="415" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="69" X="1456" H="10" Y="341" T="4" P="0,0,20,0.2,60,0,0,0" /><S L="10" X="1564" H="84" Y="325" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1727" H="80" Y="332" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1909" H="68" Y="344" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="2090" H="69" Y="351" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="2167" H="73" Y="208" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="2141" H="10" Y="288" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="2191" H="10" Y="136" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="2209" H="70" Y="57" T="3" P="0,0,0,20,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="10" X="620" c="3" Y="99" T="1" H="79" /><S P="0,0,20,0.2,0,0,0,0" L="10" X="630" c="3" Y="100" T="4" H="83" /><S H="666" L="1610" o="6a7495" X="1420" c="3" v="12000" Y="333" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="119" H="10" X="554" Y="53" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="332" X="494" Y="-108" T="1" P="0,0,0,0.2,0,0,0,0" /></S><D><F Y="132" X="597" /><T Y="136" X="29" /><T Y="59" X="635" /></D><O><O C="11" Y="146" P="0" X="608" /></O></Z></C>'
mapa29='<C><P DS="m;200,350,201,351" F="6" L="21000" defilante="0,0,0,1" /><Z><S><S L="3000" H="33" X="1500" Y="383" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="4500" H="33" Y="383" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" H="33" X="7500" Y="383" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><F Y="364" X="8981" /><T Y="341" X="8983" /></D><O><O C="32" Y="351" X="499" P="0" /><O C="32" Y="352" X="714" P="0" /><O C="32" Y="354" X="933" P="0" /><O C="15" Y="352" X="1157" P="0" /><O C="32" Y="354" X="1418" P="0" /><O C="32" Y="352" X="1937" P="0" /><O C="32" Y="353" X="2220" P="0" /><O C="32" Y="353" X="2220" P="0" /><O C="32" Y="350" X="2429" P="0" /><O C="15" Y="353" P="0" X="2749" /><O C="32" Y="355" P="0" X="3064" /><O C="32" Y="355" P="0" X="3412" /><O C="32" Y="354" P="0" X="3774" /><O C="15" Y="356" P="0" X="4120" /><O C="15" Y="354" P="0" X="4455" /><O C="32" Y="352" P="0" X="4752" /><O C="32" Y="354" P="0" X="5037" /><O C="32" Y="351" P="0" X="5349" /><O C="32" Y="348" P="0" X="5611" /><O C="15" Y="350" P="0" X="5907" /><O C="15" Y="352" P="0" X="6220" /><O C="32" Y="350" P="0" X="6512" /><O C="32" Y="352" P="0" X="6831" /><O C="32" Y="353" P="0" X="7111" /><O C="15" Y="353" P="0" X="7413" /><O C="15" Y="356" P="0" X="7716" /><O C="15" Y="358" P="0" X="8056" /><O C="32" Y="354" P="0" X="8419" /><O C="32" Y="353" P="0" X="8755" /><O C="15" Y="357" P="0" X="9022" /></O></Z></C>'
mapa30='<C><P Ca="" L="3000" defilante="0,0,0,1" H="800" F="7" /><Z><S><S Y="326" T="1" P="0,0,0,0.2,0,0,0,0" L="10" H="180" X="1258" /><S Y="326" T="1" P="0,0,0,0.2,0,0,0,0" L="10" X="1762" H="180" /><S Y="608" T="10" P="0,0,0.3,0,0,0,0,0" L="40" X="2980" H="384" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" H="207" X="20" /><S Y="608" T="10" P="0,0,0.3,0,0,0,0,0" L="40" H="384" X="20" /><S Y="785" T="10" P="0,0,0.3,0,0,0,0,0" L="3000" X="1500" H="30" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" X="2980" H="207" /><S Y="326" T="3" P="0,0,0,9999,0,0,0,0" L="400" H="180" X="240" /><S Y="223" T="4" P="0,0,20,0.2,0,0,0,0" L="10" H="22" X="45" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" X="460" H="207" /><S Y="252" T="6" P="0,0,0.3,0.2,0,0,0,0" L="400" X="680" H="32" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" H="207" X="900" /><S Y="317" T="9" P="0,0,,,,0,0,0" L="300" X="1070" H="200" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" X="1240" H="207" /><S Y="223" T="9" P="0,0,,,,0,0,0" L="10" X="1340" H="10" /><S Y="223" T="9" P="0,0,,,,0,0,0" L="10" H="10" X="1440" /><S Y="223" T="9" P="0,0,,,,0,0,0" L="10" X="1540" H="10" /><S Y="223" T="9" P="0,0,,,,0,0,0" L="10" H="10" X="1640" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="40" H="207" X="1780" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="10" X="1969" H="207" /><S Y="314" T="6" P="0,0,0.3,0.2,0,0,0,0" L="10" X="2187" H="208" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="10" H="208" X="2410" /><S Y="313" T="6" P="0,0,0.3,0.2,0,0,0,0" L="10" X="2613" H="208" /><S Y="313" T="1" P="0,0,0,0.2,0,0,0,0" L="29" X="2774" H="207" /><S Y="313" T="7" H="207" P="0,0,0.1,0.2,0,0,0,0" L="960" X="2280" c="4" N="" /><S Y="320" T="3" P="0,0,0,9999,0,0,0,0" L="171" X="2874" H="191" /><S Y="107" T="12" X="237" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="91" /><S Y="51" T="12" X="666" P="0,0,0.3,0.2,0,0,0,0" L="50" o="324650" H="10" /><S Y="74" T="12" X="687" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="39" /><S Y="92" T="12" X="666" P="0,0,0.3,0.2,0,0,0,0" L="39" o="324650" H="10" /><S Y="119" T="12" X="650" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="53" /><S Y="145" T="12" X="670" P="0,0,0.3,0.2,0,0,0,0" L="41" o="324650" H="10" /><S Y="48" T="12" X="1031" P="0,0,0.3,0.2,0,0,0,0" L="55" o="324650" H="10" /><S Y="93" T="12" X="1030" P="0,0,0.3,0.2,0,0,0,0" L="48" o="324650" H="10" /><S Y="135" T="12" H="10" P="0,0,0.3,0.2,0,0,0,0" L="46" o="324650" X="1033" c="1" /><S Y="92" T="12" X="1058" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="94" /><S Y="91" T="12" X="1555" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="118" /><S Y="89" T="12" X="1531" P="0,0,0.3,0.2,0,0,0,0" L="51" o="324650" H="10" /><S Y="60" T="12" X="1509" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="54" /><S Y="30" T="12" X="2243" P="0,0,0.3,0.2,0,0,0,0" L="64" o="324650" H="10" /><S Y="55" T="12" X="2217" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="43" /><S Y="77" T="12" X="2244" P="0,0,0.3,0.2,0,0,0,0" L="54" o="324650" H="10" /><S Y="103" T="12" X="2269" P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="49" /><S Y="129" T="12" X="2242" P="0,0,0.3,0.2,0,0,0,0" L="59" o="324650" H="10" /><S Y="103" T="13" H="10" P="0,0,0.3,0.2,0,0,0,0" L="25" o="324650" X="2874" c="4" /><S Y="65" T="12" H="62" P="0,0,0.3,0.2,20,0,0,0" L="10" o="324650" X="2866" c="4" /></S><D><DS Y="193" X="23" /><P Y="400" T="34" P="0,0" X="40" C="111111" /><P Y="400" T="34" X="840" P="0,0" C="111111" /><P Y="400" T="34" P="0,0" X="1640" C="111111" /><P Y="400" T="34" X="2164" P="0,0" C="111111" /><P Y="670" T="45" P="0,0" X="425" /><P Y="670" T="45" X="1222" P="0,0" /><P Y="670" T="45" P="0,0" X="2018" /><P Y="675" T="45" X="2570" P="0,0" /><F Y="232" X="622" /><F Y="233" X="848" /><P Y="237" T="48" P="0,0" X="541" /><P Y="237" T="48" P="0,0" X="622" /><P Y="237" T="48" P="0,0" X="701" /><P Y="238" T="48" P="0,0" X="774" /><P Y="236" T="48" P="0,0" X="849" /><F Y="208" X="1240" /><F Y="187" X="1239" /><F Y="166" X="1238" /><F Y="145" X="1239" /><F Y="121" X="1240" /><F Y="99" X="1240" /><F Y="75" X="1241" /><F Y="53" X="1240" /><F Y="31" X="1240" /><T Y="212" X="2980" /></D><O /></Z></C>'
mapa31='<C><P F="0" L="2007" /><Z><S><S c="3" L="160" H="300" X="170" Y="250" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="13" o="ffffffff" H="100" X="251" Y="51" T="12" P="0,0,0,0,0,0,0,0" /><S L="90" X="45" H="18" Y="392" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" X="80" H="554" Y="-300" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" H="554" X="2007" Y="-300" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="320" X="2007" H="300" Y="250" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S c="3" L="160" X="335" H="300" Y="250" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="200" X="1700" Y="100" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="60" X="1700" Y="230" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1550" H="185" Y="92" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1550" H="54" Y="212" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="170" X="1400" Y="85" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="48" X="1400" Y="195" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="155" X="1250" Y="76" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1250" H="42" Y="175" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1100" H="140" Y="70" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="36" X="1100" Y="158" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="125" X="950" Y="63" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="950" H="30" Y="140" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="800" H="110" Y="55" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="24" X="800" Y="123" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="95" X="650" Y="47" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="650" H="18" Y="104" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="500" H="80" Y="41" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="12" X="500" Y="88" T="4" P="0,0,20,0.2,0,0,0,0" /><S c="3" L="20" H="370" X="426" Y="215" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="1600" X="965" H="10" Y="-5" T="1" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="243" o="324650" X="2282" Y="-101" T="12" H="403" /><S L="1363" X="957" H="10" Y="-495" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="160" X="1730" H="10" Y="-495" T="1" P="0,0,0,0.2,0,0,0,0" /></S><D><F Y="96" X="343" /><T Y="102" X="295" /><DS Y="89" X="196" /></D><O /></Z></C>'
mapa32='<C><P F="3" L="2000" Ca="" /><Z><S><S L="80" X="42" H="160" Y="320" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="400" H="140" X="281" Y="330" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="80" H="160" X="520" Y="320" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="30" H="30" X="185" Y="245" T="3" P="0,0,0,950,0,0,0,0" /><S L="30" X="360" H="30" Y="245" T="3" P="0,0,0,950,0,0,0,0" /><S L="80" H="25" X="40" Y="110" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="80" X="520" H="25" Y="110" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="400" H="10" X="280" Y="107" T="9" P="0,0,,,,0,0,0" /><S L="10" H="200" X="700" Y="200" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="30" X="700" Y="315" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="35" H="10" X="722" Y="281" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="10" X="746" Y="281" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="35" H="10" X="722" Y="271" T="3" P="0,0,0,950,0,0,0,0" /><S L="10" H="50" X="830" Y="259" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="10" X="830" Y="289" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="105" X="830" Y="150" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="90" X="960" Y="140" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="40" X="960" Y="205" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="120" X="1050" Y="145" T="1" P="0,0,0,0.2,40,0,0,0" /><S L="51" H="14" X="990" Y="193" T="3" P="0,0,0,,0,0,0,0" /><S L="10" H="14" X="1020" Y="193" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="50" X="1090" Y="120" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="46" X="1051" Y="161" T="4" P="0,0,20,0.2,40,0,0,0" /><S L="10" H="10" X="1090" Y="150" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="150" X="1210" Y="75" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="110" H="10" X="1150" Y="100" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="10" X="1211" Y="155" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="200" H="10" X="1315" Y="100" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="200" X="1315" H="10" Y="110" T="3" P="0,0,0,45,0,0,0,0" /><S L="10" X="1221" H="34" Y="132" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="200" X="1315" H="35" Y="132" T="9" P="0,0,,,,0,0,0" /><S L="10" X="1421" H="55" Y="122" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" X="1421" H="48" Y="174" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1432" H="36" Y="168" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="50" H="10" X="1240" Y="90" T="3" P="0,0,0,9999,0,0,0,0" /><S L="10" H="120" X="1150" Y="-201" T="2" P="0,0,0,1.2,45,0,0,0" /><S L="10" X="1250" H="120" Y="-205" T="2" P="0,0,0,1.2,-45,0,0,0" /><S L="10" H="10" X="1270" Y="90" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="240" H="10" X="1557" Y="173" T="9" P="0,0,,,,0,0,0" /><S L="10" H="85" X="1680" Y="135" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="35" X="1680" Y="195" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="26" X="1691" Y="165" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="107" H="10" X="1739" Y="145" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="240" X="1848" Y="246" T="4" P="0,0,20,0.2,-30,0,0,0" /><S L="10" H="39" X="1903" Y="319" T="1" P="0,0,0,0.2,-30,0,0,0" /><S L="10" H="10" X="1857" Y="241" T="3" P="0,0,0,20,-30,0,0,0" /><S L="10" H="48" X="1691" Y="116" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1670" H="10" Y="96" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="759" X="316" H="10" Y="179" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="115" X="-7" Y="62" T="3" P="0,0,0,20,0,0,0,0" /></S><D><T Y="98" X="40" /><DS Y="224" X="39" /><F Y="94" X="518" /><F Y="101" X="429" /><F Y="64" X="429" /><F Y="82" X="383" /><F Y="111" X="311" /><F Y="109" X="228" /><F Y="84" X="213" /><F Y="110" X="149" /><F Y="78" X="260" /><F Y="93" X="107" /></D><O /></Z></C>'
mapa33='<C><P F="4" L="1600" /><Z><S><S P="0,0,0.3,0.2,70,0,0,0" L="10" o="324650" X="90" Y="65" T="14" H="39" /><S P="0,0,0.3,0.2,-20,0,0,0" L="10" o="324650" X="85" Y="57" T="14" H="46" /><S P="0,0,0.3,0.2,-40,0,0,0" L="11" o="324650" X="106" Y="94" T="14" H="45" /><S L="11" o="324650" X="286" H="45" Y="127" T="14" P="0,0,0.3,0.2,60,0,0,0" /><S L="11" o="324650" X="319" H="45" Y="100" T="14" P="0,0,0.3,0.2,50,0,0,0" /><S L="10" o="324650" X="343" H="46" Y="64" T="14" P="0,0,0.3,0.2,20,0,0,0" /><S H="39" L="10" o="324650" X="353" c="1" Y="20" T="14" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="424" Y="70" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="404" Y="46" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="410" Y="23" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="425" Y="33" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="472" Y="107" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="485" Y="101" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="538" Y="128" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="531" Y="87" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="582" Y="56" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="547" Y="18" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="537" Y="12" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="649" Y="66" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="669" Y="76" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="692" Y="21" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="717" Y="22" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="739" Y="38" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="747" Y="58" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="824" Y="68" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="870" Y="33" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="837" Y="15" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="896" Y="60" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="994" Y="59" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1002" Y="34" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1019" Y="45" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1016" Y="80" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1068" Y="120" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1078" Y="110" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1130" Y="96" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1183" Y="67" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1136" Y="138" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1270" Y="85" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1256" Y="77" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1300" Y="31" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1323" Y="34" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1347" Y="48" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1353" Y="71" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1439" Y="79" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1449" Y="27" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1484" Y="47" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1512" Y="74" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1136" Y="24" T="14" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="1147" Y="29" T="14" H="10" /><S L="3000" o="6a7495" H="10" X="800" Y="405" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="42" X="103" /><F Y="78" X="1552" /><T Y="158" X="187" /></D><O /></Z></C>'
mapa34='<C><P F="8" L="1960" H="440" /><Z><S><S L="160" X="80" H="160" Y="320" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="40" X="140" H="200" Y="100" T="10" P="0,0,0,0,0,0,0,0" /><S L="80" X="280" H="320" Y="160" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="280" Y="325" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="1960" H="800" X="980" Y="800" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="325" H="38" Y="300" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="325" H="58" Y="250" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" X="335" H="10" Y="250" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="150" H="150" X="635" Y="270" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="150" X="635" H="150" Y="75" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="325" H="10" Y="215" T="2" P="0,0,0,1.2,0,0,0,0" /><S L="30" X="749" H="30" Y="323" T="2" P="0,0,0,1.5,45,0,0,0" /><S L="40" H="150" X="729" Y="270" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="40" X="730" H="150" Y="75" T="10" P="0,0,0.3,0,180,0,0,0" /><S L="35" X="768" H="24" Y="12" T="2" P="0,0,0,2.5,0,0,0,0" /><S L="240" X="440" H="80" Y="40" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="1200" H="1800" X="-600" Y="420" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="3000" X="1500" H="480" Y="-240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="30" H="30" X="1919" Y="345" T="2" P="0,0,0,1.5,45,0,0,0" /><S L="1200" X="2560" H="1200" Y="600" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="1940" H="150" Y="325" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="10" X="1940" Y="200" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1940" H="10" Y="150" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="10" X="1940" Y="100" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" X="1940" H="10" Y="50" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="80" H="280" X="905" Y="140" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="80" X="1105" H="240" Y="160" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="80" H="240" X="1305" Y="160" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="80" X="1505" H="240" Y="160" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="80" H="240" X="1705" Y="160" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="1005" H="80" Y="240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="80" X="1205" Y="240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="1405" H="80" Y="240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="80" X="1805" Y="240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="1605" H="80" Y="240" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="1930" Y="50" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="40" X="1765" H="40" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="150" X="859" Y="76" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="40" H="40" X="1646" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="1445" H="40" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="40" X="1365" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="1565" H="40" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="1164" H="40" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="40" X="1245" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" X="1045" H="40" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="40" X="964" Y="60" T="15" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="225" X="32" /><F Y="236" X="80" /><F Y="219" X="79" /><F Y="205" X="138" /><F Y="226" X="138" /><F Y="241" X="140" /><F Y="238" X="105" /><F Y="217" X="108" /><T Y="35" X="967" /><DC Y="183" X="733" /></D><O /></Z></C>'
mapa35='<C><P F="1" L="2500" G="5,15" /><Z><S><S L="120" H="202" X="2440" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,0,0,0,0,0,0" L="36" o="42b41d" H="10" Y="224" T="13" X="2250" /><S L="36" o="42b41d" H="10" X="2080" Y="224" T="13" P="1,0,0,0,0,0,0,0" /><S P="1,0,0,0,0,0,0,0" L="36" o="42b41d" X="1910" Y="224" T="13" H="10" /><S P="1,0,0.3,0.2,0,0,0,0" L="10" o="42b410" X="2250" Y="224" T="12" H="116" /><S L="10" o="42b410" X="2080" H="116" Y="224" T="12" P="1,0,0.3,0.2,0,0,0,0" /><S P="1,0,0.3,0.2,0,0,0,0" L="10" o="42b410" H="116" Y="224" T="12" X="1910" /><S L="632" X="2184" H="50" Y="26" T="3" P="0,0,0,20,0,0,0,0" /><S L="120" X="1730" H="202" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1599" H="104" Y="149" T="9" P="0,0,,,,0,0,0" /><S L="10" X="1538" H="79" Y="58" T="9" P="0,0,,,,0,0,0" /><S L="10" X="1464" H="53" Y="27" T="9" P="0,0,,,,0,0,0" /><S L="120" H="202" X="1212" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1397" H="54" Y="28" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="555" X="1669" H="10" Y="-5" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" X="2454" H="10" Y="194" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="1864" H="127" Y="64" T="3" P="0,0,0,20,0,0,0,0" /><S L="12" X="1146" H="59" Y="370" T="3" P="0,0,0,25,0,0,0,0" /><S L="10" X="1146" H="10" Y="336" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="1152" X="576" H="10" Y="406" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="1152" H="10" X="119" Y="387" T="1" P="0,0,0,0.2,30,0,0,0" /><S L="1152" X="-50" H="10" Y="267" T="1" P="0,0,0,0.2,60,0,0,0" /><S L="1152" H="10" X="-101" Y="31" T="1" P="0,0,0,0.2,80,0,0,0" /><S L="1152" X="11" H="10" Y="-51" T="1" P="0,0,0,0.2,110,0,0,0" /><S L="1152" H="10" X="60" Y="-9" T="1" P="0,0,0,0.2,140,0,0,0" /><S L="1152" X="271" H="10" Y="-76" T="1" P="0,0,0,0.2,160,0,0,0" /><S L="1152" H="10" X="1378" Y="-270" T="1" P="0,0,0,0.2,180,0,0,0" /><S L="1152" X="2516" H="10" Y="-270" T="1" P="0,0,0,0.2,180,0,0,0" /><S L="1152" H="10" X="2182" Y="-5" T="1" P="0,0,0,0.2,180,0,0,0" /><S L="1152" X="2813" H="10" Y="-192" T="1" P="0,0,0,0.2,220,0,0,0" /><S L="1152" H="10" X="2918" Y="-38" T="1" P="0,0,0,0.2,250,0,0,0" /><S L="1152" X="2897" H="10" Y="73" T="1" P="0,0,0,0.2,300,0,0,0" /><S L="1152" H="10" X="3043" Y="11" T="1" P="0,0,0,0.2,340,0,0,0" /><S L="10" H="152" X="2506" Y="77" T="1" P="0,0,0,0.2,0,0,0,0" /></S><D><DS Y="187" X="2437" /><P X="1758" Y="200" T="4" P="0,0" /><P X="2409" Y="199" T="0" P="0,0" /><P X="2428" Y="254" T="1" P="0,0" /><P X="1700" Y="201" T="3" P="0,0" /><P X="1240" Y="202" T="0" P="0,0" /><P X="1206" Y="200" T="2" P="0,0" /><P X="1178" Y="199" T="5" P="0,0" /><T Y="200" X="2479" /><F Y="397" X="1111" /><DC Y="189" X="1163" /></D><O><O X="2250" C="13" Mv="15" Y="224" Mp="Infinity" P="0" /><O X="2080" C="13" Mv="15" Y="224" Mp="Infinity" P="0" /><O X="1910" C="13" Mv="15" Y="224" Mp="Infinity" P="0" /></O></Z></C>'
mapa36='<C><P F="0" L="2400" H="500" /><Z><S><S L="3000" X="620" H="25" Y="80" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" X="0" c="4" Y="1592" T="5" H="3000" /><S H="3000" L="3000" X="3000" c="4" Y="1592" T="5" P="0,0,0.3,0.2,0,0,0,0" /><S L="2080" H="25" X="3230" Y="80" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,20,0,0,0,0" L="3000" X="0" c="4" N="" Y="990" T="3" H="1040" /><S H="1040" L="3000" X="3000" c="4" N="" Y="990" T="3" P="0,0,0,20,0,0,0,0" /><S L="80" X="79" H="25" Y="212" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="80" H="25" X="245" Y="232" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" X="112" H="25" Y="316" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="233" Y="362" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" X="384" H="25" Y="270" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="913" Y="177" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="862" Y="137" T="10" P="0,0,0.3,0,-120,0,0,0" /><S L="80" H="25" X="723" Y="188" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" X="564" H="25" Y="233" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="385" Y="399" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" X="520" H="25" Y="353" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="653" Y="308" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" X="873" H="25" Y="466" T="10" P="0,0,0.3,0,-20,0,0,0" /><S L="80" H="25" X="963" Y="389" T="10" P="0,0,14,0,-20,0,0,0" /><S L="80" X="1030" H="25" Y="311" T="10" P="0,0,14,0,-20,0,0,0" /><S L="80" H="25" X="1117" Y="234" T="10" P="0,0,4,0,-20,0,0,0" /><S L="80" X="1638" H="25" Y="209" T="10" P="0,0,14,0,-20,0,0,0" /><S L="80" H="25" X="1448" Y="491" T="10" P="0,0,14,0,-20,0,0,0" /><S L="80" H="25" X="1592" Y="493" T="10" P="0,0,14,0,-20,0,0,0" /><S L="80" H="25" X="1729" N="" Y="422" T="10" P="0,0,14,0,-20,0,0,0" /><S L="16" X="2155" H="394" Y="273" T="9" P="0,0,,,,0,0,0" /><S P="0,0,14,0,-20,0,0,0" L="80" X="1705" N="" Y="362" T="10" H="25" /><S L="80" X="1683" H="25" N="" Y="309" T="10" P="0,0,14,0,-20,0,0,0" /><S P="0,0,14,0,-20,0,0,0" L="80" H="25" N="" Y="260" T="10" X="1661" /><S L="80" H="25" X="1619" Y="162" T="10" P="0,0,14,0,-20,0,0,0" /><S L="600" X="1282" H="25" Y="104" T="9" P="0,0,,,,0,0,0" /><S P="0,0,14,0,-20,0,0,0" L="80" X="1911" N="" Y="443" T="10" H="25" /><S L="80" X="2076" H="25" N="" Y="445" T="10" P="0,0,14,0,-20,0,0,0" /></S><D><F Y="155" D="" X="910" /><T Y="68" X="60" /><DS Y="191" X="82" /><DC Y="286" X="1033" /></D><O /></Z></C>'
mapa37='<C><P F="8" L="3000" /><Z><S><S L="120" X="60" H="160" Y="320" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="285" Y="320" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" X="405" H="160" Y="160" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="602" Y="81" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="233" H="10" X="519" Y="-5" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="120" X="602" H="160" Y="275" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="774" Y="184" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" X="894" H="160" Y="24" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="24" H="136" X="774" v="1" Y="332" T="9" P="0,0,,,,0,0,0" /><S L="120" H="160" X="1012" Y="248" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="158" X="947" Y="248" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="120" X="1206" H="160" Y="84" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="1286" Y="489" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="10" X="1140" H="158" Y="84" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="120" X="1406" H="160" Y="330" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="1324" Y="140" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="56" X="1271" Y="32" T="3" P="0,0,0,20,0,0,0,0" /><S L="10" H="158" X="840" Y="-135" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="120" X="2341" H="160" Y="81" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="2461" Y="241" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="10" H="158" X="2287" Y="-79" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="120" X="2585" H="160" Y="491" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="2802" Y="502" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" X="2888" H="160" Y="320" T="10" P="0,0,0.3,0,0,0,0,0" /><S L="120" H="160" X="2678" Y="236" T="10" P="0,0,0.3,0,0,0,0,0" /></S><D><DS Y="225" X="60" /><F Y="24" X="2425" /><T Y="400" X="2975" /></D><O /><L><VL n="Layer1" l="-1" /><JD P2="9999,125" c="ffffff,250,0.95,1" P1="-999,125" /><JD P2="9999,375" c="ffffff,250,0.95,1" P1="-999,375" /><JD P2="9999,-125" c="ffffff,250,0.95,1" P1="-999,-125" /><JD P2="9999,625" c="ffffff,250,0.95,1" P1="-999,625" /><L /></L></Z></C>'
mapa38='<C><P Ca="" F="0" H="3000" /><Z><S><S P="0,0,0.3,0,0,0,0,0" L="816" X="400" c="4" Y="1892" T="10" H="2200" /><S L="800" X="400" H="30" Y="2985" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="60" Y="2905" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="61" H="30" Y="2831" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="269" Y="2831" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="162" H="30" Y="2763" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="162" Y="2695" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="346" H="30" Y="2639" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="497" Y="2574" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="345" H="30" Y="2515" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="646" Y="2516" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="619" H="30" Y="2375" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="368" Y="2371" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="120" H="30" Y="2372" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="61" Y="2301" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="226" H="30" Y="2244" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="226" Y="2177" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="483" H="30" Y="2214" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="637" Y="2153" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="485" H="30" Y="2093" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="261" Y="2054" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="327" Y="1953" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="740" H="30" Y="1945" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="554" Y="1885" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="361" H="30" Y="1841" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="360" Y="1739" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="575" H="30" Y="1739" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="463" Y="1537" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="140" H="30" Y="1534" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="261" Y="1436" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="741" H="30" Y="1241" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="522" Y="1188" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="321" H="30" Y="1136" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="30" X="145" Y="1084" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="741" H="30" Y="871" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="720" H="30" X="360" Y="807" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="39" X="117" Y="2797" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0.3,1.2,0,0,0,0" L="10" o="ffffffff" X="495" Y="2513" T="12" H="24" /><S L="10" o="ffffffff" X="314" H="24" Y="2344" T="12" P="0,0,0.3,55,0,0,0,0" /><S P="0,0,0.3,55,0,0,0,0" L="10" o="ffffffff" H="24" Y="2151" T="12" X="172" /><S L="10" o="ffffffff" H="24" X="207" Y="2027" T="12" P="0,0,0.3,1,0,0,0,0" /><S P="0,0,0.3,1,0,0,0,0" L="10" o="ffffffff" X="382" Y="1927" T="12" H="24" /><S L="10" o="ffffffff" X="795" H="24" Y="1919" T="12" P="0,0,0.3,1.2,0,0,0,0" /><S P="0,0,0.3,1.2,0,0,0,0" L="10" o="ffffffff" H="24" Y="1713" T="12" X="306" /><S L="10" o="ffffffff" H="24" X="521" Y="1712" T="12" P="0,0,0.3,55,0,0,0,0" /><S L="10" o="ffffffff" H="24" X="795" Y="1214" T="12" P="0,0,0.3,1.2,0,0,0,0" /></S><D><DS Y="2956" X="769" /><F Y="1848" D="" X="103" /><T Y="792" X="37" /><P P="0,0" Y="793" T="1" X="645" /><P P="0,0" Y="794" T="1" X="455" /><P P="0,0" Y="794" T="1" X="269" /><P P="0,0" Y="792" T="0" X="579" /><P P="0,0" Y="794" T="4" X="516" /><P P="0,0" Y="794" T="5" X="411" /><P P="0,0" Y="793" T="5" X="341" /><P P="0,0" Y="792" T="3" X="688" /><P P="0,0" Y="795" T="3" X="202" /><P P="0,0" Y="795" T="3" X="154" /><P P="0,0" Y="792" T="11" X="100" /></D><O /></Z></C>'
mapa39='<C><P H="400" F="2" L="2400" Ca="" /><Z><S><S L="120" H="200" X="60" Y="300" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="2340" H="200" Y="300" T="6" P="0,0,0,2,0,0,0,0" /><S H="200" L="2160" o="0" X="1200" c="4" Y="300" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" H="15" X="180" Y="192" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" o="0" X="180" H="15" Y="392" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="120" X="384" H="15" Y="192" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="120" o="0" H="15" Y="392" T="12" X="384" /><S L="10" X="440" H="24" Y="173" T="3" P="0,0,0,20,0,0,0,0" /><S L="10" o="0" H="24" X="440" Y="373" T="12" P="0,0,0.3,20,0,0,0,0" /><S L="80" H="15" X="534" Y="167" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="2160" o="0" X="1200" Y="205" T="12" H="10" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" o="0" X="534" Y="367" T="12" H="15" /><S L="80" X="616" H="15" Y="135" T="6" P="0,0,0.3,0.2,-90,0,0,0" /><S L="80" o="0" X="615" H="15" Y="335" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="80" o="0" H="15" Y="253" T="12" X="663" /><S L="80" H="15" X="663" Y="53" T="6" P="0,0,0.3,0.2,-90,0,0,0" /><S L="14" X="663" H="10" Y="98" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="14" o="0" H="10" X="663" Y="298" T="12" P="0,0,20,0.2,90,0,0,0" /><S L="80" X="723" H="15" Y="53" T="6" P="0,0,0.3,0.2,-90,0,0,0" /><S L="14" H="10" X="723" Y="98" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="80" o="0" H="15" X="723" Y="253" T="12" P="0,0,0.3,0.2,90,0,0,0" /><S P="0,0,20,0.2,90,0,0,0" L="14" o="0" X="723" Y="298" T="12" H="10" /><S P="0,0,0,0.2,0,0,0,0" L="10" o="0" X="736" Y="253" T="12" H="81" /><S L="10" H="81" X="736" Y="53" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="14" o="0" X="746" H="10" Y="278" T="12" P="0,0,20,0.2,90,0,0,0" /><S L="14" X="746" H="10" Y="78" T="4" P="0,0,20,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,90,0,0,0" L="80" o="0" X="888" Y="360" T="12" H="15" /><S L="80" H="15" X="888" Y="160" T="6" P="0,0,0.3,0.2,-90,0,0,0" /><S L="10" X="970" H="81" Y="118" T="1" P="0,0,0,0.2,-30,0,0,0" /><S L="10" H="81" X="1063" Y="118" T="1" P="0,0,0,0.2,30,0,0,0" /><S L="14" H="10" X="993" Y="158" T="4" P="0,0,20,0.2,-30,0,0,0" /><S L="14" X="1040" H="10" Y="157" T="4" P="0,0,20,0.2,30,0,0,0" /><S L="80" o="0" X="970" H="10" Y="318" T="12" P="0,0,0,0.2,60,0,0,0" /><S P="0,0,0,0.2,120,0,0,0" L="80" o="0" H="10" Y="318" T="12" X="1063" /><S P="0,0,20,0.2,150,0,0,0" L="14" o="0" H="10" Y="358" T="12" X="993" /><S L="14" o="0" H="10" X="1040" Y="357" T="12" P="0,0,20,0.2,30,0,0,0" /><S L="80" o="0" H="10" X="1172" Y="252" T="12" P="0,0,0,0.2,120,0,0,0" /><S P="0,0,20,0.2,120,0,0,0" L="14" o="0" X="1149" Y="292" T="12" H="10" /><S L="14" o="0" X="1175" H="10" Y="266" T="12" P="0,0,20,0.2,120,0,0,0" /><S P="0,0,20,0.2,120,0,0,0" L="14" o="0" H="10" Y="230" T="12" X="1196" /><S L="10" X="1172" H="81" Y="52" T="1" P="0,0,0,0.2,30,0,0,0" /><S L="14" H="10" X="1149" Y="92" T="4" P="0,0,20,0.2,120,0,0,0" /><S L="14" X="1175" H="10" Y="66" T="4" P="0,0,20,0.2,120,0,0,0" /><S L="14" H="10" X="1196" Y="30" T="4" P="0,0,20,0.2,120,0,0,0" /><S L="10" X="1363" H="81" Y="142" T="1" P="0,0,0,0.2,30,0,0,0" /><S P="0,0,0,0.2,120,0,0,0" L="80" o="0" X="1363" Y="342" T="12" H="10" /><S L="10" X="1394" H="24" Y="122" T="3" P="0,0,0,20,0,0,0,0" /><S P="0,0,0,20,0,0,0,0" L="10" o="0" H="24" Y="322" T="12" X="1394" /><S L="49" X="2249" H="10" Y="192" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="49" o="0" X="2251" H="10" Y="387" T="12" P="0,0,0,0.2,0,0,0,0" /></S><D><DS Y="377" X="147" /><T Y="187" X="2251" /><F Y="195" X="1014" /><F Y="395" X="1012" /><T Y="381" D="" X="2253" /></D><O /></Z></C>'
mapa40='<C><P F="0" L="5600" H="1600" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="1500" c="4" Y="600" T="12" H="1200" /><S H="1200" L="3000" o="6a7495" X="2499" c="4" Y="601" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="317" o="ffffffff" H="10" X="160" Y="1594" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="143" X="324" Y="1527" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="192" X="447" Y="1502" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="241" X="588" Y="1475" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="132" o="ffffffff" H="10" X="656" Y="1360" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="176" o="ffffffff" H="10" X="990" Y="1597" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="1194" Y="1596" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="1350" Y="1595" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="1491" Y="1593" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="207" o="ffffffff" H="10" X="1736" Y="1593" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="1918" Y="1542" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2017" Y="1496" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2102" Y="1454" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2198" Y="1409" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2305" Y="1363" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2413" Y="1326" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2535" Y="1291" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2645" Y="1318" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2751" Y="1364" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2846" Y="1415" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="2944" Y="1474" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="3032" Y="1536" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="3126" Y="1594" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="10" X="3290" Y="1593" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="489" o="ffffffff" H="10" X="3683" Y="1589" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="142" o="ffffffff" H="10" X="4077" Y="1592" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="ffffffff" H="269" X="4294" Y="1462" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="137" o="ffffffff" H="10" X="4481" Y="1592" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="900" o="6000ff" H="1200" X="5411" N="" Y="1398" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="40" H="800" X="5118" Y="430" T="6" P="0,0,0.3,0.2,20,0,0,0" /><S L="360" H="800" X="5304" Y="499" T="6" P="0,0,0.3,0.2,20,0,0,0" /><S L="360" X="5420" H="600" Y="503" T="6" P="0,0,0.3,0.2,00,0,0,0" /><S L="146" o="ffffffff" H="10" X="4754" Y="1595" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><P C="8000ff" Y="1200" T="34" P="0,0" X="0" /><P C="8000ff" Y="1200" T="34" X="1600" P="0,1" /><P C="8000ff" Y="1200" T="34" X="1600" P="0,0" /><P C="8000ff" Y="1200" T="34" X="3200" P="0,1" /><P C="8000ff" Y="1200" T="34" X="3200" P="0,0" /><P C="8000ff" Y="1200" T="34" X="4800" P="0,1" /><DS Y="389" X="158" /><P C="8000ff" Y="1200" T="34" P="0,0" X="4800" /><P C="8000ff" Y="800" T="34" P="0,1" X="4800" /><P C="8000ff" Y="1200" T="34" P="0,1" X="4840" /><P C="8000ff" Y="1200" T="34" P="0,1" X="4840" /><P C="8000ff" Y="1200" T="34" P="0,1" X="4840" /><P C="8000ff" Y="800" T="34" X="4800" P="0,0" /><T Y="175" X="5564" /><F Y="142" X="5479" /></D><O /></Z></C>'
mapa41='<C><P F="0" L="4800" Ca="" /><Z><S><S L="174" H="10" X="86" Y="177" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="233" X="265" Y="169" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="193" H="10" X="365" Y="57" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="189" H="10" X="94" Y="395" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="230" H="10" X="398" Y="393" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="242" X="510" Y="277" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="194" X="386" Y="258" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="108" H="10" X="326" Y="162" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="114" H="10" X="448" Y="162" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="243" X="632" Y="277" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="109" H="10" X="570" Y="277" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="111" H="10" X="570" Y="267" T="3" P="0,0,0,200,0,0,0,0" /><S L="10" H="101" X="715" Y="109" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="87" X="796" Y="200" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="217" H="10" X="751" Y="101" T="1" P="0,0,0,0.2,50,0,0,0" /><S L="10" H="21" X="822" Y="190" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="10" H="236" X="975" Y="274" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="214" H="10" X="1088" Y="160" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="327" H="10" X="1358" Y="165" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="17" H="127" X="1513" Y="106" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="153" X="1441" Y="33" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="57" H="10" X="1474" Y="104" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="70" H="10" X="1400" Y="-38" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="204" H="10" X="1624" Y="49" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="300" X="1771" Y="173" T="1" P="0,0,0,0.2,45,0,0,0" /><S L="1149" H="32" X="1554" Y="376" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="21" H="194" X="991" Y="263" T="2" P="0,0,0.2,2.4,0,0,0,0" /><S L="303" H="10" X="2722" Y="365" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="60" X="2565" Y="360" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="14" H="162" X="2866" Y="289" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="218" H="10" X="2646" Y="210" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="10" H="90" X="2771" Y="258" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="107" X="2645" Y="266" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" H="10" X="2645" Y="324" T="4" P="0,0,20,0.2,0,0,0,0" /><S L="104" H="10" X="2807" Y="210" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="257" H="10" X="3001" Y="213" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="111" H="10" X="3182" Y="344" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="112" H="10" X="3291" Y="344" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S L="600" H="10" X="3647" Y="344" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="800" H="45" X="4400" Y="361" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="3000" o="6a7495" X="2501" c="4" Y="208" T="12" H="555" /><S L="10" H="29" X="796" Y="257" T="4" P="0,0,20,0.2,0,0,0,0" /><S H="555" L="3000" o="6a7495" X="1500" c="4" Y="200" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><F Y="145" D="" X="1175" /><P X="4067" Y="338" T="1" P="0,0" /><P X="4752" Y="339" T="1" P="0,0" /><P X="4251" Y="339" T="1" P="0,0" /><P X="4580" Y="344" T="1" P="0,0" /><P X="4150" Y="339" T="0" P="0,0" /><P X="4666" Y="340" T="0" P="0,0" /><P X="4304" Y="339" T="2" P="0,0" /><P X="4521" Y="341" T="2" P="0,0" /><T Y="338" X="4402" /><DS Y="160" X="23" /></D><O /><L><VL n="Layer1" l="-1" /><JD c="ffffff,2,1,1" P1="41,39" P2="13,85" /><JD c="ffffff,2,1,1" P1="62,41" P2="63,86" /><JD c="ffffff,2,1,1" P1="88,58" P2="64,40" /><JD c="ffffff,2,1,1" P1="89,58" P2="68,87" /><JD c="ffffff,2,1,1" P1="126,46" P2="103,43" /><JD c="ffffff,2,1,1" P1="101,81" P2="101,42" /><JD c="ffffff,2,1,1" P1="121,88" P2="98,83" /><JD c="ffffff,2,1,1" P1="123,65" P2="100,67" /><JD c="ffffff,2,1,1" P1="145,47" P2="142,87" /><JD c="ffffff,2,1,1" P1="168,71" P2="149,45" /><JD c="ffffff,2,1,1" P1="148,75" P2="164,69" /><JD c="ffffff,2,1,1" P1="167,97" P2="141,69" /><JD c="ffffff,2,1,1" P1="144,95" P2="166,98" /><JD c="ffffff,2,1,1" P1="181,47" P2="184,95" /><JD c="ffffff,2,1,1" P1="212,92" P2="188,93" /><JD c="ffffff,2,1,1" P1="212,41" P2="213,89" /><JD c="ffffff,2,1,1" P1="265,42" P2="239,44" /><JD c="ffffff,2,1,1" P1="237,94" P2="239,48" /><JD c="ffffff,2,1,1" P1="258,96" P2="240,96" /><JD c="ffffff,2,1,1" P1="270,74" P2="265,96" /><JD c="ffffff,2,1,1" P1="251,75" P2="267,75" /><JD c="ffffff,2,1,1" P1="4000,153" P2="4000,154" /><JD c="000000,2,1,1" P1="4064,10" P2="4062,70" /><JD c="000000,2,1,1" P1="4116,41" P2="4068,12" /><JD c="000000,2,1,1" P1="4070,70" P2="4118,45" /><JD c="000000,2,1,1" P1="4205,16" P2="4164,16" /><JD c="000000,2,1,1" P1="4156,74" P2="4161,19" /><JD c="000000,2,1,1" P1="4194,77" P2="4162,72" /><JD c="000000,2,1,1" P1="4190,43" P2="4158,42" /><JD c="000000,2,1,1" P1="4276,24" P2="4241,42" /><JD c="000000,2,1,1" P1="4274,61" P2="4242,47" /><JD c="000000,2,1,1" P1="4245,77" P2="4272,61" /><JD c="000000,2,1,1" P1="4321,30" P2="4299,73" /><JD c="000000,2,1,1" P1="4339,73" P2="4322,31" /><JD c="000000,2,1,1" P1="4312,62" P2="4333,60" /><JD c="000000,2,1,1" P1="4369,22" P2="4367,75" /><JD c="000000,2,1,1" P1="4412,26" P2="4368,21" /><JD c="000000,2,1,1" P1="4404,56" P2="4370,54" /><JD c="000000,2,1,1" P1="4449,39" P2="4448,67" /><JD c="000000,2,1,1" P1="4451,24" P2="4451,25" /><JD c="000000,2,1,1" P1="4487,31" P2="4484,73" /><JD c="000000,2,1,1" P1="4521,33" P2="4488,31" /><JD c="000000,2,1,1" P1="4525,71" P2="4525,37" /><JD c="000000,2,1,1" P1="4491,77" P2="4521,76" /><JD c="000000,2,1,1" P1="4605,28" P2="4602,68" /><JD c="000000,2,1,1" P1="4634,54" P2="4607,28" /><JD c="000000,2,1,1" P1="4608,72" P2="4638,58" /><JD c="000000,2,1,1" P1="4688,38" P2="4655,36" /><JD c="000000,2,1,1" P1="4653,74" P2="4656,36" /><JD c="000000,2,1,1" P1="4682,77" P2="4655,74" /><JD c="000000,2,1,1" P1="4691,74" P2="4689,37" /><JD c="000000,2,1,1" P1="4164,105" P2="4160,156" /><JD c="000000,2,1,1" P1="4199,109" P2="4193,156" /><JD c="000000,2,1,1" P1="4169,131" P2="4191,131" /><JD c="000000,2,1,1" P1="4245,110" P2="4226,157" /><JD c="000000,2,1,1" P1="4262,154" P2="4247,115" /><JD c="000000,2,1,1" P1="4242,138" P2="4252,138" /><JD c="000000,2,1,1" P1="4286,115" P2="4312,147" /><JD c="000000,2,1,1" P1="4282,146" P2="4309,111" /><JD c="000000,2,1,1" P1="4344,111" P2="4345,153" /><JD c="000000,2,1,1" P1="4374,114" P2="4375,160" /><JD c="000000,2,1,1" P1="4352,136" P2="4370,136" /><JD c="000000,2,1,1" P1="4480,108" P2="4522,110" /><JD c="000000,2,1,1" P1="4520,160" P2="4523,117" /><JD c="000000,2,1,1" P1="4478,161" P2="4516,160" /><JD c="000000,2,1,1" P1="4485,139" P2="4523,130" /><JD c="000000,2,1,1" P1="4559,115" P2="4556,161" /><JD c="000000,2,1,1" P1="4598,117" P2="4563,113" /><JD c="000000,2,1,1" P1="4593,164" P2="4595,115" /><JD c="000000,2,1,1" P1="4562,165" P2="4591,163" /><JD c="ff0000,2,1,1" P1="4179,221" P2="4172,347" /><JD c="ff0000,2,1,1" P1="4123,285" P2="4173,281" /><JD c="ff0000,2,1,1" P1="4154,223" P2="4118,283" /><JD c="ff0000,2,1,1" P1="4334,246" P2="4300,333" /><JD c="ff0000,2,1,1" P1="4346,327" P2="4337,252" /><JD c="ff0000,2,1,1" P1="4317,307" P2="4341,305" /><JD c="ff0000,2,1,1" P1="4385,247" P2="4376,328" /><JD c="ff0000,2,1,1" P1="4417,327" P2="4385,243" /><JD c="ff0000,2,1,1" P1="4424,257" P2="4416,328" /><JD c="ff0000,2,1,1" P1="4461,262" P2="4505,261" /><JD c="ff0000,2,1,1" P1="4457,323" P2="4461,266" /><JD c="ff0000,2,1,1" P1="4510,326" P2="4456,327" /><JD c="ff0000,2,1,1" P1="4514,264" P2="4514,325" /><JD c="ff0000,2,1,1" P1="4615,264" P2="4573,262" /><JD c="ff0000,2,1,1" P1="4575,297" P2="4575,269" /><JD c="ff0000,2,1,1" P1="4612,303" P2="4581,300" /><JD c="ff0000,2,1,1" P1="4614,331" P2="4616,306" /><JD c="ff0000,2,1,1" P1="4561,326" P2="4615,330" /><JD c="ff0000,2,1,1" P1="4658,247" P2="4655,307" /><JD c="ff0000,2,1,1" P1="4654,324" P2="4654,325" /><L /></L></Z></C>'
mapa42='<C><P F="2" L="2225" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="58" o="ffffff" X="58" Y="69" T="12" H="56" /><S L="58" o="ff" X="57" H="56" Y="218" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="58" o="ff0000" X="58" H="56" Y="144" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="58" H="56" X="128" Y="69" T="0" P="0,0,0.3,0.2,0,0,0,0" /><S L="58" H="56" X="128" Y="144" T="1" P="0,0,0,0.2,0,0,0,0" /><S L="58" H="56" X="128" Y="218" T="8" P="0,0,0.3,0.2,0,0,0,0" /><S H="28" L="105" o="ffffff" X="265" c="1" Y="386" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="105" o="ff" X="370" c="2" Y="386" T="12" H="28" /><S L="10" o="ffffff" H="172" X="484" Y="315" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="10" o="ff" H="172" c="1" Y="133" T="12" X="620" /><S L="10" o="ffffff" H="10" X="620" Y="358" T="12" P="0,0,12,0.2,0,0,0,0" /><S L="10" o="ff0000" H="145" X="620" Y="280" T="12" P="0,0,0,0.2,0,0,0,0" /><S H="172" L="10" o="ff" X="772" c="2" Y="281" T="12" P="0,0,0,0.2,45,0,0,0" /><S P="0,0,0.3,0.2,-45,0,0,0" L="10" o="ffffff" X="779" Y="402" T="12" H="172" /><S L="10" o="ffffff" X="1001" H="172" Y="343" T="12" P="0,0,0.3,0.2,45,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="10" o="ff0000" X="1060" Y="216" T="12" H="145" /><S L="10" o="ffffff" X="916" H="172" Y="212" T="12" P="0,0,0.3,0.2,-45,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="ffffff" H="80" Y="183" T="12" X="1050" /><S P="0,0,0,0.2,-45,0,0,0" L="10" o="ff0000" X="1130" c="2" Y="210" T="12" H="172" /><S P="0,0,0.3,0.2,45,0,0,0" L="10" o="ffffff" H="172" Y="336" T="12" X="1404" /><S P="0,0,0,0.2,-45,0,0,0" L="10" o="ff0000" X="1517" Y="333" T="12" H="145" /><S P="0,0,0.3,0.2,45,0,0,0" L="10" o="ffffff" H="172" Y="334" T="12" X="1847" /><S X="1969" L="10" o="ff" H="172" c="2" Y="341" T="12" P="0,0,0,0.2,-45,0,0,0" /><S L="10" o="ffffff" H="172" X="2158" Y="336" T="12" P="0,0,0.3,0.2,45,0,0,0" /><S L="10" o="ffffff" H="172" X="2082" Y="212" T="12" P="0,0,0.3,0.2,-45,0,0,0" /><S P="0,0,0.3,0.2,-45,0,0,0" L="10" o="ffffff" X="1685" Y="280" T="12" H="172" /><S L="10" o="ffffff" X="1365" H="172" Y="187" T="12" P="0,0,0.3,0.2,-45,0,0,0" /><S H="172" L="10" o="ff" X="1243" c="2" Y="194" T="12" P="0,0,0,0.2,45,0,0,0" /></S><D><DS Y="29" X="131" /><F Y="267" X="2199" /><T Y="372" X="234" /></D><O /></Z></C>'
mapa43='<C><P L="3000" /><Z><S><S L="120" H="240" X="60" Y="280" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,50,0.2,0,0,0,0" L="100" o="324650" X="240" Y="240" T="13" H="10" /><S c="3" L="120" X="2978" H="240" Y="281" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="100" o="324650" X="500" H="10" Y="240" T="13" P="1,0,50,0.2,0,0,0,0" /><S L="10" H="10" X="350" Y="239" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" X="610" H="10" Y="240" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,50,0.2,0,0,0,0" L="100" o="324650" H="10" Y="240" T="13" X="760" /><S L="10" H="10" X="870" Y="241" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="100" o="324650" H="10" X="1020" Y="240" T="13" P="1,0,50,0.2,0,0,0,0" /><S L="10" X="1130" H="10" Y="241" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,50,0.2,0,0,0,0" L="100" o="324650" X="1280" Y="240" T="13" H="10" /><S L="150" o="324650" X="1590" H="10" Y="240" T="13" P="1,0,50,0.2,0,0,0,0" /><S L="10" H="10" X="1390" Y="240" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,50,0.2,0,0,0,0" L="150" o="324650" H="10" Y="240" T="13" X="1950" /><S L="10" X="1750" H="10" Y="240" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S L="150" o="324650" H="10" X="2310" Y="240" T="13" P="1,0,50,0.2,0,0,0,0" /><S L="10" H="10" X="2110" Y="243" T="6" P="0,0,0.3,0.2,0,0,0,0" /><S P="1,0,50,0.2,0,0,0,0" L="200" o="324650" X="2720" Y="246" T="13" H="10" /><S L="10" X="2470" H="10" Y="243" T="6" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="147" X="59" /><T Y="160" X="26" /><F Y="159" X="2963" /><DC Y="223" X="1390" /></D><O><O Mv="8" Mp="Infinity" X="240" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="760" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="500" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="1020" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="1280" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="1590" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="1950" C="12" Y="241" P="0" /><O Mv="8" Mp="Infinity" X="2310" C="12" Y="240" P="0" /><O Mv="8" Mp="Infinity" X="2720" C="12" Y="246" P="0" /></O></Z></C>'
mapa44='<C><P defilante="0,0,0,1" G="0,0" H="1200" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="800" o="0" X="400" c="2" Y="600" T="12" H="1200" /><S P="0,0,0.3,0.2,0,0,0,0" L="170" o="324650" H="10" Y="1149" T="12" X="86" /><S L="10" o="324650" X="329" H="60" Y="1170" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="170" o="324650" H="10" X="250" Y="1100" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="324650" X="274" H="36" Y="1119" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="340" o="324650" X="174" H="10" Y="1018" T="12" P="0,0,0.3,0.2,-10,0,0,0" /><S L="420" H="10" X="550" Y="989" T="3" P="0,0,0,9999,0,0,0,0" /><S L="464" H="10" X="568" Y="1190" T="1" P="0,0,0,0.2,1,0,0,0" /><S L="96" o="324650" X="752" H="10" Y="890" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="48" o="324650" H="10" Y="840" T="12" X="680" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="11" Y="1096" T="12" H="107" /><S L="720" X="401" H="10" Y="980" T="1" P="0,0,0,0.2,1,0,0,0" /><S L="600" X="350" H="10" Y="800" T="3" P="0,0,0,20,0,0,0,0" /><S L="10" o="324650" H="272" X="795" Y="749" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="1128" o="324650" H="10" X="1354" Y="617" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="1550" o="324650" H="10" X="-680" Y="733" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="324650" H="10" X="160" Y="790" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="500" o="324650" H="10" X="345" Y="723" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="260" Y="790" T="12" H="10" /><S L="10" o="324650" X="360" H="10" Y="790" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" H="10" Y="790" T="12" X="460" /><S L="10" o="324650" H="10" X="560" Y="790" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="10" o="324650" X="60" Y="790" T="12" H="10" /><S L="10" o="324650" H="238" X="652" Y="686" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="500" H="10" X="345" Y="720" T="3" P="0,0,0,20,0,0,0,0" /><S L="547" H="10" X="384" Y="556" T="1" P="0,0,0,0.2,3,0,0,0" /><S L="700" o="324650" H="10" X="350" Y="460" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="148" o="324650" H="10" X="726" Y="646" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="10" o="324650" H="464" X="700" Y="233" T="12" P="0,0,0.3,0.2,0,0,0,0" /></S><D><DS Y="1182" X="45" /><F Y="727" X="606" /><F Y="728" X="634" /><T Y="98" D="" X="753" /></D><O><O C="15" Y="1150" P="0" X="190" /><O C="15" Y="1150" P="0" X="221" /><O C="15" Y="1150" P="0" X="277" /><O C="15" Y="1150" P="0" X="307" /><O C="15" Y="1120" P="0" X="255" /><O C="15" Y="965" X="749" P="0" /><O C="15" Y="890" X="662" P="0" /><O C="15" Y="935" P="0" X="750" /><O C="15" Y="745" P="0" X="110" /><O C="15" Y="745" X="210" P="0" /><O C="15" Y="745" P="0" X="310" /><O C="15" Y="745" X="410" P="0" /><O C="15" Y="745" P="0" X="510" /><O C="15" Y="611" P="0" X="588" /><O C="15" Y="626" P="0" X="497" /><O C="15" Y="648" P="0" X="405" /><O C="15" Y="690" P="0" X="316" /><O C="16" Y="700" P="0" X="215" /><O C="16" Y="701" P="0" X="180" /><O C="16" Y="701" P="0" X="144" /><O C="16" Y="712" P="0" X="47" /><O C="16" Y="626" P="0" X="760" /><O C="16" Y="626" P="0" X="760" /><O C="16" Y="626" P="0" X="760" /><O C="15" Y="626" P="0" X="675" /><O C="15" Y="626" P="0" X="717" /></O></Z></C>'
mapa45='<C><P Ca="" L="2400" aie="" /><Z><S><S H="3000" L="3000" o="324650" X="1200" c="4" Y="274" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S L="200" o="ffffff" X="100" H="270" Y="265" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0.2,0,0,0,0" L="200" o="ffffff" H="270" Y="387" T="12" X="300" /><S L="200" o="ffffff" H="270" X="500" Y="496" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="200" o="ffffff" X="698" Y="385" T="12" H="270" /><S L="200" o="ffffff" X="898" H="270" Y="265" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0.3,0.2,0,0,0,0" L="200" o="ffffff" H="350" Y="226" T="12" X="1098" /><S L="200" o="ffffff" H="350" X="1298" Y="571" T="12" P="0,0,0,0.2,0,0,0,0" /><S P="0,0,0,0.3,0,0,0,0" L="200" o="ffffff" X="1498" Y="291" T="12" H="350" /><S L="200" X="1298" H="10" Y="391" T="9" P="0,0,,,,0,0,0" /><S L="200" o="ffffff" H="350" X="1698" Y="215" T="12" P="0,0,0.3,0.2,0,0,0,0" /><S P="0,0,0,0,120,0,0,0" L="10" o="ffffff" X="2056" Y="194" T="12" H="600" /><S L="10" o="ffffff" X="2335" H="100" Y="302" T="12" P="0,0,0,0,210,0,0,0" /><S P="0,0,0,0,90,0,0,0" L="10" o="ffffff" H="600" Y="395" T="12" X="2098" /></S><D><DS Y="116" X="64" /><T Y="395" X="1829" /><F Y="386" D="" X="1837" /></D><O><O C="7" Y="351" X="549" P="0" /><O C="11" Y="356" X="594" P="0" /></O></Z></C>'
mapa46='<C><P F="8" L="4444" G="-25,9" /><Z><S><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2183" Y="380" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2045" Y="346" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1930" Y="277" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1749" Y="343" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1608" Y="379" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1493" Y="323" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1396" Y="211" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1355" Y="121" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1238" Y="89" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1074" Y="79" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="909" Y="58" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="743" Y="69" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="40" Y="318" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="1391" Y="417" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2321" Y="333" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2438" Y="249" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2585" Y="155" T="6" /><S H="225" P="0,0,0,0.2,0,0,0,0" L="10" X="2550" Y="287" T="1" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2731" Y="212" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="2892" Y="245" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="3071" Y="276" T="6" /><S P="0,0,0.3,0.2,0,0,0,0" L="80" H="40" X="3242" Y="364" T="6" /><S H="10" P="0,0,0.3,0.2,0,0,0,0" L="10" X="3224" Y="332" T="0" /></S><D><DS Y="331" X="3266" /><F Y="355" X="2177" /><T Y="297" X="38" /></D><O /></Z></C>'
level=0
diff=0
tfm.exec.disableAutoNewGame(true)
tfm.exec.disableDebugCommand(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAfkDeath(true)
tfm.exec.disablePhysicalConsumables(true)
system.disableChatCommandDisplay("jjjjjjjjj")
system.disableChatCommandDisplay("shutar123h")
level=level+1
function eventChatCommand(n,m)
	if m == "jjjjjjjjj" then
		ui.addPopup(0,2,"",n,350,175,200,true)
	end
	if m == "shutar123h" then
		system.exit()
	end
end
function eventNewGame()
	ui.setMapName("<font color='#111111'>DhannyRMM Script Lite <N><b>Version 4.3</b>   <G>|   <N>Current Map : <V>"..level.."   <G>|   <N>Difficulty : <V>"..diff.."<")
	reset=0;
end
function eventLoop(p,f)
	local tempo=0;
	reset=reset+1;
	if reset == 600 then
		level=math.random(21,46)
		runmap();
	end
	tempo=p/1000+1
	tfm.exec.setGameTime(tempo)
end
function eventNewPlayer(name)
	ui.setMapName("<font color='#111111'>DhannyRMM Script Lite <N><b>Version 4.3</b>   <G>|   <N>Current Map : <V>"..level.."   <G>|   <N>Difficulty : <V>"..diff.."<")
	tfm.exec.respawnPlayer(name)
	tfm.exec.chatMessage("<VP>Hello, "..name.."!<br><ROSE><b>This is the DhannyRMM (Random Maze Maps) code!</b><br><N>This script will test your Transformice techniques and abilities. Some maps are easy, but another maps are simply IMPOSSIBLE!<br>The maps are automatically changed every 5 minutes.Good luck!<br><br><V>Maps and code developed by Dhanny_mheyran#6701",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(n)
	tfm.exec.respawnPlayer(n)
end
function runmap()
	if level == 21 then
		tfm.exec.newGame(mapa21)
		diff=4
	elseif level == 22 then
		tfm.exec.newGame(mapa22)
		diff=3
	elseif level == 23 then
		tfm.exec.newGame(mapa23)
		diff=2
	elseif level == 24 then
		tfm.exec.newGame(mapa24)
		diff=4
	elseif level == 25 then
		tfm.exec.newGame(mapa25)
		diff=5
	elseif level == 26 then
		tfm.exec.newGame(mapa26)
		diff=3
	elseif level == 27 then
		tfm.exec.newGame(mapa27)
		diff=5
	elseif level == 28 then
		tfm.exec.newGame(mapa28)
		diff=3
	elseif level == 29 then
		tfm.exec.newGame(mapa29)
		diff=2
	elseif level == 32 then
		tfm.exec.newGame(mapa32)
		diff=6
	elseif level == 31 then
		tfm.exec.newGame(mapa31)
		diff=2
	elseif level == 30 then
		tfm.exec.newGame(mapa30)
		diff=3
	elseif level == 33 then
		tfm.exec.newGame(mapa33)
		diff=3
	elseif level == 34 then
		tfm.exec.newGame(mapa34)
		diff=5
	elseif level == 35 then
		tfm.exec.newGame(mapa35)
		diff=4
	elseif level == 36 then
		tfm.exec.newGame(mapa36)
		diff=4
	elseif level == 37 then
		tfm.exec.newGame(mapa37)
		diff=5
	elseif level == 38 then
		tfm.exec.newGame(mapa38)
		diff=3
	elseif level == 39 then
		tfm.exec.newGame(mapa39)
		diff=5
	elseif level == 40 then
		tfm.exec.newGame(mapa40)
		diff=6
	elseif level == 41 then
		tfm.exec.newGame(mapa41)
		diff=6
	elseif level == 42 then
		tfm.exec.newGame(mapa42)
		diff=2
	elseif level == 43 then
		tfm.exec.newGame(mapa43)
		diff=4
	elseif level == 44 then
		tfm.exec.newGame(mapa44)
		diff=2
	elseif level == 45 then
		tfm.exec.newGame(mapa45)
		diff=4
	elseif level == 46 then
		tfm.exec.newGame(mapa46)
		diff=5
	end
	if diff == 1 then txt = "Crap" end
	if diff == 2 then txt = "Easy" end
	if diff == 3 then txt = "Medium" end
	if diff == 4 then txt = "Hard" end
	if diff == 5 then txt = "Extreme" end
	if diff == 6 then txt = "IMPOSSIBLE WTF" end
	tfm.exec.chatMessage("<N>DhannyRMM Script Lite  <N><b>Version 4.3</b><br>Playing map <V><b>"..level.."</b><br>Difficulty : <V>"..diff.." ("..txt..")<br><N>Map made by Dhanny_mheyran#6701<br><br><VP>Good luck!</b>")
end
function eventPopupAnswer(id,name,answer)
	level=tonumber(answer)
	runmap()
end
function eventPlayerWon(name)
	tfm.exec.setPlayerScore(name,10,true)
	tfm.exec.respawnPlayer(name)
end
for name,player in pairs(tfm.get.room.playerList) do
	tfm.exec.setPlayerScore(name,0,false)
end
level=math.random(21,46)
runmap();
end

Rooms = function()
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7803705")
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00objects<br>/room #anvilwar00fall<br>/room #anvilwar00test")
function eventNewPlayer(name)
	tfm.exec.chatMessage("<J>/room #anvilwar<br>/room #anvilwar00objects<br>/room #anvilwar00fall<br>/room #anvilwar00test")
end
end

tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.159<br>By Spectra_phantom#6089")
if string.find(tfm.get.room.name,"*") then
	tfm.exec.chatMessage("<ROSE><b>Tribehouse detected. Only #anvilwar will be available in English.</b>")
	initAnvilwar()
else
	if string.find(tfm.get.room.name,"bootcamp") or string.find(tfm.get.room.name,"racing") or string.find(tfm.get.room.name,"defilante") or string.find(tfm.get.room.name,"village") or string.find(tfm.get.room.name,"vanilla") then
		tfm.exec.chatMessage("<R>Not allowed")
	elseif string.find(tfm.get.room.name,"objects") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'objects' on room name.<br>Initialising submodule #objects...")
		initObjects()
	elseif string.find(tfm.get.room.name,"fall") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'fall' on room name.<br>Initialising submodule #fall...")
		initFall()
	elseif string.find(tfm.get.room.name,"test") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'test' on room name.<br>Initialising submodule #test...")
		initTest()
	elseif string.find(tfm.get.room.name,"rooms") then
		tfm.exec.chatMessage("<br><VP>Detected keyword 'rooms' on room name.<br>Showing available #anvilwar rooms.")
		Rooms()
	else
		tfm.exec.chatMessage("<br><VP>Additional keywords was not detected. Initialising main #anvilwar module.")
		initAnvilwar()
	end
end
