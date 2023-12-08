Start-Transcript -Path $env:TEMP\remove-dell-apps.log
try{
	#Tested on Dell Optimizer Core 4.1.351.0, 4.0.310.0 and Dell Optimizer Service 1.0.554.0, 2.0.651.0, 3.2.212.0
	If (Test-Path 'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe'){
	Write-Output 'Removing Dell Optimizer Core/Dell Optimizer Service'
	&'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe' -remove -runfromtemp -silent
}
	Else{
	Write-Output "Dell Optimizer Core/Service not present"
}
	#Tested on Dell Core Services 1.0.248.0, 1.3.371.1
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Core Services')) {
	Write-Output 'Removing Dell Core Services Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Core Services'
}
	Else {
	Write-Output 'Dell Core Services Package not present'
}
	#Tested on Dell Optimizer 1.0.554.0, 2.0.651.0, 3.2.212.0, 4.1.351.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Optimizer')) {
	Write-Output 'Removing Dell Optimizer Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Optimizer'
}
	Else {
	Write-Output 'Dell Optimizer Package not present'
}
	#Tested on DellOptimizerUI 1.0.554.0, 2.0.651.0, 3.2.212.0, 4.0.310.0, 4.1.351.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'DellOptimizerUI')) {
	Write-Output 'Removing DellOptimizerUI Package'
	Uninstall-Package -ProviderName msi -Name 'DellOptimizerUI'
}
	Else {
	Write-Output 'DellOptimizerUI Package not present'
}
	#Tested on Dell Display Manager 2.0.0.137, 2.0.0.139
	If (Test-Path 'C:\Program Files\Dell\Dell Display Manager 2.0\uninst.exe') {
	Write-Output "Removing Dell Display Manager 2.0 AppxPackage"
	&'C:\Program Files\Dell\Dell Display Manager 2.0\uninst.exe' /S
}
	Else{
	Write-Output 'Dell Display Manager 2.0 not present'
}
	#Tested on Dell Display Manager 2.1.1.37
	If (Test-Path 'C:\Program Files\Dell\Dell Display Manager 2\uninst.exe') {
	Write-Output "Removing Dell Display Manager 2 AppxPackage"
	&'C:\Program Files\Dell\Dell Display Manager 2\uninst.exe' /S
}
	Else{
	Write-Output 'Dell Display Manager 2 not present'
}
	#Tested on Dell Peripheral Manager 1.6.1, 1.6.5, 1.6.7
	If (Test-Path 'C:\Program Files\Dell\Dell Peripheral Manager\Uninstall.exe') {
	Write-Output "Removing Dell Peripheral Manager AppxPackage"
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
