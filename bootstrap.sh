#!/usr/bin/env bash

# -*- coding: utf-8; mode: sh; -*-
# Exit when a command fails
set -o errexit
# Exit when a command in a series of pipes fails
set -o pipefail
# Exit when there is an undeclared variable
set -o nounset
# Trace what gets executed (for debugging)
#set -o xtrace

if [[ $OSTYPE == darwin* ]]; then
    BASH_OS_TYPE='macOS'
elif [[ $OSTYPE == linux-gnu ]]; then
    BASH_OS_TYPE='Linux'
elif [[ '$OS' == Windows* ]]; then
    BASH_OS_TYPE='Windows'
else
    BASH_OS_TYPE='Unknown'
fi

if [[ $BASH_OS_TYPE == macOS ]]; then
    if type brew >/dev/null 2>&1; then
        echo "Homebrew is already installed ..."
    else
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew update && brew upgrade
    brew tap caskroom/cask
    brew cask install emacs
    brew install git
elif [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get update -y && sudo apt-get upgrade -y
    sudo apt-get install -y emacs
    sudo apt-get install -y git
fi

rm -rf "${HOME}/config-files"
git clone github:adamliter/config-files.git "${HOME}/config-files"
cd "${HOME}/config-files"
git submodule update --init --remote --recursive

git submodule foreach --recursive \
  'git checkout \
  $(git config -f $toplevel/.gitmodules submodule.$name.branch || \
  echo master)'

rm -rf "${HOME}/.emacs.d"
ln -sn "${HOME}/config-files/emacs.d" "${HOME}/.emacs.d"

emacs --batch --load="${HOME}/.emacs.d/init.el"

emacs --batch \
  --eval="(progn
  (require 'org)
  (setq org-confirm-babel-evaluate nil)
  (find-file \"~/config-files/README.org\")
  (org-babel-tangle)
  (org-babel-execute-buffer)
  (kill-buffer))"
