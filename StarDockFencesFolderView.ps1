# Function to add registry values
function Add-RegistryValues($folderPath) {
    $registryPath = "HKCU:\Software\Stardock\Fences\ViewStates"
    $valueName1 = $folderPath
    $valueName2 = "$folderPath|ViewMode"
    $valueData1 = 3
    $valueData2 = 4

    # Add the first registry value
    Set-ItemProperty -Path $registryPath -Name $valueName1 -Value $valueData1 -Type DWORD

    # Add the second registry value
    Set-ItemProperty -Path $registryPath -Name $valueName2 -Value $valueData2 -Type DWORD
}

# Function to process each folder
function Process-Folder($folderPath) {
    # Add registry values
    Add-RegistryValues $folderPath
    Write-Host "Processed folder: $folderPath"
}

# Recursive function to loop through folders and subfolders
function Process-SubFolders($currentPath, $totalFolders) {
    # Process the current folder
    Process-Folder $currentPath

    # Increment the folder index and update progress
    $global:folderIndex++
    $percentComplete = ($global:folderIndex / $totalFolders) * 100
    Write-Progress -Activity "Processing Folders" -Status "$($global:folderIndex) of $totalFolders processed" -PercentComplete $percentComplete

    # Loop through each subfolder and recursively process it
    $subfolders = Get-ChildItem -Path $currentPath -Directory
    foreach ($subfolder in $subfolders) {
        Process-SubFolders $subfolder.FullName $totalFolders
    }
}

$rootPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get all subfolders including the root folder in the count
$subfolders = Get-ChildItem -Recurse -Path $rootPath -Directory
$folderCount = $subfolders.Count + 1 # Including root folder

# Write the folder count to the console
Write-Host "Total folders: $folderCount"
    
# Initialize folder index
$global:folderIndex = 0

# Start processing from the root folder
Process-SubFolders $rootPath $folderCount

Write-Progress -Activity "Processing Folders" -Status "Completed" -Completed
write-host "Done!"