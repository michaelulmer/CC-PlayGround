
#Remove Alias of Cloud Mailbox
Set-Mailbox "Tester@adatum.com" -EmailAddresses @{remove="Tester.Test@international.org"}



# Change UPN - Singe User
Set-MsolUserPrincipalName -UserPrincipalName "Tester@adatum.com" -NewUserPrincipalName "tester.test@adatum.onmicrosoft.com"


# Change UPN - Mass/Bulk 
$CSVFile = "D:\UPNSwitchUsers.CSV"
$users = Import-Csv -Path $CSVFile -Delimiter ";"


foreach ($user in $users)
{      
    Set-MsolUserPrincipalName -UserPrincipalName $user.OldUPN -NewUserPrincipalName $user.NewUPN
}