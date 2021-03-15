let mapleader = ","

set number
set clipboard=unnamed
set scrolloff=5

" Remapings
inoremap kj <C-[>
inoremap jk <ESC>$a;<ESC>
inoremap jl <ESC>la
inoremap jm <ESC>o{<Enter>
inoremap jn <END>();<ESC>
nnoremap <Leader>" wbi"<ESC>ea"<ESC>
nnoremap <Leader>> wbi\<<ESC>ea><ESC>
nnoremap <Leader>) wbi(<ESC>Ea)<ESC>
nnoremap <Leader>p ?)<Enter>i

nnoremap <Leader>j :join<Enter>
nnoremap <S-j> 3j
nnoremap <S-k> 3k

cmap #m 

cmap w!! w !sudo tee > /dev/null %