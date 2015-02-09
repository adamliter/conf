export PATH=/usr/local/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Command for knitr + pdflatex + bibtex + pdflatex + pdflatex from a shell
knitretal () {
Rscript -e "library(knitr); knit('"$@".Rnw')"
pdflatex "$@".tex
bibtex "$@".aux
pdflatex "$@".tex
pdflatex "$@".tex
}

# For color output with `ls`
# See http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# For auto-completion with `pass`
source /usr/local/etc/bash_completion.d/password-store

# ------------------------------------
# aliases
# ------------------------------------

## Aliases for `cd`-ing into git repos

# Alias for personal website
alias cdpsite='cd ~/Documents/PersonalWebsite'

# Alias for TeXnology folder
alias cdtex='cd ~/Dropbox/TeXnology'

# Alias for `lingsem` folder
alias cdling='cd ~/Dropbox/TeXnology/lingsem'

# Alias for config-files
alias cdconfig='cd ~/config-files'

# Alias for CV
alias cdcv='cd ~/Dropbox/SillyCareerStuff/adamlitercv'

# Alias for linguistics stuff
alias cdling='cd ~/Dropbox/linguistics'

# Alias for undergrad thesis
alias cdugradthesis='cd ~/Dropbox/linguistics/undergrad-thesis'

# Alias for masters-thesis
alias cdmastersthesis='cd ~/Dropbox/linguistics/masters-thesis'

# Alias for Emacs stuff
alias cdemacs='cd ~/config-files/.emacs.d'

# Alias for verbose brew update
alias bud='brew update -v'

# Alias for verbose brew upgrade
alias bug='brew upgrade -v'

# Alias for verbose brew cleanup
alias brc='brew cleanup -v'

# Alias for verbose brew prune
alias brp='brew prune -v'

# Alias for verbose brew update,
# verbose brew upgrade, verbose brew
# cleanup, and verbose brew prune
alias bra='bud && bug && brc && brp'

# Alias for `ssh-add` to add id_rsa
alias sshid='ssh-add ~/.ssh/id_rsa'

# Alias for `pass` to copy a password to clipboard
alias passcopy='pass show -c'

# Alias for `pass` to copy chess password to clipboard
alias chess='passcopy misc/chess'

#GPG USB
alias gpgusb='gpg2 --home=/Volumes/adamliter1/.gnupg'

# For opening anything with TextWrangler
alias openTW='open -a "TextWrangler"'

# For opening any with Emacs
alias openE='open -a "Emacs"'

# Alias for CorpusSearch
alias CS='java -classpath ~/Applications/CS_2.003.04.jar csearch/CorpusSearch'

# Aliases for showing/revealing hidden files in Finder
alias showFiles='defaults write -g AppleShowAllFiles -bool true; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write -g AppleShowAllFiles -bool false; killall Finder /System/Library/CoreServices/Finder.app'
