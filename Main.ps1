Param (
[string]$VMName
)

Write-Host -ForegroundColor Red -BackgroundColor Black "`nGPU partitioning wizzard`n"
$confirmation = Read-Host "What do you want:
1: Check compatibility,
2: Start GPU partitioning,
3: Restore GPU partitioning,
0: exit"

if ($confirmation -eq '1') {
    & ./Compatible_PCI_Hardware.ps1 -VMName $VMName
}

if ($confirmation -eq '2') {
    & ./GPU-Patitioning.ps1 -VMName $VMName
    Write-Host -ForegroundColor Green -BackgroundColor Black "GPU partitioning OK..."
    Write-Host -ForegroundColor Green -BackgroundColor Black "Start driver moving to:" $VMName
    & ./Update-VMGpuPartitionDriver.ps1 -VMName $VMName -GPUName "AUTO"
}

if ($confirmation -eq '3') {
    try {
    & ./Restore-GPU-ressource.ps1 -VMName $VMName
    Write-Host -ForegroundColor Green -BackgroundColor Black "GPU ressource restore to host..."
    } catch { Write-Host -ForegroundColor Red -BackgroundColor Black "Error occurred: $_"}
}

if ($confirmation -eq '0') { exit }