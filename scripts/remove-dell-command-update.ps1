Start-Transcript -Path $env:TEMP\remove-dell-dommand-update.log
#using Out-Null to force wait for uninstall
try{
	#Tested on Dell Command | Update for Windows Universal 5.1.0, 5.0.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Update for Windows Universal')) {
	Write-Output 'Removing Dell Command | Update for Windows Universal Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Update for Windows Universal' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Update for Windows Universal not present'
}
	#Tested on Dell Command | Update for Windows
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Update for Windows')) {
	Write-Output 'Removing Dell Command | Update for Windows Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Update for Windows' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Update for Windows Package not present'
}
	#Tested on Dell Command | Update 4.4.0, 4.6.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Update')) {
	Write-Output 'Removing Dell Command | Update Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Update' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Update Package not present'
}
	#Tested on Dell Command | Update for Windows 10 4.3.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Update for Windows 10')) {
	Write-Output 'Removing Dell Command | Update for Windows 10 Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Update for Windows 10' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Update for Windows 10 Package not present'
}
	If ($null -ne (Get-AppxPackage -Name 'DellInc.DellCommandUpdate' -AllUsers)) {
	Write-Output 'Removing DellInc.DellCommandUpdate Appx Package'
	Get-AppxPackage -Name 'DellInc.DellCommandUpdate' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.DellCommandUpdate Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellCommandUpdate'})) {
	Write-Output 'Removing DellInc.DellCommandUpdate AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellCommandUpdate'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.DellCommandUpdate AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
