```
 /$$$$$$                            /$$              /$$$$$$$              /$$      /$$$$$$  /$$ /$$
|_  $$_/                           | $/             | $$__  $$            | $$     /$$__  $$|__/| $$
  | $$ /$$    /$$ /$$$$$$  /$$$$$$$|_//$$$$$$$      | $$  \ $$  /$$$$$$  /$$$$$$  | $$  \__/ /$$| $$  /$$$$$$   /$$$$$$$
  | $$|  $$  /$$/|____  $$| $$__  $$ /$$_____/      | $$  | $$ /$$__  $$|_  $$_/  | $$$$    | $$| $$ /$$__  $$ /$$_____/
  | $$ \  $$/$$/  /$$$$$$$| $$  \ $$|  $$$$$$       | $$  | $$| $$  \ $$  | $$    | $$_/    | $$| $$| $$$$$$$$|  $$$$$$
  | $$  \  $$$/  /$$__  $$| $$  | $$ \____  $$      | $$  | $$| $$  | $$  | $$ /$$| $$      | $$| $$| $$_____/ \____  $$
 /$$$$$$ \  $/  |  $$$$$$$| $$  | $$ /$$$$$$$/      | $$$$$$$/|  $$$$$$/  |  $$$$/| $$      | $$| $$|  $$$$$$$ /$$$$$$$/
|______/  \_/    \_______/|__/  |__/|_______/       |_______/  \______/    \___/  |__/      |__/|__/ \_______/|_______/
```

## Setup

```
git clone git@github.com:mexpolk/dotfiles.git ~/.dotfiles
cd .dotfiles
npm install
./bin/setup -n "Your Real Name" -m "youremail@example.com" -u github-username
```

## Vim Installation

```
brew install ag curl fzf neovim tmux wget
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### Inside VIM run `:PluginInstall`

Install patched fonts from https://github.com/powerline/fonts/archive/master.zip
Install iTerm 2 themes from https://github.com/mbadolato/iTerm2-Color-Schemes/zipball/master

### Setup Gist Token

Go to https://github.com/settings/tokens, and generate a new token. Then create the file `$HOME/.gist-vim` and add the token to that file:

```
token 000000000000000000000000000000000000000
```
