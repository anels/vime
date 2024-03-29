#Requires -RunAsAdministrator

$vimedir = $PWD

$vimrc = "$HOME\_vimrc"
$vimdir = "$HOME\vime"
$backupdir = "$HOME\vim_backup"

Clear-Host
Get-Content $vimedir\vime.txt

Write-Host -ForegroundColor Green "Installing vime........"

Write-Host -ForegroundColor Green "1. Creating backup for current vim configuration..."
New-Item -ItemType Directory -Force -Path $backupdir | Out-Null

If (Test-Path $vimdir) {
    Copy-Item $vimdir $backupdir\vimdir -Recurse -Force | Out-Null
    Remove-Item $vimdir -Recurse -Force | Out-Null
}

$backup_name = "vimbackup_$(Get-Date -Format "yyyyMMdd-hhmmss").zip"
Write-Host "  --> Compressing backup files into $backup_name ..."
Compress-Archive -Path $backupdir -DestinationPath $HOME\$backup_name
Remove-Item $backupdir -Recurse -Force | Out-Null

Write-Host -ForegroundColor Green "2. Creating soft links of vime..."
New-Item -ItemType Directory -Force -Path $vimdir  | Out-Null
New-Item -Path $vimdir\rc -ItemType Junction -Value $vimedir\rc | Out-Null
New-Item -Path $vimdir\vimrc -ItemType SymbolicLink -Value $vimedir\vimrc -Force | Out-Null
# Copy-Item $vimedir\vimrc -Destination $vimrc -Force
"source $vimdir\vimrc" | Out-File -FilePath $vimrc

Write-Host -ForegroundColor Green "3. Installing Vim-Plug..."
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    New-Item $HOME/vimfiles/autoload/plug.vim -Force | Out-Null

Write-Host -ForegroundColor Green "4. Installing plugins using Vim-Plug..."
Invoke-Expression "vim -u $vimedir/pre/vimrc-update.vim +mapclear +PlugInstall! +PlugClean! +qall! $vimedir\vime.txt"

Write-Host -ForegroundColor Green "vime has been successfully installed. Let's vimming!"