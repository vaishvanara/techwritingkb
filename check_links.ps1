$docsRoot = "docs"
$brokenCount = 0
$files = Get-ChildItem -Path $docsRoot -Filter *.md -Recurse

Write-Host "--- Zensical Manual Link Validator ---" -ForegroundColor Cyan

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw # -Raw ensures it handles empty files better
    
    # Skip processing if the file is empty or null
    if ([string]::IsNullOrWhiteSpace($content)) {
        continue
    }

    $currentDir = $file.DirectoryName
    
    # Regex to find [text](path)
    $links = [regex]::Matches($content, '\[.*?\]\(((?!http|https|mailto|tel|#).*?)\)')

    foreach ($link in $links) {
        $rawPath = $link.Groups[1].Value
        $cleanPath = $rawPath.Split('#')[0]
        
        if ([string]::IsNullOrWhiteSpace($cleanPath)) { continue }

        if ($cleanPath.StartsWith("/")) {
            Write-Host "ILLEGAL ABSOLUTE LINK in [$($file.Name)]" -ForegroundColor Magenta
            Write-Host "   -> Path: $rawPath"
            $brokenCount++
            continue
        }

        try {
            $combinedPath = Join-Path $currentDir $cleanPath
            $targetPath = [System.IO.Path]::GetFullPath($combinedPath)

            if (-not (Test-Path $targetPath)) {
                Write-Host "BROKEN LINK in [$($file.Name)]" -ForegroundColor Red
                Write-Host "   -> File Not Found: $rawPath" -ForegroundColor Yellow
                $brokenCount++
            }
        } catch {
            Write-Host "INVALID PATH FORMAT in [$($file.Name)]: $rawPath" -ForegroundColor Red
            $brokenCount++
        }
    }
}

Write-Host "`n--- Scan Complete ---" -ForegroundColor Cyan
if ($brokenCount -eq 0) {
    Write-Host "Success: All internal links are valid relative paths!" -ForegroundColor Green
} else {
    Write-Host "Failure: Found $brokenCount link issues." -ForegroundColor Red
    exit 1
}