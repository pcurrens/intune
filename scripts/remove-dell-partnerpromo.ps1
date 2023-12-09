Start-Transcript -Path $env:TEMP\remove-dell-supportassist.log
#using Out-Null to force wait for uninstall
try{
	If ($null -ne (Get-AppxPackage -Name 'DellInc.PartnerPromo' -AllUsers)) {
	Write-Output 'Removing DellInc.PartnerPromo Appx Package'
	Get-AppxPackage -Name 'DellInc.PartnerPromo' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.PartnerPromo Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.PartnerPromo'})) {
	Write-Output 'Removing DellInc.PartnerPromo AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.PartnerPromo'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.PartnerPromo AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
