# ------------------------------------
# PATH stuff
# ------------------------------------
export PATH=/usr/local/bin:$PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	export PATH="$HOME/bin:$PATH"
fi

# This should come at the end of any path stuff,
# otherwise the rvm-managed version of Ruby
# will not be at the beginning of the path, and rvm
# will complain about this

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# ------------------------------------
# EDITOR
# ------------------------------------
export EDITOR=emacs

# ------------------------------------
# Python stuff
# ------------------------------------
export PIP_REQUIRE_VIRTUALENV=true
export PROJECT_HOME=$HOME/projects
export WORKON_HOME=$HOME/.virtualenvs


