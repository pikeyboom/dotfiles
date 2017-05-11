source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Plugin to check if a 256 colour terminal
# is available, and enable all colours if
# it is
antigen bundle chrissicool/zsh-256color

# Load the theme.
antigen theme blinks

# Tell antigen that you're done.
antigen apply

export EDITOR=nvim

BUILD_CORES=8
if type distcc > /dev/null; then
  export CCACHE_PREFIX="distcc"
  BUILD_CORES=48
fi

# Ensure Google Test tests always show colour output:
export GTEST_COLOR=yes

# Don't use cached preprocessor output
export CCACHE_CPP2=true

# Set up ninja tab completion
source ~/dotfiles/ninja/_ninja

# Adjust the path
source ~/.pathrc

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-atelier-estuary.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias l='ls -lhtr'

# general aliases
alias eb='elderberry'
alias ja='ninja -j$BUILD_CORES && ninja tests -j$BUILD_CORES'
alias now='watch -x -t -n 0.01 date +%s.%N'

# source quanergy run commands
source ~/dotfiles/quanergyrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
