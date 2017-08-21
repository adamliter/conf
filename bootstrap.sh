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
cd "${HOME}"
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
if [ -f "${HOME}/.ssh/config" ]; then
    cp -H "${HOME}/.ssh/config" "${HOME}/.ssh/config.temp"
    rm "${HOME}/.ssh/config"
    mv "${HOME}/.ssh/config.temp" "${HOME}/.ssh/config"
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
if [[ $BASH_OS_TYPE == macOS ]]; then
    brew update && brew install bash
    if ! grep -q "/usr/local/bin/bash" /etc/shells; then
        echo "Adding Homebrew's bash to possible login shells ..."
        sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"
    else
        echo "Homebrew's bash is already a possible login shell ..."
    fi
    if [ $SHELL == "/usr/local/bin/bash" ]; then
        echo "Shell is already set to Homebrew's bash ..."
    else
        echo "Setting shell to Homebrew's bash ..."
        chsh -s /usr/local/bin/bash
    fi
fi
ln -sf "${HOME}/config-files/bash/bash_profile" "${HOME}/.bash_profile"
ln -sf "${HOME}/config-files/bash/bashrc" "${HOME}/.bashrc"
ln -sf "${HOME}/config-files/bash/profile" "${HOME}/.profile"
if [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get install -y curl
fi
ln -sf "${HOME}/config-files/git/gitconfig" "${HOME}/.gitconfig"
ln -sf "${HOME}/config-files/git/gitignore_global" "${HOME}/.gitignore_global"
if [[ $BASH_OS_TYPE == macOS ]]; then
    brew install htop
elif [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get install -y htop
fi
#ln -sf "${HOME}/config-files/htop/htoprc" "${HOME}/.config/htop/htoprc"
if [[ $BASH_OS_TYPE == macOS ]]; then
    brew install pandoc
elif [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get install -y pandoc
fi
ln -sf "${HOME}/config-files/ssh/config" "${HOME}/.ssh/config"
if [[ $BASH_OS_TYPE == macOS ]]; then
    brew install tmux
elif [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get install -y tmux
fi
if [[ BASH_OS_TYPE == Linux ]]; then
    if [ -f /usr/share/doc/tmux/examples/bash_completion_tmux.sh ]; then
        echo "Symlinking tmux bash completion into place ..."
        ln -sf "/usr/share/doc/tmux/examples/bash_completion_tmux.sh" "/etc/bash_completion.d/tmux"
    else
        echo "Could not find tmux bash completion file ..."
    fi
fi
ln -sf "${HOME}/config-files/tmux/tmux.conf" "${HOME}/.tmux.conf"
if [[ $BASH_OS_TYPE == Linux ]]; then
    sudo apt-get install -y wget
fi
