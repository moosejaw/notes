#azure #virtual_network #private_dns_zone

Date of creation: 2024-03-25.

Runs in Azure PowerShell. 

Replace `<predicate>` with your search term.

```powershell
#!/usr/bin/env pwsh
$zones = Get-AzPrivateDnsZone

foreach ($zone in $zones) {
  if ($zone.Name -like "<predicate>")
  {
    Read-Host -Prompt "Will delete links from $($zone.Name)"

    $links = Get-AzPrivateDnsVirtualNetworkLink -ResourceGroupName HubCore_ResourceGroup -ZoneName $zone.Name

    foreach ($link in $links)
    {
      Remove-AzPrivateDnsVirtualNetworkLink -Name $link.Name -ZoneName $zone.Name -ResourceGroupName HubCore_ResourceGroup
    }
  }
}
```