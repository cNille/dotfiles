

echo "Install vundle..."
VUNDLE="$HOME/.vim/bundle/Vundle.vim"
[ ! -d "$VUNDLE" ] && \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Done."

echo "Install vundle plugins..."
vim +PluginInstall +qall
