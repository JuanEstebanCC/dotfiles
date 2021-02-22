set number
set noshowmode
set mouse=a
set noerrorbells
set tabstop=4 softtabstop=4
set numberwidth=3
set nu
set smartcase
set noswapfile
set nowrap
set nobackup
set incsearch
set smartindent
set clipboard=unnamed
syntax on
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2

call plug#begin('~/.vim/plugged')
"Themes
"Plug 'ghifarit53/tokyonight-vim'
Plug 'arcticicestudio/nord-vim'
" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'gko/vim-coloresque'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
	  \ 'do': 'npm install',
	  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'eslint/eslint'
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis/ale'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'alvan/vim-closetag'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'wakatime/vim-wakatime'



call plug#end()

" TokyoNight theme (Colorscheme)
set termguicolors

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
colorscheme nord


"Nerdtree Quit when opens
let NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"Keybinds
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <F3> :Autoformat<CR>
" Airline settings
let g:airline_powerline_fonts = 1

" Emmet shortcuts
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" Linter (Ali) setting
au BufWrite * :Autoformat
" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

"Terminal Integrated
"" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+t
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <Leader>t :call OpenTerminal()<CR>


" Open fzf on search mode
map <C-f>  <Esc><Esc>:Files!<CR>
inoremap <C-f>  <Esc><Esc>:BLines!<CR>


