# ---------------------------------------------------------------------------- #
#                                  DESCRIPTION                                 #
# This script is about adding the filename of a JPEG as metadata tag (IPTC).   #
# ---------------------------------------------------------------------------- #
#                                  CONFIG HERE                                 #
# ---------------------------------------------------------------------------- #
# Define the folder path to JPGs
$folderPath = "E:\Bilder\tmp"

# Define the path to the ExifTool executable
$exifToolPath = "C:\Exiftool\exiftool.exe"

# ---------------------------------------------------------------------------- #
#                                 INSTRUCTIONS                                 #
#                                                                              #
# 1. Install ExifTool:                                                         #
#   - Download ExifTool from the ExifTool website (https://exiftool.org/)      #
#   - Extract or install it to a directory, e.g. C:\ExifTool\                  #
#                                                                              #
# 2. Save the Script:                                                          #
#   - Copy this PowerShell script to your local harddisk                       #
#                                                                              #
# 3. Set up Paths                                                              #
#   - Set variable $folderPath to the path of your JPG files                   #
#   - Ensure that variable $exifToolPath is set to path of Step 1.             #
#                                                                              #
# 3. Run the Script:                                                           #
#   - Open PowerShell ( you can use Win + X )                                  #
#   - Navigate to the directory where you saved the script                     #
#   - Execute the script by typing: .\filenameToKeyword.ps1                    #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
#                     INTERNAL - do not touch lines below!                     #
# ---------------------------------------------------------------------------- #
# Get all JPG files in the folder
$jpgFiles = Get-ChildItem -Path $folderPath -Include *.jpg,*.jpeg,*.JPG,*.JPEG -Recurse -File

# Loop through each JPG file
foreach ($file in $jpgFiles) {
    # Set the filename as keyword using ExifTool
    & "$exifToolPath" $file.FullName -overwrite_original -Keywords+="$file"

}

# Output a message indicating completion
Write-Host "Metadata tags updated for all JPG files in $folderPath"
