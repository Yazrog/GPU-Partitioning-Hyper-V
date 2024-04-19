Param (
[string]$VMName
)

$vm = $VMName
Add-VMGpuPartitionAdapter -VMName $vm
if (Get-VMGpuPartitionAdapter -VMName $vm -ErrorAction SilentlyContinue) {
   Remove-VMGpuPartitionAdapter -VMName $vm
}
Set-VM -GuestControlledCacheTypes $true -VMName $vm
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $vm
Set-VM -HighMemoryMappedIoSpace 32Gb -VMName $vm
Add-VMGpuPartitionAdapter -VMName $vm