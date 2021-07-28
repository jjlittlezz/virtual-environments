################################################################################
##  File:  Update-DotnetTLS.ps1
##  Desc:  Update DotNetFramework security protocol to TLS 1.2
################################################################################

Write-Host "Update-DotnetTLS.ps1"

$registryPath = "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319"
$name = "SchUseStrongCrypto"
$value = "1"
if(Test-Path $registryPath) {
    Write-Host "Into 1st condition"
    Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWORD
}

$registryPath = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319"
if(Test-Path $registryPath){
    Write-Host "Into 2nd condition"
    Set-ItemProperty -Path $registryPath -Name $name -Value $value -Type DWORD
}

Write-Host "Update-DotnetTLS.ps1 - tests"

Invoke-PesterTests -TestFile "Tools" -TestName "DotnetTLS"


Write-Host "Update-DotnetTLS.ps1 tests"

