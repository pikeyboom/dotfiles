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
export BASE16_COLORSCHEME=base16-atelier-estuary
BASE16_SHELL="$HOME/.config/base16-shell/scripts/$BASE16_COLORSCHEME.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


BUILD_CORES=8
if type distcc > /dev/null; then
  export CCACHE_PREFIX="distcc"
  BUILD_CORES=48
fi

# Default to ccache if available
if type ccache > /dev/null; then
  ccache -M 10 > /dev/null
  export CXX='ccache /usr/bin/c++'
  # Don't use cached preprocessor output
  export CCACHE_CPP2=true
fi

# Ensure Google Test tests always show colour output:
export GTEST_COLOR=yes

# Set up ninja tab completion
source ~/dotfiles/ninja/_ninja

alias l='ls -lhtr'

# general aliases
alias ja='ninja -j$BUILD_CORES && ninja tests -j$BUILD_CORES'
alias make='make -j$BUILD_CORES'
alias now='watch -x -t -n 0.01 date +%s.%N'
alias du='du -h --max-depth=1'
alias df='df -h'

# Alias to check for avx and avx2 instructions
alias checkavx1='find -type f -executable | xargs objdump --disassemble | egrep "(vbroadcastss|vbroadcastsd|vbroadcastf128|vinsertf128|vextractf128|vmaskmovps|vmaskmovpd|vpermilps|vpermilpd|vperm2f128|vzeroall|vzeroupper)"'

alias checkavx2='find -type f -executable | xargs objdump --disassemble | egrep "(vpbroadcastb|vpbroadcastw|vpbroadcastd|vpbroadcastq|vbroadcasti128|vinserti128|vextracti128|vgatherdpd|vgatherqpd|vgatherdps|vgatherqps|vpgatherdd|vpgatherdq|vpgatherqd|vpgatherqq|vpmaskmovd|vpmaskmovq|vpermps|vpermd|vpermpd|vpermq|vperm2i128|vpblendd|vpsllvd|vpsllvq|vpsrlvd|vpsrlvq|vpsravd)"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Adjust the path
source ~/.pathrc

# source local rc commands
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# populate env variables for dircolors
if [ -f ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
fi

