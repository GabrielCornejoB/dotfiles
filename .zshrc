#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Function to get current git branch name
parse_git_branch() {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n "$branch" ]]; then
    echo " $branch"
  fi
}

# Enable prompt substitution
setopt PROMPT_SUBST

NEWLINE=$'\n '
PROMPT=" %F{blue}󰉋  %~%f %F{green}\$(parse_git_branch)${NEWLINE}%F{white}$ "

# Case-insensitive auto-complete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
