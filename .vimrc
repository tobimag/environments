if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/Townk/vim-autoclose'
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'https://github.com/danro/rename.vim'
call plug#end()

map <Tab> <C-W>w
map <Bar> <C-W>v<C-W><Right>
map -     <C-W>s<C-W><Down>
map <C-n> :NERDTreeToggle<CR>

set expandtab
set shiftwidth=3
set softtabstop=3
set smartindent

let NERDTreeShowHidden=1

" Display filename
set laststatus=2
