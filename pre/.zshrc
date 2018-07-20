#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# setting about font
POWERLEVEL9K_MODE='awesome-patched'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

# powerlevel9k
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

POWERLEVEL9K_PROMPT_ON_NEWLINE=false

#POWERLEVEL9K_VCS_GIT_ICON=''
#POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
#POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
#POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
#POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

# POWERLEVEL9K_RAM_BACKGROUND="black"
# POWERLEVEL9K_RAM_FOREGROUND="249"
# POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n"
# POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%K{white}%F{black} `date +%T` \UE12E %f%k%F{white}%f "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status)

