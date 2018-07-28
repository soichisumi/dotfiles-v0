function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}

# zsh-completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -u
# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# suggest-color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

# stern completion
source <(stern --completion=zsh)

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開         
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# kubectl
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f ~/aliases.zsh ]; then source ~/aliases.zsh; fi
if [ -f ~/.zshrc.local ]; then source ~/.zshrc.local; fi

# setup fasd
eval "$(fasd --init auto)"

# peco
bindkey "^]" peco-src
function peco-src(){
	local src=$(ghq list --full-path | peco --query "$LBUFFER")
 if [ -n “$src” ]; then
   BUFFER="cd $src"
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

# set env_val for gcp pubsub emulator
# $(gcloud beta emulators pubsub env-init)

export BOOST_ROOT=$HOME/Downloads/boost_1_64_0