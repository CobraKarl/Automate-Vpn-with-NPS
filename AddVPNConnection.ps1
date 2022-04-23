$VPNName = Read-Host -Prompt "Enter A Name Of The VPN Connection"
$SeverAdress = Read-Host -Prompt "Enter IPAdress or Domainname to Server"
$PreSharedKey = Read-Host -Prompt "Enter The PreSharedKey Password" -AsSecureString
$username = Read-Host -Prompt "Enter Username"
$plainpassword = Read-Host -Prompt "Enter Password" -AsSecureString

#ADD VPN-CONNECTION (In Win 10 TO CONNECT TO SERVER)
Add-VpnConnection -Name $VPNName -ServerAddress $SeverAdress -AuthenticationMethod MSChapv2 -EncryptionLevel Optional -Force -L2tpPsk $PreSharedKey -TunnelType L2tp -UseWinlogonCredential -RememberCredential -PassThru

#GET VPN-CONNECTION INFO AND DIAL UP AND THEN SEE STATUS
Get-VpnConnection -Name $VPNName
rasdial.exe $VPNName $username $plainpassword
Get-Vpnconnection | Select-Object Name, Connectionstatus

#rasphone -d "Test3"
