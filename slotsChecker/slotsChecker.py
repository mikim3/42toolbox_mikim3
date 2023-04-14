from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import time
from datetime import datetime, timedelta
import os

# 크롬 드라이버 실행
driver = webdriver.Chrome()

# 동적으로 변할 프로젝트 slot명을 변수로 지정
projects_slot = "cpp-module-08/slots?team_id=4800551"

# 웹드라이버를 로드합니다.
driver = webdriver.Chrome()

# 초기 URL을 설정합니다. team_id는 인자로 받아온 변수를 사용합니다.
url = f"https://projects.intra.42.fr/projects/{projects_slot}#"


# 사이트 접속
driver.get("https://your-appointment-site.com/")

# ID와 패스워드를 입력하고 로그인
username = driver.find_element_by_name("username")
password = driver.find_element_by_name("password")
username.send_keys("your_username")
password.send_keys("your_password")
driver.find_element_by_css_selector("button[type='submit']").click()

# 초기 시간 설정
last_updated_time = datetime.now()

# 스케줄 감지
while True:
    try:
        # 원하는 요소가 로딩될 때까지 기다림
        element = WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "schedule-element"))
        )
        
        # 스케줄이 선택되었는지 확인
        if "available" in element.get_attribute("class"):
            print("스케줄이 변경되었습니다. 알림을 보냅니다.")

            # macOS용 알림
            os.system("""
            osascript -e 'display notification "스케줄이 변경되었습니다." with title "약속 변경"'
            """)

            # Windows용 알림
            # win10toast 라이브러리 설치 필요
            # from win10toast import ToastNotifier
            # toaster = ToastNotifier()
            # toaster.show_toast("약속 변경", "스케줄이 변경되었습니다.", duration=10)

            # 마지막 업데이트 시간 갱신
            last_updated_time = datetime.now()
        
    except:
        print("스케줄 변경 감지 실패. 재시도합니다.")
    
    # 5초마다 스케줄 업데이트 확인
    time.sleep(5)
    
    # 일정 간격으로 마지막 업데이트 시간 확인
    if datetime.now() - last_updated_time > timedelta(minutes=5):
        print("스케줄 변경 없음. 프로그램을 종료합니다.")
        break