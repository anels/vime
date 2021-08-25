$vimedir = $PWD

$vimrc = "$HOME\_vimrc"
$vimdir = "$HOME\_vim"
$backupdir = "$HOME\vim_backup"

Clear-Host
Get-Content $vimedir\vime.txt

Write-Host -ForegroundColor Green "Installing vime........"

Write-Host -ForegroundColor Green "1. Creating backup for current vim configuration..."
# if [ ! -x "$backupdir" ]; then
#   mkdir "$backupdir"
# fi

# if [ -f "$vimrc" ]; then
#   echo "Backing up $vimrc ..."
#   cp $vimrc $backupdir
#   rm $vimrc
#   if [ -f "$vimrc.local" ]; then
#     cp $vimrc.local $backupdir
#     rm $vimrc.local
#   fi
# fi

# if [ -x "$vimdir" ]; then
#   echo "Backing up $vimdir/ ..."
#   cp -rf $vimdir $backupdir
#   rm -rf $vimdir
# fi

# backup_name=vimbackup_`date '+%Y-%m-%d-%H%M%S'`.tar.gz
# echo "Compressing backup files into $backup_name ..."
# tar zcf $backupdir/../$backup_name -C $backupdir/.. vim_backup --remove-files

Write-Host -ForegroundColor Green "2. Creating soft links of vime..."
mkdir $vimdir
New-Item -Path $vimrc -ItemType SymbolicLink -Value $vimedir\vimrc
New-Item -Path $vimdir -ItemType Junction -Value $vimedir\rc

Write-Host -ForegroundColor Green "4. Installing Plug..."
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    New-Item $HOME/vimfiles/autoload/plug.vim -Force

Write-Host -ForegroundColor Green "4. Installing plugins using Vundle..."
Invoke-Expression "vim -u $vimedir/pre/vimrc-update.vim +mapclear +PlugInstall! +PlugClean! +qall! $vimedir\vime.txt"

Write-Host -ForegroundColor Green "vime has been successfully installed. Let's vimming!"