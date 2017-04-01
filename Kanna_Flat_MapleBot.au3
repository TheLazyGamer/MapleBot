#include <ScreenCapture.au3>


global $hpNeverAppeared = 0
global $bossCheckFailed = 0
global $windowsUser = "TheLazyGamer"

While 1
	RebootMapleBot()
	If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
		ExitLoop
	ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
		Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
		Sleep(5000)
		ProcessClose("WerFault.exe")
		ProcessClose("Maplestory.exe")
		Sleep(1000)
		ProcessClose("BlackCipher.ae3")
	EndIf
Wend

$startedString = "MapleBot successfully started"
Run('C:\Users\' & $windowsUser & '\Documents\SendEmail\SendEmail.bat ' & '"' & $startedString & '"')

$loopCount = 0


While 1 = 1 ;Start master loop
	$iColor = PixelGetColor(460, 580)
	
	If $iColor <> 15936871 Then ;If HP bar is low or not present
		UsePotion() ;Use a potion to possibly heal
		$dyingColor = PixelGetColor(460, 580) ;DD0033 14483507
		If $dyingColor <> 15936871 Then ;After possibly healing, check again
			AbortCheck()
		EndIf
	EndIf
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf

		$bCoord = PixelSearch(29, 103, 54, 123, 0xFFDD44) ;Check if we are on the left side of the map
		If Not @error Then ;if we are on the left side, then move to the right out of the rectangle, putting us in the middle
			Send("{RIGHT DOWN}")
			Sleep(1000)
			Send("{RIGHT UP}")
		ElseIf @error Then ;the minifig icon was not found in the left (hence the @error), meaning it's now in the middle or right
			ExitLoop
		EndIf
	Wend
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
		
		$bCoord = PixelSearch(69, 103, 139, 123, 0xFFDD44) ;Check if we are on the right side of the map
		If Not @error Then ;if we are on the right side, then move to the left out of the rectangle, putting us in the middle
			Send("{LEFT DOWN}")
			Sleep(1000)
			Send("{LEFT UP}")
		ElseIf @error Then ;the minifig icon was not found in the right (hence the @error), meaning it's now in the middle or left
			ExitLoop
		EndIf
	Wend
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
		
		$bCoord = PixelSearch(624, 28, 804, 108, 0xDAAB24) ;Check if O skill is activated 0xDDAB23 0xDBAB23
		If Not @error Then ;if O skill is activated
			ExitLoop
			
		ElseIf @error Then ;if O skill is not activated. Hence the @error, because the color wasn't found on the top right skills
			$bCoord = PixelSearch(624, 28, 804, 108, 0xDDAB23)
			
			If Not @error Then ;if O skill is activated
				ExitLoop
			
			ElseIf @error Then
				$bCoord = PixelSearch(624, 28, 804, 108, 0xDBAB23, 10)
				
				If Not @error Then ;if O skill is activated
					ExitLoop
				
				ElseIf @error Then
					Send("{O DOWN}")
					Sleep(500)
					Send("{O UP}")
					Sleep(200)
				EndIf
			EndIf
		EndIf
	Wend
	
	Sleep(300)
	KishinAndHaku()
	Sleep(300)
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
		
		$bCoord = PixelSearch(29, 93, 110, 118, 0xFFDD44) ;Check if we are on the left side of the map, just kished about to attack
		If Not @error Then ;if we are on the left side, then move to the right out of the rectangle, putting us in the attack location
			Send("{RIGHT DOWN}")
			Sleep(400)
			Send("{RIGHT UP}")
		ElseIf @error Then ;the minifig icon was not found in the left (hence the @error), meaning it's now in the attack location
			ExitLoop
		EndIf
	Wend
	
	$attackCount = 0
	
	While $attackCount < 50
		Attack()
		$attackCount = $attackCount + 1
	Wend
	$attackCount = 0
	
	AbortCheck()
	BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
		
		$bCoord = PixelSearch(134, 93, 144, 108, 0xFFDD44) ;Check if we are on the right wall of the map
		If Not @error Then ;if we are on the right wall, then exit loop and start moving left
			ExitLoop
		ElseIf @error Then ;the minifig icon was not found on the right wall (hence the @error), so walk right to it
			Send("{RIGHT DOWN}")
			Sleep(1200)
			Send("{RIGHT UP}")
		EndIf
	Wend
	
	While 1
		AbortCheck()
		BossCheck()
		If $bossCheckFailed == 1 Then ;if BossCheck return with errors
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
		
		$bCoord = PixelSearch(29, 103, 39, 118, 0xFFDD44) ;Check if we are on the left wall of the map
		If Not @error Then ;if we are on the left wall, then exit loop
			Sleep(2000)
			ExitLoop
		ElseIf @error Then ;the minifig icon was not found on the left wall (hence the @error), so walk left to it
			Send("{LEFT DOWN}")
			Sleep(1200)
			Send("{LEFT UP}")
		EndIf
	Wend
	
	$loopCount = $loopCount + 1
Wend


Func AbortCheck()

	$iColor = PixelGetColor(460, 580)
	If $iColor <> 15936871 Then ;If HP bar is low or not present
		UsePotion() ;Use a potion to possibly heal
		$dyingColor = PixelGetColor(460, 580) ;DD0033 14483507
		If $dyingColor <> 15936871 Then ;After possibly healing, check again
			While 1
				RebootMapleBot()
				If $hpNeverAppeared == 0 Then
					ExitLoop
				ElseIf $hpNeverAppeared == 1 Then
					Run('C:\Users\' & $windowsUser & '\Documents\LogRebootHPRestart.bat')
					Sleep(5000)
					ProcessClose("WerFault.exe")
					ProcessClose("Maplestory.exe")
					Sleep(1000)
					ProcessClose("BlackCipher.ae3")
				EndIf
			Wend
		EndIf
	EndIf
EndFunc


Func Attack()
	Send("{V DOWN}")
	Sleep(200)
	Send("{V UP}")
	Sleep(1900)
EndFunc

Func BossCheck()

	$bossCheckFailed = 0
	
	$bossBarPixel = PixelGetColor(29, 43) ;Check if the boss HP bar is present
		
	If $bossBarPixel == 14531464 Or $bossBarPixel == 6772543 Then
	
		MouseMove(140, 35, 10)
		Sleep(1000)
		MouseClick("left", 140, 35, 2, 20) ;Click the World button to open the world map
		Sleep(10000)
		
		$rebootAttemptCnt = 0
		
		$moveToBlackgateCity = 1
		
		While $moveToBlackgateCity == 1
		
			While 1
				$bCoord = PixelSearch(163, 248, 172, 257, 0xFFDD33) ;Check if the World map is open by checking for Northwest Outskirts node
				If Not @error Then ;if the World map is open, click Blackgate City
					MouseClick("left", 80, 335, 2, 20)
					Sleep(3000)
					$noHyperTele = PixelGetColor(311, 305)
					If $noHyperTele == 16777215 Then
						Terminate("The Hyper Teleport Rock expired")
					EndIf
					Send("{ENTER}")
					Sleep(10000)
					ExitLoop
					
				ElseIf @error Then ;if the World map was not found, meaning we still need to wait
					If $rebootAttemptCnt > 9 Then
						TakeScreenshot("The World map was missing")
						$bossCheckFailed = 1
						Return
					EndIf
					$rebootAttemptCnt = $rebootAttemptCnt + 1
					Sleep(5000)
				EndIf
			Wend
		
			$okOtherRequests = PixelGetColor(504, 353) ;Check if the OK is there for Other Requests
		;11193344 AACC00 170,204,0
			If $okOtherRequests == 11193344 Then ;The OK button was there for Other Requests		
				MouseClick("left", 504, 353, 2, 20) ;click the OK button, closing the Other Requests popup
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(3000)
			Else
				$moveToBlackgateCity = 0
			EndIf
			
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The Other Requests freaked out")
				$bossCheckFailed = 1
				Return
			EndIf
		
		Wend
		
		$rebootAttemptCnt = 0
		
		;Clicks the system Menu button, then change channel, then selects the next channel
		MouseClick("left", 750, 592, 2, 20)
		Sleep(3000)
		MouseClick("left", 750, 440, 2, 20)
		Sleep(1000)
		Send("{RIGHT}")
		Sleep(1000)
		
		While 1
			$bCoord = PixelSearch(445, 305, 510, 325, 0xFFAA00) ;Check if the Change Channel button is present
			If Not @error Then ;if the Change Channel button is open, click it
				MouseClick("left", 475, 315, 2, 20)
				Sleep(3000)
				Send("{ENTER}")
				Sleep(10000)
				ExitLoop
				
			ElseIf @error Then ;if the Change Channel button was not found, meaning we still need to wait
				If $rebootAttemptCnt > 9 Then
					TakeScreenshot("The Change Channel was missing")
					$bossCheckFailed = 1
					Return
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(5000)
			EndIf
		Wend
		
		$rebootAttemptCnt = 0
		
		While 1
			$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
			If Not @error Then
				Sleep(10000)
				MouseClick("left", 140, 35, 2, 20) ;Click the World button to open the world map
				Sleep(10000)
				ExitLoop
			Else
				Sleep(10000)
				UsePotion()
				If $rebootAttemptCnt > 9 Then
					TakeScreenshot("The HP bar never appeared 2")
					$bossCheckFailed = 1
					Return
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
			EndIf
		Wend
		
		$rebootAttemptCnt = 0
		
		$moveToNorthwestHeights = 1
		
		While $moveToNorthwestHeights == 1
		
			While 1
				$bCoord = PixelSearch(163, 248, 172, 257, 0xFFDD33) ;Check if the World map is open by checking for Northwest Outskirts node
				If Not @error Then ;if the World map is open, click Northwest Heights
					MouseMove(240, 197, 5) ;was 236 188 before the GUI change
					Sleep(1000)
					MouseClick("left", 240, 197, 2, 20) ;MouseClick("left", 235, 184, 2, 20)
					Sleep(3000)
					$noHyperTele = PixelGetColor(311, 305)
					If $noHyperTele == 16777215 Then
						Terminate("The Hyper Teleport Rock expired 2")
					EndIf
					Send("{ENTER}")
					Sleep(10000)
					ExitLoop
				
				ElseIf @error Then ;if the World map was not found, meaning we still need to wait
					If $rebootAttemptCnt > 9 Then
						TakeScreenshot("The World map was missing 2")
						$bossCheckFailed = 1
						Return
					EndIf
					$rebootAttemptCnt = $rebootAttemptCnt + 1
					Sleep(5000)
				EndIf
			Wend
		
			$okOtherRequests = PixelGetColor(504, 353) ;Check if the OK is there for Other Requests
		;11193344 AACC00 170,204,0
			If $okOtherRequests == 11193344 Then ;The OK button was there for Other Requests				
				MouseClick("left", 504, 353, 2, 20) ;click the OK button, closing the Other Requests popup
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(3000)
			Else
				$moveToNorthwestHeights = 0
			EndIf
			
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The Other Requests freaked out 2")
				$bossCheckFailed = 1
				Return
			EndIf
		Wend
		
		;TakeScreenshot("Change Channel End")
		$rebootAttemptCnt = 0
	EndIf
EndFunc ;End BossCheck

Func KishinAndHaku()
	Sleep(1000)
	Send("{B DOWN}")
	Sleep(1000)
	Send("{B UP}")
	Sleep(1000)
	Send("{B DOWN}")
	Sleep(1000)
	Send("{B UP}")
	Sleep(2000)
	Send("{J DOWN}")
	Sleep(700)
	Send("{J UP}")
	Sleep(300)
EndFunc

Func RebootMapleBot()
	Global $rebootAttemptCnt = 0
	
	Run('C:\Users\' & $windowsUser & '\Documents\LogRebootStart.bat')
	
	ProcessClose("WerFault.exe")
	ProcessClose("Maplestory.exe")
	Sleep(1000)
	ProcessClose("BlackCipher.ae3")
	Sleep(10000)
	ProcessClose("iexplore.exe")
	Sleep(2000)
	ProcessClose("iexplore.exe")
	Sleep(10000)
	Local $iPid = Run('C:\Users\' & $windowsUser & '\Documents\RunMaple.bat')
	
	;Wait 3 minutes for Maple to Load (will change depending on start video, internet connection, etc)
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	Sleep(10000) ;Sleep long enough to let Maple fully load
	
	WinSetState("Nexon Launcher", "", @SW_MINIMIZE)
	
	While 1
		$mapleEmblem = PixelGetColor(9, 8) ;Check if the Maple emblem is in the top left corner
		If $mapleEmblem == 8217624 Then ;The maple emblem is in the top left corner
			ExitLoop
			
		Else ;Maple emblem is not in the top left corner			
			$bCoord = PixelSearch(0, 30, 1000, 400, 0x7D6418) ;Check if the Maple emblem is present, meaning the program is loaded
			If Not @error Then ;if the emblem is present, click and drag it to the corner
				MouseClick("left", $bCoord[0] + 17, $bCoord[1], 1, 20)
				Sleep(2000) ;TODO was 5000
				MouseClickDrag("left", $bCoord[0] + 17, $bCoord[1], 9 + 17, 8, 30)
			
			ElseIf @error Then ;if the emblem was not found, meaning we still need to wait
				If $rebootAttemptCnt > 9 Then
					ExitLoop
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(5000) ;TODO was 30000
			EndIf
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1
		$mapleEmblem = PixelGetColor(9, 8) ;Check if the Maple emblem is in the top left corner
		If $mapleEmblem == 8217624 Then ;The maple emblem is in the top left corner
			ExitLoop
			
		Else ;Maple emblem is not in the top left corner			
			$bCoord = PixelSearch(0, 0, 1000, 400, 0x7D6418) ;Check if the Maple emblem is present, meaning the program is loaded
			If Not @error Then ;if the emblem is present, click and drag it to the corner
				MouseClick("left", $bCoord[0] + 17, $bCoord[1], 1, 20)
				Sleep(2000) ;TODO was 5000
				MouseClickDrag("left", $bCoord[0] + 17, $bCoord[1], 9 + 17, 8, 30)
			
			ElseIf @error Then ;if the emblem was not found, meaning we still need to wait
				If $rebootAttemptCnt > 9 Then
					Terminate("The Maple emblem was missing")
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(5000) ;TODO was 30000
			EndIf
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1
		$bCoord = PixelSearch(70, 570, 85, 585, 0xCC7733, 10) ;Check if the quit game button is present
		If Not @error Then ;if quit game button is present, click NA's belt
			Sleep(1000)
			MouseClick("left", 270, 325, 2, 20)
			Sleep(60000) ;TODO was 5000
			ExitLoop
			
		ElseIf @error Then ;if the quit game button was not found, meaning we still need to wait
			If $rebootAttemptCnt > 23 Then ;TODO change this back to 9 when maple is stable
				Terminate("The regions were missing")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(5000)
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1 ;PixelSearch was DD4455
		$bCoord = PixelSearch(740, 540, 750, 550, 0xBB2233, 10) ;Check if the Reboot tab is present in the bottom right
		If Not @error Then ;if the Reboot tab is present, click the tab
			MouseClick("left", 740, 540, 2, 20)
			Sleep(3000)
			ExitLoop
			
		ElseIf @error Then ;if the tab was not found, meaning we still need to wait
			If $rebootAttemptCnt > 9 Then
				Terminate("The Reboot tab was missing")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(5000)
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1
		$bCoord = PixelSearch(400, 325, 410, 330, 0x886655, 10) ;Check if the Channel 8 is there
		If Not @error Then ;if the Channel 8 is there, click it
			MouseClick("left", 375, 340, 2, 20)
			Sleep(30000)
			ExitLoop
			
		ElseIf @error Then ;if Channel 8 is not there, meaning we still need to wait
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The Channel 8 was missing")
				$hpNeverAppeared = 1
				Return
				;Terminate("The Channel 8 was missing")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(5000)
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1
		$loadedButtons = PixelGetColor(610, 200) ;Check if the Part-Time Jobs and Character Card have loaded
		If $loadedButtons == 16768256 Then ;The Part-Time Jobs and Character Card have loaded
			MouseClick("left", 260, 235, 1, 20)
			Sleep(3000)
			ExitLoop
		Else ;The Part-Time Jobs and Character Card have not loaded yet
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The buttons were missing")
				$hpNeverAppeared = 1
				Return
				;Terminate("The buttons were missing")
			EndIf
			Sleep(15000)
			$rebootAttemptCnt = $rebootAttemptCnt + 1
		EndIf
	Wend
	
	$rebootAttemptCnt = 0
	
		While 1
		$bCoord = PixelSearch(710, 455, 730, 475, 0xEEAA00, 10) ;Check if the big, yellow Start button is present
		If Not @error Then ;if the Start button is present, click it
			MouseMove(720, 465, 5)
			Sleep(500)
			MouseClick("left", 720, 465, 2, 20)
			Sleep(3000)
			ExitLoop
			
		ElseIf @error Then ;if the Start button was not found, meaning we still need to wait
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The yellow Start button was missing")
				$hpNeverAppeared = 1
				Return
				;Terminate("The yellow Start button was missing")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(5000)
		EndIf
	Wend
	
	;now 9, 8 was 5, 5 meaning a 4, 3 bump
	$checkSum1 = 936838906
	$checkSum7 = 1545537631
	
	$x1 = -1
	$y1 = -1
	
	$x7 = -1
	$y7 = -1
	
	$topLeft1 = PixelChecksum(365, 296, 365, 300)
	$topMid1 = PixelChecksum(404, 296, 404, 300)
	$topRight1 = PixelChecksum(443, 296, 443, 300)
	
	$midLeft1 = PixelChecksum(365, 331, 365, 335)
	$midMid1 = PixelChecksum(404, 331, 404, 335)
	$midRight1 = PixelChecksum(443, 331, 443, 335)
	
	$botLeft1 = PixelChecksum(365, 366, 365, 370)
	$botMid1 = PixelChecksum(404, 366, 404, 370)
	$botRight1 = PixelChecksum(443, 366, 443, 370)
	
	$zeroSpot1 = PixelChecksum(365, 401, 365, 405)
	
	If $topLeft1 == $checkSum1 Then
		$x1 = 365
		$y1 = 296
	ElseIf $topMid1 == $checkSum1 Then
		$x1 = 404
		$y1 = 296
	ElseIf $topRight1 == $checkSum1 Then
		$x1 = 443
		$y1 = 296
	ElseIf $midLeft1 == $checkSum1 Then
		$x1 = 365
		$y1 = 331
	ElseIf $midMid1 == $checkSum1 Then
		$x1 = 404
		$y1 = 331
	ElseIf $midRight1 == $checkSum1 Then
		$x1 = 443
		$y1 = 331
	ElseIf $botLeft1 == $checkSum1 Then
		$x1 = 365
		$y1 = 366
	ElseIf $botMid1 == $checkSum1 Then
		$x1 = 404
		$y1 = 366
	ElseIf $botRight1 == $checkSum1 Then
		$x1 = 443
		$y1 = 366
	ElseIf $zeroSpot1 == $checkSum1 Then
		$x1 = 365
		$y1 = 401
	EndIf
		
	
	
	
	$topLeft7 = PixelChecksum(362, 290, 368, 290)
	$topMid7 = PixelChecksum(401, 290, 407, 290)
	$topRight7 = PixelChecksum(440, 290, 446, 290)
	
	$midLeft7 = PixelChecksum(362, 325, 368, 325)
	$midMid7 = PixelChecksum(401, 325, 407, 325)
	$midRight7 = PixelChecksum(440, 325, 446, 325)
	
	$botLeft7 = PixelChecksum(362, 360, 368, 360)
	$botMid7 = PixelChecksum(401, 360, 407, 360)
	$botRight7 = PixelChecksum(440, 360, 446, 360)
	
	$zeroSpot7 = PixelChecksum(362, 395, 368, 395)
	
	If $topLeft7 == $checkSum7 Then
		$x7 = 362
		$y7 = 290
	ElseIf $topMid7 == $checkSum7 Then
		$x7 = 401
		$y7 = 290
	ElseIf $topRight7 == $checkSum7 Then
		$x7 = 440
		$y7 = 290
	ElseIf $midLeft7 == $checkSum7 Then
		$x7 = 362
		$y7 = 325
	ElseIf $midMid7 == $checkSum7 Then
		$x7 = 401
		$y7 = 325
	ElseIf $midRight7 == $checkSum7 Then
		$x7 = 440
		$y7 = 325
	ElseIf $botLeft7 == $checkSum7 Then
		$x7 = 362
		$y7 = 360
	ElseIf $botMid7 == $checkSum7 Then
		$x7 = 401
		$y7 = 360
	ElseIf $botRight7 == $checkSum7 Then
		$x7 = 440
		$y7 = 360
	ElseIf $zeroSpot7 == $checkSum7 Then
		$x7 = 362
		$y7 = 395
	EndIf
	
	;Enters PIC 117711. Change as needed
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(2000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(2000)
	MouseClick("left", $x7, $y7, 1, 20)
	Sleep(2000)
	MouseClick("left", $x7, $y7, 1, 20)
	Sleep(2000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(2000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(2000)
	MouseClick("left", 350, 440, 2, 10)
	
	$hpNeverAppeared = 0
	
	While 1
		$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
		If Not @error Then
			Sleep(10000)
			MouseMove(140, 35, 10)
			Sleep(1000)
			MouseClick("left", 140, 35, 2, 20) ;Click the World button to open the world map
			Sleep(10000)
			ExitLoop
		Else
			Sleep(10000)
			UsePotion()
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The HP bar never appeared")
				$hpNeverAppeared = 1
				Return
				;Terminate("The HP bar never appeared")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
		EndIf
	Wend
	
	$rebootAttemptCnt = 0
	$hpNeverAppeared = 0
	
	$moveToNorthwestHeightsAfterReboot = 1
		
	While $moveToNorthwestHeightsAfterReboot == 1
	
		While 1
			$bCoord = PixelSearch(163, 248, 172, 257, 0xFFDD33) ;Check if the World map is open by checking for Northwest Outskirts node
			If Not @error Then ;if the World map is open, click Northwest Heights
				MouseMove(240, 197, 5) ;was 236 188 before the GUI change
				Sleep(1000)
				MouseClick("left", 240, 197, 2, 20) ;MouseClick("left", 235, 184, 2, 20)
				Sleep(3000)
				$noHyperTele = PixelGetColor(311, 305)
				If $noHyperTele == 16777215 Then
					Terminate("The Hyper Teleport Rock expired 3")
				EndIf
				Send("{ENTER}")
				Sleep(10000)
				ExitLoop
			ElseIf @error Then ;if the World map was not found, meaning we still need to wait
				If $rebootAttemptCnt > 9 Then
					TakeScreenshot("The World map was missing 3")
					$hpNeverAppeared = 1
					Return
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(5000)
			EndIf
		Wend
	
		$okOtherRequests = PixelGetColor(504, 353) ;Check if the OK is there for Other Requests
		;11193344 AACC00 170,204,0 TODO this might not work after GUI change
		If $okOtherRequests == 11193344 Then ;The OK button was there for Other Requests
			MouseClick("left", 504, 353, 2, 20) ;click the OK button, closing the Other Requests popup
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(3000)
		Else
			$moveToNorthwestHeightsAfterReboot = 0
		EndIf
			
		If $rebootAttemptCnt > 9 Then
			TakeScreenshot("The Other Requests freaked out 3")
			$hpNeverAppeared = 1
			Return
		EndIf
	Wend
		
	$bCoord = PixelSearch(163, 248, 172, 257, 0xFFDD33) ;Check if the World map is open by checking for Northwest Outskirts node
	If Not @error Then ;if the World map is open, Return, triggering another Reboot
		TakeScreenshot("The World map never closed")
		$hpNeverAppeared = 1
		Return
	ElseIf @error Then ;if the World map was not found, meaning we successfully teleported
		Sleep(1000)
	EndIf
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	Run('C:\Users\' & $windowsUser & '\Documents\LogRebootEnd.bat')
EndFunc ;End RebootMapleBot

Func TakeScreenshot(ByRef $passedBody)
	$timeString = @YEAR & "_" & @MON & "_" & @MDAY & "_" & @HOUR & "_" & @MIN & "_" & @SEC & "_" & $passedBody
	$hBmp = _ScreenCapture_Capture("")
	_ScreenCapture_SaveImage('C:\Users\' & $windowsUser & '\Documents\Screenshots\' & $timeString & '.png', $hBmp)
EndFunc

Func Terminate(ByRef $passedBody)
	$timeString = @YEAR & "_" & @MON & "_" & @MDAY & "_" & @HOUR & "_" & @MIN & "_" & @SEC & "_" & $passedBody
	$hBmp = _ScreenCapture_Capture("")
	_ScreenCapture_SaveImage('C:\Users\' & $windowsUser & '\Documents\Screenshots\' & $timeString & '.png', $hBmp)
	
	Run('C:\Users\' & $windowsUser & '\Documents\LogRebootFail.bat')
	Run('C:\Users\' & $windowsUser & '\Documents\SendEmail\SendEmail.bat ' & '"' & $passedBody & '"')
	Exit 0
EndFunc

Func UsePotion()
	Send("{A DOWN}")
	Sleep(200)
	Send("{A UP}")
	Sleep(100)
	Send("{A DOWN}")
	Sleep(200)
	Send("{A UP}")
	Sleep(2000)
EndFunc