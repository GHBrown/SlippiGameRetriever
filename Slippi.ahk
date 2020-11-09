#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ;Lowers threshold for window title matches to be accepted.
#SingleInstance, Ignore
#Persistent
;------------autoexecution ends here--------------

;GET PATH VARIABLES FROM FILES AND REMOVE NEW LINE CHARACTERS
FileRead, autosaveFolder, autosaveFolder.txt
FileRead, culledFolder, culledFolder.txt
FileRead, SlippiPath, SlippiPath.txt

autosaveFolder:=StrReplace(autosaveFolder,"`r`n")
culledFolder:=StrReplace(culledFolder,"`r`n")
SlippiPath:=StrReplace(SlippiPath,"`r`n")


;OPEN SLIPPI (IF NECESSARY)
If WinExist("Faster Melee - Slippi") {
}
Else {
	Run, %SlippiPath%
	WinWait, % "Faster Melee - Slippi"
}

;OPEN THREAD WHICH WAITS ON CLOSURE OF SLIPPI TO TERMINATE THIS SCRIPT
SetTimer, waitForClose, -0 ;


;DEFINE HOTKEYS FOR CULLING REPLAY AND CLOSING SLIPPI
;(FOR WHEN SLIPPI IS OPEN)
If WinExist("Faster Melee - Slippi") {
	Down::
	timeLatest:=0 ;dummy creation time of latest file
	MsgBox, %autosaveFolder%\*.slp
	Loop, Files, %autosaveFolder%\*.slp
	{
		FileGetTime, curFileCurTime, %A_LoopFileFullPath%, C
		If (curFileCurTime>timeLatest){
			timeLatest:=curFileCurTime
			fileLatest:=A_LoopFileName
		}
	}
	originalFullPath:=autosaveFolder . "\" . fileLatest
	culledFullPath:=culledFolder . "\" . fileLatest
	MsgBox, %autosaveFolder% 
	MsgBox, %originalFullPath% 
	FileCopy, %originalFullPath%, %culledFullPath%, 1
	return
}


;FUNCTIONS
waitForClose(){
	WinWaitClose, % "Faster Melee - Slippi"
	ExitApp
	return
}

