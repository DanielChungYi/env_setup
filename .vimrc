set fileencodings=utf8,big5
" key mapping
"inoremap {<Cr> {<Cr>}<Esc>ko<Tab>
"inoremap jf <esc>

" exit terminal mode
"if exists(':tnoremap')
"    tnoremap <Esc> <C-\><C-n>
"endif

" alias function
function! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
    \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
    \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAlias("W","w")

" auto script
augroup cur_col
    autocmd WinEnter * setlocal cursorcolumn
    autocmd WinLeave * setlocal nocursorcolumn
augroup END

augroup num_rel
    autocmd WinEnter * setlocal relativenumber
    autocmd WinLeave * setlocal norelativenumber
augroup END

function! CleanupSpace()
    :%s/\s\+$//e
    :%s/ \+\t/\t/e
endfunction
command! CleanupSpace call CleanupSpace()
"autocmd BufWritePre * :%s/\s\+$//e
"
function! UnifyTabIndent()
    :set expandtab
    :%retab!
    :set noexpandtab
    :%s/^ \{8\}/\t/e
    :%s/^\(\t\+\) \{8\}/\1\t/e
    :%s/^\(\t\+\) \{8\}/\1\t/e
    :%s/^\(\t\+\) \{8\}/\1\t/e
    :%s/^\(\t\+\) \{8\}/\1\t/e
endfunction
command! UnifyTabIndent call UnifyTabIndent()

function! IwhiteToggle()
    if &diffopt =~ 'iwhite'
        set diffopt-=iwhite
    else
        set diffopt+=iwhite
    endif
endfunction
command! IwhiteToggle call IwhiteToggle()

" status
set showcmd

" layout
set scrolloff=3

set nowrap
set linebreak

" search
set hlsearch
set ignorecase
set smartcase

" line %
set number
set relativenumber

" tab
set tabstop=4
set shiftwidth=4
set expandtab
%retab!
set autoindent

"set foldmethod=indent

" mouse mod
set mouse=n
nnoremap <RightMouse> <RightMouse>:<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>

"set paste
set clipboard=unnamedplus

" line high light
set cursorcolumn
set cursorline

" color customer
set t_Co=256
hi LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
hi CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE
hi CursorLine cterm=bold ctermfg=NONE ctermbg=DarkGrey
hi CursorColumn cterm=bold ctermfg=NONE ctermbg=DarkGrey


" gcc
function! GCC()
    exec "!gcc -std=c99 %"
    exec "!./a.out"
endfunction
command! GCC call GCC()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" C O N F I N G """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Reference: https://github.com/junegunn/vim-plug
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Shorthand notation:
"   Plug 'username/toolname'
"   => fetch url: https://github.com/username/toolname

"" powerful status bar
Plug 'vim-airline/vim-airline'

"" Code alignment tool
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" Auto complete code
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
let g:snipMate = { 'snippet_version' : 1 }

"" Filemanager
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' } " On-demand loading
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' } " On-demand loading

"" useful colorscheme selector
Plug 'https://github.com/c9s/colorselector.vim.git'

"" make vim more sensible
Plug 'https://github.com/tpope/vim-sensible.git'

"" show indent line
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_enabled = 1


"" auto commentary
Plug 'https://github.com/tpope/vim-commentary.git'

"" easy to delete/add/change surroundings
Plug 'https://github.com/tpope/vim-surround.git'

Plug 'zivyangll/git-blame.vim'

"" search and move to
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

if exists(':tnoremap')
    "" fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "" floating terminal
    Plug 'voldikss/vim-floaterm'
    command! XPLR FloatermNew --width=0.8 --height=0.8 xplr
    command! RANGER FloatermNew --width=0.8 --height=0.8 ranger
    "" preview markdown with browser
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
endif

" color theme grunbox
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

if filereadable($HOME . "/.vim/andes.vim")
    source $HOME/.vim/andes.vim
endif

if filereadable($HOME . "/.vim/custom.vim")
    source $HOME/.vim/custom.vim
endif

" theme color
set list " show all white spaces as character
set background=dark 
let g:gruvbox_contrast_dark='hard'
syntax on
try
    colorscheme gruvbox
    " colorscheme Tomorrow-Night-Eighties
catch
   " colorscheme Tomorrow-Night-Eighties
    colorscheme torte
    "colorscheme gruvbox
endtry

