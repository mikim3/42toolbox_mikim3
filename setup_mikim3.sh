#/bin/bash

sleep 0.15

clear

echo "execute  mikim3's Mac init"

BANNER="$(
  cat <<-EOF
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_mikim3.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mikim3 <mikim3@student.42seoul.kr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/03 10:13:32 by mikim3            #+#    #+#              #
#    Updated: 2023/04/03 10:13:32 by mikim3           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
EOF
)"

# link cache directories to goinfre
# 원하는 타겟 남아있는거 지우고 goinfre로 옮기기
TARGET=(
	"Caches"
	"Application \Support/Code/Cache"
	"Application \Support/Code/CachedData"
	"Application \Support/Code/CachedExtensions"
	"Application \Support/Code/CachedExtensionVSIXs"
	"Application \Support/Code/Code Cache"
	"Application \Support/Slack/Cache"
	"Application \Support/Slack/CachedData"
	"Application \Support/Slack/Service Worker/CacheStorage"
	"Application \Support/Slack/Service Worker/ScriptCache"
	"Containers/com.tinyspeck.slackmacgap"
	# "Safari"
	"Application \Support/Code/User/workspaceStorage"
)

# "Keychains" // 자동로그인 관련해서 저장하는 폴더 삭제하면 불편해짐

TARGET_INTELLIJ=(
	"IdeaProjects"
)

FLAG="$HOME/goinfre/is_mikim3_setup"

function init_cluster_mac(){
	echo "link Code Slack Cache dirs..."
	for ((i = 0; i < ${#TARGET[@]}; i++)); do
		mkdir -p "$HOME/goinfre/CachesFolder/${TARGET[$i]}"
		rm -rf "$HOME/Library/${TARGET[$i]}"
		ln -s "$HOME/goinfre/CachesFolder/${TARGET[$i]}" "$HOME/Library/${TARGET[$i]}"
	done
	echo "Complete link all Cache dirs!"
#  touch "$FLAG"
}

function init_intellij(){
	echo "----init_intellij----"
	for ((i = 0; i < ${#TARGET_INTELLIJ[@]}; i++)); do
		mkdir -p "$HOME/goinfre/${TARGET_INTELLIJ[$i]}"
		rm -rf "$HOME/${TARGET_INTELLIJ[$i]}"
		ln -s "$HOME/goinfre/${TARGET_INTELLIJ[$i]}" "$HOME/${TARGET_INTELLIJ[$i]}"
	done
	echo "Complete intellij all Cache dirs!"
#  touch "$FLAG"
}

if [ ! -e "$FLAG" ]; then
	echo "$BANNER"
	init_cluster_mac
fi

# set -e

# (cd ~/goinfre && rm -f vscode.zip && curl -o vscode.zip -L https://az764295.vo.msecnd.net/stable/97dec172d3256f8ca4bfb2143f3f76b503ca0534/VSCode-darwin-universal.zip && rm -rf "Visual Studio Code.app" && unzip vscode.zip) | cat
# (cd ~/goinfre && rm -f vscodium.zip && curl -o vscodium.zip -L https://github.com/VSCodium/vscodium/releases/download/1.74.3.23010/VSCodium-darwin-x64-1.74.3.23010.zip && rm -rf VSCodium.app && unzip vscodium.zip) | cat

# homebrew설치
# curl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh



# 용량관리 팁 du -sh * | sort -h, df -h 를 이용하면 용량관리에 엉청 도움이 됩니다.

# brew팁
# Brew install —cask 를 이용하면 브류에 등록된 앱들은 드래그조차 필요없답니다..!
# —appdir 옵션으로 설치 위치도 바꿀 수 있어요!
