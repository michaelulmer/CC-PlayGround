# 1. Modules
Install-Module Microsoft.Online.Sharepoint.Powershell
Import-Module Microsoft.Online.Sharepoint.Powershell 

# 2. Connect to SPO
Connect-SPOService -url https://adatum-admin.sharepoint.com


# 3a. Do single user
# Users must be unblocked!
Request-SPOPersonalSite -UserEmails "tester.test@adatum.com"


# 3b. Do multiple users
# Requirements:
# Users must be unblocked!
# UserEmails must be a non-empty array which contains non-null and non-empty strings. 
# Total number of user emails cannot exceed 200.
$users = Get-Content -path "D:\Mass Configuration CSV\All New Users.csv"
Request-SPOPersonalSite -UserEmails $users




Disconnect-SPOService