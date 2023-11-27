##################################################
#        Ersetzt die UPN's von Benutzern         #
#        in einer bestimmten OU                  #
#        durch deren Email-Adresse               #
#        Zusaetzliche Ausgabe und Feedback       #
##################################################

#Angegebene OU und alle unter-OU's
$users = get-aduser -Filter * -Properties * -SearchBase "OU=Mitarbeiter,OU=User,DC=contoso,DC=local" | Select-Object samaccountname, mail, UserPrincipalName
#Angegebene OU ohne alle unter-OU's
$users = get-aduser -Filter * -Properties * -SearchBase "OU=Mitarbeiter,OU=User,DC=contoso,DC=local" -SearchScope OneLevel | Select-Object samaccountname, mail, UserPrincipalName

foreach ($user in $users)
{
     write-host processing $user.samaccountname -NoNewline

     [string]$sam = $user.samaccountname
     [string]$upn = $user.mail

     if (!($null -eq $user.mail))
     {

        if ($user.UserPrincipalName -eq $upn)
        {
            write-host " UPN bereits wie erwartet: $upn (Uebersprungen)"
        }
        else 
        {
            set-aduser -identity $sam -UserPrincipalName $upn
            write-host " UPN wurde angepasst: $upn " 
        }
     }
     else
        {
           write-host " User hatte keine Email von der die neue UPN abgeleitet werden konnte"
        }
}

################################################################
#         Ersetzt den UPN-Suffix                               #
#         aller User mit einem entsprechenden UPN Suffix       #
#         durch einen gewuenschten UPN Suffix                  #
################################################################

$LocalUsers = Get-ADUser -Filter "UserPrincipalName -like '*contoso.local'" -Properties userPrincipalName -ResultSetSize $null

$LocalUsers | ForEach-Object {$newUpn = $_.UserPrincipalName.Replace("@contoso.local","@contoso.com"); $_ | Set-ADUser -UserPrincipalName $newUpn}




####################### Cloud #################################
# https://morgantechspace.com/2019/10/set-primary-email-address-for-o365-users-powershell.html

# Single User:
Set-Mailbox 'username' -WindowsEmailAddress 'newalias@newdomain.com' -MicrosoftOnlineServicesID 'newalias@newdomain.com'

# Bulk:
Import-Csv 'C:\Office365Users.csv' | ForEach-Object {
   Set-Mailbox $_."UserPrincipalName" -WindowsEmailAddress $_."NewEmailAddress" -MicrosoftOnlineServicesID $_."NewEmailAddress"
}


