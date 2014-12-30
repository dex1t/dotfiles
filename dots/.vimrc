" !==================== 基本の設定 ==================== "
"全般設定
set nocompatible "Vi互換をオフ
set viminfo='20,<50,s10,h,! " YankRing用に!を追加
set shellslash              " Windowsでディレクトリパスの区切り文字に / を使えるようにする
set lazyredraw              " マクロなどを実行中は描画を中断
set clipboard=unnamed,autoselect " クリップボードをコピペに使用

" tab周り
set tabstop=4 shiftwidth=4 softtabstop=0
set expandtab              " タブを空白文字に展開
set autoindent smartindent " 自動インデント，スマートインデント

" 入力補助
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions+=m           " 整形オプション，マルチバイト系を追加
set nostartofline "移動コマンドを使ったとき行頭に移動しない

" ファイル名補完
set wildmenu " コマンド補完を強化
set wildmode=list:longest

" 検索関連
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

" ファイル関連
set nobackup  "バックアップ取らない
set writebackup
set autoread   " 他で書き換えられたら自動で読み直す
set noswapfile " スワップファイル作らない
set hidden     " 編集中でも他のファイルを開けるようにする

"表示関連
set showmatch         " 括弧の対応をハイライト
set showcmd           " 入力中のコマンドを表示
set number            " 行番号表示
set wrap              " 画面幅で折り返す
set list              " 不可視文字表示
set listchars=tab:▸\ ,trail:~,eol:↲  " 不可視文字の表示方法
set notitle           " タイトル書き換えない
set scrolloff=5       " 行送り

" エンコーディング関連
set ffs=unix,dos,mac " 改行文字

" 文字コードの自動認識
" 適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp

syntax on " シンタックスカラーリングオン

" 全角スペースハイライト
highlight ZenkakuSpace ctermbg=6 guibg=white
match ZenkakuSpace /\s\+$\|　/

"Escの置き換え
inoremap <C-f> <Esc>
nnoremap <C-f> <Nop>

"インサートモードのキー移動
imap <C-a> <HOME>
imap <C-e> <END>

"split時の移動
map <C-j> <C-W>j<C-w>_
map <C-k> <C-W>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_

"split
noremap ,. :vsp<C-M>

" Rails
autocmd FileType ruby,eruby,yaml set softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let g:rails_level = 4

"環境依存ファイル読み込み
if filereadable(expand('~/.vimrc.mac'))
    source ~/.vimrc.mac
endif
if filereadable(expand('~/.vimrc.server'))
    source ~/.vimrc.server
endif

" !==================== NeoBundle-start ==================== "
set nocompatible "required
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif

" スニペット&補完
NeoBundle 'Shougo/neocomplcache'
NeoBundleLazy 'Shougo/neosnippet', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ }}
NeoBundle 'Shougo/neocomplcache-rsense', {
      \ 'depends': 'Shougo/neocomplcache',
      \ 'autoload': { 'filetypes': 'ruby' }}
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" ファイル操作
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'wincent/Command-T'

" syntax & indent
NeoBundle 'IndentAnything' " Javascript-Indentationが依存
NeoBundle 'Javascript-Indentation'
NeoBundle 'JavaScript-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'tpope/vim-haml'
NeoBundle 'othree/html5.vim'
NeoBundle 'Markdown'

" Rails全般
NeoBundle 'tpope/vim-rails'

" コーディング補助
NeoBundle 'surround.vim'
NeoBundleLazy 'taichouchou2/vim-endwise.git', {
      \ 'autoload' : {
      \   'insert' : 1,
      \ } }
NeoBundle 'AutoClose'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'vim-scripts/ruby-matchit'

" yankのヒストリー
NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
let g:yankring_history_dir = '$HOME/.vim/'

" vimのstatusline
NeoBundle 'bling/vim-airline'
NeoBundle 'git://github.com/tpope/vim-fugitive.git' "airline git

" vim theme
NeoBundle 'git://github.com/nanotech/jellybeans.vim.git'

filetype plugin indent on     " required!
filetype indent on
syntax on
colorscheme jellybeans
" /==================== NeoBundle-end ==================== "

"nerd commenter
let g:NERDCreateDefaultMappings = 0 "デフォルトマッピングをオフ
let NERDSpaceDelims = 1 "コメントの後にスペース
let NERDShutUp = 1 "未対応ファイルの警告を消す
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle
nmap ,a <Plug>NERDCommenterAppend
nmap ,e <Plug>NERDCommenterToEOL
vmap ,s <Plug>NERDCommenterSexy

"nerd tree
let g:NERDTreeShowHidden = 1 "ドットファイル表示
nmap <silent> <special> <F1> :NERDTreeToggle<RETURN>

" rsense
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
let g:rsenseUseOmniFunc = 1
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 "起動時有効
" 大文字小文字を区別する
let g:NeoComplCache_SmartCase = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
" シンタックスファイルの補完対象キーワードとする最小の長さ
let g:NeoComplCache_MinSyntaxLength = 3
" プラグイン毎の補完関数を呼び出す文字数
let g:NeoComplCache_PluginCompletionLength = {
  \ 'keyword_complete'  : 2,
  \ 'syntax_complete'   : 2
  \ }

" neocomplcache-snipetts
autocmd BufEnter * if exists("b:rails_root") | NeoComplCacheSetFileType ruby.rails | endif
autocmd BufEnter * if (expand("%") =~ "_spec\.rb$") || (expand("%") =~ "^spec.*\.rb$") | NeoComplCacheSetFileType ruby.rspec | endif
" snippetの配置場所
let g:neocomplcache_snippets_dir='~/.vim/snippets'
" Plugin key-mappings.
" imap <C-k> <Plug>(neocomplcache_snippets_expand)
" smap <C-K> <Plug>(neocomplcache_snippets_expand)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" neocom周りのkeymap
let g:neocomplcache_enable_auto_select = 0
inoremap <silent><expr><TAB>  pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
inoremap <silent><expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
inoremap <silent><CR>  <CR><C-R>=neocomplcache#smart_close_popup()<CR>

" vim-coffe
" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデントを設定
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

function! s:css_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal cindent
endfunction
autocmd FileType scss call s:css_filetype_settings()

"-----------------------------------------------------
"" ステータスライン StatusLine
"----------------------------------------------------
set laststatus=2 " 常にステータスラインを表示
"カーソルが何行目の何列目に置かれているかを表示する
set ruler
"airlineにパッチ当てたフォントつかうとき
let g:airline_powerline_fonts = 1

" Command-T
nnoremap <silent> <Space> :CommandT<CR>
nnoremap <silent> b<Space> :CommandTBuffer<CR>
