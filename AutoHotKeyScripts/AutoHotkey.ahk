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


sc159 & n:: Send, ^#{Left}
sc159 & m:: Send, ^#{Right}

;Multimedia
sc159 & F7:: Send, {Media_Prev}
sc159 & F8:: Send, {Media_Play_Pause}
sc159 & F9:: Send, {Media_Next}
sc159 & F10:: Send, {Volume_Mute}
sc159 & F11:: Send, {Volume_Down}
sc159 & F12:: Send, {Volume_Up}


;Tilt scroll
+WheelDown:: Send, {WheelRight}
+WheelUp:: Send, {WheelLeft}
RButton & WheelDown:: Send, {WheelRight}
RButton & WheelUp:: Send, {WheelLeft}


; Google translate from clipboard
sc159 & T::
	en_text := LC_UriEncode(CLIPBOARD)
	Keywait, T, U
	Keywait, T, D T0.3
	if (ErrorLevel) {
		en_text := StrReplace(en_text, "%2F", "%5C%2F")
		Run,https://www.deepl.com/translator#en/ja/%en_text% ; DeepL Translator if T is single-pressed
	} else {
		Run,https://translate.google.co.jp/#en/ja/%en_text% ; Google Translator if T is double-pressed
	}
Return

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




; Toggle VPN with blinking ScrollLock light on my keyboard
; NIZ Keyboard

count := 0
sc160::
	SetFormat, Float, 0.0
	SetWorkingDir, C:\Program Files\OpenVPN\config
	if ( Mod(count,2) = 1 ) {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --command disconnect_all
		Send, {ScrollLock}
		Sleep, 100
		Send, {ScrollLock}
		Sleep, 100
		Send, {ScrollLock}
		Sleep, 100
		Send, {ScrollLock}
	} else {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --connect "SyncronVPN - AllTraffic.ovpn"
		Send, {ScrollLock}
		Sleep, 1800
		Send, {Tab}^!+z ; Paste OTP using WinAuth shortcut key
		Sleep, 700
		Send, {Enter}
		Sleep, 1000
		Send, {ScrollLock}
		
	}
	count += 1
	if GetKeyState("ScrollLock", "T")
		Send, {ScrollLock} ; Send ScrollLock once again in case it is accidentally on
		
return

; REALFORCE
count := 0
+sc160::
	SetFormat, Float, 0.0
	SetWorkingDir, C:\Program Files\OpenVPN\config
	if ( Mod(count,2) = 1 ) {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --command disconnect_all
		Send, {NumLock}
		Sleep, 100
		Send, {NumLock}
		Sleep, 100
		Send, {NumLock}
		Sleep, 100
		Send, {NumLock}
	} else {
		Run C:\Program Files\OpenVPN\bin\openvpn-gui.exe --connect "SyncronVPN - AllTraffic.ovpn"
		Send, {NumLock}
		Sleep, 1800
		Send, {Tab}^!+z ; Paste OTP using WinAuth shortcut key
		Sleep, 700
		Send, {Enter}
		Sleep, 1000
		Send, {NumLock}
		
	}
	count += 1
	if GetKeyState("NumLock", "T")
		Send, {NumLock} ; Send NumLock once again in case it is accidentally on
		
return

; ------------- Methods --------------
; Modified by GeekDude from http://goo.gl/0a0iJq
LC_UriEncode(Uri, RE="[0-9A-Za-z]") {
	VarSetCapacity(Var, StrPut(Uri, "UTF-8"), 0), StrPut(Uri, &Var, "UTF-8")
	While Code := NumGet(Var, A_Index - 1, "UChar")
		Res .= (Chr:=Chr(Code)) ~= RE ? Chr : Format("%{:02X}", Code)
	Return, Res
}
