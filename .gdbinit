# コマンド履歴を保存する
set history save on
set history size 10000
set history filename ~/.gdb_history

# listコマンドで表示する行数
set listsize 25

# 配列の要素を全て表示する
set print elements 0

# 構造体のメンバを1行ずつ表示できる
set print pretty on

# quitコマンドで終了するときに確認しない
define hook-quit
    set confirm off
end

# Alias
alias -a ib = info b
alias -a ia = info args
alias -a il = info locals
alias -a bd = clear
