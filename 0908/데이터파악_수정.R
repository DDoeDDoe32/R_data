install.packages('ggplot2')
library(ggplot2)
## -------------------------------------------------------------------- ##
# ggplo2의 mpg 데이터를 데이터 프레임 형태로 불러오기
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)     # Raw 데이터 앞부분 확인
tail(mpg)     # Raw 데이터 뒷부분 확인
View(mpg)     # Raw 데이터 뷰어 창에서 확인
dim(mpg)      # 행, 열 출력
str(mpg)      # 데이터 속성 확인

# $ model     : 자동차 모델명
# $ displ       : 배기량(displacement)
# $ year        : 생산년도
# $ cyl          : 실린더 개수(cylinders)
# $ trans       : 변속기 종류(transmission)
# $ drv         : 구동 방식(drive wheel)
# $ cty         : 도시 연비(city)
# $ hwy        : 고속도로 연비(highway)
# $ fl           : 연료 종류
# $ class       : 자동차 종류
# $ manufacturer : 제조회사

summary(mpg)  # 요약 통계량 출력

?mpg    #mpg 설명글 출력

