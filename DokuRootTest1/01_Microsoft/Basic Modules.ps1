#######################################################################################################################
# OnPrem: 

# Importiere AD Powershell Module:
Import-Module activedirectory

# Importiere Exchange Powershell Module:
# Fuer EXCH 2010
Add-PSsnapin Microsoft.Exchange.Management.PowerShell.E2010

# Fuer EXCH 2013/2016/2019
Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn


#######################################################################################################################
# Cloud

# AzureAD GA and AzureADPreview back and forth:

#AzureAD GA
Install-Module AzureAD
Get-Module AzureAD
Update-Module AzureAD
Connect-AzureAD
Disconnect-AzureAD
Uninstall-Module AzureAD

#AzureADPreview
Install-Module AzureADPreview
Get-Module AzureADPreview
Update-Module AzureADPreview
Connect-AzureAD
Disconnect-AzureAD
Uninstall-Module AzureADPreview

#######################################################################################################################

# EXO Powershell: 
# https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps
Install-Module -Name ExchangeOnlineManagement
Get-Module ExchangeOnlineManagement
Update-Module -Name ExchangeOnlineManagement
Disconnect-ExchangeOnline
Connect-ExchangeOnline

#######################################################################################################################

# MS Online
Install-Module MSonline
Update-Module MsolService
Connect-MsolService

#######################################################################################################################

# SharePoint Online
Install-Module Microsoft.Online.Sharepoint.Powershell
Import-Module Microsoft.Online.Sharepoint.Powershell
Get-Module Microsoft.Online.SharePoint.PowerShell
Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable | Select-Object Name,Version
Update-Module Microsoft.Online.SharePoint.PowerShell


# PNP Powershell (SharePoint Alternative)
Install-Module PnP.PowerShell
Import-Module PnP.PowerShell
Uninstall-Module PnP.PowerShell

#######################################################################################################################

# Teams 
Install-Module -Name MicrosoftTeams
Connect-MicrosoftTeams

#######################################################################################################################

# Graph API 
# https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0

# Check if the Microsoft Graph PowerShell module is installed already, using this PowerShell command:
Get-InstalledModule Microsoft.Graph

# Make sure Powershell is 5.1 or later
$PSVersionTable

# Check current permission:
Get-ExecutionPolicy

#Update PowerShellGet to the latest version using
Install-Module PowerShellGet -Force

# Show Graph Modules
Find-Module Microsoft.Graph*

# Install Graph
Install-Module Microsoft.Graph

# Verify Installation:
Get-InstalledModule Microsoft.Graph

# Verify Submodules:
Get-InstalledModule

# Update the Graph SDK
Update-Module Microsoft.Graph

# Unintall the Graph SDK
# First:
Uninstall-Module Microsoft.Graph -AllVersions
# Then - clean up dependencies: 
Get-InstalledModule Microsoft.Graph.* | Where-Object Name -ne "Microsoft.Graph.Authentication" | Uninstall-Module
Uninstall-Module Microsoft.Graph.Authentication


