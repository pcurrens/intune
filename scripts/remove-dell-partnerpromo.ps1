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
