#!/bin/bash
# Sublime Text 3

dir=~/dotfiles/sublime
olddir=~/dotfiles_old/sublime
files="
Preferences.sublime-settings 
PackageControl.sublime-settings 
Default(Linux).sublime-keymap 
LaTeX.sublime-completions 
LaTeXTools.sublime-settings 
JavaBuildRun.sublime-build 
Origami.sublime-settings 
bh_core.sublime-settings 
Emmet.sublime-settings 
"



# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	echo "Moving any existing dotfiles from $dir to $olddir"
    mv ~/.config/sublime-text-3/Packages/User/$file ~/dotfiles_old/sublime/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.config/sublime-text-3/Packages/User/$file
done