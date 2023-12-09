Start-Transcript -Path $env:TEMP\remove-dell-command-power-manager.log
#using Out-Null to force wait for uninstall
try{
	#Tested on Dell Command | Power Manager 2.1.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Command | Power Manager')) {
	Write-Output 'Removing Dell Command | Power Manager Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Command | Power Manager' | Out-Null
}
	Else {
	Write-Output 'Dell Command | Power Manager not present'
}
	#Tested on Dell Power Manager Service 3.9.0, 3.15.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Power Manager Service')) {
	Write-Output 'Removing Dell Power Manager Service Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Power Manager Service' | Out-Null
}
	Else {
	Write-Output 'Dell Power Manager Service Package not present'
}
	If ($null -ne (Get-AppxPackage -Name 'DellInc.DellPowerManager' -AllUsers)) {
	Write-Output 'Removing DellInc.DellPowerManager Appx Package'
	Get-AppxPackage -Name 'DellInc.DellPowerManager' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.DellPowerManager Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellPowerManager'})) {
	Write-Output 'Removing DellInc.DellPowerManager AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellPowerManager'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.DellPowerManager AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
