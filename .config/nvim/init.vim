"=======================================
" Setup plugins
"=======================================
call plug#begin('~/.vim/plugged')

" Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" Snippets plugin
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Show derectory tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Interactive filter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For tokyonight-vim
Plug 'sheerun/vim-polyglot'

" Theme
Plug 'ghifarit53/tokyonight-vim'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" Rainbow csv
Plug 'mechatroner/rainbow_csv'

" Initialize plugin system
call plug#end()

"=======================================
" tokyonight-vim
"=======================================
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:airline_theme = 'tokyonight'
let g:lightline = {'colorscheme' : 'tokyonight'}

colorscheme tokyonight

"=======================================
" vim-easy-align
"=======================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"=======================================
" ultisnips
"=======================================

"=======================================
" fzf.vim
"=======================================
set rtp+=/usr/local/opt/fzf

"=======================================
" nerdtree
"=======================================
" NERDTreeでdotfilesも表示する
let NERDTreeShowHidden=1

" ===== Setup =====
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" yankしたときclipboardにもcopy(逆も)
set clipboard+=unnamed
" ファイル保存時に行末のspaceを削除
autocmd BufWritePre * :%s/\s\+$//ge
" ===== Setup =====

" ===== Setup Keybinding =====
inoremap <silent> jj <ESC>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
" ===== Setup Keybinding =====

" ===== Setup Design =====
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドライン入力時にTabで候補表示できるようにする
set wildmenu
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable
" ===== Setup Design =====

" ===== Setup Tab =====
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" ===== Setup Tab =====

" ===== Setup Search =====
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" ===== Setup Search =====
