Start-Transcript -Path $env:TEMP\remove-dell-optimizer.log
#using Out-Null to force wait for uninstall
try{
	#Tested on Dell Optimizer Service 1.0.554.0, 2.0.651.0, 3.2.212.0 (has to run twice for 1.0.554.0 because it doesn't wait)
 	If ($null -ne (Get-Package -ProviderName Programs -Name 'Dell Optimizer Service')) {
	Write-Output 'Removing Dell Optimizer Service'
	&'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe' -remove -runfromtemp -silent | Out-Null
}
	Else{
	Write-Output "Dell Optimizer Service not present"
}
	#Tested on Dell Optimizer Core 4.1.351.0, 4.0.310.0
 	If ($null -ne (Get-Package -ProviderName Programs -Name 'Dell Optimizer Core')) {
	Write-Output 'Removing Dell Optimizer Core'
	&'C:\Program Files (x86)\InstallShield Installation Information\{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}\DellOptimizer.exe' -remove -runfromtemp -silent | Out-Null
}
	Else{
	Write-Output "Dell Optimizer Core not present"
}
	#Tested on Dell Core Services 1.0.248.0, 1.3.371.1
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Core Services')) {
	Write-Output 'Removing Dell Core Services Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Core Services' | Out-Null
}
	Else {
	Write-Output 'Dell Core Services Package not present'
}
	#Tested on Dell Optimizer 1.0.554.0, 2.0.651.0, 3.2.212.0, 4.1.351.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'Dell Optimizer')) {
	Write-Output 'Removing Dell Optimizer Package'
	Uninstall-Package -ProviderName msi -Name 'Dell Optimizer' | Out-Null
}
	Else {
	Write-Output 'Dell Optimizer Package not present'
}
	#Tested on DellOptimizerUI 1.0.554.0, 2.0.651.0, 3.2.212.0, 4.0.310.0, 4.1.351.0
	If ($null -ne (Get-Package -ProviderName msi -Name 'DellOptimizerUI')) {
	Write-Output 'Removing DellOptimizerUI Package'
	Uninstall-Package -ProviderName msi -Name 'DellOptimizerUI' | Out-Null
}
	Else {
	Write-Output 'DellOptimizerUI Package not present'
}
	#Tested on Dell Display Manager 2.0.0.137, 2.0.0.139
	If ($null -ne (Get-Package -ProviderName Programs -Name 'Dell Display Manager 2.0')) {
	Write-Output "Removing Dell Display Manager 2.0 Package"
	&'C:\Program Files\Dell\Dell Display Manager 2.0\uninst.exe' /S | Out-Null
}
	Else{
	Write-Output 'Dell Display Manager 2.0 not present'
}
	#Tested on Dell Display Manager 2.1.1.37
	If ($null -ne (Get-Package -ProviderName Programs -Name 'Dell Display Manager 2.1')) {
	Write-Output "Removing Dell Display Manager 2 Package"
	&'C:\Program Files\Dell\Dell Display Manager 2\uninst.exe' /S | Out-Null
}
	Else{
	Write-Output 'Dell Display Manager 2 not present'
}
	#Tested on Dell Peripheral Manager 1.6.1, 1.6.5, 1.6.7
	If ($null -ne (Get-Package -ProviderName Programs -Name 'Dell Peripheral Manager')) {
	Write-Output "Removing Dell Peripheral Manager Package"
	&'C:\Program Files\Dell\Dell Peripheral Manager\Uninstall.exe' /S | Out-Null
}
	Else{
	Write-Output 'Dell Peripheral Manager not present'
}
	#Tested on ExpressConnect Drivers & Services 4.1023.208
	If ($null -ne (Get-Package -ProviderName msi -Name 'ExpressConnect Drivers & Services')) {
	Write-Output "Removing ExpressConnect Drivers & Services Package"
	Uninstall-Package -ProviderName msi -Name 'ExpressConnect Drivers & Services' | Out-Null
}
	Else{
	Write-Output 'ExpressConnect Drivers & Services not present'
}
	If ($null -ne (Get-AppxPackage -Name 'DellInc.DellOptimizer' -AllUsers)) {
	Write-Output 'Removing DellInc.DellOptimizer Appx Package'
	Get-AppxPackage -Name 'DellInc.DellOptimizer' -AllUsers | Remove-AppxPackage -AllUsers | Out-Null
}
	Else {
	Write-Output 'DellInc.DellOptimizer Appx Package not present'
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellOptimizer'})) {
	Write-Output 'Removing DellInc.DellOptimizer AppxProvisioned Package'
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'DellInc.DellOptimizer'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output 'DellInc.DellOptimizer AppxProvisioned Package not present'
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript
