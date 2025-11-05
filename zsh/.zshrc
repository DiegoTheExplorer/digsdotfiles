autoload -Uz compinit
compinit

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# PATH variables
export EDITOR=nvim
export PATH="$HOME/.cargo/bin:$PATH" # Rust installs
export PATH="$HOME/go/bin:$PATH" # Go installs
export PATH="$HOME/.local/bin:$PATH" 
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

alias zj="zellij"
alias zja="zellij attach"
alias ankins="QTWEBENGINE_DISABLE_SANDBOX=1 anki &"
alias pav="source .venv/bin/activate"

fastfetch

# Yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# UV
eval "$(uvx --generate-shell-completion zsh)"

# Node version manager config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# Carapace completion config
# ~/.zshrc
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Zoxide init
eval "$(zoxide init zsh)"

# Starship init
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
