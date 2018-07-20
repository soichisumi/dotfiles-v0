function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.zsh.inc' ]; then source '~/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.zsh.inc' ]; then source '~/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f ~/aliases.zsh ] && source ~/aliases.zsh
if [ -f ~/.zshrc.local ] && source ~/.zshrc.local

# setup fasd
eval "$(fasd --init auto)"

# peco
bindkey ‘^]’ peco-src
function peco-src(){
 local src=$(ghq list --full-path | peco --query “$LBUFFER”)
 if [ -n “$src” ]; then
   BUFFER=“cd $src”
   zle accept-line
 fi
 zle -R -c
}
zle -N peco-src

export NVM_DIR=“$HOME/.nvm”
[ -s “$NVM_DIR/nvm.sh” ] && \. “$NVM_DIR/nvm.sh”  # This loads nvm
# [ -s “$NVM_DIR/bash_completion” ] && \. “$NVM_DIR/bash_completion”  # This loads nvm bash_completion

LANG="`defaults read -g AppleLocale | sed 's/@.*$//g'`.UTF-8"
export LANG

# stern completion
source <(stern --completion=zsh)
# set env_val for gcp pubsub emulator
# $(gcloud beta emulators pubsub env-init)
