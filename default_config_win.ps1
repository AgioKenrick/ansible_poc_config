

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
net start w32time
start-sleep -Seconds 10
w32tm /config /manualpeerlist:time.nist.gov /syncfromflags:MANUAL
Stop-Service w32time
start-sleep -seconds 10
Start-Service w32time
start-sleep -seconds 10
w32tm /resync
start-sleep -seconds 10
#set to auto start
sc.exe config W32Time start= delayed-auto

set-timezone "Eastern Standard Time"
