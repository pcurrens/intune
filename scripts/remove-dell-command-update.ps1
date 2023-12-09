Start-Transcript -Path $env:TEMP\remove-dell-dommand-update.log
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
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
