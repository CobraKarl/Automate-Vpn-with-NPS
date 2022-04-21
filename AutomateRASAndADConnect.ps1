$NPSServerName = Read-Host -Prompt "Name or IPAdress to where NPS server role is/or will be installed"
$SharedSecret = Read-Host -Prompt "Enter a Shared Secret Password" -AsSecureString
$PreSharedKey = Read-Host -Prompt "Enter a PresharedKey" -AsSecureString

#INSTALL REMOTE ACCESS
Install-WindowsFeature RemoteAccess, DirectAccess-VPN -IncludeManagementTools
Install-RemoteAccess -Prerequisite

#CHANGE TO RADIUSSERVER 
Install-RemoteAccess -VpnType Vpn -Legacy  -RadiusServer $NPSServerName -SharedSecret $SharedSecret
Start-Sleep -Seconds 30

#CHANGE TO L2TP WITH PRESHAREDKEY AND RESTART REMOTE ACCESS SERVER
Set-VpnAuthProtocol -SharedSecret $PreSharedKey -TunnelAuthProtocolsAdvertised PreSharedKey -UserAuthProtocolAccepted MsChapv2
Restart-Service RemoteAccess
Start-Sleep -Seconds 15

# DOWNLOAD AND OPEN AZURE AD CONNECT
$DownloadPath = "$HOME/Downloads"
Start-BitsTransfer https://download.microsoft.com/download/B/0/0/B00291D0-5A83-4DE7-86F5-980BC00DE05A/AzureADConnect.msi -Destination $DownloadPath
Start-Process $DownloadPath\AzureADConnect.msi
