
```
brew install neovim tmux fzf
brew install reattach-to-user-namespace --with-wrap-pbcopy-and-pbpaste
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Inside VIM run `:PluginInstall`

Install patched fonts from https://github.com/powerline/fonts/archive/master.zip
Install iTerm 2 themes from https://github.com/mbadolato/iTerm2-Color-Schemes/zipball/master

Setup Gist Token

Go to https://github.com/settings/tokens, and generate a new token. Then create the file `$HOME/.gist-vim` and add the token to that file:

```
token 000000000000000000000000000000000000000
```
