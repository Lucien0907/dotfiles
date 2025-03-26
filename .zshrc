
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export CLICOLOR=1

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
NEWLINE=$'\n'
# PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$NEWLINE>> '
PROMPT='%F{magenta}%n%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$NEWLINE%F{green}>>%f '

# Created by `pipx` on 2025-01-25 05:48:44
export PATH="$PATH:/Users/tao-wei/.local/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tao-wei/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tao-wei/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tao-wei/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tao-wei/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
