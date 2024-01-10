# Specify the input and output folders
$inputFolder = "C:\Users\javie\OneDrive\Documents\programacion\apbs-analysis\data\interim\pdb"
$outputFolder = "C:\Users\javie\OneDrive\Documents\programacion\apbs-analysis\data\interim\pqr"

# Get all PDB files in the input folder
$pdbFiles = Get-ChildItem -Path $inputFolder -Filter *.pdb

# Loop through each PDB file
foreach ($pdbFile in $pdbFiles) {
    # Construct the output PQR file path
    $pqrFile = Join-Path $outputFolder "$($pdbFile.BaseName).pqr"

    # Execute the pdb2pqr command
    & pdb2pqr -ff=AMBER $pdbFile.FullName $pqrFile

    # Print a message indicating the completion of the conversion
    Write-Host "Conversion complete for $($pdbFile.FullName)"
}