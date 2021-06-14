#! /bin/bash
DATETIME=`date +%Y%m%d_%H%M%S`
MEMO_DIR="/Users/shibuyahiroyuki/ghq/github.com/hir0o/trash-memo/memos"

if [ $# == 0 ]; then # ファイル名指定しない
	echo "vmemo"
elif [ $1 == "--edit" -o $1 == "-e"  ]; then # 編集
	$EDITOR `ls -d ${MEMO_DIR}/* | fzf --preview "bat --color=always --style=header,grid {}"`
elif [ $1 == "--delete" -o $1 == "-d" ]; then # 削除
	rm `ls -d ${MEMO_DIR}/* | fzf --multi --preview "bat --color=always --style=header,grid {}"`
elif [ $1 == "--new" -o $1 == "-n" ]; then # 新規作成
	if [ $# == 1 ]; then
		$EDITOR "$MEMO_DIR/$DATETIME.md"
	else
		$EDITOR "$MEMO_DIR/$2.md"
	fi
else
	echo "Invalid argument"
fi
