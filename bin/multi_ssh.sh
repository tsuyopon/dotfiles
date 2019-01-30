#!/bin/bash
# tmuxパッケージがあらかじめインストールされている必要があります。
# 使い方
# 1. 引数としてIPアドレスやドメインをいくつでも指定できます
#   $ ./multi_ssh.sh 127.0.0.1 localhost
# 2. ユーザーを指定できます。指定すると全てに対してそのユーザーでログインしようとします。
#   $ ./multi_ssh.sh -u hoge 127.0.0.1 localhost

usage(){
    echo './multi_ssh.sh [-u username] host ...'
}

while getopts "hu:" opts
do
  case $opts in
    h)
      usage
      exit
      ;;
    u)
      usr=$OPTARG 
      ;;
  esac
  shift
  shift
done

if [ -z "$usr" ];then
    usr=`whoami`
fi

if [ -n "$SESSION_NAME" ];then
    session=$SESSION_NAME
else
    session=multi-ssh-`date +%s`
fi
window=multi-ssh

### tmuxのセッションを作成
tmux new-session -d -n $window -s $session

### 各ホストにsshログイン
# 最初の1台はsshするだけ
tmux send-keys "ssh ${usr}@${1}" C-m
shift

# 残りはpaneを作成してからssh
for i in $*;do
    tmux split-window
    tmux select-layout tiled
    tmux send-keys "ssh ${usr}@${i}" C-m
done

### 最初のpaneを選択状態にする
tmux select-pane -t 0

### paneの同期モードを設定
tmux set-window-option synchronize-panes on

### セッションにアタッチ
tmux attach-session -t $session
