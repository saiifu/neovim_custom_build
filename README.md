## Install Neovim
### Fedora
```bash
sudo dnf install nvim 
```
### Debian 
```bash
sudo apt install nvim
```
Check the nvim version first cause it will only work on version 0.11.3+
```bash
nvim --version
```

Install nvim-lspconfig 
```bash
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

#### Then install these command one after one for python, javascript/typescript, rust, bash 
```bash
sudo npm i -g pyright 
npm install -g typescript typescript-language-server
rustup component add rust-analyzer
npm install -g bash-language-server
```


#### Install Packer
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

Then move the init.lua file to the followin folder 
```bash
~/.config/nvim/ 
```

then run the command 
```bash
nvim
```
and in visual mode press shift+: and type 
```bash
PackerSync
```

## Now you can see auto completion and press ctrl+n for tree file structure
