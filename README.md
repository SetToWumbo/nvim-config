# nvim-config
repo for my neovim config

notes: 

tree-sitter install commands that ACTUALLY WORKED:

curl -OL https://github.com/tree-sitter/tree-sitter/releases/download/v0.25.10/tree-sitter-linux-x64.gz
mkdir -p $HOME/bin
gunzip tree-sitter-linux-x64.gz
mv tree-sitter-linux-x64 $HOME/bin/tree-sitter
chmod u+x $HOME/bin/tree-sitter
export PATH=$HOME/bin:$PATH
