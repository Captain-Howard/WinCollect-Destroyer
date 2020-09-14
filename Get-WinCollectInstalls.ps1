$ApplicationIdentifyingNumber = "{1E933549-2407-4A06-8EC5-83313513AE4B}"
$Servers2008 = Get-ADComputer -Filter { OperatingSystem -like '*Windows Server 2008*' }
$ServersNewer = Get-ADComputer -Filter { OperatingSystem -like '*Windows Server 201*' }
if (!(Test-Path C:\temp\WinCollect)) {
  New-Item -ItemType Directory -Name "WinCollect" -Path "C:\temp\"
}
foreach ($Server in $Servers2008) {
  if (Get-CimInstance win32_product -ComputerName $Server -ErrorAction SilentlyContinue | Where IdentifyingNumber -EQ $ApplicationIdentifyingNumber) {
    $Server.DNSHostName | Out-File "C:\temp\WinCollect\InstallFound-2008.txt" -Append
  }
  else {
    $Server.DNSHostName | Out-File "C:\temp\WinCollect\ConnectionFailed-2008.txt" -Append
  }
}
foreach ($Server in $ServersNewer) {
  if (Get-CimInstance win32_product -ComputerName $Server -ErrorAction SilentlyContinue | Where IdentifyingNumber -EQ $ApplicationIdentifyingNumber) {
    $Server.DNSHostName | Out-File "C:\temp\WinCollect\InstallFound-2012+.txt" -Append
  }
  else {
    $Server.DNSHostName | Out-File "C:\temp\WinCollect\ConnectionFailed-2012+.txt" -Append
  }
}
