# PowerShell script to replace IP address links with domain

$contentPath = "c:\Users\hanss\Documents\BT\hugo-besttutorial\content\posts"
$oldDomain = "https://besttutorial.net/"
$newDomain = "https://besttutorial.net/"

# Get all markdown files
$files = Get-ChildItem -Path $contentPath -Filter "*.md" -Recurse

$filesChanged = 0
$totalReplacements = 0

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    if ($content -match [regex]::Escape($oldDomain)) {
        $newContent = $content -replace [regex]::Escape($oldDomain), $newDomain
        
        # Count replacements in this file
        $matches = ([regex]::Matches($content, [regex]::Escape($oldDomain))).Count
        $totalReplacements += $matches
        $filesChanged++
        
        # Write the updated content back
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
        
        Write-Host "Fixed $matches link(s) in: $($file.Name)" -ForegroundColor Green
    }
}

Write-Host "`nSummary:" -ForegroundColor Cyan
Write-Host "Files changed: $filesChanged" -ForegroundColor Yellow
Write-Host "Total replacements: $totalReplacements" -ForegroundColor Yellow
Write-Host "`nAll IP address links have been replaced with https://besttutorial.net/" -ForegroundColor Green
