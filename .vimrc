let mapleader = ","

set number
set clipboard=unnamed
set scrolloff=5
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set mouse=a
set rnu

" --==== Remappings ====--
"> Insert mode shortcuts 
inoremap kj <C-[>
inoremap kc <ESC>cc
inoremap jk <END>;<ESC>
inoremap jK <END>;<ESC>o
inoremap jl <ESC>la
inoremap jm <ESC>la {<Enter>
inoremap jM () {<Enter>
inoremap jn <ESC>o
inoremap jN <ESC>O
nnoremap ,k $a;<ESC>
nnoremap ,l $a,<Enter>

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
nnoremap <Leader>e /)<Enter>i, <ESC>a
nnoremap <Leader>E /);<Enter>i, <ESC>a
nnoremap <Leader>a /(<Enter>a

"> Leader mappings
nnoremap <Leader>j :join<Enter>;
nnoremap <Leader>u V~<Esc>

"> Space mappings
nnoremap <Space>; a;<ESC>
nnoremap <Space><Space> zz
nnoremap <Space>l i<Space><ESC>l
nnoremap <Space>h db
nnoremap <Space>j o<ESC><Space>
nnoremap <Space>k O<ESC><Space>
nnoremap <Space>d dd<Space>

"> Delete around/inside new lines
nnoremap da<Space> ?\n\n<Enter>jvNjd
nnoremap di<Space> ?\n\n<Enter>jjdN

"> Inline paste
nnoremap <Space>p mzp"zd$"_dd`z"zp

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

"> Mark shortcuts
nnoremap mm mmVV
map <Leader>y Y`mp
map <Leader>d d`mp

"> Remove typeparameter surround
nnoremap dst "zdiw"zpbdB

"> Visual
nmap <Leader>v <C-V>
vnoremap <Leader>j <ESC>
vnoremap D "_d

"> Save as root
cmap w!! w !sudo tee > /dev/null %