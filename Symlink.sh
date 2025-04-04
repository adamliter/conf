#!/usr/bin/env bash
ln -sf "${HOME}/conf/bash/bash_profile" "${HOME}/.bash_profile"
ln -sf "${HOME}/conf/bash/bashrc" "${HOME}/.bashrc"
ln -sf "${HOME}/conf/bash/profile" "${HOME}/.profile"
ln -sf "${HOME}/conf/git/gitconfig" "${HOME}/.gitconfig"
ln -sf "${HOME}/conf/git/gitignore_global" "${HOME}/.gitignore_global"
ln -sf "${HOME}/conf/git/gitattributes_global" "${HOME}/.gitattributes_global"
mkdir -p ~/.config/htop
ln -sf "${HOME}/conf/htop/htoprc" "${HOME}/.config/htop/htoprc"
mkdir -p ~/.config/lab
ln -sf "${HOME}/conf/lab/lab.toml" "${HOME}/.config/lab/lab.toml"
ln -sf "${HOME}/conf/starship/starship.toml" "${HOME}/.config/starship.toml"
ln -sf "${HOME}/conf/tmux/tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${HOME}/conf/npm/npmrc" "${HOME}/.npmrc"
ln -sf "${HOME}/conf/conda/condarc" "${HOME}/.condarc"
