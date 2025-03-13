# FZF Configuration
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="find . -type d -not -path '*/\.git*' | sort"

# Key bindings
bindkey '^f' fzf-file-widget      # Ctrl-f for files
bindkey '^g' fzf-cd-widget        # Ctrl-g for directories
bindkey '^r' fzf-history-widget   # Ctrl-r for history

# Custom functions
fzf-git-branch() {
  git branch | fzf --height 40% --layout=reverse | tr -d '* '
}

fzf-git-checkout() {
  local branch=$(git branch | fzf --height 40% --layout=reverse | tr -d '* ')
  if [[ -n $branch ]]; then
    git checkout $branch
  fi
}

alias gb='fzf-git-branch'
alias gco='fzf-git-checkout'
