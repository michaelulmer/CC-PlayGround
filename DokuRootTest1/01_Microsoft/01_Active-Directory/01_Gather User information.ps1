
####################################################
# DURCHFUEHRUNG:                                   #
# siehe userDisplayname_modification.ps1           #
#                                                  #
####################################################

Get-ADUser -Filter * -SearchBase 'OU=TestUser,OU=01_MyUsers,DC=adatum,DC=local'