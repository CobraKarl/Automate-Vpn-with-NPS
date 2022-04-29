# Automate-Vpn-with-NPS
Part 1 TO 4 in Automate Installation and Configuration for "Integrate your VPN infrastructure with Azure AD MFA by using the Network Policy Server extension for Azure" Link:https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-nps-extension-vpn

<h3>Part 1 (use the ps file: AutomateRASAndADConnect) Includes:</h3>

* Installation of Remote Access
* Change To Radius Server
* Change to L2tp With Prehared Key
* Download and open Azure AD Connect (needs to be configure in the GUI)

<h3>Part 2 (use the file: AutomateNPS) Includes (installation on a diffrent server than RAS):</h3>

* Install NPS
* Configure Radius Client
* Configure Connection Request Policies
* Configure Network Policies


<h3>Part 3 (Use the file: NPSExtension) and run on the NPS server:</h3>

* Install Azure AD Module and downloads (in download folder) and creates a tenent ID file, copy the tenet id when asked for
*  Download and open NPS extension (needs to be setup in the GUI, See attached link)
*  Change directory and run Setup file

<h3>Part 4 (Use the file: AddVPNConnection):</h3>

* Adds a VPN-Connection with Username and Password and connects to the VPN (Radius) Server
