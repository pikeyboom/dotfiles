source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme blinks

# Tell antigen that you're done.
antigen apply

export EDITOR=vim

# Set ccache to use distcc:
#export CCACHE_PREFIX="distcc"

# Ensure Google Test tests always show colour output:
export GTEST_COLOR=yes

export TERM="xterm-256color"

# Set up ninja tab completion
source ~/dotfiles/ninja/_ninja

# Adjust the path
source ~/.pathrc

alias ja='ninja'
alias l='ls -lhtr'

alias rand4='echo $(($RANDOM % 4))'

