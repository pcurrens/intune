Start-Transcript -Path $env:TEMP\remove-teams-personal.log
#using Out-Null to force wait for uninstall
try{
	If ($null -ne (Get-AppxPackage -Name 'MicrosoftTeams' -AllUsers)) {
	Write-Output "Removing MicrosoftTeams Appx Package"
	Get-AppxPackage -Name 'MicrosoftTeams' -AllUsers | Remove-AppPackage -AllUsers | Out-Null
}
	Else {
	Write-Output "MicrosoftTeams Appx Package not present"
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftTeams'})) {
	Write-Output "Removing MicrosoftTeams AppxProvisioned Package"
 	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MicrosoftTeams'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output "MicrosoftTeams AppxProvisioned Package not present"
}
	If ($null -ne (Get-AppxPackage -Name 'MSTeams' -AllUsers)) {
	Write-Output "Removing MSTeams Appx Package"
	Get-AppxPackage -Name 'MSTeams' -AllUsers | Remove-AppPackage -AllUsers | Out-Null
}
	Else{
	Write-Output "MSTeams AppxPackage not present"
}
	If ($null -ne (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MSTeams'})) {
	Write-Output "Removing MSTeams AppxProvisioned Package"
	Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'MSTeams'} | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null
}
	Else{
	Write-Output "MSTeams AppxProvisioned Package not present"
}
}
catch{
	$errMsg = $_.Exception.Message
	write-error $errMsg
}
Stop-Transcript

<#
##stop the process so it can be removed
    Try {
        Write-Output “Removing Microsoft Teams Personal App”
        If (Get-Process msteams -ErrorAction SilentlyContinue) {
            Try {
                Write-Output “Stopping Microsoft Teams Personal app process”
                Stop-Process msteams -Force
                Write-Output “Stopped”
            }
            catch {
                Write-Output “Unable to stop process, trying to remove anyway”
            }
	    }
	    
##stop it from coming back - doesn't work because system doesn't have permissions on the reg key
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath ConfigureChatAutoInstall -Value 0

##unpin it
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Chat"
If (!(Test-Path $registryPath)) { 
    New-Item $registryPath
}
Set-ItemProperty $registryPath "ChatIcon" -Value 2
#>
