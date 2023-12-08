Start-Transcript -Path $env:TEMP\MSTeamsPersonalRemove.log
try{
	If ($null -ne (Get-AppxPackage -Name MicrosoftTeams -AllUsers)) {
	Write-Output "Removing MicrosoftTeams AppxPackage"
	Get-AppxPackage -Name MicrosoftTeams -AllUsers | Remove-AppPackage -AllUsers
}
	Else {
	Write-Output "MicrosoftTeams AppxPackage not present"
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftTeams'})) {
	Write-Output "Removing MicrosoftTeams AppxProvisionedPackage"
	Remove-AppxProvisionedPackage -online -Packagename MicrosoftTeams -AllUsers
}
	Else{
	Write-Output "MicrosoftTeams AppxProvisioned Package not present"
}
	If ($null -ne (Get-AppxPackage -Name MSTeams -AllUsers)) {
	Write-Output "Removing MSTeams AppxPackage"
	Get-AppxPackage -Name MSTeams -AllUsers | Remove-AppPackage -AllUsers
}
	Else{
	Write-Output "MSTeams AppxPackage not present"
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MSTeams'})) {
	Write-Output "Removing MSTeams AppxProvisionedPackage"
	Remove-AppxProvisionedPackage -online -Packagename MSTeams -AllUsers
}
	Else{
	Write-Output "MSTeams AppxProvisionedPackage not present"
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
