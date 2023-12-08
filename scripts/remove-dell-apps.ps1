Start-Transcript -Path $env:TEMP\remove-dell-apps.log
try{
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Core Services')) {
	Write-Output 'Removing Dell Core Services Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Core Services'
}
	Else {
	Write-Output 'Dell Core Services Package not present'
}
	#Tested on Dell Optimizer Core 4.1.351.0,4.0.310.0 and Dell Optimizer Service
	If (Test-Path 'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe'){
	Write-Output 'Removing Dell Optimizer Core/Dell Optimizer Service'
	&'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe' -remove -runfromtemp -silent
}
	Else{
	Write-Output "Dell Optimizer Core/Service not present"
}
	If (Test-Path 'C:\Program Files\Dell\Dell Display Manager 2.0\uninst.exe') {
	Write-Output "Removing MSTeams AppxPackage"
	&'C:\Program Files\Dell\Dell Display Manager 2.0\uninst.exe' /S
}
	Else{
	Write-Output 'Dell Display Manager 2.0 not present'
}
	If (Test-Path 'C:\Program Files\Dell\Dell Display Manager 2\uninst.exe') {
	Write-Output "Removing MSTeams AppxPackage"
	&'C:\Program Files\Dell\Dell Display Manager 2\uninst.exe' /S
}
	Else{
	Write-Output 'Dell Display Manager 2 not present'
}
	If (Test-Path 'C:\Program Files\Dell\Dell Peripheral Manager\Uninstall.exe') {
	Write-Output "Removing MSTeams AppxPackage"
	&'C:\Program Files\Dell\Dell Peripheral Manager\Uninstall.exe' /S
}
	Else{
	Write-Output 'Dell Peripheral Manager not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
