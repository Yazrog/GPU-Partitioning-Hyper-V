Param (
[string]$VMName
)

$vm = $VMName
Add-VMGpuPartitionAdapter -VMName $vm
if (Get-VMGpuPartitionAdapter -VMName $vm -ErrorAction SilentlyContinue) {
    Remove-VMGpuPartitionAdapter -VMName $vm
}
Set-VM -GuestControlledCacheTypes $true -VMName $VMName
Set-VM -LowMemoryMappedIoSpace 1Gb -VMName $VMName
Set-VM -HighMemoryMappedIoSpace 32Gb -VMName $VMName
Add-VMGpuPartitionAdapter -VMName $VMName