$NewerHosts = Get-Item "C:\temp\WinCollect\InstallFound-2012+.txt"
$OlderHosts = Get-Item "C:\temp\WinCollect\InstallFound-2008.txt"

Invoke-Command -ComputerName $NewerHosts.toString() -ScriptBlock {Start-Process "msiexec.exe" -ArgumentList "/x{1E933549-2407-4A06-8EC5-83313513AE4B} REMOVE_ALL_FILES=True /qn"}
Invoke-Command -ComputerName $NewerHosts.toString() -ScriptBlock {Start-Process "msiexec.exe" -ArgumentList "/x{D50A23B4-FD0D-472D-80B7-2E6332AE2E92} /qn"}
