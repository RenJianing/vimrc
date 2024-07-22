" Basic "
set cc=80
set cursorline
set showcmd
set showmatch
set autochdir

" Linux Kernel need tab takes up 8 spaces, and do not expaned to space "
set tabstop=8
set shiftwidth=8
set noexpandtab

" unmap key for vim-mark
unmap <Leader>m
unmap <Leader>n
unmap <Leader>r

" vim-plug "
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/taglist.vim'
let g:Tlist_Show_One_File = 0
let g:Tlist_Auto_Update = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Auto_Open = 0
let g:Tlist_Use_Right_Window = 0
Plug 'ludovicchabant/vim-gutentags'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'zivyangll/git-blame.vim'
call plug#end()

" Show lines, toggled with <F2> "
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Show tab and tail space, toggled with <F3> "
set listchars=tab:»■,trail:■
nnoremap <F3> :set list!<Cr>

" Show taglist, toggled with <F4> "
map <F4> <Esc>:TlistToggle<Cr>

" Enable mouse by default, toggle with <F5> "
set mouse=a
nnoremap <F5> :exec &mouse=='a' ? ':set mouse-=a' : ':set mouse=a'<CR>

" Switch user<F6> and kernel<F7> coding style "
nnoremap <F6> :set tabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>
nnoremap <F7> :set tabstop=8<CR>:set shiftwidth=8<CR>:set noexpandtab<CR>

" resize horzontal split window "
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window "
nmap <C-Right> <C-W>><C-W>>
nmap <C-Left> <C-W><<C-W><

" open recent used file in new tab "
nmap <C-n> :tabedit<CR>,f

nmap <C-h> gT
nmap <C-l> gt

" map cscope "
" cscope -Rbq "
" :cs add ~/Code/linux-stable/cscope.out ~/Code/linux-stable -C "
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" Map fzf "
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>f? :GFiles?<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fc :Commits<CR>

" vim-blame "
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

set path+=/usr/local/opt/ffmpeg/include
set path+=/Volumes/Code/kernel/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include

" Auto load when .vimrc updated "
autocmd! bufwritepost .vimrc source %
