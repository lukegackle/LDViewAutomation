Write-Host "-------------------------------------------------"
Write-Host "----------------LDView Automation----------------"
Write-Host "-------------------------------------------------"
Write-Host "This script enables you to batch render .ldr "
Write-Host "LEGO models and save them as images, you may also"
Write-Host "tweak this script to export POV, and STL, by"
Write-Host "reviewing the documentation for LDView."
Write-Host ""
Write-Host "Script written by Luke Gackle"
Write-Host "https://lukestoolkit.blogspot.com/"
Write-Host "-------------------------------------------------"
Write-Host ""
Write-Host ""
Write-Host ""

#Find out other options you can change in the settings.ini file at: https://trevorsandy.github.io/lpub3d/assets/docs/ldview/Help.html



Add-Type -AssemblyName microsoft.VisualBasic
Add-Type -AssemblyName System.Windows.Forms

$path = (Get-Location).path
$iniFile = (Resolve-Path ($path + "\Settings.ini")).Path

$wshell = New-Object -ComObject wscript.shell;

Write-Host "Loading Settings from: " $iniFile

Write-Host ""

$fp = Read-Host -Prompt "Provide folder path for .ldr files"
$LDView = "C:\Program Files (x86)\LDraw\LDView\LDView.exe"

Get-ChildItem $fp -Filter *.ldr | 
Foreach-Object {
    $file = $_.FullName
    $filepath = Resolve-Path $file
    
    Start-Process $LDView -ArgumentList "-file `"$($filepath.path)`"  -SaveSnapshots=1 -IniFile=`"$($iniFile)`""
    start-sleep -Milliseconds 2000

}