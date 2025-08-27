let mapleader=" "

:set guioptions-=T
:set guioptions-=m

" Disable mouse
:set mouse=
if !has('nvim')
    :set ttymouse=
endif

:set ai ts=4 sts=4 et sw=4
" Always cd to the current file's directory
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /

:set encoding=utf-8

:set scrolloff=4

:set ignorecase
:set smartcase

:set incsearch
:set hidden

" stay on the same column after buffer change
:set nostartofline

" backspace should behave as expected
set backspace=indent,eol,start

" from http://vi.stackexchange.com/a/2770
nnoremap <silent> n n:call HighlightNext(0.1)<cr>
nnoremap <silent> N N:call HighlightNext(0.1)<cr>
nnoremap <silent> * *:call HighlightNext(0.1)<cr>
nnoremap <silent> # #:call HighlightNext(0.1)<cr>

function! HighlightNext (blinktime)
    let target_pat = '\c\%#'.@/
    let ring = matchadd('IncSearch', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

:syntax on

:filetype plugin on

:nnoremap <leader>w :write<CR>
:nnoremap <leader>e :edit<space>
:nnoremap <leader>d :bd<CR>
:nnoremap <leader>q :quit<CR>

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j

:set shortmess+=I

:imap jk <Esc>

:set background=dark
:colorscheme default

" respace function sets unix line endings, removes trailing whitespace,
" and converts TABs to spaces
function! ReSpace()
    :retab
    :set ff=unix
    :%s/\s\+$//
endfunction

" file types
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufNew,BufRead *.md setlocal textwidth=72

autocmd BufNewFile,BufNew,BufRead *.py setlocal softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufNew,BufRead *.js setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufNew,BufRead *.ts setlocal softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufNew,BufRead *.html setlocal softtabstop=2 shiftwidth=2
