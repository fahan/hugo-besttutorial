# PowerShell script to copy images from content to static directory
# This makes images accessible in the built site

$contentPath = "content\posts"
$staticPath = "static"

# Create static directory if it doesn't exist
if (-not (Test-Path $staticPath)) {
    New-Item -ItemType Directory -Path $staticPath | Out-Null
}

Write-Host "Copying images from content to static directory..."

# Find all 'images' directories in content/posts
$imageDirs = Get-ChildItem -Path $contentPath -Directory -Recurse -Filter "images"

$totalFiles = 0
$copiedDirs = 0

foreach ($imageDir in $imageDirs) {
    # Get the relative path from content/posts (e.g., 2018/09)
    $relativePath = $imageDir.Parent.FullName.Replace((Get-Item $contentPath).FullName, "").TrimStart("\")
    
    # Create destination path in static (e.g., static/2018/09/images)
    $destPath = Join-Path $staticPath $relativePath "images"
    
    # Create destination directory if it doesn't exist
    if (-not (Test-Path $destPath)) {
        New-Item -ItemType Directory -Path $destPath -Force | Out-Null
    }
    
    # Copy all files from source to destination
    $files = Get-ChildItem -Path $imageDir.FullName -File
    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination $destPath -Force
    }
    
    $totalFiles += $files.Count
    $copiedDirs++
    Write-Host "Copied $($files.Count) images from: $relativePath"
}

Write-Host "`nCompleted!"
Write-Host "Copied $totalFiles images from $copiedDirs directories"
Write-Host "Images are now in static directory and will be available in public folder after build"
