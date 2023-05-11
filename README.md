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

4. (추천사항)로그인 할때마다 실행시키기

<img width="420" alt="Screen Shot 2023-05-04 at 3 41 44 PM" src="https://user-images.githubusercontent.com/26201797/236135447-4e4c6818-1087-4db0-b4f3-0720d90ddde2.png">

<img width="666" alt="Screen Shot 2023-05-04 at 4 13 14 PM" src="https://user-images.githubusercontent.com/26201797/236135471-e617e235-41c4-46f0-a153-a4990942a57c.png">

이렇게 설정해놓으면 간편하게 쓰기 좋습니다.



# setup_mikim3.sh 사용시 주의사항

### setup_mikim3.sh을 사용한 이후 VSCode가 안켜져요.               

- 아래 그림과 같이 자리를 옮겨도 Library에 만들어 놓은 심볼릭링크된 폴더는 여전히 goinfre에 연결되어 있습니다.  그러므로 setup_mikim3.sh을 자리마다 한번씩 돌려줘야 됩니다.
<img width="351" alt="Screen Shot 2023-05-03 at 1 56 33 PM" src="https://user-images.githubusercontent.com/26201797/235835506-af33d059-7c95-43be-8da2-f8cfb1a2cf9c.png">


<img width="563" alt="Screen Shot 2023-05-03 at 1 56 21 PM" src="https://user-images.githubusercontent.com/26201797/235835526-b3572701-a08f-430f-84dc-6182c7e354c3.png">

- 그래도 문제가 있다면 ~/Library/Code 에 Code폴더 안에 내용을 전부 지우고 다시실행하면 기본설정으로 VSCode가 다시 실행됩니다.


## 문제에 대한 모든 사항을 해결해 줄수는 없지만
42intra  mikim3에게 slack으로 문제에 대하여 보내주시면 최대한 열심히 같이 해결해 보겠습니다.

# 잘 쓰고 있다면 오른쪽 위 Star클릭해주시면 감사하겠습니다.








