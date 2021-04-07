#set ntp server
w32tm /config /manualpeerlist:pool.ntp.org /syncfromflags:MANUAL
Stop-Service w32time
Start-Sleep -seconds 10
Start-Service w32time

New-Item -path "C:\" -Name Temp -ItemType directory
Start-sleep -seconds 5
cd C:\Temp

if (Test-Path firefox-latest.exe -PathType leaf) {
    Write-Host "Mozilla Firefox Latest Exists In Folder: firefox-latest.exe"
}
else {
    Write-Host ">> Downloading Latest Version of Mozilla Firefox"
    Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US' -OutFile firefox-latest.exe
    Write-Host ">> Download Complete"
}

$param = "/s"
Start-sleep -seconds 10
& ".\firefox-latest.exe" $Param


