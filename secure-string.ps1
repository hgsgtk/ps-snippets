$plainPassword = $env:PASSWORD
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertfrom-securestring?view=powershell-7.2
$password = ConvertTo-SecureString $plainPassword -AsPlainText -Force
Write-Output $plainPassword
Write-Output $password
