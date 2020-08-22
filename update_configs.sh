#!/bin/bash

# ===================================================
# STEP 1: Update local config if remote has changed
# ===================================================

cp .vimrc /tmp/.vimrc
cp .gitconfig /tmp/.gitconfig

mkdir -p /tmp/.config/nvim/
cp .zshrc /tmp/.zshrc

# Fetch new changes from remote repository
git pull

update_local () {
    # If remote repo has been updated, then write it to local.
    cmp --silent /tmp/$1 $1 || (
        cp $1 ~/$1
    )
}

update_local .zshrc
update_local .config/nvim/init.vim
update_local .vimrc

# Needs to be cleaned before added to git-history. Therefore different function.
cmp --silent /tmp/.gitconfig .gitconfig || (

    # Save user-data
    GIT_EMAIL=`grep "email" ~/.gitconfig`
    GIT_NAME=`grep "name" ~/.gitconfig`
    GIT_SIGNINGKEY=`grep "signingkey" ~/.gitconfig`

    # Overwrite local
    cp .gitconfig ~/.gitconfig

    # Append user-data at end of config file
    echo "[user]" >> ~/.gitconfig
    echo "$GIT_EMAIL" >> ~/.gitconfig
    echo "$GIT_NAME" >> ~/.gitconfig
    echo "$GIT_SIGNINGKEY" >> ~/.gitconfig
)

# ===================================================
# STEP 2: Update remote config if local has changed
# ===================================================

cp ~/.zshrc /tmp/.zshrc
cp ~/.vimrc /tmp/.vimrc
cp ~/.gitconfig /tmp/.gitconfig
cp ~/.config/nvim/init.vim /tmp/.config/nvim/init.vim

# Clean userdata from gitconfig
sed -i '' '/\[user\]/d' /tmp/.gitconfig
sed -i '' '/signingkey/d' /tmp/.gitconfig
sed -i '' '/email/d' /tmp/.gitconfig
sed -i '' '/name/d' /tmp/.gitconfig

update_remote () {
    cmp --silent /tmp/$1 $1 || (
        # Local file has been updated. Send it to repo.
        cp /tmp/$1 $1;
        git add $1;
        git -c commit.gpgsign=false commit -m "Autoupdate $1";
        git push;
    )
}

update_remote .zshrc
update_remote .config/nvim/init.vim 
update_remote .vimrc
update_remote .gitconfig

# Clean up
rm /tmp/.gitconfig
rm /tmp/.vimrc
rm /tmp/.zshrc
rm -rf /tmp/.config
