# Select-String https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-7.2

$basicAuths = Select-String --custom-basic-auth-configs ./selenium.log `
    # $_ = data got by Get-Process https://nabelog.org/400/
    # ForEach-Object https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/foreach-object?view=powershell-7.2
    | ForEach-Object {$_ -replace "--custom-basic-auth-configs=", ""} `
    | ForEach-Object {$_.ToString().Split(" ").Where({$_ -ne ""})[1].Split(',') -replace '"', ''}
    | Where-Object ({ "" -ne $_})
Write-Output $basicAuths

$customHostnames = Select-String --custom-hostname-configs ./selenium.log `
    | ForEach-Object {$_ -replace "--custom-hostname-configs=", ""} `
    | ForEach-Object {$_.ToString().Split(" ").Where({$_ -ne ""})[1].Split(',') -replace '"', ''}
    | Where-Object ({ "" -ne $_})
Write-Output $customHostnames

$customProxy = Select-String --custom-proxy-config ./selenium.log `
    | ForEach-Object {$_ -replace "--custom-proxy-config=", ""} `
    | ForEach-Object {$_.ToString().Split(" ").Where({$_ -ne ""})[1] -replace '"', ''}
Write-Output $customProxy

if ($basicAuths.Count + $customHostnames.Count -gt 0) {
    Write-Output $basicAuths.Count
    Write-Output $customHostnames.Count

    $url = "http://localhost:8080/proxy"
    if ($customProxy) {
        $url = $url + "?httpProxy=" + $customProxy
    }

    Write-Output $url
    $response = (Invoke-Webrequest -Method POST -Body 'trustAllServers=true' $url).Content
    Write-Output $response
    $port=($response | ConvertFrom-Json).port
    Write-Output $port
} elseif ($customProxy) {
    Write-Output "Configure a custom proxy"
}
