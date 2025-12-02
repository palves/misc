# SPDX-License-Identifier: GPL-3.0-or-later
# Author  : Pedro Alves (pedro@palves.net)

# Define valid short and long options.
$longOptionsMap = @{
    "--kill" = "k"
    "--help" = "h"
    "--loop" = "l"
    "--name" = "n"
    "--age" = "a"
}

$k = $false
$h = $false
$l = $false
$n = "gdb"
$a = 600

# Manually parse command-line arguments.
for ($i = 0; $i -lt $args.Count; $i++) {
    $arg = $args[$i]

    if ($longOptionsMap.ContainsKey($arg)) {
        Set-Variable -Name $longOptionsMap[$arg] -Value $true -Scope Script
    }
    elseif ($arg -match "^-([khl])$") {  # Match short options: -k, -h, -l
        Set-Variable -Name $matches[1] -Value $true -Scope Script
    }
    elseif ($arg -match "^-n$") {  # Match "-n <name>"
        if ($i + 1 -ge $args.Count) { Write-Host "Error: -n requires a value." -ForegroundColor Red; exit 1 }
        $n = $args[++$i]
    }
    elseif ($arg -match "^-a$") {  # Match "-a <age>"
        if ($i + 1 -ge $args.Count) { Write-Host "Error: -a requires a value." -ForegroundColor Red; exit 1 }
        if ($args[$i + 1] -match "^\d+$") { $a = [int]$args[++$i] }
        else { Write-Host "Error: -a requires a numeric value." -ForegroundColor Red; exit 1 }
    }
    elseif ($arg -match "^--") {  # Handle invalid --long-options
        Write-Host "Error: Unrecognized option '$arg'" -ForegroundColor Red
        Write-Host "Use '--help' to see valid options."
        exit 1
    }
    else {
        Write-Host "Error: Unrecognized argument '$arg'" -ForegroundColor Red
        Write-Host "Use '--help' to see valid options."
        exit 1
    }
}

Write-Host "Kill mode: $k"
Write-Host "Loop mode: $l"
Write-Host "Process Name: $n"
Write-Host "Process Age: $a"

if ($h) {
    Write-Host "Usage: $PSCommandPath [-k|--kill] [-h|--help] [-l|--loop] [-n <process_name>] [-a <seconds>]"
    Write-Host "  -k, --kill   Kill the processes instead of just listing them"
    Write-Host "  -h, --help   Display this help message"
    Write-Host "  -l, --loop   Loop indefinitely, checking every 5 minutes"
    Write-Host "  -n, --name   Specify the process name to check (default: gdb)"
    Write-Host "  -a, --age    Specify the age in seconds for a process to be considered long-running (default: 600)"
    exit
}

# Check and process long-running processes.
function Check-Processes {
    param([int]$age = 600)

    $longRunningProcesses = @()
    $now = Get-Date

    Get-Process -Name $n -ErrorAction SilentlyContinue | ForEach-Object {
        $process = $_
        $startTime = $process.StartTime
        $timeRunning = $now - $startTime

        if ($timeRunning.TotalSeconds -gt $age) {
            $longRunningProcesses += $process
        }
    }

    if ($longRunningProcesses.Count -eq 0) {
        Write-Host "No $n processes have been running for longer than $age seconds."
    }
    else {
        Write-Host "$n processes running longer than $age seconds:"
        foreach ($process in $longRunningProcesses) {
            Write-Host "Process ID: $($process.Id)"
            Write-Host "Process Name: $($process.ProcessName)"
            Write-Host "Start Time: $($process.StartTime)"
            Write-Host "Running Time: $(($now - $process.StartTime).ToString())"
            Write-Host "-------------------"
        }
    }

    # Kill processes if -k was set.
    if ($k -and $longRunningProcesses.Count -gt 0) {
        Write-Host "Attempting to kill the processes..."
        foreach ($process in $longRunningProcesses) {
            try {
                Stop-Process -Id $process.Id -Force -ErrorAction Stop
                Write-Host "Process $($process.Id) has been stopped."
            }
            catch {
                Write-Host "Error stopping process $($process.Id): $($_.Exception.Message)"
            }
        }
    }
}

if ($l) {
    Write-Host "Entering loop mode.  Checking every 5 minutes for $n processes older than $a seconds..."
    while ($true) {
        Check-Processes -age $a
        Write-Host "Next check in 5 minutes..."
        Start-Sleep -Seconds 300
    }
}
else {
    Check-Processes -age $a
}
