# Deploy DocFX to Azure Static Web Apps
# Run this script from the root directory

Write-Host "Building DocFX site..." -ForegroundColor Green

# Navigate to DocFX directory
Set-Location DocFX

# Build the site
docfx docfx.json

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful! Site generated in _site folder." -ForegroundColor Green
    Write-Host ""
    Write-Host "To deploy to Azure Static Web Apps:" -ForegroundColor Yellow
    Write-Host "1. Push this code to your GitHub repository" -ForegroundColor White
    Write-Host "2. Create an Azure Static Web App connected to your GitHub repo" -ForegroundColor White
    Write-Host "3. Set the app location to 'DocFX/_site' in the deployment settings" -ForegroundColor White
    Write-Host ""
    Write-Host "The GitHub Action will automatically deploy on push to main branch." -ForegroundColor Green
} else {
    Write-Host "Build failed! Check the errors above." -ForegroundColor Red
}

# Return to original directory
Set-Location ..
