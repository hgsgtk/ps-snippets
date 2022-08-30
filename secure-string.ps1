# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertfrom-securestring?view=powershell-7.2
$passwordd = Get-Item -Path Env:\PASSWORD 
Write-Output $passwordd
$plainPassword = $env:PASSWORD
$password = $env:PASSWORD | ConvertTo-SecureString $plainPassword -AsPlainText -Force |  ConvertFrom-SecureString
Write-Output $password
