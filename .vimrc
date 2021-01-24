"---------- Pluginの管理 ----------"
" vim-plugでのpluginの導入
" 参考：https://github.com/junegunn/vim-plug
" Usage:
"   vimを開き':PlugInstall'でpluginのinstall
call plug#begin('~/.vim/plugged')

" Material theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'cocopon/iceberg.vim'

" Customize the status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go'

call plug#end()
"---------- Pluginの管理 ----------"

" kaicataldo/material.vim
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
let g:lightline = { 'colorscheme': 'material_vim' }
colorscheme material

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

" Material airline for vim-airline
let g:airline_theme='iceberg'

"colorscheme iceberg

" 行番号を表示
set number

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

" Setting for go language
let g:go_fmt_command = "goimports"

" jjでインサートモードからノーマルモードへ切り替え
inoremap <silent> jj <ESC>

" INSERTモードの場合にカーソルを"|"にする
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

