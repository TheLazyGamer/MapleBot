#include <ScreenCapture.au3>


global $hpNeverAppeared = 0
global $playerCheckFailed = 0
global $loopCount = 99;used to count how many attack cycles have completed. if it's more than 3, buffs and uses pots
global $crashCount = 0;used to count how many the bot should have terminated. if it's more than crashReloops, the bot terminates
global $crashReloops = 5;used to determine how many reloops for crashes upon startup. 3 normally, 5 if unstable Maple
global $windowsUser = "TheLazyGamer"


While 1
	RebootMapleBot()
	If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
		ExitLoop
	ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
		Sleep(5000)
		ProcessClose("WerFault.exe")
		ProcessClose("Maplestory.exe")
		Sleep(1000)
		ProcessClose("BlackCipher.ae3")
	EndIf
Wend

$startedString = "MapleBot successfully started"
Run('C:\Users\' & $windowsUser & '\Documents\SendEmail\SendEmail.bat ' & '"' & $startedString & '" "MapleBot"')




While 1 = 1 ;Start master loop
	$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
	If @error Then
		UsePotion() ;Use a potion to possibly heal
		$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
			If @error Then ;Potion didn't work, must be dead
			TakeScreenshot("Dead")
			MouseClick("left", 510, 240, 2, 20)
			Sleep(2000)
			RebootMapleBot()
		EndIf
	EndIf
	

	AbortCheck()
	PlayerCheck()
	DeadCheck()
	If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
		While 1
			RebootMapleBot()
			If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
				ExitLoop
			ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
				Sleep(5000)
				ProcessClose("WerFault.exe")
				ProcessClose("Maplestory.exe")
				Sleep(1000)
				ProcessClose("BlackCipher.ae3")
			EndIf
		Wend
	EndIf
	

	If $loopCount > 4 Then
		UsePotion()
		WinActivate("MapleStory")
		Send("{J DOWN}")
		Sleep(300)
		Send("{J UP}")
		Sleep(200)
		Send("{RIGHT DOWN}")
		Sleep(100)
		Send("{RIGHT UP}")
		Sleep(300)
		Send("{J DOWN}")
		Sleep(300)
		Send("{J UP}")
		Sleep(200)
		Send("{RIGHT DOWN}")
		Sleep(100)
		Send("{RIGHT UP}")
		Sleep(300)
		WinActivate("MapleStory")
		Send("{C DOWN}")
		Sleep(500)
		Send("{C UP}")
		Sleep(200)
		WinActivate("MapleStory")
		Send("{[ DOWN}")
		Sleep(500)
		Send("{[ UP}")
		Sleep(5000) 
		WinActivate("MapleStory")
		Send("{] DOWN}")
		Sleep(500)
		Send("{] UP}")
		Sleep(4500)
		WinActivate("MapleStory")
		Send("{O DOWN}")
		Sleep(300)
		Send("{O UP}")
		Sleep(200)
		Send("{6 DOWN}")
		Sleep(100)
		Send("{6 UP}")
		Sleep(300)
		$lineVal = 1807750975
		$expAttempts = 0
		While 1
			$firstLine = PixelChecksum(237, 566, 237, 575)
			$secondLine = PixelChecksum(237, 553, 237, 562)
			$thirdLine = PixelChecksum(237, 540, 237, 549)
			$fourthLine = PixelChecksum(237, 527, 237, 536)
			$fifthLine = PixelChecksum(237, 514, 237, 523)
			
			If $firstLine = $lineVal Or $secondLine = $lineVal Or $thirdLine = $lineVal Or $fourthLine = $lineVal Or $fifthLine = $lineVal Or $expAttempts > 4 Then
				ExitLoop
			Else
				Send("{LEFT DOWN}")
				Sleep(20)
				Send("{LEFT UP}")
				Sleep(1)
				Send("{RIGHT DOWN}")
				Sleep(50)
				Send("{RIGHT UP}")
				Sleep(500)
				Send("{L DOWN}")
				Sleep(300)
				Send("{L UP}")
				Sleep(1000)
				$expAttempts = $expAttempts + 1
			EndIf
		Wend
		UsePotion()
		WinActivate("MapleStory")
		$loopCount = 0
	EndIf
	Attack() ;Attack left bottom
	Sleep(100)
	$rightLeftPlatAttempts = 0;
	While 1
		$bCoord = PixelSearch(68, 101, 80, 107, 0xFFDD44) ;Check if we are on the right half of the left bottom island
		If Not @error Or $rightLeftPlatAttempts > 20 Then ;if we are on the right half, then break
			ExitLoop
		ElseIf @error Then ;the minifig icon was not found in the right (hence the @error), meaning it's now in the middle or left)
			Send("{RIGHT DOWN}")
			Sleep(100)
			Send("{RIGHT UP}")
			$rightLeftPlatAttempts = $rightLeftPlatAttempts + 1
		EndIf
	Wend
	Send("{V DOWN}")
	Sleep(300)
	Send("{V UP}")
	Sleep(600)
	Attack() ;Attack left top
	Send("{RIGHT DOWN}")
	Sleep(2000)
	Send("{RIGHT UP}")
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(500)
	AbortCheck()
	PlayerCheck()
	DeadCheck()
	If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
		While 1
			RebootMapleBot()
			If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
				ExitLoop
			ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
				Sleep(5000)
				ProcessClose("WerFault.exe")
				ProcessClose("Maplestory.exe")
				Sleep(1000)
				ProcessClose("BlackCipher.ae3")
			EndIf
		Wend
	EndIf
	Attack() ;Attack mid bottom
	Sleep(600)
	$rightMidPlatAttempts = 0
	While 1
		$bCoord = PixelSearch(97, 97, 124, 100, 0xFFAABB) ;Check if we are on the right half of the left bottom island
		If Not @error Or $rightMidPlatAttempts > 20 Then ;if we are on the right half, then break
			ExitLoop
		ElseIf @error Then ;the minifig icon was not found in the right (hence the @error), meaning it's now in the middle or left)
			Send("{RIGHT DOWN}")
			Sleep(100)
			Send("{RIGHT UP}")
			$rightMidPlatAttempts = $rightMidPlatAttempts + 1
			$bCoord = PixelSearch(47, 97, 90, 100, 0xFFAABB) ;Check if we are on the right half of the left bottom island
			If Not @error Or $rightMidPlatAttempts > 20 Then ;if we are on the right half, then break
				$rightMidPlatAttempts = 31
			EndIf
		EndIf
	Wend
	Send("{V DOWN}")
	Sleep(300)
	Send("{V UP}")
	Sleep(600)
	Attack() ;Attack mid top
	Sleep(300)
	Send("{RIGHT DOWN}")
	Sleep(4500)
	Send("{RIGHT UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(100)
	Send("{F DOWN}")
	Sleep(100)
	Send("{F UP}")
	Sleep(500)
	AbortCheck()
	PlayerCheck()
	DeadCheck()
	If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
		While 1
			RebootMapleBot()
			If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
				ExitLoop
			ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
				Sleep(5000)
				ProcessClose("WerFault.exe")
				ProcessClose("Maplestory.exe")
				Sleep(1000)
				ProcessClose("BlackCipher.ae3")
			EndIf
		Wend
	EndIf
	Send("{LEFT DOWN}")
	Sleep(1050)
	Send("{LEFT UP}")
	Attack() ;Attack right
	$atPortal = 0
	$atLeft = 0
	$atRight = 0
	$lineUpWithPortalAttempts = 0
	While $atPortal == 0
		$bCoord = PixelSearch(150, 100, 189, 107, 0xFFDD44) ;Check if we are on the left side of the map
		If @error Then ;if we are on the left side, then move to the right out of the rectangle, putting us in the middle
			$atRight = 1
		EndIf
	
		$bCoord = PixelSearch(194, 102, 210, 107, 0xFFDD44) ;Check if we are on the right side of the map
		If @error Then ;if we are on the right side, then move to the left out of the rectangle, putting us in the middle
			$atLeft = 1
		EndIf
	
		If $atRight == 1 And $atLeft == 1 Then
			ExitLoop
		Else
			$atLeft = 0
			$atRight = 0
		EndIf
	
		While 1
			AbortCheck()
			PlayerCheck()
			DeadCheck()
			If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
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

			$bCoord = PixelSearch(150, 100, 189, 107, 0xFFDD44) ;Check if we are on the left side of the island
			If Not @error Then ;if we are on the left side, then move to the right out of the rectangle, hopefully putting us on the portal
				Send("{RIGHT DOWN}")
				Sleep(50)
				Send("{RIGHT UP}")
				$lineUpWithPortalAttempts = $lineUpWithPortalAttempts + 1
			ElseIf @error Or $lineUpWithPortalAttempts > 20 Then ;the minifig icon was not found in the left (hence the @error), meaning it's now in the middle or right
				Sleep(500)
				ExitLoop
			EndIf
		Wend
	
		While 1
			AbortCheck()
			PlayerCheck()
			DeadCheck()
			If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
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
		
			$bCoord = PixelSearch(194, 102, 210, 107, 0xFFDD44) ;Check if we are on the right side of the map
			If Not @error Then ;if we are on the right side, then move to the left out of the rectangle, putting us in the middle
				Send("{LEFT DOWN}")
				Sleep(70)
				Send("{LEFT UP}")
				$lineUpWithPortalAttempts = $lineUpWithPortalAttempts + 1
			ElseIf @error Or $lineUpWithPortalAttempts > 20 Then ;the minifig icon was not found in the right (hence the @error), meaning it's now in the middle or left
				Sleep(500)
				ExitLoop
			EndIf
			
			Sleep(500)
		Wend
	Wend
	
	$teleAttempts = 0
	
	While 1
		$bCoord = PixelSearch(189, 102, 194, 107, 0xFFDD44) ;Check if we are in the middle of the portal
		If Not @error Then ;if we are in the middle of the portal, meaning we need to press up
			Send("{UP DOWN}")
			Sleep(100)
			Send("{UP UP}")
			$teleAttempts = $teleAttempts + 1
		ElseIf @error Or $teleAttempts > 15 Then ;the minifig icon was not found in the left (hence the @error), meaning it's now in the middle or right)
			If $teleAttempts > 15 Then
				$atPortal = 1
			EndIf
			Sleep(300)
			ExitLoop
		EndIf
	Wend
	
	AbortCheck()
	PlayerCheck()
	DeadCheck()
	If $playerCheckFailed == 1 Then ;if PlayerCheck return with errors
		While 1
			RebootMapleBot()
			If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
				ExitLoop
			ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
				Sleep(5000)
				ProcessClose("WerFault.exe")
				ProcessClose("Maplestory.exe")
				Sleep(1000)
				ProcessClose("BlackCipher.ae3")
			EndIf
		Wend
	EndIf
	
	Send("{A DOWN}")
	Sleep(500)
	Send("{A UP}")
	Sleep(200)
	WinActivate("MapleStory")
	
	$loopCount = $loopCount + 1
Wend


Func AbortCheck()
	
	$bCoord = PixelSearch(5, 495, 85, 580, 0x00FF00) ;Check if someone has whispered
	If Not @error Then
		Send("H DOWN")
		Sleep(100)
		Send("{H UP}")
		Sleep(500)
		Send("ENTER DOWN")
		Sleep(100)
		Send("{ENTER UP}")
		Sleep(500)
		Send("Howdy Howdy just multitasking watching a movie hands are getting tired")
		Sleep(1000)
		Send("{ENTER}")
		Sleep(1000)
		TakeScreenshot("Whisper was present")
		Sleep(500)
		TerminateAC("Whisper was present")
	EndIf
	
	$bCoord = PixelSearch(13, 87, 223, 110, 0x00CCEE) ;Check if buddy is in map
	If Not @error Then
		Send("1 DOWN")
		Sleep(100)
		Send("{1 UP}")
		Sleep(200)
		MouseMove(85, 595, 5)
		Sleep(500)
		MouseClick("left", 85, 595, 2, 20)
		Send("All yours just gonna watch my movie hands are getting tired")
		Sleep(1000)
		Send("{ENTER}")
		Sleep(1000)
		TakeScreenshot("Buddy was present")
		Sleep(500)
		TerminateAC("Buddy was present")
	EndIf
	
	$bCoord = PixelSearch(420, 500, 455, 505, 0x73AA29) ;Check if someone requesed Chat
	If Not @error Then
		TakeScreenshot("Chat was present")
		Sleep(500)
		TerminateAC("Chat was present")
	EndIf
	
	$bCoord = PixelSearch(473, 346, 507, 357, 0xBBEE00) ;Check if pet died
	If Not @error Then
		TakeScreenshot("Pet died")
		Sleep(500)
		TerminateAC("Pet died")
	EndIf
	
	$bCoord = PixelSearch(30, 168, 60, 174, 0x9922EE) ;Check we're in Hidden Torrent Zone
	If @error Then ;If we're not
		TakeScreenshot("Wrong map")
		Sleep(500)
		While 1
			RebootMapleBot()
			If $hpNeverAppeared == 0 Then ;if RebootMapleBot returned without any errors
				ExitLoop
			ElseIf $hpNeverAppeared == 1 Then ;if RebootMapleBot return with errors
				Sleep(5000)
				ProcessClose("WerFault.exe")
				ProcessClose("Maplestory.exe")
				Sleep(1000)
				ProcessClose("BlackCipher.ae3")
			EndIf
		Wend
	EndIf
EndFunc


Func Attack()
	$strikeCount = 0
	while $strikeCount < 30
		Send("{X DOWN}")
		Sleep(100)
		Send("{X UP}")
		$strikeCount = $strikeCount + 1
	Wend
EndFunc


Func DeadCheck()
	$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
	If @error Then
		UsePotion() ;Use a potion to possibly heal
		$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
			If @error Then ;Potion didn't work, must be dead
			TakeScreenshot("Dead")
			MouseClick("left", 510, 240, 2, 20)
			Sleep(2000)
			$playerCheckFailed = 1
		EndIf
	EndIf
EndFunc


Func PlayerCheck()

	$playerCheckFailed = 0

	$bCoord = PixelSearch(13, 87, 223, 110, 0xDD0000) ;Check if an unknown person (red) is in our map
	If Not @error Then
		;Sleep(5000)
		;$bCoord = PixelSearch(13, 87, 223, 110, 0xDD0000) ;Check if an unknown person (red) is in our map even after waiting
		;If Not @error Then
			UsePotion()
			MouseMove(200, 35, 10)
			Sleep(1000)
			MouseClick("left", 200, 35, 2, 20) ;Click the World button to open the world map
			Sleep(5000)
			
			$rebootAttemptCnt = 0
			
			$movetoChuchu = 1
			
			While $movetoChuchu == 1
			
				While 1
					$bCoord = PixelSearch(557, 319, 559, 322, 0x3333FF) ;Check if the World map is open by checking for Muto's Descent node
					If Not @error Then ;if the World map is open, click Chu Chu Village
						MouseClick("left", 368, 302, 2, 20)
						Sleep(1500)
						$noHyperTele = PixelGetColor(311, 305)
						If $noHyperTele == 16777215 Then
							Terminate("The Hyper Teleport Rock expired")
						EndIf
						Send("{ENTER}")
						Sleep(5000)
						ExitLoop
						
					ElseIf @error Then ;if the World map was not found, meaning we still need to wait
						If $rebootAttemptCnt > 9 Then
							TakeScreenshot("The World map was missing 1")
							$playerCheckFailed = 1
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
					$movetoChuchu = 0
				EndIf
				
				If $rebootAttemptCnt > 9 Then
					TakeScreenshot("The Other Requests freaked out")
					$playerCheckFailed = 1
					Return
				EndIf
			
			Wend
			
			$rebootAttemptCnt = 0
			
			;Clicks the system Menu button, then change channel, then selects the next channel
			MouseClick("left", 750, 592, 2, 20)
			Sleep(2000)
			MouseClick("left", 750, 440, 2, 20)
			Sleep(1000)
			Send("{RIGHT}")
			Sleep(500)
			
			While 1
				$bCoord = PixelSearch(445, 305, 510, 325, 0xFFAA00) ;Check if the Change Channel button is present
				If Not @error Then ;if the Change Channel button is open, click it
					MouseClick("left", 475, 315, 2, 20)
					Sleep(1000)
					Send("{ENTER}")
					Sleep(5000)
					ExitLoop
					
				ElseIf @error Then ;if the Change Channel button was not found, meaning we still need to wait
					If $rebootAttemptCnt > 9 Then
						TakeScreenshot("The Change Channel was missing")
						$playerCheckFailed = 1
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
					Sleep(3000)
					MouseClick("left", 165, 35, 2, 20) ;Click the World button to open the world map
					Sleep(5000)
					ExitLoop
				Else
					Sleep(10000)
					UsePotion()
					If $rebootAttemptCnt > 9 Then
						TakeScreenshot("The HP bar never appeared 2")
						$playerCheckFailed = 1
						Return
					EndIf
					$rebootAttemptCnt = $rebootAttemptCnt + 1
				EndIf
			Wend
			
			$rebootAttemptCnt = 0
			
			$moveToHiddenTorrentZone = 1
			
			While $moveToHiddenTorrentZone == 1
			
				While 1
					$bCoord = PixelSearch(557, 319, 559, 322, 0x3333FF) ;Check if the World map is open by checking for Muto's Descent node
					If Not @error Then ;if the World map is open, click Hidden Torrent Zone
						MouseMove(27, 142, 5)
						Sleep(500)
						MouseClick("left", 27, 142, 2, 20)
						Sleep(3000)
						$noHyperTele = PixelGetColor(311, 305)
						If $noHyperTele == 16777215 Then
							Terminate("The Hyper Teleport Rock expired 2")
						EndIf
						Send("{ENTER}")
						Sleep(5000)
						ExitLoop
					
					ElseIf @error Then ;if the World map was not found, meaning we still need to wait
						If $rebootAttemptCnt > 9 Then
							TakeScreenshot("The World map was missing 2")
							$playerCheckFailed = 1
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
					$moveToHiddenTorrentZone = 0
				EndIf
				
				If $rebootAttemptCnt > 9 Then
					TakeScreenshot("The Other Requests freaked out 2")
					$playerCheckFailed = 1
					Return
				EndIf
			Wend
			
			;TakeScreenshot("Change Channel End")
			UsePotion()
			$rebootAttemptCnt = 0
		;EndIf
	EndIf
EndFunc ;End PlayerCheck

Func RebootMapleBot()
	Global $rebootAttemptCnt = 0
	
	ProcessClose("WerFault.exe")
	ProcessClose("Maplestory.exe")
	Sleep(10000)
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
		$bCoord = PixelSearch(0, 30, 1000, 400, 0x7D6418) ;Check if the Maple emblem is present, meaning the program is loaded
		If Not @error Then ;if the emblem is present, click and drag it to the corner
			MouseClick("left", $bCoord[0] + 17, $bCoord[1], 1, 20)
			Sleep(2500) ;NOTE was 5000
			MouseClickDrag("left", $bCoord[0] + 17, $bCoord[1], 9 + 17, 8, 30)
			ExitLoop
		
		ElseIf @error Then ;if the emblem was not found, meaning we still need to wait
			If $rebootAttemptCnt > 15 Then
				ExitLoop
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(3000)
		EndIf
		;EndIf
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
				Sleep(2000) ;NOTE was 5000
				MouseClickDrag("left", $bCoord[0] + 17, $bCoord[1], 9 + 17, 8, 30)
			
			ElseIf @error Then ;if the emblem was not found, meaning we still need to wait
				If $rebootAttemptCnt > 15 Then
					If $crashCount < $crashReloops Then
						TakeScreenshot("The Maple emblem was missing")
						$crashCount = $crashCount + 1
						$hpNeverAppeared = 1
						Return
					Else
						Terminate("The Maple emblem was missing")
					EndIf
				EndIf
				$rebootAttemptCnt = $rebootAttemptCnt + 1
				Sleep(3000)
			EndIf
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	
	While 1
		$bCoord = PixelSearch(70, 570, 85, 585, 0xCC7733, 10) ;Check if the quit game button is present
		If Not @error Then ;if quit game button is present, click NA's belt
			Local $hWnd = WinGetHandle("MapleStory")
			WinActivate("MapleStory")
			WinSetOnTop($hWnd, "", 1)
			Sleep(1000)
			MouseClick("left", 270, 325, 2, 20)
			Sleep(35000)
			ExitLoop
			
		ElseIf @error Then ;if the quit game button was not found, meaning we still need to wait
			If $rebootAttemptCnt > 58 Then
				If $crashCount < $crashReloops Then
					TakeScreenshot("The regions were missing")
					$crashCount = $crashCount + 1
					$hpNeverAppeared = 1
					Return
				Else
					Terminate("The regions were missing")
				EndIf
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(2000)
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
				If $crashCount < $crashReloops Then
					TakeScreenshot("The Reboot tab was missing")
					$crashCount = $crashCount + 1
					$hpNeverAppeared = 1
					Return
				Else
					Terminate("The Reboot tab was missing")
				EndIf
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
			Sleep(5000)
		EndIf
	Wend
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	$crashReloops = 0
	
	While 1
		$bCoord = PixelSearch(400, 325, 410, 330, 0x886655, 10) ;Check if the Channel 8 is there
		If Not @error Then ;if the Channel 8 is there, click a random channel
			$randomChannel = Random(2, 20, 1)
			
			If $randomChannel == 2 Then
				MouseClick("left", 330, 308, 2, 20)
			ElseIf $randomChannel == 3 Then
				MouseClick("left", 400, 308, 2, 20)
			ElseIf $randomChannel == 4 Then
				MouseClick("left", 470, 308, 2, 20)
			ElseIf $randomChannel == 5 Then
				MouseClick("left", 540, 308, 2, 20)
			ElseIf $randomChannel == 6 Then
				MouseClick("left", 260, 338, 2, 20)
			ElseIf $randomChannel == 7 Then
				MouseClick("left", 330, 338, 2, 20)
			ElseIf $randomChannel == 8 Then
				MouseClick("left", 400, 338, 2, 20)
			ElseIf $randomChannel == 9 Then
				MouseClick("left", 470, 338, 2, 20)
			ElseIf $randomChannel == 10 Then
				MouseClick("left", 540, 338, 2, 20)
			ElseIf $randomChannel == 11 Then
				MouseClick("left", 260, 368, 2, 20)
			ElseIf $randomChannel == 12 Then
				MouseClick("left", 330, 368, 2, 20)
			ElseIf $randomChannel == 13 Then
				MouseClick("left", 400, 368, 2, 20)
			ElseIf $randomChannel == 14 Then
				MouseClick("left", 470, 368, 2, 20)
			ElseIf $randomChannel == 15 Then
				MouseClick("left", 540, 368, 2, 20)
			ElseIf $randomChannel == 16 Then
				MouseClick("left", 260, 398, 2, 20)
			ElseIf $randomChannel == 17 Then
				MouseClick("left", 330, 398, 2, 20)
			ElseIf $randomChannel == 18 Then
				MouseClick("left", 400, 398, 2, 20)
			ElseIf $randomChannel == 19 Then
				MouseClick("left", 470, 398, 2, 20)
			ElseIf $randomChannel == 20 Then
				MouseClick("left", 540, 398, 2, 20)
			EndIf
			
			Sleep(3000)
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
		$bCoord = PixelSearch(710, 455, 730, 475, 0xEEAA00, 10) ;Check if the big, yellow Start button is present
		If Not @error Then ;if the Start button is present, click it
			MouseClick("left", 135, 235, 1, 20)
			Sleep(100)
			MouseMove(720, 465, 5)
			Sleep(500)
			MouseClick("left", 720, 465, 2, 20)
			Sleep(2000)
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
	
	If $topLeft1 = $checkSum1 Then
		$x1 = 365
		$y1 = 296
	ElseIf $topMid1 = $checkSum1 Then
		$x1 = 404
		$y1 = 296
	ElseIf $topRight1 = $checkSum1 Then
		$x1 = 443
		$y1 = 296
	ElseIf $midLeft1 = $checkSum1 Then
		$x1 = 365
		$y1 = 331
	ElseIf $midMid1 = $checkSum1 Then
		$x1 = 404
		$y1 = 331
	ElseIf $midRight1 = $checkSum1 Then
		$x1 = 443
		$y1 = 331
	ElseIf $botLeft1 = $checkSum1 Then
		$x1 = 365
		$y1 = 366
	ElseIf $botMid1 = $checkSum1 Then
		$x1 = 404
		$y1 = 366
	ElseIf $botRight1 = $checkSum1 Then
		$x1 = 443
		$y1 = 366
	ElseIf $zeroSpot1 = $checkSum1 Then
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
	
	If $topLeft7 = $checkSum7 Then
		$x7 = 362
		$y7 = 290
	ElseIf $topMid7 = $checkSum7 Then
		$x7 = 401
		$y7 = 290
	ElseIf $topRight7 = $checkSum7 Then
		$x7 = 440
		$y7 = 290
	ElseIf $midLeft7 = $checkSum7 Then
		$x7 = 362
		$y7 = 325
	ElseIf $midMid7 = $checkSum7 Then
		$x7 = 401
		$y7 = 325
	ElseIf $midRight7 = $checkSum7 Then
		$x7 = 440
		$y7 = 325
	ElseIf $botLeft7 = $checkSum7 Then
		$x7 = 362
		$y7 = 360
	ElseIf $botMid7 = $checkSum7 Then
		$x7 = 401
		$y7 = 360
	ElseIf $botRight7 = $checkSum7 Then
		$x7 = 440
		$y7 = 360
	ElseIf $zeroSpot7 = $checkSum7 Then
		$x7 = 362
		$y7 = 395
	EndIf
	
	;Enters PIC 117711. Change as needed
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(1000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(1000)
	MouseClick("left", $x7, $y7, 1, 20)
	Sleep(1000)
	MouseClick("left", $x7, $y7, 1, 20)
	Sleep(1000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(1000)
	MouseClick("left", $x1, $y1, 1, 20)
	Sleep(1000)
	MouseClick("left", 350, 440, 2, 10)
	
	$hpNeverAppeared = 0
	$atTown = 0
	
	While 1
		$hpCoord = PixelSearch(460, 580, 461, 581, 0xF32E68, 20) ;Check if hp is there
		If Not @error Then
			Sleep(5000)
			$bCoord = PixelSearch(30, 168, 60, 174, 0x9922EE) ;Check we're in Hidden Torrent Zone
			If @error Then ;Purple Arcane bar not found, meaning in town
				$atTown = 1
				MouseMove(165, 35, 10)
				Sleep(500)
				MouseClick("left", 165, 35, 2, 20) ;Click the World button to open the world map
				Sleep(5000)
			EndIf
			ExitLoop
		Else
			Sleep(5000)
			UsePotion()
			If $rebootAttemptCnt > 36 Then
				TakeScreenshot("The HP bar never appeared 1")
				$hpNeverAppeared = 1
				Return
				;Terminate("The HP bar never appeared")
			EndIf
			$rebootAttemptCnt = $rebootAttemptCnt + 1
		EndIf
	Wend
	
	$rebootAttemptCnt = 0
	$hpNeverAppeared = 0
	
	$moveToHiddenTorrentZoneAfterReboot = 1
	
	Send("{U DOWN}")
	Sleep(500)
	Send("{U UP}")
	Sleep(1000)
	Send("{0 DOWN}")
	Sleep(500)
	Send("{0 UP}")
	Sleep(1000)
	
	If $atTown > 0 Then
		
		While $moveToHiddenTorrentZoneAfterReboot == 1
		
			While 1
				$bCoord = PixelSearch(557, 319, 559, 322, 0x3333FF) ;Check if the World map is open by checking for Muto's Descent node
				If Not @error Then ;if the World map is open, click Hidden Torrent Zone
					MouseMove(27, 142, 5)
					Sleep(500)
					MouseClick("left", 27, 142, 2, 20)
					Sleep(3000)
					$noHyperTele = PixelGetColor(311, 305)
				If $noHyperTele == 16777215 Then
					Terminate("The Hyper Teleport Rock expired 3")
				EndIf
				Send("{ENTER}")
				Sleep(5000)
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
				$moveToHiddenTorrentZoneAfterReboot = 0
			EndIf
				
			If $rebootAttemptCnt > 9 Then
				TakeScreenshot("The Other Requests freaked out 3")
				$hpNeverAppeared = 1
				Return
			EndIf
		Wend
	EndIf
		
	$bCoord = PixelSearch(557, 319, 559, 322, 0x3333FF) ;Check if the World map is open by checking for Muto's Descent node
	If Not @error Then ;if the World map is open, Return, triggering another Reboot
		TakeScreenshot("The World map never closed")
		$hpNeverAppeared = 1
		Return
	ElseIf @error Then ;if the World map was not found, meaning we successfully teleported
		Sleep(1000)
	EndIf
	
	Local $hWnd = WinGetHandle("MapleStory")
	WinActivate("MapleStory")
	WinSetOnTop($hWnd, "", 1)
	
	UsePotion()
	
	$hpNeverAppeared = 0
	$rebootAttemptCnt = 0
	$crashCount = 0
	$loopCount = 99
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
	
	Run('C:\Users\' & $windowsUser & '\Documents\SendEmail\SendEmail.bat ' & '"CRASH ' & $passedBody & '" "MapleBot"')
	Exit 0
EndFunc

Func TerminateAC(ByRef $passedBody)
	Run('C:\Users\' & $windowsUser & '\Documents\SendEmail\SendEmail.bat ' & '"CRASH ' & $passedBody & '" "MapleBot"')
	Sleep(500)
	ProcessClose("WerFault.exe")
	ProcessClose("Maplestory.exe")
	Sleep(1000)
	ProcessClose("BlackCipher.ae3")
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