#  ~/.zshrc file is evaluated every time a shell is launched. 

# # Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null; then
# 	complete -o default -o nospace -F _git g;
# fi;

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# bun end

# brew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# brew completions end

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/the-unnamed.omp.json)"
#   eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/takuya.omp.json)"
fi

PS1+="$(node --version)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi