$var = $null
Write-Output [String]::IsNullOrEmpty($var)

$var = ""
Write-Output [String]::IsNullOrEmpty($var)

$var = "string"
Write-Output [String]::IsNullOrEmpty($var)
