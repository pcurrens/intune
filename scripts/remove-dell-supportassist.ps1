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
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
