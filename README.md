# Install Custom Neovim
Things i've used there :
- nvim 
- nnn 
- packer 
- knap 
- lsp 


##### Install nvim on Fedora

```bash
sudo dnf install nvim 
```
##### Install nvim on Debian/Ubuntu

```bash
sudo apt install nvim
```

**Check the nvim version first cause it will only work on version 0.11.3+** 

```bash
nvim --version
```
---

##### Install lspconfig via git clone 

```bash
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

If you want to use latex auto-completion and suggestion also, you can install latex on your machine:

**For Fedora**

```bash
sudo dnf update -y
sudo dnf install texlive-scheme-full -y
```

Check the latex version:

```bash
pdflatex --version
```
---

##### Install Latex LSP (texlab)

Run these commands one by one 

```bash
curl -LO https://github.com/latex-lsp/texlab/releases/latest/download/texlab-x86_64-linux.tar.gz
tar -xvzf texlab-x86_64-linux.tar.gz
sudo mv texlab /usr/local/bin/
sudo chmod +x /usr/local/bin/texlab
```

Check texlab version:

```bash
texlab --version
```
Install Pandoc also. 

```bash
sudo apt install Pandoc
sudo dnf install Pandoc
```
---

##### Install KNAP for auto preview Markdown, HTML 

Run these commands one by one .

```bash
mkdir -p ~/.local/share/nvim/site/pack/plugins/start 
cd ~/.local/share/nvim/site/pack/plugins/start/ 
git clone --depth 1 https://github.com/frabjous/knap.git 
```
---

##### Install NNN for file explorer

```bash
sudo dnf install nnn 

```
**nnn icon configuration (you must have the NERD font installed on your machine)** 

```bash
cd ~
git clone https://github.com/jarun/nnn.git
cd nnn
make O_NERD=1
sudo make install

```
---

**Then install these command one by one for python, javascript/typescript, rust, bash**

```bash
sudo npm i -g pyright 
npm install -g typescript typescript-language-server
rustup component add rust-analyzer
npm install -g bash-language-server
```
---

##### Install Packer

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

**Then move the init.lua file to the followin folder**

```bash
~/.config/nvim/ 
```

Run the command :

```bash
nvim
```
and in visual mode press shift+: and type :

```bash
PackerSync
```


## Now you can see auto completion and press ctrl+n for tree file structure
