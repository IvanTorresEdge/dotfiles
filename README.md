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

## Install Dependencies

```
brew install ag curl fzf node tmux wget
/usr/local/opt/fzf/install
brew tap neovim/neovim
brew install neovim
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
```

## Setup

```
git clone git@github.com:mexpolk/dotfiles.git ~/.dotfiles
cd .dotfiles
git submodule init && git submodule update
npm install
./bin/setup -n "Your Real Name" -m "youremail@example.com" -u github-username
```

## Vim Installation

Inside VIM run `:PluginInstall`

### Setup Gist Token

Go to https://github.com/settings/tokens, and generate a new token. Then create the file `$HOME/.gist-vim` and add the token to that file:

```
token 000000000000000000000000000000000000000
```
### Install Fonts and Schemes for iTerm

* Fonts available under `nerd-fonts` directory (provided by https://nerdfonts.com/)
* Schemes available under `schemes` directory (provided by http://iterm2colorschemes.com/)
