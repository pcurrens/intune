Start-Transcript -Path $env:TEMP\remove-dell-digital-delivery.log
#using Out-Null to force wait for uninstall
try{
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Digital Delivery')) {
	Write-Output 'Removing Dell Digital Delivery Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Digital Delivery' | Out-Null
}
	Else {
	Write-Output 'Dell Digital Delivery not present'
}
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Digital Delivery Service')) {
	Write-Output 'Removing Dell Digital Delivery Service Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Digital Delivery Service' | Out-Null
}
	Else {
	Write-Output 'Dell Digital Delivery Service Package not present'
}
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Digital Delivery Services')) {
	Write-Output 'Removing Dell Digital Delivery Service Packages'
	Uninstall-Package -ProviderName msi -Name 'Dell Digital Delivery Services' | Out-Null
}
	Else {
	Write-Output 'Dell Digital Delivery Services Package not present'
}
	If ($null -ne (Get-AppxPackage -Name 'DellInc.DellDigitalDelivery' -AllUsers)) {
	Write-Output 'Removing DellInc.DellDigitalDelivery Appx Package'
	Get-AppxPackage -Name 'DellInc.DellDigitalDelivery' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.DellDigitalDelivery Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellDigitalDelivery'})) {
	Write-Output 'Removing DellInc.DellDigitalDelivery AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellDigitalDelivery'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.DellDigitalDelivery AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
