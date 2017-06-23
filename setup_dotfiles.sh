#!/bin/zsh

declare base=${HOME}/dotfiles

# Check for required dependencies before continuing:
hash git 2>/dev/null || { echo "Error: git is not installed. Please install git first."; exit 1;}
hash curl 2>/dev/null || { echo "Error: curl is not installed. Please install curl first."; exit 1;}
hash unzip 2>/dev/null || { echo "Error: unzip is not installed. Please install unzip first."; exit 1;}

# Get font
if [ ! -f ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ]; then
  curl -fLo ~/.fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf --create-dirs \
    https://github.com/powerline/fonts/raw/master/Meslo%20Slashed/Meslo%20LG%20M%20Regular%20for%20Powerline.ttf
  fc-cache -vf ~/.fonts/
fi

# Get the Base16 colour schemes
mkdir -p ~/.config
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

# Set up tmux plugin manager:
mkdir -p ~/.tmux/plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Set up antigen, the zsh plugin manager:
mkdir -p ~/.zsh
if [ ! -d ~/.zsh/antigen ]; then
  git clone https://github.com/zsh-users/antigen ~/.zsh/antigen
fi

# Get vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

files=(.zshrc .vimrc .tmux.conf .gitconfig .pathrc .Xresources)

# setup dotfiles
mkdir -p ~/.dotfiles_backup

for f in $files; do
  if [[ $f =~ ".*" ]]; then
    src=${f/.//}
  else
    src=$f
  fi;
  if [[ ! -h ~/$f ]]; then
    if [[ -e ~/$f && -e ${base}/${src} ]]; then
      echo "Backing up $f"
      mv ~/$f ${backup_dir}/$f
    fi
    if [[ -e ${base}/${src} ]]; then
      echo "Installing $f"
      ln -s ${base}${src} $f
    fi
  else
    echo "Skipping synlink $f"
  fi
done;

# # link vimrc
# if [ ! -f .vimrc ]; then
#   ln -s ${base}/vimrc .vimrc
# fi

cd && source .zshrc
