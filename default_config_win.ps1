

mkdir C:\Temp
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


#set ntp server
w32tm /config /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org" /syncfromflags:MANUAL
Start-sleep -seconds 2
Stop-Service w32time -force
Start-Sleep -seconds 10
Start-Service w32time
