#!/bin/bash
# OS: MacOS , Terminal: iTerm2
# this install shell requires brew

brew update
brew install git
brew upgrade

#install yadr(=Prezto+Zsh)
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"


git clone https://github.com/bhilburn/powerlevel9k.git  ~/.zprezto/modules/prompt/external/powerlevel9k
ln -s ~/.zprezto/modules/prompt/external/powerlevel9k/powerlevel9k.zsh-theme ~/.zprezto/modules/prompt/functions/prompt_powerlevel9k_setup

curl -L -O https://rawgit.com/gabrielelana/awesome-terminal-fonts/patching-strategy/patched/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf
open SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf

mv -f .zshrc ~/.zshrc

echo 'Done. Restart iterm2. Then set font to SourceCodePro+Powerline+Awesome and set Theme to Solarized Dark.'
