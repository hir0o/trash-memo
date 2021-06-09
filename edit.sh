MEMO_DIR="/Users/shibuyahiroyuki/ghq/github.com/hir0o/trash-memo/memos"

$EDITOR `ls -d ${MEMO_DIR}/* | fzf --preview "bat --color=always --style=header,grid {}"`
