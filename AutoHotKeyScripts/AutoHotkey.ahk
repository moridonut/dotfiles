;Right alt combinations
; vim cursor movement
sc159 & h:: Send, {Blind}{left}
sc159 & l:: Send, {Blind}{right}
sc159 & k:: Send, {Blind}{up}
sc159 & j:: Send, {Blind}{down}
sc159 & Space:: Send, {vkF4sc029} ; âEAlt+SpaceÇ≈ëSäpîºäpêÿë÷

sc159 & 9:: Send, {Blind}{PgUp}
sc159 & 0:: Send, {Blind}{PgDn}

sc159 & `;:: Send, {Blind}{Home}
sc159 & ':: Send, {Blind}{End}
sc159 & /:: Send, {Blind}{Insert}

sc159 & ]:: Send, {Blind}{WheelDown}
sc159 & [:: Send, {Blind}{WheelUp}
sc159 & -:: Send, {Blind}{WheelLeft}
sc159 & =:: Send, {Blind}{WheelRight}
sc159 & o:: Send, ^{WheelDown}
sc159 & p:: Send, ^{WheelUp}

sc159 & ,:: Send, {Blind}{XButton1}
sc159 & .:: Send, {Blind}{XButton2}
sc159 & \:: Send, {AppsKey}

;Multimedia
sc159 & F7:: Send, {Media_Prev}
sc159 & F8:: Send, {Media_Play_Pause}
sc159 & F9:: Send, {Media_Next}
sc159 & F10:: Send, {Volume_Mute}
sc159 & F11:: Send, {Volume_Down}
sc159 & F12:: Send, {Volume_Up}


; Google translate from clipboard
sc159 & T::Run,https://translate.google.co.jp/#en/ja/%CLIPBOARD%

; hp notebook useless keys
; Share Screen key
<!<^F22::Send, {Blind}{Home}

; Pick up Key

$<!<#F15::Send, {Blind}{End}

; Hangup Key
<!<^F14::Send, {Blind}{Insert}
+<!<^F14::Send {Shift}{Insert}

; Mouse Fn1 This is to avoid a bug that ELECOM driver keeps the buttons pressed down.
<!<+Up:: Send !+{Right}

; Mouse Fn2 This is to avoid a bug that ELECOM driver keeps the buttons pressed down.
<!<+Down:: Send !+{Left}

; Unify "Toggle Mute" across all video conference apps
Pause::
if ( WinActive("ahk_class ZPContentViewWndClass")  ){
	Send, !a ;Zoom
}else if ( WinActive("ahk_exe Teams.exe") ) {
	Send, ^+m ;MS Teams
}else if ( WinActive("ahk_exe lync.exe") ) {
	Send, #{F4} ; Skype for business
}
return


;Double click print screen to run Togle
PrintScreen::
	Keywait, PrintScreen, U
	Keywait, PrintScreen, D T0.3
	if (ErrorLevel) {
		Send, {PrintScreen} ; if single click, then normal print screen
	} else {
		Send, ^!+q ; if double click, then call Togle
	}
return

; Toggle VPN
ScrollLock::
	SetWorkingDir, C:\Program Files\OpenVPN\config
	if ( GetKeyState("ScrollLock", "T") ) {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --command disconnect_all
		Sleep, 1000
		Send, {ScrollLock}
	} else {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --connect "SyncronVPN - AllTraffic.ovpn"
		Sleep, 1700
		Send, {Tab}^!+z
		Sleep, 500
		Send, {Enter}{ScrollLock}
	}
return

