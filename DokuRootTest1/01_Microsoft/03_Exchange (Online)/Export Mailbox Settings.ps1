####################### Cloud #################################
      
      # Single User:
      Set-Mailbox 'username' -WindowsEmailAddress 'newalias@newdomain.com' -MicrosoftOnlineServicesID 'newalias@newdomain.com'

      # Bulk:
      Import-Csv 'C:\Office365Users.csv' | ForEach-Object {
         Set-Mailbox $_."UserPrincipalName" -WindowsEmailAddress $_."NewEmailAddress" -MicrosoftOnlineServicesID $_."NewEmailAddress"
      }
