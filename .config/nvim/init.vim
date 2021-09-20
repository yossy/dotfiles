let mapleader = "\<Space>"
"=======================================
" Setup plugins
"=======================================
call plug#begin('~/.vim/plugged')

" Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

Plug 'easymotion/vim-easymotion'

" Show File tree
Plug 'lambdalisue/fern.vim'
" File treeにgit statusを表示
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" apply colors on Nerd Fonts.
Plug 'lambdalisue/glyph-palette.vim'

" File icons
Plug 'ryanoasis/vim-devicons'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Interactive filter
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" For tokyonight-vim
Plug 'sheerun/vim-polyglot'

" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" Rainbow csv
Plug 'mechatroner/rainbow_csv'

" 囲み文字の変更tool
Plug 'tpope/vim-surround'

" vim-surroundでの変更を`.`で繰り返しできるようにする
Plug 'tpope/vim-repeat'

" gcで選択した複数行を一括コメントアウトする
Plug 'tpope/vim-commentary'

" Gitの追加・変更・削除を行番号の左で可視化
Plug 'airblade/vim-gitgutter'

" For Git commands
Plug 'tpope/vim-fugitive'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'

" For Ruby
" gemのsourceにとべるようにする
Plug 'szw/vim-tags'

" For reisizing of windows.
Plug 'simeji/winresizer'

" Syntax highlighting.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Initialize plugin system
call plug#end()

"=======================================
" folke/tokyonight.nvim
"=======================================
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:lightline = {'colorscheme': 'tokyonight'}
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Load the colorscheme
colorscheme tokyonight

"=======================================
" nvim-treesitter/nvim-treesitter
"=======================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    enable = true,
    disable = {}
  }
}
EOF

"=======================================
" vim-easy-align
"=======================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"=======================================
" fzf.vim
"=======================================
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
nnoremap <silent> <leader>d :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>G :GFiles?<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>his :History<CR>
nnoremap <silent> <leader>r :Rg<CR>

"=======================================
" fern
"=======================================
let g:fern#default_hidden=1
let g:fern#renderer = 'nerdfont'
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

"=======================================
" lambdalisue/glyph-palette.vim
"=======================================
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"=======================================
" vim-tags
"=======================================
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle list --paths` 2>/dev/null"

"=======================================
" Setup
"=======================================
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
" 補完ウィンドウを透過
set pumblend=10

"=======================================
" Setup Keybinding
"=======================================
inoremap <silent> jj <ESC>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
" neovim terminal mapping
if has('nvim')
  " 新しいタブでターミナルを起動
  nnoremap @t :tabe<CR>:terminal<CR>
  " Ctrl + q でターミナルを終了
  tnoremap <C-q> <C-\><C-n>:q<CR>
  " ESCでターミナルモードからノーマルモードへ
  tnoremap <ESC> <C-\><C-n>
endif

"=======================================
" Setup Design
"=======================================
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
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
" menuone=補完候補が1件でも補完ウィンドウを表示
set completeopt=menuone

"=======================================
" Setup Tab
"=======================================
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

"=======================================
" Setup Search
"=======================================
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

"=======================================
" coc.nvim
"=======================================
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>F <Plug>(coc-format)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" nmap <silent> <space>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
