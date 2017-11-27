# load zgen
source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then
  # Load the oh-my-zsh's library.
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/command-not-found


  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting

  # Plugin to check if a 256 colour terminal
  # is available, and enable all colours if
  # it is
  zgen load chrissicool/zsh-256color

  # Load the theme.
  zgen oh-my-zsh themes/pygmalion
fi

export EDITOR=vim

BUILD_CORES=8
# if type distcc > /dev/null; then
#   export CCACHE_PREFIX="distcc"
#   BUILD_CORES=48
# fi

# Default to ccache if available
if type ccache > /dev/null; then
  export CXX='ccache /usr/bin/c++'
  # Don't use cached preprocessor output
  export CCACHE_CPP2=true
fi

# Ensure Google Test tests always show colour output:
export GTEST_COLOR=yes

# Set up ninja tab completion
source ~/dotfiles/ninja/_ninja

# Adjust the path
source ~/.pathrc

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-atelier-savanna.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias l='ls -lhtr'

# general aliases
alias ja='ninja -j$BUILD_CORES && ninja tests -j$BUILD_CORES'
alias now='watch -x -t -n 0.01 date +%s.%N'
alias du='du -h --max-depth=1'
alias df='df -h'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source local rc commands
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

