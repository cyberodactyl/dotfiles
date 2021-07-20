let mapleader = ","

set number
set clipboard=unnamed
set scrolloff=5
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set mouse=a

" --==== Remappings ====--
"> Insert mode shortcuts 
inoremap kj <C-[>
inoremap jk <END>;<ESC>
inoremap jl <ESC>la
inoremap jm <END>;<ESC>o
inoremap jM <ESC>A {<Enter>
inoremap jn <END>();<ESC>
nnoremap ,k $a;<ESC>

"> Deletion
nnoremap dd "_dd
nnoremap yd dd

"> Textobj-function
nnoremap vaf va{o?(<Enter>V
nnoremap daf va{o?(<Enter>Vd
nnoremap yaf va{o?(<Enter>Vy

"> Textobj-member
nnoremap vam va{ok
nnoremap dam va{okd
nnoremap yam va{oky

"> Parameter operations
nnoremap <Leader>w /[,(]<Enter>w
nnoremap <Leader>b ?[,(]<Enter>b
nnoremap <Leader>p ?)<Enter>i
nnoremap <Leader>a /)<Enter>i, <ESC>a
nnoremap <Leader>A /);<Enter>i, <ESC>a

"> Space mappings
nnoremap <Space>o o<ESC>
nnoremap <Space>O O<ESC>
nnoremap <Space>j :join<Enter>
nnoremap <Space>; a;<ESC>
nnoremap <Space><Space> zz
map <Space>d "_d

"> Delete around/inside new lines
nnoremap da<Space> ?\n\n<Enter>jvNjd
nnoremap di<Space> ?\n\n<Enter>jjdN

"> Inline paste
nnoremap <Space>p mzp"zd$"_dd`z"zp
nnoremap <Space>P mzp"zd$"_dd`z"zp

"> Fast movement
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

"> Increment & sequence
vnoremap <Leader>i <C-a>
vnoremap <Leader>I g<C-a>

"> Replace
nnoremap ri{ "_di{P
nnoremap riB "_diBP
nnoremap rib "_dibP
nnoremap ri' "_di'P
nnoremap ri" "_di"P
nnoremap r$ "_d$p
nnoremap riw "_diwP
nnoremap riW "_diWP

"> Remove typeparameter surround
nnoremap dst "zdiw"zpbdB

"> Visual
nmap <Leader>v <C-V>
vnoremap <Leader>j <ESC>
vnoremap D "_d

"> Save as root
cmap w!! w !sudo tee > /dev/null %
