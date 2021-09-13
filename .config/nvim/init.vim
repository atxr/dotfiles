set clipboard+=unnamedplus
set number relativenumber
set mouse=a

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

autocmd FileType * RainbowParentheses

let g:cmake_link_compile_commands = 1

source $HOME/.config/nvim/vim-plug/plugins.vim

source $HOME/.config/nvim/basics/remap.vim
source $HOME/.config/nvim/basics/tab.vim

source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim

source $HOME/.config/nvim/plug-config/floaterm.vim
