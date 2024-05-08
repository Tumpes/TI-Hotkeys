$wc = New-Object System.Net.WebClient

if (!(Test-Path "$env:APPDATA\TI-Hotkeys\")) {
    New-Item -Path "$env:APPDATA" -Name "TI-Hotkeys" -ItemType "directory"
  }
if (Test-Path "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk") {
    Remove-Item "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk"
 # update the script
    $wc.DownloadFile("https://raw.githubusercontent.com/Tumpes/TI-Hotkeys/master/src/TI-Hotkeys.ahk", "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk")
}
else {
    $wc.DownloadFile("https://raw.githubusercontent.com/Tumpes/TI-Hotkeys/master/src/TI-Hotkeys.ahk", "$env:APPDATA\TI-Hotkeys\TI-Hotkeys.ahk")
}

if (!(Test-Path "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe")) {
    $wc.DownloadFile("https://github.com/Tumpes/TI-Hotkeys/raw/master/src/AutoHotkey64.exe", "$env:APPDATA\TI-Hotkeys\AutoHotkey64.exe")
}

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