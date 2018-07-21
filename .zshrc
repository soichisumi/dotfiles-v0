function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}

# zsh-completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -u

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f ~/aliases.zsh ]; then source ~/aliases.zsh; fi
if [ -f ~/.zshrc.local ]; then source ~/.zshrc.local; fi

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

# fix home, end, delete keys
# To investigate the code of key, od -c, press any key, enter, then C-c.
bindkey "\033[1~" beginning-of-line # Home
bindkey "\033[4~" end-of-line       # End
bindkey "^[[3~"  delete-char        # Delete

LANG="`defaults read -g AppleLocale | sed 's/@.*$//g'`.UTF-8"
export LANG

# stern completion
source <(stern --completion=zsh)
# set env_val for gcp pubsub emulator
# $(gcloud beta emulators pubsub env-init)


# nvm setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
