#NoEnv
#SingleInstance force
SetTitleMatchMode, 2

; ===TODO===
; Raw모드 추가하기. (특수문자 그대로 출력)
;   => 한글 자판으로 되어있을 시 영어가 한글로 복사되는 버그도 수정하기.
; 저장, 불러오기시 여러줄일때 제대로 저장 안되는 버그 수정.

;====================Main====================
Main_Gui()
;====================창 이동==================
FileRead,Win_Pos,%A_WorkingDir%\info.ini
StringSplit, Win_Pos, Win_Pos ,`n
WinMove, 도우미 GUI, , %Win_Pos1%, %Win_Pos2%
;===============세이브 불러오기=================
FileRead,Data,%A_WorkingDir%\Data%load_num%.ini ;저장값 불러오기
if errorlevel = 1
{
	return
}
StringSplit, Data, Data ,`n

Guicontrol,,f1,%Data1%
Guicontrol,,f2,%Data2%
Guicontrol,,f3,%Data3%
Guicontrol,,f4,%Data4%
Guicontrol,,f6,%Data5%
Guicontrol,,f7,%Data6%
Guicontrol,,f8,%Data7%
Guicontrol,,f9,%Data8%
Guicontrol,,f10,%Data9%

F1::
gui,submit,nohide
SendInput, {Raw}%f2%
return

F2::
gui,submit,nohide
SendInput, {Raw}%f2%
return

F3::
gui,submit,nohide
SendInput, {Raw}%f3%
return

F4::
gui,submit,nohide
SendInput, {Raw}%f4%
return

F6::
gui,submit,nohide
SendInput, %f6%
return

F7::
gui,submit,nohide
SendInput, %f7%
return

F8::
gui,submit,nohide
SendInput, %f8%
return

F9::
gui,submit,nohide
SendInput, %f9%
return

F10::
gui,submit,nohide
SendInput, %f10%
return

Reload:
F11::
save_data()
Reload

GuiClose:
F12::
ExitApp

;================Func=================
save_data(){
	global
	gui,submit,nohide
	WinGetPos , win_X, win_Y,,, 도우미 GUI
	FileDelete, %A_WorkingDir%\info.ini
	FileAppend,%win_X%`n,%A_WorkingDir%\info.ini
	FileAppend,%win_Y%,%A_WorkingDir%\info.ini
	FileDelete, %A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f1%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f2%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f3%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f4%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f6%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f7%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f8%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f9%`n,%A_WorkingDir%\Data%save_num%.ini
	FileAppend,%f10%`n,%A_WorkingDir%\Data%save_num%.ini
}
Main_GUI()
{
	global
	Gui, Add, Text, x12 y9 w110 h20 , F1
	Gui, Add, Edit, x12 y29 w110 h40 vf1, Edit1
	Gui, Add, Text, x132 y9 w120 h20 , F2
	Gui, Add, Edit, x132 y29 w120 h40 vf2, Edit
	Gui, Add, Text, x262 y9 w110 h20 , F3
	Gui, Add, Edit, x262 y29 w110 h40 vf3, Edit
	Gui, Add, Text, x12 y89 w110 h20 , F4
	Gui, Add, Edit, x12 y109 w110 h40 vf4, Edit
	Gui, Add, Text, x132 y89 w120 h20 , F6
	Gui, Add, Edit, x132 y109 w120 h40 vf6, Edit
	Gui, Add, Text, x262 y89 w110 h20 , F7
	Gui, Add, Edit, x262 y109 w110 h40 vf7, Edit
	Gui, Add, Text, x12 y169 w110 h20 , F8
	Gui, Add, Edit, x12 y189 w110 h40 vf8, Edit
	Gui, Add, Text, x132 y169 w120 h20 , F9
	Gui, Add, Edit, x132 y189 w120 h40 vf9, Edit
	Gui, Add, Text, x262 y169 w110 h20 , F10
	Gui, Add, Edit, x262 y189 w110 h40 vf10, Edit
	Gui, Add, Text, x12 y240 w380 h20 , F11 입력값 저장, F12 종료            문의 : skatjrdndqo@naver.com
	; Generated using SmartGUI Creator for SciTE
	Gui, Show, w392 h260, 도우미 GUI
	return
}