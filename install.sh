#!/bin/sh

# Script for installing dotfiles

if [ ! -n "$1" ] || [ ! -n "$2" ]
then
  echo "Usage: $(basename $0) install/remove <package>"
  echo ""
  echo "Available packages:"
  echo "\tbash"
  echo "\tvim"
  echo "\tscreen"
  echo "\tssh"
  echo "\thg"
  echo "\tmutt"
  echo "\tirssi"
  echo ""
  exit 1
fi  

case "$1" in

  "install")
    case "$2" in
      "bash")
        echo "Installing bash dotfiles"
	    ln -f bash/bash_profile ~/.bash_profile
	    ln -f bash/bashrc ~/.bashrc
        ln -f bash/bash_aliases ~/.bash_aliases
        ln -f bash/bash_atmail ~/.bash_atmail
        ;;

      "vim")
        echo "Installing vim dotfiles"
        mkdir -p ~/.vim
        mkdir -p ~/.vim/backupfiles
        mkdir -p ~/.vim/plugin
        mkdir -p ~/.vim/tmp
        ln -f vim/vimrc ~/.vimrc
        ln -f vim/comments.vim ~/.vim/plugin/comments.vim
        ln -f vim/openssl.vim ~/.vim/plugin/openssl.vim
        ln -f vim/skeleton.c ~/.vim/skeleton.c
        ln -f vim/skeleton.cc ~/.vim/skeleton.cc
        ln -f vim/skeleton.hh ~/.vim/skeleton.hh
        ln -f vim/skeleton.h ~/.vim/skeleton.h
        ln -f vim/skeleton.html ~/.vim/skeleton.html
        ln -f vim/skeleton.tex ~/.vim/skeleton.tex
        ln -f vim/skeleton.py ~/.vim/skeleton.py
        ;;

      "screen")
        echo "Installing screen dotfiles"
        ln -f screen/screenrc ~/.screenrc
        ;;

      "ssh")
        echo "Installing vim dotfiles"
        mkdir -p ~/.ssh
        ln -f ssh/config ~/.ssh/config
        ;;

      "hg")
        echo "Installing hg dotfiles"
        ln -f hg/hgrc ~/.hgrc
        ;;

      "mutt")
        echo "Installing mutt dotfiles"
        ln -f mutt/muttrc ~/.muttrc
        mkdir -p ~/.mutt
        ln -f mutt/colors ~/.mutt/colors
        ln -f mutt/colors2 ~/.mutt/colors2
        ln -f mutt/colors3 ~/.mutt/colors3
        ln -f mutt/msmtprc ~/.msmtprc
        chmod 600 ~/.msmtprc
        ;;

      "irssi")
        echo "Installing irssi dotfiles"
        mkdir -p ~/.irssi
        ln -f irssi/config ~/.irssi/config
        ln -f irssi/yotus.theme ~/.irssi/yotus.theme
        ;;

      *)
        echo "No package with this name; exiting"
        exit 1
        ;;
      esac
  ;;

  "remove")
    case "$2" in
      "bash")
        echo "Removing bash dotfiles"
        rm -f ~/.bashrc ~/.bash_profile ~/.bash_aliases ~/.bash_atmail
        ;;

      "vim")
        echo "Removing vim dotfiles"
	    rm -rf ~/.vimrc ~/.vim
        ;;

      "screen")
        echo "Removing screen dotfiles"
	    rm -f ~/.screenrc
        ;;

      "ssh")
        echo "Removing ssh dotfiles"
	    rm -f ~/.ssh/config
        ;;

      "hg")
        echo "Removing hg dotfiles"
	    rm -f ~/.hgrc
        ;;

      "mutt")
        echo "Removing mutt dotfiles"
        rm -rf ~/.muttrc ~/.mutt ~/.msmtprc
        ;;

      "irssi")
        echo "Removing irssi dotfiles"
        rm -f ~/.irssi/config ~/.irssi/yotus.theme
        ;;

      *)
        echo "No package with this name; exiting"
        exit 1
      ;;
      esac
  ;;

  *)
    echo "No action with this name; exiting"
    exit 1
  ;;

esac
