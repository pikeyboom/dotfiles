#!/bin/zsh

declare base=${HOME}/dotfiles

# Check for required dependencies before continuing:
if [[ ! -a $(which git) ]]; then
    echo "Error: git is not installed. Please install git first.";
    exit 1
fi
if [[ ! -a $(which curl) ]]; then
    echo "Error: curl is not installed. Please install curl first.";
    exit 1
fi
if [[ ! -a $(which unzip) ]]; then
    echo "Error: unzip is not installed. Please install unzip first.";
    exit 1
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
      ln -s ${base}${src} $HOME/$f
    fi
  else
    echo "Skipping synlink $f"
  fi
done;

