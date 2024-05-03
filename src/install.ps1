New-Item -Path "$env:APPDATA" -Name "TI-Hotkeys" -ItemType "directory"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://github.com/Tumpes/TI-Hotkeys/raw/master/src/AutoHotkey64.exe", "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe")

$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://raw.githubusercontent.com/Tumpes/TI-Hotkeys/master/src/TI-Hotkeys.ahk", "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk")

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\TI-Hotkeys.lnk")
$Shortcut.TargetPath = "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe"
$Shortcut.Arguments = "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk"
$Shortcut.Save()

$Shortcut2 = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\TI-Hotkeys.lnk")
$Shortcut2.TargetPath = "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe"
$Shortcut2.Arguments = "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk"
$Shortcut2.Save()

Invoke-Expression "& `"$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe`" $env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk"