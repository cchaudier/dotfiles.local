set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails.git'
Bundle 'L9'
" interface
Bundle 'bling/vim-airline'
Bundle 'gcmt/taboo.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tpope/vim-vividchalk'
Bundle 'endel/vim-github-colorscheme'
Bundle 'goatslacker/mango.vim'
" files
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
" code
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-surround'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'nathanaelkane/vim-indent-guides'
"Bundle ''
Bundle 'tpope/vim-abolish'
" snippet
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
" to retest
Bundle 'tpope/vim-fugitive'
Bundle 'w0ng/vim-hybrid'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}


"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"map <C-n> :NERDTreeToggle<CR>
syntax enable
filetype plugin indent on


let g:taboo_tab_format = '%m[%N]%f '







" Leader
let mapleader = " "

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set noswapfile    "
" http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vim/vundles"))
  source ~/.vim/vundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor
  "             position.
  " Don't do it for commit messages, when the position is
  "               invalid, or when
  "                 " inside an event handler (happens when dropping a file on
  "                 gvim).
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  "
  "           " Enable spellchecking for Markdown
  autocmd BufRead,BufNewFile *.md setlocal spell
  "
  "               " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab


" Display extra whitespace
set nolist listchars=tab:»·,trail:·

"                     " Use The Silver Searcher
"                     https://github.com/ggreer/the_silver_searcher
"                     if executable('ag')
"                       " Use Ag over Grep
"                         set grepprg=ag\ --nogroup\ --nocolor
"
"                           " Use ag in CtrlP for listing files. Lightning
"                           fast and respects .gitignore
"                             let g:ctrlp_user_command = 'ag %s -l
"                             --nocolor -g ""'
"endif

" Numbers
set number
set numberwidth=5
"
" " Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"
"
" " Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
" set wildmode=list:longest,list:full
" set complete=.,w,t
" function! InsertTabWrapper()
"     let col = col('.') - 1
"         if !col || getline('.')[col - 1] !~ '\k'
"                 return "\<tab>"
"                     else
"                             return "\<c-p>"
"                                 endif
"                                 endfunction
"                                 inoremap <Tab>
"                                 <c-r>=InsertTabWrapper()<cr>
"
"                                 " Exclude Javascript files in :Rtags via
"                                 rails.vim due to warnings when parsing
"                                 let g:Tlist_Ctags_Cmd="ctags
"                                 --exclude='*.js'"
"
"                                 " Index ctags from any project, including
"                                 those outside Rails
"                                 map <Leader>ct :!ctags -R .<CR>
"
"                                 " Switch between the last two files
"                                 nnoremap <leader><leader> <c-^>
"
"                                 " Get off my lawn
"                                 nnoremap <Left> :echoe "Use h"<CR>
"                                 nnoremap <Right> :echoe "Use l"<CR>
"                                 nnoremap <Up> :echoe "Use k"<CR>
"                                 nnoremap <Down> :echoe "Use j"<CR>
"
"                                 " Treat <li> and <p> tags like the block
"                                 tags they are
"                                 let g:html_indent_tags = 'li\|p'
"
"                                 " Open new split panes to right and
"                                 bottom, which feels more natural
"                                 set splitbelow
"                                 set splitright
"
"                                 " Quicker window movement
"                                 nnoremap <C-j> <C-w>j
"                                 nnoremap <C-k> <C-w>k
"                                 nnoremap <C-h> <C-w>h
"                                 nnoremap <C-l> <C-w>l
"
"                                 " configure syntastic syntax checking to
"                                 check on open as well as save
"                                 let g:syntastic_check_on_open=1
"
"                                 " Local config
"                                 if filereadable($HOME . "/.vimrc.local")
"                                   source ~/.vimrc.local
"                                   endif
"
"
"
autocmd BufRead,BufNewFile *.jbuilder set filetype=Ruby
autocmd BufRead,BufNewFile *.arb set filetype=Ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
set t_Co=256
colorscheme jellybeans 
set ts=2 sw=2 et
hi IndentGuidesOdd  ctermbg=234
hi IndentGuidesEven ctermbg=235
autocmd  FileType * IndentGuidesEnable
set mouse=nicr
"map h gT
"map l gt
map ♥ <ESC>:w<Return>
imap ♥ <ESC>:w<Return>
map ♢ <ESC>:q<Return>
imap ♢ <ESC>:q<Return>
cmap é <C-t>
"map ù <C-p>
imap ♋ <ESC>:q<Return>
map ♋ :q<Return>
map ⦿ cw
imap ⦿ <C-p>
map <C-n> :NERDTreeToggle<CR>
imap <C-n><ESC>:NERDTreeToggle<CR>
map ✔ :NERDTreeToggle<CR>
imap ✔ <ESC>:NERDTreeToggle<CR>
map ☆ <C-p>
imap ☆ <C-t>
cmap ☆ <C-(>
map! ☆ <)C-t>
map ♧ <<
map ♡ >>

imap ♧ <ESC><<i
imap ♡ <ESC>>>i
map ♤ c$

imap ♤ <ESC>c$
map é $
"imap é -><Return>
map ♞ <C-w>t<C-w>K
map ♘ <C-w>t<C-w>H


map ♋  :tabnew<CR>
map ♈  <C-w><C-w>
map è :tabnew<CR>:NERDTreeToggle<CR>
map <Leader>è :vs<CR>:NERDTreeToggle<CR>
map <Leader>t gt
map <Leader>d gT
map <Leader>é :tabnew<CR><C-p>
map <Leader>s :vs<CR><C-p>
map <Leader>n <C-w>w

map <Leader>1 1gt
map <Leader>2 2gt
map <Leader>3 3gt
map <Leader>4 4gt
map <Leader>5 5gt
map <Leader>6 6gt
map <Leader>7 7gt
map <Leader>8 8gt
map <Leader>9 9gt
map <Leader>a <C-p>
autocmd ColorScheme * highlight Normal ctermbg=None
autocmd ColorScheme * highlight NonText ctermbg=None
hi Normal ctermbg=none


syntax enable
filetype plugin indent on