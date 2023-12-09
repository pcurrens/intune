Start-Transcript -Path $env:TEMP\remove-dell-dommand-update.log
#using Out-Null to force wait for uninstall
try{
	#Tested on Dell Command | Update for Windows Universal 5.1.0
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
	#Tested on Dell Command | Update 4.4.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Update')) {
	Write-Output 'Removing Dell Command | Update Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Update' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Update Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
