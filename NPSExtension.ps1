#DOWNLOAD AND OPEN NPS EXTENSION
$DownloadPath = "$HOME/Downloads"
Start-BitsTransfer "https://download.microsoft.com/download/B/F/F/BFFB4F12-9C09-4DBC-A4AF-08E51875EEA9/NpsExtnForAzureMfaInstaller.exe" -Destination $DownloadPath
Start-Process $DownloadPath\NpsExtnForAzureMfaInstaller.exe
Start-Sleep -Seconds 20

#BEFORE CONTINUE, DO NFS EXTENSION SETUP ON SCREEN"
Write-Debug "Before Continue, Do NFS Extension setup om screen" -Debug
cd "c:\Program Files\Microsoft\AzureMfa\Config"
.\AzureMfaNpsExtnConfigSetup.ps1
