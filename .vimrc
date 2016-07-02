execute pathogen#infect()
filetype plugin indent on
syntax on
color desert
set nu
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set smartindent

map <Tab> <C-W>w
map <S-Tab> <C-W>p
map <=> <C-W>p
map <Bar> :vsp
map -     :sp

set viminfo='200,h
set history=200

" CommandT
map <silent> <leader>ff :CommandT<CR>
map <silent> <leader>fb :CommandTBuffer<CR>
map <silent> <leader>fr :CommandTFlush<CR>
