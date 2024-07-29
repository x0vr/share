# ---------------------------------------------------------------------------- #
#                                  DESCRIPTION                                 #
# This script is about adding the filename of a JPEG as metadata tag (IPTC)    #
# ---------------------------------------------------------------------------- #


# ---------------------------------------------------------------------------- #
#                                  CONFIG HERE                                 #
# ---------------------------------------------------------------------------- #
# Define the folder path to JPGs
$folderPath = "E:\Bilder\tmp"

# Define the path to the ExifTool executable
$exifToolPath = "C:\Exiftool\exiftool.exe"

# ---------------------------------------------------------------------------- #
#                           INTERNAL - do not touch!                           #
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
