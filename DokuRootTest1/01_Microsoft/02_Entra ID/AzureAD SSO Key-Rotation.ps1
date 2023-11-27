#Phase 1:
	# 1. On Azure AD-Connect install AzureAD Powershell module
		Install-module azuread
		
	# 2. Change to Azure AD-Connect installation directory:
		cd $env:programfiles"\Microsoft Azure Active Directory Connect"
		
	# 3. Import Module:
		Import-Module .\AzureADSSO.psd1
		
	# 4. Connect an Login to Azure AD with Global Admin
		New-AzureADSSOAuthenticationContext

	# 5. Check all Domains that have SSO enabled:
		Get-AzureADSSOStatus | ConvertFrom-Json

#Phase 2: 
	# 1. Gib Domain Credentials (contoso.com\Administrator or CONTOSO\Administor -> If problems with next Step!)
		$creds = Get-Credential
		
	# 2. Update the SSO Account with this Funktion:
		Update-AzureADSSOForest -OnPremCredentials $creds
	
	# 3. Repeat Phase 2 for all domains discovered in Phase 1 - Step 5



#Official Docs:
# https://learn.microsoft.com/de-de/azure/active-directory/hybrid/how-to-connect-sso-faq#wie-kann-ich-einen-rollover-des-kerberos-entschl-sselungsschl-ssels-des--azureadsso--computerkontos-durchf-hren-