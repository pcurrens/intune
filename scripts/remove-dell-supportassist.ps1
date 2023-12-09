Start-Transcript -Path $env:TEMP\remove-dell-supportassist.log
#using Out-Null to force wait for uninstall
try{
	#Tested on Dell SupportAssist 3.14.2.45116
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell SupportAssist')) {
	Write-Output 'Removing Dell SupportAssist Package'
	Uninstall-Package -ProviderName msi -Name 'Dell SupportAssist' | Out-Null
}
	Else {
	Write-Output 'Dell SupportAssist Package not present'
}
	#Tested on Dell SupportAssist Remediation
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell SupportAssist Remediation')) {
	Write-Output 'Removing Dell SupportAssist Remediation Package'
	Uninstall-Package -ProviderName msi -Name 'Dell SupportAssist Remediation' | Out-Null
}
	Else {
	Write-Output 'Dell SupportAssist Remediation Package not present'
}
	#Tested on DellInc.DellSupportAssistforPCs
	If ($null -ne (Get-AppxPackage -Name 'DellInc.DellSupportAssistforPCs' -AllUsers)) {
	Write-Output 'Removing DellInc.DellSupportAssistforPCs Appx Package'
	Get-AppxPackage -Name 'DellInc.DellSupportAssistforPCs' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.DellSupportAssistforPCs Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellSupportAssistforPCs'})) {
	Write-Output 'Removing DellInc.DellSupportAssistforPCs AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellSupportAssistforPCs'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.DellSupportAssistforPCs AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
