"フォント設定
set guifontwide=Ricty-Regular-Powerline:h16
set guifont=Ricty-Regular-Powerline:h16
""全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"常にタブを表示
"set showtabline=2
""透明度を変更
set transparency=3
map  gw :macaction selectNextWindow:
map  gW :macaction selectPreviousWindow:
colorscheme jellybeans
