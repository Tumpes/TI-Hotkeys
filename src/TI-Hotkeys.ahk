﻿; Hotkey for TI-Nspire cas software
; github.com/tumpes/TI-Hotkeys

#SingleInstance Force

SendIntegral() {
  mathMode()
  Send "∫(,,,)"       ; definite Integral
  mathMode()
  Send "{Left}"
  Send "{Left}"
  Send "{Left}"       ; three times left to get cursor in the default position
  Send "{Down}"
  Send "{Down}"
}

Senddx() {
  mathMode()
  Send "(,)"       ; derive and fill in x
  mathMode()
  Send "{Left}"     ; go left to get cursor in the default place
  Send "{Left}"
  Send "x"
  Send "{Right}"
}

SendDerivative() {
  mathMode()
  Send "(,)"
  mathMode()
  Send "{Left}"     ; go left to get cursor in the default place
  Send "{Left}"
}

SendNeper() {
  Send ""
}

replaceHotkey(key, val) {
  IniWrite(val, configFile, "Hotkeys", key)
}

mathMode()
{
  Send "{Ctrl down}"
  Send "m"
  Send "{Ctrl up}"
}

NewHotkey(keyBind, action)
{
  if (action == "integral") 
  {
    Hotkey keyBind, (_) => SendIntegral()
  }
  else if (action == "derivative") {
    Hotkey keyBind, (_) => SendDerivative()
  }
  else if (action == "autofilled derivative") {
    Hotkey keyBind, (_) => Senddx()
  }
  else if (action == "neper number") {
    Hotkey keyBind, (_) => Sendneper()
  }
  else {
    Hotkey(keyBind, (_) => Send(action)) ;
  }
}

InitConfigFile()
{
  if (FileExist(A_AppData "\TI-Hotkeys\config.ini") == "")
  {
    MsgBox("Installation successful! `nPress alt + h or use the tray menu to open the hotkey editor")
    FileAppend("[Hotkeys]", A_AppData "\TI-Hotkeys/config.ini", "UTF-16-RAW")
  }

  try
  {
    IniRead(A_AppData "\TI-Hotkeys/config.ini", "Hotkeys")
  }
  catch
  {
    FileDelete(A_AppData "\TI-Hotkeys/config.ini")                           ; reset the config file if it's empty or malformed
    FileAppend("[Hotkeys]", A_AppData "\TI-Hotkeys/config.ini", "UTF-16-RAW")
  }
}

GuiConstructor()
{

  ;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
  ;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
  ;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

  myGui := Gui()
  WinSetStyle("-0x20000", myGui) ; hide minimize and fullscreen buttons
  keyBind := myGui.Add("Hotkey", "x160 y16 w120 h21 vChosenHotkey")
  ; lockCalc := myGui.Add("CheckBox", "x304 y8 w160 h34", "Toimii laskimen ulkopuolella")
  hotkeyButton := myGui.Add("DropDownList", "x24 y16 w120 Choose1", [" ", "≈", "≠", "↑", "↓", "α", "β", "γ", "Σ", "≤", "≥", "±", "π", "Ω", "neper number", "λ", "μ", "ε", "φ", "⇔", "⇒", "¬", "∧", "∨", "▶", "≡", "integral", "derivative", "autofilled derivative"])
  saveBtn := myGui.Add("Button", "x190 y60 w40", "Save")
  keyBind.OnEvent("Change", HandleChange)
  ; lockCalc.OnEvent("Click", HandleChange)
  ; hotkeyButton.OnEvent("Change", HandleChange)
  saveBtn.OnEvent("Click", HandleSave)
  myGui.OnEvent('Close', (*) => myGui.Destroy())
  myGui.Title := "Hotkey Editor"

  HandleSave(*)
  {

    KeyBindText := keyBind.Value
    action := hotkeyButton.Text

    if(KeyBindText == ""){
      MsgBox("Please fill both fields")
      return 0
    }

    if (action == " ")
    {
      HotIfWinNotActive "ahk_class AutoHotkeyGUI"
      Hotkey(KeyBindText, "Off")
      HotIfWinNotActive

      IniDelete(configFile, "Hotkeys", KeyBindText)

      return 0
    }

    replaceHotkey(KeyBindText, action)

    HotIfWinNotActive "ahk_class AutoHotkeyGUI"

    NewHotkey(KeyBindText, action)

    HotIfWinNotActive

  }

  HandleChange(*) {
    KeyBindText := keyBind.Value

    try {
      existing := IniRead(configFile, "Hotkeys", KeyBindText)
      hotkeyButton.Text := existing
    }
    ; catch{
    ;   hotkeyButton.Text := " "
    ; }
  }

  return myGui
}

StartGui(*) {
  if !WinExist("ahk_class AutoHotkeyGUI")
    {
      myGui := GuiConstructor()
      myGui.Show("w550 h120")
    }
}

; Load hotkeys from file

InitConfigFile()

configFile := A_AppData "\TI-Hotkeys/config.ini"

Hotkeystring := IniRead(configFile, "Hotkeys")

arr := StrSplit(Hotkeystring, "`n")

HotIfWinNotActive "ahk_class AutoHotkeyGUI"

for item in arr
{
  hotkeyArr := StrSplit(item, "=")
  NewHotkey(hotkeyArr[1], hotkeyArr[2])
}

HotIfWinNotActive


Tray := A_TrayMenu ; set up tray

Tray.Delete()

Tray.Add("Open Hotkey Editor", StartGui)

Tray.AddStandard()

Tray.Delete("&Open")
Tray.Delete("&Help")        ; Should rewrite this later, works for now
Tray.Delete("&Window Spy")
Tray.Delete("&Reload Script")
Tray.Delete("&Edit Script")
Tray.Delete("&Pause Script")

Tray.Delete("2&") ; delete separators
Tray.Delete("2&")


!h:: ; Hotkey editor
{

  StartGui()
}


; official nspire shortcuts available at https://education.ti.com/-/media/files/activities/us/math/international-baccalaureate/short-cuts/ti-shortcuts-and-tips.pdf
