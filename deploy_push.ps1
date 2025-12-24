<#
  deploy_push.ps1
  - Automates git init, remote setup and initial push to GitHub.
  - If GitHub CLI (`gh`) is available it will try to create the repo and push.
  - Usage: run PowerShell in the `amazon` folder and execute: .\deploy_push.ps1

  IMPORTANT: This script runs git commands and will attempt to push to the remote.
  You will be prompted to authenticate if required.
#>

param(
  [string]$GitHubUser = 'NurayShiraliyeva24',
  [string]$RepoName = 'amazon-clone-nurayShiraliyeva',
  [string]$RemoteUrl
)

if (-not $RemoteUrl) {
  $RemoteUrl = "https://github.com/$GitHubUser/$RepoName.git"
}

Write-Host "Running from: $(Get-Location)" -ForegroundColor Cyan

# Check for git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  Write-Error "git is not installed or not in PATH. Install Git first: https://git-scm.com/downloads"
  exit 1
}

# If gh exists, offer to use it
$useGh = $false
if (Get-Command gh -ErrorAction SilentlyContinue) {
  $ans = Read-Host "GitHub CLI (gh) is installed. Use it to create the repo if it doesn't exist? (Y/n)"
  if ($ans -eq '' -or $ans -match '^[Yy]') { $useGh = $true }
}

try {
  # Ensure we're in a git working folder
  if (-not (Test-Path .git)) {
    git init
    Write-Host "Initialized a new git repository." -ForegroundColor Green
  } else {
    Write-Host "Git repository already initialized." -ForegroundColor Yellow
  }

  # Status and remove existing origin if present
  $remotes = git remote
  if ($remotes -match 'origin') {
    Write-Host "Removing existing origin remote..." -ForegroundColor Yellow
    git remote remove origin
  }

  if ($useGh) {
    Write-Host "Attempting to create repo via GitHub CLI (gh)..." -ForegroundColor Cyan
    gh repo create $GitHubUser/$RepoName --public --source=. --remote=origin --push --confirm
    Write-Host "Created repo and pushed via gh." -ForegroundColor Green
    exit 0
  }

  # Add remote and push
  git add .
  try { git commit -m "Initial site" } catch { Write-Host "Nothing to commit or commit failed (continuing)" -ForegroundColor Yellow }
  git branch -M main
  git remote add origin $RemoteUrl

  Write-Host "Pushing to $RemoteUrl ..." -ForegroundColor Cyan
  git push -u origin main
  Write-Host "Push complete. If authentication was required you were prompted by git." -ForegroundColor Green
}
catch {
  Write-Error "An error occurred: $_"
  exit 1
}
