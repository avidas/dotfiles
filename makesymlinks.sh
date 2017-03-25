#!/bin/bash

# This script creates symlinks from the home dir to any desired dotfiles in ~/dotfiles. Fork of @michaeljsmalley's version

set -euvx

dir=~/dotfiles
olddir=~/dotfiles_old
files="bashrc bash_aliases bash_profile profile tmux.conf vimrc"

echo -n "Create $olddir for backup of existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to $dir directory ..."
cd $dir
echo "done"

for file in $files; do
  echo "Moving existing dotfiles from ~ to $olddir"
  if [ -f ~/.$file ]; then
    mv ~/.$file ${olddir}/
  fi
  echo "Creating symlink to $file in home dir."
  if [ -f ${dir}/.${file} ]; then
    ln -s ${dir}/.${file} ~/.$file
  fi
done
