#Requires -RunAsAdministrator

$sourcedir = $PWD

# Use $env:USERPROFILE instead of $HOME for Windows consistency
$vimrc = Join-Path $env:USERPROFILE "_vimrc"
$vimfiles = Join-Path $env:USERPROFILE "vimfiles"
$vimdir = Join-Path $env:USERPROFILE "vime"
$backupdir = Join-Path $env:USERPROFILE "vim_backup"

Clear-Host
Get-Content (Join-Path $sourcedir "vime.txt")

Write-Host -ForegroundColor Green "Installing vime........"

Write-Host -ForegroundColor Green "1. Creating backup for current vim configuration..."
if (Test-Path $backupdir) {
    Remove-Item $backupdir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $backupdir | Out-Null

# Backup existing _vimrc if it exists
if (Test-Path $vimrc) {
    Copy-Item $vimrc (Join-Path $backupdir "_vimrc.bak") -Force
}

# Backup existing vime directory if it exists
if (Test-Path $vimdir) {
    Copy-Item $vimdir (Join-Path $backupdir "vimdir") -Recurse -Force
    Remove-Item $vimdir -Recurse -Force
}

$backup_name = "vimbackup_$(Get-Date -Format "yyyyMMdd-HHmmss").zip"
Write-Host "  --> Compressing backup files into $backup_name ..."
Compress-Archive -Path $backupdir -DestinationPath (Join-Path $env:USERPROFILE $backup_name) -Force
Remove-Item $backupdir -Recurse -Force

Write-Host -ForegroundColor Green "2. Creating vime directory structure..."
New-Item -ItemType Directory -Force -Path $vimdir | Out-Null
New-Item -Path (Join-Path $vimdir "rc") -ItemType Junction -Value (Join-Path $sourcedir "rc") | Out-Null
New-Item -Path (Join-Path $vimdir "vimrc") -ItemType SymbolicLink -Value (Join-Path $sourcedir "vimrc") -Force | Out-Null

# Create/update _vimrc to source our vimrc
"source $vimdir\vimrc" | Out-File -FilePath $vimrc -Encoding utf8 -Force

Write-Host -ForegroundColor Green "3. Installing Vim-Plug..."
# Create autoload directory if it doesn't exist
$autoloadDir = Join-Path $vimfiles "autoload"
if (-not (Test-Path $autoloadDir)) {
    New-Item -ItemType Directory -Force -Path $autoloadDir | Out-Null
}

# Download vim-plug
$plugVim = Join-Path $autoloadDir "plug.vim"
try {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" -OutFile $plugVim -UseBasicParsing
} catch {
    Write-Host -ForegroundColor Red "Failed to download vim-plug: $_"
    exit 1
}

Write-Host -ForegroundColor Green "4. Installing plugins using Vim-Plug..."
try {
    $vimrcUpdate = Join-Path $sourcedir "pre/vimrc-update.vim"
    $vimeTxt = Join-Path $sourcedir "vime.txt"
    Invoke-Expression "vim -u `"$vimrcUpdate`" +mapclear +PlugInstall! +PlugClean! +qall! `"$vimeTxt`""
} catch {
    Write-Host -ForegroundColor Red "Error during plugin installation: $_"
    Write-Host -ForegroundColor Yellow "You may need to run vim manually to complete plugin installation."
}

Write-Host -ForegroundColor Green "vime has been successfully installed. Let's vimming!"