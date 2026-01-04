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
    echo "This bootstrapping script does not currently support Linux ..."
    exit 1
elif [[ '$OS' == Windows* ]]; then
    BASH_OS_TYPE='Windows'
    echo "This bootstrapping script does not currently support Windows ..."
    exit 1
else
    BASH_OS_TYPE='Unknown'
    echo "Unknown operating system ..."
    exit 1
fi

if [[ $BASH_OS_TYPE == 'macOS' ]]; then
    if [[ $(uname -m) == arm* ]]; then
        MAC_OS_TYPE='apple-silicon'
    elif [[ $(uname -m) == x86_64 ]]; then
        MAC_OS_TYPE='intel'
    else
        MAC_OS_TYPE='Unknown'
    fi
fi
if [[ $BASH_OS_TYPE == macOS ]]; then
    if type brew >/dev/null 2>&1; then
        echo "Homebrew is already installed ..."
    else
        echo "Installing Homebrew ..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew was successfully installed ..."
        if [[ $MAC_OS_TYPE == 'apple-silicon' ]]; then
            echo "Temporarily adding Homebrew to PATH for Apple Silicon Mac ..."
            eval $(/opt/homebrew/bin/brew shellenv)
        fi
        echo "Tapping d12frosted/emacs-plus..."
        brew tap d12frosted/emacs-plus
    fi
fi
if [ -f "${HOME}/.ssh/config" ]; then
    cp -H "${HOME}/.ssh/config" "${HOME}/.ssh/config.temp"
    rm "${HOME}/.ssh/config"
    mv "${HOME}/.ssh/config.temp" "${HOME}/.ssh/config"
fi
if [ -d "${HOME}/conf" ]; then
    echo "~/conf already exists; backing it up to ~/conf.bkp ..."
    cp -r "${HOME}/conf" "${HOME}/conf.bkp"
fi
rm -rf "${HOME}/conf"
git clone github:adamliter/conf.git "${HOME}/conf"
cd "${HOME}/conf"
git submodule update --init --remote --recursive

git submodule foreach --recursive \
  'git checkout \
  $(git config -f $toplevel/.gitmodules submodule.$name.branch || \
  echo main)'

cd "${HOME}"
if [[ $BASH_OS_TYPE == macOS ]]; then
    if xcode-select -p >/dev/null 2>&1; then
        echo "XCode command line tools are already installed ..."
    else
        echo "Installing XCode command line tools ..."
        xcode-select --install
    fi
fi
if [[ $BASH_OS_TYPE == macOS ]]; then
    if ([[ $MAC_OS_TYPE == 'apple-silicon' ]] && [ -f /opt/homebrew/bin/emacs ]) \
        || ([[ $MAC_OS_TYPE == 'intel' ]] && [ -f /usr/local/bin/emacs ]); then
        echo "Emacs was already installed with Homebrew ..."
    else
        echo "Installing Emacs ..."
        brew install emacs-plus --with-xwidgets --with-imagemagick
    fi
fi
rm -rf "${HOME}/.doom.d"
ln -sn "${HOME}/conf/doom.d" "${HOME}/.doom.d"
if ~/.emacs.d/bin/doom >/dev/null 2>&1; then
    echo "Doom Emacs is arleady installed ..."
else
    echo "Installing dependencies for Doom Emacs ..."
    if [[ $BASH_OS_TYPE == macOS ]]; then
        brew install git ripgrep
    fi
    echo "Installing optional dependencies for Doom Emacs ..."
    if [[ $BASH_OS_TYPE == macOS ]]; then
        brew install coreutils fd
    fi
    echo "Cloning the doomemacs repository ..."
    git clone https://github.com/doomemacs/doomemacs ~/.emacs.d
    echo "Installing Doom Emacs ..."
    ~/.emacs.d/bin/doom install
fi
emacs --batch \
  --eval="(progn
  (require 'org)
  (setq org-confirm-babel-evaluate nil)
  (find-file \"~/conf/README.org\")
  (org-babel-tangle)
  (org-babel-execute-buffer)
  (kill-buffer))"
. "${HOME}/conf/symlink.sh"
brew install aspell
if [[ $BASH_OS_TYPE == macOS ]]; then
    brew install bash
    if ([[ $MAC_OS_TYPE == 'apple-silicon' ]] && ! grep -q "/opt/homebrew/bin/bash" /etc/shells) \
        || ([[ $MAC_OS_TYPE == 'intel' ]] && ! grep -q "/usr/local/bin/bash" /etc/shells); then
        echo "Adding Homebrew's bash to possible login shells ..."
        if [[ $MAC_OS_TYPE == 'apple-silicon' ]]; then
            sudo bash -c "echo /opt/homebrew/bin/bash >> /etc/shells"
        fi
        if [[ $MAC_OS_TYPE == 'intel' ]]; then
            sudo bash -c "echo /usr/local/bin/bash >> /etc/shells"
        fi
    else
        echo "Homebrew's bash is already a possible login shell ..."
    fi
    if ([[ $MAC_OS_TYPE == 'apple-silicon' ]] && [ $SHELL == "/opt/homebrew/bin/bash" ]) \
        || ([[ $MAC_OS_TYPE == 'intel' ]] && [ $SHELL == "/usr/local/bin/bash" ]); then
        echo "Shell is already set to Homebrew's bash ..."
    else
        echo "Setting shell to Homebrew's bash ..."
        if [[ $MAC_OS_TYPE == 'apple-silicon' ]]; then
            chsh -s /opt/homebrew/bin/bash
        fi
        if [[ $MAC_OS_TYPE == 'intel' ]]; then
            chsh -s /usr/local/bin/bash
        fi
    fi
fi
ln -sf "${HOME}/conf/bash/bashrc" "${HOME}/.bashrc"
brew install cmake
brew install direnv
brew install dvc
brew install editorconfig
brew install git-delta
brew install git-lfs
brew install glow
brew install gnupg
brew install helm
brew install htop
brew install hub
brew install jq
brew install kubernetes-cli
brew install lab
brew install minikube
brew install pandoc
brew install pass
brew install pinentry-mac
defaults write org.gpgtools.common UseKeychain NO
defaults write org.gpgtools.common DisableKeychain -bool yes
brew install pre-commit
brew install reattach-to-user-namespace
brew install ruff
ln -sf "${HOME}/conf/ssh/config" "${HOME}/.ssh/config"
brew install starship
brew install tmux
brew install trivy
brew install wget
brew install yq
brew install node
brew install nodenv
echo "Installing node package pyright globally ..."
npm install -g pyright
echo "Installing @commitlint/{cli,config-conventional} globally ..."
npm install -g @commitlint/{cli,config-conventional}
rm -rf "${HOME}/org"
ln -sn "${HOME}/conf/org" "${HOME}/org"
brew install pdm
brew install pyenv pyenv-virtualenv
pyenv install 3:latest
brew install rustup
# Make sure rust-analyzer is installed for LSP
rustup component add rust-analyzer
if [ -d "${HOME}/bin" ]; then
    echo "~/bin already exists; backing it up to ~/bin.bkp ..."
    cp -r "${HOME}/bin" "${HOME}/bin.bkp"
fi
rm -rf ${HOME}/bin
ln -sn "${HOME}/conf/bin" "${HOME}/bin"
brew install --cask font-monaspace font-monaspace-nf
