$RASAdress = Read-Host -Prompt "Name or IP To Where RemoteAcces is installed"
$FriendlyName = Read-Host -Prompt "Make Up A Firendly Name"
$SharedSecret = Read-Host -Prompt "Enter A Shared Secret Password (Same as when installing Remote Access" -AsSecureString


#INSTALL NPS
Install-WindowsFeature NPAS -IncludeManagementTools
Start-Sleep -Seconds 20
netsh nps add registeredserver
Start-Sleep -Seconds 10

#CONFIGURE RADIUSCLIENT
New-NpsRadiusClient -Address $RASAdress -Name $FriendlyName -SharedSecret $SharedSecret

#CONFIGURE CONNECTION REQUEST POLICIES
netsh nps add crp name = "Crp Authentication for all users"`
        state = "ENABLE" processingorder = "0" policysource = "2"`
        conditionid = "0x3d" conditiondata = "^5$"`
        profileid = "0x1025" profiledata = "0x1"`
        profileid = "0x100a" profiledata = "1A000000000000000000000000000000"`
        profileid = "0x1009" profiledata = "0x5" profiledata = "0x4"`
        profileid = "0x1fb0" profiledata = "TRUE"

#CONFIGURE NETWORK POLICIES
netsh nps add np name = "Np Authentication for all users"`
        state = "enable" processingorder = "0" policysource = "2"`
        conditionid = "0x3d" conditiondata = "^5$"`
        profileid = "0x100a" profiledata = "1A000000000000000000000000000000"`
        profileid = "0x1008" profiledata = "0x5"`
        profileid = "0x7" profiledata = "0x1"`
        profileid = "0x6" profiledata = "0x2"`
        profileid = "0xffffffa7" profiledata = "0x2"`
        profileid = "0xffffffa6" profiledata = "0xe"`
        profileid = "0x1009" profiledata = "0x5" profiledata = "0x4"`
        profileid = "0x100f" profiledata = "TRUE"
Start-Sleep -Seconds 15

#DOWNLOAD AND OPEN NPS EXTENSION
$DownloadPath = "$HOME/Downloads"
Start-BitsTransfer "https://download.microsoft.com/download/B/F/F/BFFB4F12-9C09-4DBC-A4AF-08E51875EEA9/NpsExtnForAzureMfaInstaller.exe" -Destination $DownloadPath
Start-Process $DownloadPath\NpsExtnForAzureMfaInstaller.exe
Start-Sleep -Seconds 20

#RUN IAS UNRESTRICTED (WORKS SOMETHIMES WHEN SERVER IS NOT CONNECTING)
cmd.exe /c sc sidtype IAS unrestricted
Start-Sleep -Seconds 10
Restart-Computer
    
        


    
        


