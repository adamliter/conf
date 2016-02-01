# ------------------------------------
# PATH stuff
# ------------------------------------
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

# ------------------------------------
# EDITOR
# ------------------------------------
export EDITOR=emacs

# ------------------------------------
# Python
# ------------------------------------
export PIP_REQUIRE_VIRTUALENV=true
