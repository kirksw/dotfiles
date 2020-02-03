#%/usr/bin/bash

dotfiles_dir=~/Git/dotfiles
log_file=~/install_progress_log.txt

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.tmux > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.p10k.zsh > /dev/null 2>&1
sudo rm -rf ~/.fzf.zsh > /dev/null 2>&1
#sudo rm -rf ~/.gitconfig > /dev/null 2>&1
#sudo rm -rf ~/.config > /dev/null 2>&1

#==============
# Install oh-my-zsh
#==============

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vimrc ~/.vimrc
ln -sf $dotfiles_dir/tmux ~/.tmux
ln -sf $dotfiles_dir/tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/zshrc ~/.zshrc
ln -sf $dotfiles_dir/p10k.zsh ~/.p10k.zsh
#ln -sf $dotfiles_dir/config ~/.config
#ln -sf $dotfiles_dir/custom-configs/custom-snips ~/.vim/custom-snips

#if [ -n "$(find $dotfiles_dir/custom-configs -name gitconfig)" ]; then
#    ln -s $dotfiles_dir/custom-configs/**/gitconfig ~/.gitconfig
#else
#    ln -s $dotfiles_dir/gitconfig ~/.gitconfig
#fi

#=============
# Install FZF (autodetects all installed)
#=============

sudo pacman -S fzf

#=============
# Install vim config prerequisties
#=============

sudo pacman -S git curl python-pip universal-ctags ack-grep python-nvim flake8 python-pylint python-isort

#==============
# Set zsh as the default shell
#==============
sudo chsh -s /bin/zsh

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy --"
rm $log_file
