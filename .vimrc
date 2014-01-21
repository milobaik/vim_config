
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

" let Vundle manage Vundle
" " required! 
"Bundle 'gmarik/vundle'

" " My bundles here:
" "

"Bundle 'tpope/vim-fugitive'
"Bundle 'mbadran/headlights'

call pathogen#incubate()
call pathogen#helptags()

set tags=./tags;/
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set autochdir
set tabstop=4

syntax enable
" editor color scheme
if has ( 'gui_running' )
    set background=dark
else
    set background=light
endif
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

if has("autocmd")
  filetype plugin indent on
endif
set shiftwidth=4
set tabstop=4
set expandtab

" F11 to toggle thru line numbering modes
nmap <silent> <F11> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
    let buffer_numbers = {}
    for quickfix_item in getqflist()
        let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
    endfor
    return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" keymaps for command-t
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" keymap for tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

