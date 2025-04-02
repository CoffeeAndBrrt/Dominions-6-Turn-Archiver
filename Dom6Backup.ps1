# Dom6Backup.ps1 - Back up Dominions 6 games
# Author: Ted Hooker

# Define the folderPath variable.
# If for some reason one prefers a gamename can be provided here, instead of the shortcut method.
param (
    [string]$folderPath = "EA_Gio4"
)

# Check if folder exists
if (-Not (Test-Path -Path $folderPath)) {
    Write-Host "Folder ${folderPath} not found. (Did you forget to set a target in your shortcut?)"

    Read-Host -Prompt "Press Enter to exit"
    exit
}

# Get all *.2h files in the folder
$files = Get-ChildItem -Path $folderPath -Filter "*.2h"

foreach ($file in $files) {
    $stream = [System.IO.File]::OpenRead($file.FullName)
    $reader = New-Object System.IO.BinaryReader($stream)
    
    # Extract the turn number
    $reader.BaseStream.Seek(0x0E, [System.IO.SeekOrigin]::Begin) | Out-Null
    $byteValue = $reader.ReadByte()
    $reader.Close()
    
    $decimalValue = [int]$byteValue

    # Ensure the decimal value is at least 2 digits
    $decimalValueStr = "{0:D2}" -f $decimalValue
    break
}

# Create a new folder with the "Turn" prefix and the captured value
$newFolderName = "$($folderPath)-Turn$decimalValueStr"
if (-Not (Test-Path -Path $newFolderName)) {
    New-Item -Path $newFolderName -ItemType Directory}

# Copy all files from the original folder to the new folder
Copy-Item -Path "$folderPath\*" -Destination $newFolderName -Recurse

Write-Host "Turns copied into $newFolderName"

Read-Host -Prompt "Press Enter to exit"