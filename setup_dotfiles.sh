#!/bin/zsh

declare base=${HOME}/dotfiles

# Check for required dependencies before continuing:
hash git 2>/dev/null || { echo "Error: git is not installed. Please install git first."; exit 1;}
hash curl 2>/dev/null || { echo "Error: curl is not installed. Please install curl first."; exit 1;}
hash unzip 2>/dev/null || { echo "Error: unzip is not installed. Please install unzip first."; exit 1;}

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

# Set up zgen, the zsh plugin manager:
if [ ! -d ~/.zgen ]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# Get vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ -f ~/.gitconfig ]; then
  echo "Git config already exists. Git options will not be appended"
else
  cat ${base}/gitconfig.include > ~/.gitconfig
fi

files=(.zshrc .vimrc .tmux.conf .pathrc)

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

cd && source .zshrc
