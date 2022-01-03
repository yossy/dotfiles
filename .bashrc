source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#=======================================
# starship
#=======================================
eval "$(starship init bash)"
