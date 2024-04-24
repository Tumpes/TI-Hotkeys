New-Item -Path "$env:APPDATA" -Name "TI-Hotkeys" -ItemType "directory"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://github.com/Tumpes/TI-Hotkeys/raw/master/src/AutoHotkey64.exe", "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe")

$wc = New-Object System.Net.WebClient
$wc.DownloadFile("https://raw.githubusercontent.com/Tumpes/TI-Hotkeys/master/src/TI-Hotkeys.ahk", "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk")

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\TI-Hotkeys.lnk")
$Shortcut.TargetPath = "$Home\Desktop\AutoHotkey64.exe"
$Shortcut.Arguments = "TI-Hotkeys.ahk"
$Shortcut.Save()

Invoke-Expression "& `"$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe`" $env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk"