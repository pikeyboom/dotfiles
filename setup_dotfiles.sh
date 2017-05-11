#!/bin/zsh

declare base=${HOME}/dotfiles
mkdir -p ${base}

# Check for required dependencies before continuing:
hash git 2>/dev/null || { echo "Error: git is not installed. Please install git first."; exit 1;}
hash curl 2>/dev/null || { echo "Error: curl is not installed. Please install curl first."; exit 1;}
hash unzip 2>/dev/null || { echo "Error: unzip is not installed. Please install unzip first."; exit 1;}

# Set up tmux plugin manager:
mkdir -p ~/.tmux/plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Set up antigen, the zsh plugin manager:
if [ ! -d ~/.zsh/antigen ]; then
	git clone https://github.com/zsh-users/antigen ~/.zsh/antigen
fi

# Get vim-plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.config/nvim/autoload/plug.vim ]; then
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Get the Base16 colour schemes
mkdir -p ~/.config
if [ ! -d ~/.config/base16-shell ]; then
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi

# Get the Meslo font, used by the terminal:
if [ ! -f ~/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf ]; then
	curl -fLo ~/.fonts/Meslo\ LG\ S\ Regular\ for\ Powerline.otf https://github.com/powerline/fonts/raw/master/Meslo/Meslo%20LG%20S%20Regular%20for%20Powerline.otf
	fc-cache -vf ~/.fonts/
fi

files=(.zshrc .vimrc .tmux.conf .gitconfig .pathrc)

declare backup_dir=~/.dotfiles_backup

# Create a backup directory:
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
