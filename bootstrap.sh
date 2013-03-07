#!/usr/bin/env bash

e_warn () {
  echo -e '\e[41;33;1m'$1'\e[0m'
}

die () {
  e_warn "$1"
  exit 1
}

e_title () {
  echo -e '\e[44;33;1m'$1'\e[0m'
}

e_info () {
  echo -e '\e[34;1m'$1'\e[0m'
}


cmddir="`dirname $0`"
export vimedir="`cd $cmddir; pwd`"

vimrc="$HOME/.vimrc"
vimdir="$HOME/.vim"
backupdir="$HOME/vim_backup"

clear
cat $vimedir/vime.txt

e_title "Installing vime........"

e_info "0. Checking requriements..."
vim --version | grep 7.3 || die "Require vim 7.3. Please download and install vim from http://www.vim.org/"
git --version || die "Require git. Please download and install git from http://git-scm.com/downloads/"
ctags --version | grep 5.9 || die "Require ctags. Please download and install ctags from http://ctags.sourceforge.net/"

e_info "1. Creating backup for current vim configuration..."
if [ ! -x "$backupdir" ]; then
  mkdir "$backupdir"
fi

if [ -f "$vimrc" ]; then
  echo "Backing up $vimrc ..."
  cp $vimrc $backupdir
  cp $vimrc.local $backupdir
  rm $vimrc
  rm $vimrc.local
fi

if [ -x "$vimdir" ]; then
  echo "Backing up $vimdir/ ..."
  cp -rf $vimdir $backupdir
  rm -rf $vimdir
fi

backup_name=vimbackup_`date '+%Y-%m-%d-%H%M%S'`.tar.gz
echo "Compressing backup files into $backup_name ..."
tar zcf $backupdir/../$backup_name -C $backupdir/.. vim_backup --remove-files

e_info "2. Creating soft links of vime..."
mkdir $vimdir
echo "Linking $vimrc -> $vimedir/vimrc ..."
ln -s $vimedir/vimrc $vimrc
echo "Linking $vimdir/ -> $vimedir/rc/ ..."
ln -s $vimedir/rc $vimdir/
echo "Copying $vimedir/pre/vimrc_local.vim to $vimrc.local"
cp $vimedir/pre/vimrc-local.vim $vimrc.local

e_info "3. Installing Vundle..."
git clone git://github.com/gmarik/vundle.git $vimdir/bundle/vundle

e_info "4. Installing plugins using Vundle..."
vim -u $vimedir/pre/vimrc-update.vim +mapclear +BundleInstall!  +BundleClean! +qa! $vimedir/vime.txt

e_title "vime has been successfully installed. Let's vimming!"
