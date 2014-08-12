export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

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

# Alias for verbose brew update
alias bud='brew update -v'

# Alias for verbose brew upgrade
alias bug='brew upgrade -v'

# Alias for verbose brew cleanup
alias buc='brew cleanup -v'

# Alias for `ssh-add` to add id_rsa
alias sshid='ssh-add ~/.ssh/id_rsa'

# Alias for `pass` to copy a password to clipboard
alias passcopy='pass show -c'

#GPG USB
alias gpgusb='gpg2 --home=/Volumes/adamliter1/.gnupg'

# For opening anything with TextWrangler
alias openTW='open -a "TextWrangler"'

# For opening any with Emacs
alias openE='open -a "Emacs"'

# Alias for CorpusSearch
alias CS='java -classpath ~/Applications/CS_2.003.04.jar csearch/CorpusSearch'

# Aliases for showing/revealing hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
