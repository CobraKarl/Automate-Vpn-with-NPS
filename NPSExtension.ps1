#INSTALL AZURE AD AND SAVE TENENT ID FILE (need enterprice admin id)
Install-Module AzureAD
Connect-AzureAD | Out-File -FilePath Downloads/TenentId.txt

#DOWNLOAD AND OPEN NPS EXTENSION
$DownloadPath = "$HOME/Downloads"
Start-BitsTransfer "https://download.microsoft.com/download/B/F/F/BFFB4F12-9C09-4DBC-A4AF-08E51875EEA9/NpsExtnForAzureMfaInstaller.exe" -Destination $DownloadPath
Start-Process $DownloadPath\NpsExtnForAzureMfaInstaller.exe
Start-Sleep -Seconds 10

#BEFORE CONTINUE, DO THE NFS EXTENSION SETUP ON SCREEN (when asked for Tenent ID, use the text file that was downloaded i the download folder)
Write-Debug "Before Continue, Do NFS Extension setup om screen" -Debug
cd "c:\Program Files\Microsoft\AzureMfa\Config"
.\AzureMfaNpsExtnConfigSetup.ps1
