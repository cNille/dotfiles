Here are some configurations i have on my mac. This is a quick list of actions to reproduce my laptop so that i feel at home. 

## Parts:
+ Vim installation 
+ Bash rc configs
+ Autojump
+ git configs
+ ssh configs
+ Install brew
+ Add svorak
+ Install zsh
+ GPG key 

+ Install firefox
+ Install iTerm
    * https://www.iterm2.com/downloads.html
+ Install karabiner and add capslock -> backspace_or_delete
    * https://karabiner-elements.pqrs.org/
+ Install Mullvad net
    * https://mullvad.net/sv/download/
+ Install Dropbox
    * https://www.dropbox.com/downloading
+ Install Creative Cloud
    * https://www.adobe.com/creativecloud/desktop-app.html#
+ Install wacom tablet driver: Wacom pro small
    * https://www.wacom.com/en-us/support/product-support/drivers

- Add photo backgrounds.

# Documentation

First time to install all programs, run:
```
./all_init.sh
```
It will run all `init_*.sh` scripts.

To install cronjobs to make sure that all changes in dotfiles are logged and
updated in this repo, then run:
```
./install_cronjobs.sh
```

It will every hour scripts to check on the dotfiles.


# Old documentation


## SSH
Generate ssh-keys for all the application you want. I think it's best practice having different key pairs for each service. This is how you set it up;

```
ssh-keygen -t rsa
```

And choose a good name for your file. For e.g: `~/.ssh/id_rsa_my_github_account`
Then create a config file (`~/.ssh/config`) for different hosts;

```
Host github.com
	HostName github.com
	User git
	IdentityFile ~/.ssh/id_rsa_my_github_account
```

Add your ssh-key to github. To copy your key;

```
cat ~/.ssh/id_rsa_my_github_account | pbcopy
```

## VIM installation
Install vundle;
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open a vim and type :PluginInstall
