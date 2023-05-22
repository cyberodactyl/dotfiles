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
inoremap kd <ESC>dd
inoremap jk <END>;<ESC>
inoremap jK <END>();<ESC>
inoremap jl <ESC>la
inoremap jL <ESC>A
inoremap jh <ESC>hi
inoremap jH <ESC>I
inoremap jm <ESC>la {<Enter>
inoremap jM () {<Enter>
inoremap j, () => {<Enter>
inoremap jN <END>;<Enter>
inoremap jn <ESC>o
inoremap j; <ESC>lx$i)<ESC>

"> Normal mode shortcuts
nnoremap ,k A;<ESC>
nnoremap ,K A();<ESC>
nnoremap ,l A,<Enter>
nnoremap ^ 0
nnoremap 0 ^

"> Switch jump
nnoremap <Tab> ``

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
nmap <Leader>j :join<Enter>()
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
vnoremap <S-j> 5jzz
vnoremap <S-k> 5kzz

"> Camel-case movement
map <S-l> /[A-Z]<Enter>
map <S-h> ?[A-Z]<Enter>

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
nnoremap rw "_diwP
nnoremap rW "_diWP
nnoremap r\\w rw
nnoremap r\\W rW

"> Mark shortcuts
nnoremap mm mmVV
nnoremap <Leader>y mnyy`mp
nnoremap <Leader>d mnyd`mp
vnoremap <Leader>y mny`mp
vnoremap <Leader>d mnd`mp

"> Remove typeparameter surround
nnoremap dst "zdiw"zpbdB

"> Async task to method
nnoremap das /async<Enter>df<:s/>/<Enter>

"> Method to async task
nnoremap cmt ^wiasync Task<<ESC>ea><ESC>^

"> Void to async task
nnoremap cvt ^wiasync <ESC>lcwTask<ESC>^

"> Visual
nmap <Leader>v <C-V>
vnoremap <Leader>j <ESC>
vnoremap D "_d