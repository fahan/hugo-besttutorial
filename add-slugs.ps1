# PowerShell script to add slug field to all markdown files
# This ensures Hugo generates correct permalinks matching WordPress structure

$contentPath = "content\posts"

# Get all markdown files recursively
$mdFiles = Get-ChildItem -Path $contentPath -Filter "*.md" -Recurse

Write-Host "Found $($mdFiles.Count) markdown files"
Write-Host "Adding slug field to front matter..."

$processedCount = 0

foreach ($file in $mdFiles) {
    # Get the filename without extension as the slug
    $slug = $file.BaseName
    
    # Read the file content
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if slug already exists
    if ($content -match "(?m)^slug:") {
        Write-Host "Skipping $($file.Name) - slug already exists"
        continue
    }
    
    # Find the front matter closing --- and add slug before it
    if ($content -match "(?s)^---\r?\n(.*?)\r?\n---") {
        $frontMatter = $matches[1]
        
        # Add slug field at the end of front matter
        $newFrontMatter = $frontMatter + "`nslug: `"$slug`""
        
        # Replace the old front matter with new one
        $newContent = $content -replace "(?s)^---\r?\n(.*?)\r?\n---", "---`n$newFrontMatter`n---"
        
        # Write back to file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        
        $processedCount++
        Write-Host "Processed: $($file.Name) -> slug: $slug"
    }
    else {
        Write-Host "Warning: No front matter found in $($file.Name)"
    }
}

Write-Host "`nCompleted! Processed $processedCount files."
Write-Host "Your posts will now use URLs like: https://besttutorial.net/post-slug/"
