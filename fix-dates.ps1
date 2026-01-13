# PowerShell script to fix date format in all markdown files
# Converts dates from "2018-09-30" to "2018-09-30T00:00:00+07:00"

$contentPath = "content\posts"

# Get all markdown files recursively
$mdFiles = Get-ChildItem -Path $contentPath -Filter "*.md" -Recurse

Write-Host "Found $($mdFiles.Count) markdown files"
Write-Host "Fixing date formats..."

$processedCount = 0

foreach ($file in $mdFiles) {
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if date needs fixing (matches YYYY-MM-DD without time)
    if ($content -match "(?m)^date:\s*(\d{4}-\d{2}-\d{2})\s*$") {
        $dateOnly = $matches[1]
        $newDate = "${dateOnly}T00:00:00+07:00"
        
        # Replace the date line
        $newContent = $content -replace "(?m)^date:\s*\d{4}-\d{2}-\d{2}\s*$", "date: $newDate"
        
        # Write back to file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        
        $processedCount++
        Write-Host "Fixed: $($file.Name) -> date: $newDate"
    }
}

Write-Host "`nCompleted! Fixed $processedCount files."
