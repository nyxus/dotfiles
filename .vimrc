set modeline            " Execute Ex, Vi and Vim modelines
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set hlsearch            " highlight all matches of the previous search pattern
set number              " show line numbers
set relativenumber      " show line relative from the current line
set visualbell t_vb=    " disable terminal beep/bell

set tabstop=4
set softtabstop=0
"set expandtab
set shiftwidth=4
set smarttab

set cindent
set splitbelow
set splitright

" Needed for NERD Commenter
filetype plugin on


" Suffixes that get lower priority when doing tab completion for filenames.
"These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.obj,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'scrooloose/nerdtree'
"Plugin 'jdkanani/vim-material-theme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sheerun/vim-polyglot'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'glts/vim-radical'
Plugin 'glts/vim-magnum'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'aklt/plantuml-syntax'
Plugin 'simnalamburt/vim-mundo'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'PProvost/vim-ps1'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'pearofducks/ansible-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kergoth/vim-bitbake'
Plugin 'reedes/vim-lexical'
Plugin 'osamuaoki/vim-spell-under'

call vundle#end()
	
" Remap ALT key: https://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
" Split movement
" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><Up>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>

" Auto reload vim on vimrc changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $VIMRC | endif
augroup END

" Key bindings
map <F2> :NERDTreeToggle<CR>
map <F12> :YcmCompleter GoTo<CR>
map <F3> :FSHere<CR>
nnoremap <F4> :nohl<CR>
nnoremap <F6> :YcmCompleter FixIt<CR>
nnoremap <F7> :YcmCompleter GetType<CR>
nnoremap <F8> :MundoToggle<CR>
nnoremap <LEADER>s :Ack! <C-R><C-W> <CR>

" Show and hide all characters
"backup: set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

set listchars=tab:▸·,eol:¬,trail:~,extends:>,precedes:<,nbsp:·
set showbreak=↪\
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>


let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-h>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
endif

au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o|a|ko)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


" Spell check
let g:lexical#spell = 1         " 0=disabled, 1=enabled
set spell spelllang=en_gb

let g:highlightedyank_highlight_duration = 100
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

" File syntax settings
au BufNewFile,BufRead *.bb setlocal ft=bitbake
au BufNewFile,BufRead *.bbappend setlocal ft=bitbake

" Theme settings
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

let g:spell_under='solarized'
:silent! colorscheme solarized
