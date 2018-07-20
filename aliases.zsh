# fasd aliases
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v=‘f -e vim’ # quick opening files with vim
alias m=‘f -e mplayer’ # quick opening files with mplayer
alias o=‘a -e xdg-open’ # quick opening files with xdg-open

# etc
alias ls='ls -al'
alias ggt=‘go get -v’
alias psthis=‘git push -u origin HEAD’
alias xno=‘xargs -n1 open’

# gcloud, kube
alias gchange=‘gcloud config configurations activate’
alias gcl=‘gcloud’

alias kube=‘kubectl’
alias kp=‘kube-prompt’

alias fblogin=‘firebase login’
alias fblogout=‘firebase logout’
alias fbdeploy=‘firebase deploy’
alias fbuse=‘firebase use’
alias fbconfig=‘firebase functions:config:get’

alias gn=‘git now .’

alias git=hub
alias gpr=‘git pull-request’
alias gfp=‘git fetch --prune’

# Global aliases
alias -g ...=‘../..’
alias -g ....=‘../../..’
alias -g .....=‘../../../..’
alias -g C=‘| wc -l’
alias -g H=‘| head’
alias -g L=“| less”
alias -g N=“| /dev/null”
alias -g S=‘| sort’
alias -g G=‘| grep’ # now you can do: ls foo G something