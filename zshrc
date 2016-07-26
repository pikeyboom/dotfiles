source ~/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
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
# export CCACHE_PREFIX="distcc"

# Ensure Google Test tests always show colour output:
export GTEST_COLOR=yes

# Set up ninja tab completion
source ~/dotfiles/ninja/_ninja

# Adjust the path
source ~/.pathrc

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-flat.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias l='ls -lhtr'
alias eb='elderberry'
alias ja='ninja -j48 && ninja tests -j48'
alias ebm="CXX='ccache /usr/bin/c++'  elderberry make --no-cpack --extra --use-ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release; cd build/ && ja"

alias ebmd="CXX='ccache /usr/bin/c++'  elderberry make --no-cpack --extra --use-ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Debug; cd build/ && ja"

alias findxml='find ./ -name "*.xml"'
alias findpcd='find ./ -name "*.pcd"'
alias findcsv='find ./ -name "*.csv"'

source /opt/ros/indigo/setup.zsh


