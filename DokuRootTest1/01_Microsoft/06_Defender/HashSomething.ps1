# If the content is a string:
$someString = "Hello, World!"
$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$utf8 = New-Object -TypeName System.Text.UTF8Encoding
$hash = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($someString)))
$hash

# If the content is a file:
$someFilePath = "C:\foo.txt"
$md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
$hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($someFilePath)))
$hash
# Starting in PowerShell version 4, this is easy to do for files out of the box with the Get-FileHash cmdlet:
Get-FileHash "c:\temp\test.pdf" -Algorithm MD5
# This is certainly preferable since it avoids the problems the first solution offers as identified in the comments (uses a stream, closes it, and supports large files).

#quelle: <https://stackoverflow.com/questions/10521061/how-to-get-an-md5-checksum-in-powershell> 