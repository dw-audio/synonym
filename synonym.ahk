#NoEnv						; AutoHotKey boilerplate
SendMode Input
#SingleInstance force


ScrollLock::  					; Select a key to assign as the hotkey
SetTitleMatchMode, 1
{
if !WinExist("ahk_exe msedge.exe")
{
Run, msedge.exe  			; if edge isn't open, open it
WinWait, New tab ; Wait for homepage to load. Page title "New Tab" loads before the page does, but sometimes this isn't caught in time
}
if !WinActive("ahk_exe msedge.exe") 		; Edge may not be opened to the foreground, or may be minimised, so activate if necessary
{
WinActivatebottom ahk_exe msedge.exe   ; bring Edge to the foreground
          ; Use "bottom" to activate main window rather than any foreground notifications / popups
          ; Sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
          ; The below code should fix that.
WinGet, hWnd, ID, ahk_class Chrome_WidgetWin_1
DllCall("SetForegroundWindow", UInt, hWnd)
}
Send, ^t					; open a new tab
Send, synonym{Space}				; send the characters "synonym" then a space
}
return						; quit gracefully
