call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'morhetz/gruvbox'

Plug 'flrnprz/candid.vim'

Plug 'vim-scripts/The-NERD-Tree'

Plug 'terryma/vim-multiple-cursors'

Plug 'vim-scripts/taglist.vim'

Plug 'roxma/nvim-yarp'

Plug 'FromtonRouge/OmniCppComplete'

Plug 'Raimondi/delimitMate'

Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

filetype plugin indent on

" Key settings

let mapleader = ","
nnoremap <leader>. <C-W>
nnoremap <silent> <leader>q :tabp<CR>
nnoremap <silent> <leader>w :tabn<CR>

nnoremap <silent> <leader>e :exe "resize +3"<CR>
nnoremap <silent> <leader>d :exe "resize -3"<CR>
nnoremap <silent> <leader>s :exe "vertical resize +8"<CR>
nnoremap <silent> <leader>a :exe "vertical resize -8"<CR>

syntax on

set autoindent
set cindent
filetype plugin indent on

set number

set background=dark
colorscheme gruvbox
set t_ut=

set tabstop=4
set shiftwidth=4
set expandtab

set ignorecase
set smartcase

set incsearch
set hlsearch

set mouse=a

" Copy 'n' Paste
vnoremap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
inoremap <C-v> :r ~/.vimbuffer<CR>

" vim-airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extension#tagbar#enabled    = 0
set laststatus=2

" The-NERD-Tree
autocmd BufEnter * lcd %:p:h

nnoremap <F3> :NERDTreeToggle<cr>

let NERDTreeShowLineNumbers = 1
let g:NERDTreeWinPos = "left"

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Taglist
set tags+=/usr/include/tags

" OmniCppComplete
filetype on
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 0 " DO NOT autocomplete after '::'; to see every member of std is a torture
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

" press SHIFT-TAB to activate auto completion
inoremap <S-TAB> <C-X><C-O>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

nnoremap <silent> <F5> :!cd ..<CR>:!ctags -R *<CR>


" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight     = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight      = 1
let g:cpp_no_function_highlight     = 1


" delimitMate
let delimitMate_expand_cr    = 1
let delimitMate_expand_space = 1
