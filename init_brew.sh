
echo "Do you want to install HomeBrew? [y/n]"
read ANS
[ "$ANS" == "y" ] && \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# =============================

brew_install () {
    echo "Do you want to install $1? [y/n]"
    read ANS
    [ "$ANS" == "y" ] && \
        brew install $1
}

brew_install autojump
brew_install zsh
brew_install yarn
brew_install fd
brew_install fzf
brew_install go
brew_install neovim


echo "Do you want to install gnupg? [y/n]"
# https://stackoverflow.com/questions/39494631/gpg-failed-to-sign-the-data-fatal-failed-to-write-commit-object-git-2-10-0
read ANS
if [ "$ANS" == "y" ]; then
    brew install gnupg

    brew link --overwrite gnupg
    brew install pinentry-mac
    echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
    killall gpg-agent
fi


