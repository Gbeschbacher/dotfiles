call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'crusoexia/vim-monokai'
Plug 'slim-template/vim-slim'
Plug 'mileszs/ack.vim'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ngmy/vim-rubocop'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'airblade/vim-gitgutter'
Plug 'thoughtbot/vim-rspec'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-endwise'
Plug 'rakr/vim-one'
Plug 'endel/vim-github-colorscheme'
Plug 'w0rp/ale'
Plug 'milkypostman/vim-togglelist'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'jremmen/vim-ripgrep'
call plug#end()

set wildmenu
set wildmode=full

set guioptions=gm

set nocompatible
set omnifunc=syntaxcomplete#Complete

" Github flavoured markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='google-chrome'

" vim-yaml-helper
let g:vim_yaml_helper#always_get_root = 1
let g:vim_yaml_helper#auto_display_path = 1
set updatetime=100

if executable("rg")
  set grepprg=rg\ --color=never\ --no-heading\ --smart-case
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
  let g:ackprg = 'rg --vimgrep --smart-case --no-heading'
  noremap <C-S-F> :Ack<space>

  " bind K to grep word under cursor
  nnoremap K :Rg<CR>
endif

" disable visual bell and beeping
set vb

set number
set hidden
set splitright
set splitbelow
filetype plugin on
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set wrap
set linebreak
set ignorecase
set smartcase

" highlight search results, use :set noh to temporarly disable the highlight until the next search
set hls
" remove search highlights
nnoremap <leader><space> :nohlsearch<CR>

syntax enable
syntax on
let g:ctrlp_dont_split = 'nerdtree'

highlight Normal ctermbg=235
set t_Co=256

" Automatically :write before running commands
set autowrite
set listchars=nbsp:¬
set list
set colorcolumn=100

let g:NERDTreeWinPos = "left"
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', 'red', '#151515')

" airline configuration
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0

let g:ale_sign_column_always = 1
let g:ale_set_signs = 1
let g:ale_set_balloons = 0
let g:ale_open_list = 0
let g:ale_sign_error = "!!"
let g:ale_sign_wagning = "--"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\   'scss': ['stylelint'],
\   'slim': ['slim_lint'],
\   'javascript': ['eslint'],
\   'vue' : ['eslint']
\}

let g:vim_markdown_folding_disabled = 1

" auto remove whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" leader must be defined BEFORE any mapping uses it
let mapleader = ","

" next buffer
nmap <C-L> :bn<CR>
" previous buffer
nmap <C-H> :bp<CR>
" delete buffer
nmap <C-O> :bd<CR>
" fuzzy search in open buffer
map <leader>p :CtrlPBuffer<CR>


nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
map <leader>h :nohlsearch<CR>
nmap <leader>d :ALEFix<CR>

set noswapfile

colorscheme onehalflight
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
map <C-v> :r ~/.vimbuffer<CR>
