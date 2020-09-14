-- Transformice #anvilwar module loader
-- By Spectra_phantom#6089 / Nasus_assassin#1534
-- Disabled temporarily

for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","AfkDeath","MortCommand"} do
	tfm.exec["disable"..f](true)
end
tfm.exec.newGame("@7692039")
tfm.exec.chatMessage("<VP><b>#anvilwar</b> Multiple Module Loader revision 2<br>Version 2.111<br>By Spectra_phantom#6089 and Nasus_assassin#1534")
tfm.exec.chatMessage("<br><R>#anvilwar module and all submodules are disabled temporarily.")
