".vimrcや.exrcファイルのコメントは"で始まる。
" Option Checkul http://www15.ocn.ne.jp/~tusr/vim/options_help.html 
" vim:tw=0:sw=4:ts=4:list:listchars=tab\:>-:foldmarker={{{,}}}:fdm=marker

"{{{ 基本設定
"コロンコマンドを記録する数
set history=50

"listで表示される文字のフォーマットを指定する。
set listchars=tab:>-

"全角スペースがあれば「　」と表示する
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

"タブ文字、行末など不可視文字を表示する。
set list

"言語のsyntaxを色付きで指摘する。パラメータに拡張子指定できる。「:set syntax=html」
syntax on

"見やすい色を表示するようにVimに背景色を教える。darkとlightが選択できる。
set background=light

"番号を付加する
set number

"タブ幅は半角英字4文字分
set tabstop=4

"tabstopを変えずに空白を含めることにより、見た目のtabstopを変える
set softtabstop=0

"タブの入力を空白文字に置き換えない(これを有効にするとメールを書く時などに有効) PythonやMakefileを致命的にしない
set noexpandtab

"自動インデントは半角英字4文字文
set shiftwidth=4

"行がそれより長くなると、この幅を超えないように空白の後で改行される。値を 0 に設定すると無効になる。
set textwidth=0

"自動でインデントを行う
set autoindent

"文字コードはUTF-8
set encoding=utf-8

"端末の文字コードはUTF-8
set termencoding=utf-8

"ファイルの文字コードはUTF-8
set fileencoding=utf-8

"以下のbackup関連行が存在すれば$HOME/.backupdocディレクトリに<ファイル名>~のバックアップを行う。
set backup
set backupdir=$HOME/.backupdoc
set backupext=~
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set backupdir=$HOME/.backupdoc

"辞書を定義する。
set dictionary=$HOME/dev/vim/share/vim/phpman.dict

"エラー音の代わりに画面フラッシュを使う
set visualbell

"CTRL-_で'revins'オプションをトグルさせる。revinsは逆入力モード
set noallowrevins

" アンドゥ可能な変更の最大値
set undolevels=1024

"折り返しの設定を行う。
set wrap

"カーソルを行頭、行末で止まらないようにする。
set whichwrap=b

":sコマンドで'g'オプションをデフォルトにはしない
set nogdefault

"バックスペースの動作を指定。0,1,2が指定できる。2の場合にはset backspace=indent,eol,startと同じ
set backspace=2

"autoindentを、C言語プログラミング向けに特化したものである.(autoindentよりもこちらを有効にすればよい)
set cindent

"コマンドライン補完するときに補完候補を表示する。(例 :e t<TAB>とするとtで始まるファイルが表示される)
set wildmenu
"}}}

"{{{検索設定
"検索結果をハイライト(強調)表示する
set hlsearch

"インクリメンタルサーチ(検索文字を入力している部分までで検索を行う)
set noincsearch

"検索をファイルの末尾まで検索したら、ファイルの先頭へループする。
set wrapscan

"検索時に大文字と小文字の区別を行わない(default)
set noignorecase

"大文字小文字の両方が含まれているとき大文字小文字を区別
set nosmartcase

"}}}

"{{{表示設定
"現在のモードを表示する
set showmode

"対応するカッコを表示する
set showmatch

"メッセージを詳しく表示する
set noterse

"未保存で終了しようとしたら警告する
set warn

"起動時のメッセージを表示しないようにする。
"set shortmess+=I
"}}}

"{{{ステータスライン設定
"右下に行番号や列を付加する
set ruler

" ステータス行に文字コードや改行コードを表示。statuslineが指定されるとrulerは無視される。
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"コマンドをステータスラインに表示する。
set showcmd

"ステータスラインを表示するウィンドウを設定する。
set laststatus=2
"}}}

"{{{折り畳み設定
"折り畳みを行う始点及び終点を決定する。
set foldmarker={{{,}}}

"折り畳みを行う最低行数を定義する。
set foldminlines=1

"折り畳むネストの最大値
set foldnestmax=20

"閉じられた折り畳みを示すテキストを得るために実行されるスクリプト
set foldtext=foldtext()

"カーソルが移動したときに自動的に折り畳みを開く
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
"}}}

"{{{そのほか設定
" gfコマンドで移動させるためのもの
set suffixesadd=.js,.php,.inc,.class,.rb,.py,.pl,.txt
set path+=/home/tsuyoshi

map! <F2> <C-x><C-k>

" ,h1でh1タグでその行が囲まれる
imap ,h1 <h1>

"挿入モードで_dtと入力するとタイムスタンプに変換するように設定
iab _dt <C-R>=strftime("%Y-%m-%d")<CR>

"挿入モードで_spと入力すると全角空白文字が入力されるように設定する
"iab _sp

"F1でヘルプが入力されるように設定
map <F1> :help<Space>

"phpの拡張子の場合に辞書を表示します。
autocmd FileType php :set dictionary+=~/.vim/dict/php_functions.dict

"辞書ファイルを使用する設定に変更
set complete+=k

"以下は.testという拡張子を.htmlのsyntaxに変更するという例です。
augroup filetypedetect
au BufRead,BufNewFile *.test setfiletype html
augroup END

"拡張子毎の設定も可能(以下例)
"autocmd FileType python setlocal ts=4 sw=4 sta et sts ai

"}}}

"{{{文字コード自動認識設定 
if &encoding !=# 'utf-8'
      set encoding=japan
      set fileencoding=japan
endif
if has('iconv')
   let s:enc_euc = 'euc-jp'
   let s:enc_jis = 'iso-2022-jp'
      " iconvがeucJP-msに対応しているかをチェック
   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'eucjp-ms'
      let s:enc_jis = 'iso-2022-jp-3'
      " iconvがJISX0213に対応しているかをチェック
   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
      let s:enc_euc = 'euc-jisx0213'
      let s:enc_jis = 'iso-2022-jp-3'
   endif
   " fileencodingsを構築
   if &encoding ==# 'utf-8'
      let s:fileencodings_default = &fileencodings
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','.  s:fileencodings_default
      unlet s:fileencodings_default
   else
      let &fileencodings = &fileencodings .','. s:enc_jis
      set fileencodings+=utf-8,ucs-2le,ucs-2
      if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
         set fileencodings+=cp932
         set fileencodings-=euc-jp
         set fileencodings-=euc-jisx0213
         set fileencodings-=eucjp-ms
         let &encoding = s:enc_euc
         let &fileencoding = s:enc_euc
      else
         let &fileencodings = &fileencodings .','.  s:enc_euc
      endif
   endif
"定数を処分
unlet s:enc_euc
unlet s:enc_jis
endif

"日本語を含まない場合はfileencodingにencodingを使うようにする
if has('autocmd')
   function!  AU_ReCheck_FENC()
   if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
   endif
   endfunction
   autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"改行コードの自動認識
set fileformats=unix,dos,mac
"□とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
   set ambiwidth=double
endif
"}}}
"
"colorschemeの設定ができる
colorscheme ron

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

highlight Pmenu ctermbg=4
highlight PMenuSbar ctermbg=1
highlight PmenuSel ctermbg=4
