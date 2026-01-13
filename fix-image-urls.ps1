# PowerShell script to fix image URLs in markdown files
# Converts WordPress image URLs to Hugo-relative paths

$contentPath = "content\posts"

# Get all markdown files recursively
$mdFiles = Get-ChildItem -Path $contentPath -Filter "*.md" -Recurse

Write-Host "Found $($mdFiles.Count) markdown files"
Write-Host "Fixing image URLs..."

$processedCount = 0
$imageCount = 0

foreach ($file in $mdFiles) {
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    
    # Pattern to match WordPress image URLs
    # Matches: https://besttutorial.net/wp-content/uploads/YYYY/MM/filename.ext
    # Also matches: http://besttutorial.net/wp-content/uploads/YYYY/MM/filename.ext
    $pattern = 'https?://[^/]+/wp-content/uploads/\d{4}/\d{2}/([^)\s"]+)'
    
    # Replace with Hugo-relative path: /images/filename.ext
    $newContent = $content -replace $pattern, '/images/$1'
    
    # Count how many replacements were made
    $matches = [regex]::Matches($content, $pattern)
    if ($matches.Count -gt 0) {
        $imageCount += $matches.Count
        
        # Write back to file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        
        $processedCount++
        Write-Host "Fixed $($matches.Count) images in: $($file.Name)"
    }
}

Write-Host "`nCompleted!"
Write-Host "Processed $processedCount files"
Write-Host "Fixed $imageCount image URLs"
Write-Host "`nImages now use relative paths like: /images/filename.jpg"
