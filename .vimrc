"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set encoding=utf-8

if has('python3')
  silent! python3 1
endif


" Visual appearance.
syntax on
set number
set nowrap
set fillchars+=vert:\ " Invisible vertical split line.
set lazyredraw " Make things faster.
"let loaded_matchparen = 1 " Turn off parenthesis matching.
set showcmd

" Status line.
set laststatus=2 " Always show status line.
set statusline=%F " Full path to file.
set statusline+=%(\ [%M%R]%) " Modified and readonly flags.
set statusline+=%= " Switch to right aligned.
set statusline+=%l/%L " Current line / total lines.

" Whitespace.
" Spaces instead of tabs.
set expandtab
" How many columns a tab counts for.
set tabstop=4
" How many columns vim uses when you hit Tab in insert mode.
set softtabstop=4
" How many columns of text is indented with <<, >>, and cindent.
set shiftwidth=4
set backspace=indent,eol,start
set smarttab
" Indentation
set autoindent
set cindent
set showmatch


" Highlight column 80.
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=246 guibg=#2d2d2d

" Search.
set incsearch
set ignorecase
set smartcase

" Switch buffers without saving.
set hidden

" Tab in command mode displays all completions.
set wildmenu
" Ignore filetypes in tab completion.
set wildignore+=*.aux,*.log,*.out,*.pdf

" Start scrolling 3 lines from border.
set scrolloff=3

" Matching brace
set showmatch

" Keep working dir clean
set directory=~/.tmp//,/tmp//,.
set backupdir=~/.tmp//,/tmp//,.

" Sudo
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Saving shortcut
nnoremap <C-W> :w <CR>

" Mapleader shortcuts
let mapleader="'"

" Create new split and switch to it.
nnoremap <Leader>w <C-w>v<C-w>l
nnoremap <Leader>s <C-w>s<C-w>j
" Close split
nnoremap <Leader>c <C-w>c

" Easier movement in split windows.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Calls (saves first) make
nnoremap <Leader>m :w\|silent make\|redraw!\|cc<CR>

" Quick toggle of diff mode.
nnoremap <Leader>df :call DiffToggle()<CR>

function! DiffToggle()
    if &diff
        diffoff
    else
        diffthis
    endif
:endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/plugged.vim
call plug#begin()

Plug 'gmarik/Vundle.vim'

Plug 'godlygeek/tabular'
nnoremap <Leader>a :Tabularize /&<CR>
vnoremap <Leader>a :Tabularize /&<CR>

Plug 'sjl/gundo.vim'
noremap <Leader>u :GundoToggle<CR>

"Plug 'derekwyatt/vim-scala'
"Plug 'flazz/vim-colorschemes'
"Plug 'JuliaLang/julia-vim'

Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'honza/vim-snippets'
"Plug 'severin-lemaignan/vim-minimap'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:tex_flavor='latex'
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   'file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
Plug 'Valloric/YouCompleteMe'
    if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme



Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

"doeplete completion for latex
 " Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"let g:deoplete#enable_at_startup = 1

"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

"let g:UltiSnipsUsePythonVersion = 3

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

"set rtp+=~/.vim/bundle/vim-snippets/snippets/
"colourscheme
Plug 'morhetz/gruvbox'

call plug#end()            " required
filetype plugin indent on    " required


" Gruvbox settings
colorscheme gruvbox
set background=dark
se colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" use deoplete
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})
"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
" let g:deoplete#disable_auto_complete = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on

" Recognize .tex files as latex (instead of plaintex) for syntax highlighting.
let g:tex_flavor="latex"

"vim-latex-live settings
autocmd FileType tex setl updatetime=1
"let g:livepreview_previewer = 'open -a Preview'

autocmd FileType tex inoremap <buffer> <C-T> :LLStartPreview %<CR>


"autocmd FileType tex set autoindent
" Set the make program (rubber)
"autocmd FileType tex set makeprg=rubber\ --inplace\ --maxerr\ 1\ \ --pdf\ --short\ --quiet\ --force\ %
" Mappings for compiling Latex file
"autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
"autocmd FileType tex nmap <buffer> <C-T> :!rubber --pdf --force --short %<CR>
"autocmd FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
"autocmd FileType tex nmap <buffer> C :!rubber --clean<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace on save.
autocmd BufWrite * :%s/\s\+$//e

" Turn off colorcolumn in diff mode.
autocmd FilterWritePre * if &diff | set cc= | endif

" Skeleton files
autocmd! BufNewFile * silent! 0r ~/.vim/skel/template.%:e
