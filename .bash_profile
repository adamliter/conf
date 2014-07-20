export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Alias for CorpusSearch
alias CS='java -classpath ~/Applications/CS_2.003.04.jar csearch/CorpusSearch'

## Command for knitr + pdflatex + bibtex + pdflatex + pdflatex from a shell
knitretal () {
Rscript -e "library(knitr); knit('"$@".Rnw')"
pdflatex "$@".tex
bibtex "$@".aux
pdflatex "$@".tex
pdflatex "$@".tex
}

## For color output with `ls`
## See http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Aliases for showing/revealing hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'