Param (
[string]$VMName
)
$vm = $VMName
$gpuPartition = Get-VMGpuPartitionAdapter -VMName $vm
Remove-VMGpuPartitionAdapter -VMName $vm -AdapterId $gpuPartition.id