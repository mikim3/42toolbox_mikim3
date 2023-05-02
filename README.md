# 42toolbox_mikim3

<br>

## 42Seoul 생활을 하면서 사용하면 좋을만한 툴을 만들고 있습니다.

# setup_mikim3.sh

용량정리를 위한 툴 입니다. 
캐쉬가 많이 쌓였을때 기준으로 2GB정도의 효과가 있었습니다.

작동과정은

1. ApplicationSupport를 만든다.
<img width="564" alt="Screen Shot 2023-05-02 at 3 33 08 PM" src="https://user-images.githubusercontent.com/26201797/235595874-54f40dda-0c85-4c04-a10a-6d4bfc8ed010.png">
      
- 42에 ApplicationSupport가  있는 컴퓨터도 있고 없는 컴퓨터도 있는데 그중에 있는 컴퓨터를 기준으로 만들었기 때문에 없는 경우도 똑같이 작동하기 위해 ApplicationSupport가 있는지
확인한 뒤에 두 경우 모두 똑같이 작동하게 만들었습니다.

2. $TARGET변수에 원하는 TARGET경로 넣기
TARGET=(
	"Caches"
	"ApplicationSupport/Code/Cache"
	"ApplicationSupport/Code/CachedData"
  ...
)
과 같이 용량이 goinfre에서 처리해도 상관 없는 폴더들을 TARGET경로로 골라서 넣습니다.

3. 심볼릭링크 설정
for 문을 돌면서 심볼릭링크처리를 해줍니다.
  mkdir -p "$HOME/goinfre/${TARGET[$i]}"
  rm -rf "$HOME/Library/${TARGET[$i]}"
  ln -s "$HOME/goinfre/${TARGET[$i]}" "$HOME/Library/${TARGET[$i]}"
