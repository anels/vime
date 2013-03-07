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

e_info "Update vime from github?"
echo -n "Type Y to update: "
read line
if [ "$line" = Y ] || [ "$line" = y ]
then
  # update ivim
  e_info "Updating vime..."
  cd $vimedir
  if git pull origin master
  then
    vim -u $vimedir/pre/vimrc-update.vim +mapclear +BundleInstall! +BundleClean! +qa! $vimedir/vime.txt
    e_info -e 'vime has been updated to the latest version.'
  else
    e_warn 'There was an error updating. Sorry!'
  fi
  vim -u $vimedir/pre/vimrc-update.vim $vimedir/changelog.md
fi
