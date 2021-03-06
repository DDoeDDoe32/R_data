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
df_raw <- data.frame(var1 = c(1, 2, 1),   #두개의 변수로 구성된 데이터 프레임 생성
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")  # dplyr 설치

library(dplyr)                # dplyr 로드

df_new <- df_raw         # 복사본 생성
df_new                       # 출력
df_new <- rename(df_new, v2 = var2)  # var2를 v2로 수정

df_new                  #var2를 v2로 수정된 데이터 출력
df_raw                  #변경전 원본데이터 출력

# 혼자 해보기
# Q1 ggplot2 패키지 mpg데이터 불러와서 복사본 만들기
mpg_new = as.data.frame(ggplot2::mpg)
mpg_new2 = mpg_new
mpg_new2

# Q2 복사본 데이터를 이용해서 cty를 city로, hwy를 highway로 수정하기
str(mpg_new2)
mpg_new2 = rename(mpg_new2, city=cty, highway=hwy)
str(mpg_new2)

# Q3 데이터 일부를 출력해 변수명이 바뀌었는지 확인해 본다.
head(mpg_new2)

#파생변수 만들기
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
df$var_sum <- df$var1 + df$var2       # var_sum 파생변수 생성
df

df$var_mean <- (df$var1 + df$var2)/2  # var_mean 파생변수 생성
df

str(df)
head(df)

#mpg 파생변수 만들기
mpg
str(mpg)

mpg$total <- (mpg$cty + mpg$hwy)/2  # 통합 연비 변수 생성
head(mpg)
mean(mpg$total)  # 통합 연비 변수 평균

head(mpg)


summary(mpg$total)  # 요약 통계량 산출
hist(mpg$total)     # 히스토그램 생성

mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20) 

table(mpg$test)

qplot(mpg$test)
library(ggplot2)


mpg$grade = ifelse(mpg$total>=30,"A",
                   ifelse(mpg$total>=20,"B","C"))
mpg$grade

head(mpg,20)

table(mpg$grade)
qplot(mpg$grade)

# ※ 혼자 해보기 ※ 
# Q1. 아래 주석에 맞는 내용을 작성해보자
#1. 데이터 준비, 패키지 준비
#ggplot2로드
library(ggplot2)
#dplyr로드
library(dplyr)
#ggplot2패키지의 mpg가져오기
mpg_new3 = as.data.frame(ggplot2::mpg)

#2.데이터파악하기
#데이터 앞부분
head(mpg_new3)     # Raw 데이터 앞부분 확인
#데이터 뒷부분
tail(mpg_new3)     # Raw 데이터 뒷부분 확인
#데이터 뷰어창에서 확인
View(mpg_new3)     # Raw 데이터 뷰어 창에서 확인
#차원보기
dim(mpg_new3)      # 행, 열 출력
#속성보기
str(mpg_new3)      # 데이터 속성 확인
#요약통계량 보기
summary(mpg_new3)

#3.변수명 변경
#manufacturerf를 company로 변경
mpg_new3 = rename(mpg_new3,company = manufacturer)
str(mpg_new3)

#4.파생변수 생성
#통합연비 total
mpg_new3$total = (mpg_new3$cty + mpg_new3$hwy)/2
#total의 값이 20보다 크면 pass, 아니면 fail저장하는 test 만들기
mpg_new3$test = ifelse(mpg_new3$total>=20,"pass","fail")

#5.test의 빈도확인 table, qplot
table(mpg_new3$test)
qplot(mpg_new3$test)

# ※ 분석 도전하기 ※
# - 아래 문제를 community->weekend_R게시판에 등록하세요.

# - ggplot2 패키지에는 미국 동북중부 437개 지역의 인구 통계 정보를 담은 midwest라는
# 데이터가 있다. 이 데이터를 사용해 데이터 분석 문제를 해결해 보자

#문제 1 ggplot2의 midwest데이터를 데이터 프레임으로 불러온다음 데이터의 특징을 파악한다.(midwest_new)
# ggplo2의 mpg 데이터를 데이터 프레임 형태로 불러오기
midwest_new <- as.data.frame(ggplot2::midwest)
head(midwest_new)     # Raw 데이터 앞부분 확인
tail(midwest_new)     # Raw 데이터 뒷부분 확인
View(midwest_new)     # Raw 데이터 뷰어 창에서 확인
dim(midwest_new)      # 행, 열 출력
str(midwest_new)      # 데이터 속성 확인
summary(midwest_new)

#문제 2 poptotal(전체인구) 변수를 total로, popasian(아시아 인구)변수를 asian으로 수정한다.
midwest_new <- rename(midwest_new, total = poptotal,
                           asian = popasian)
head(midwest_new)
#문제 3 total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 
#히스토그램을 만들어 도시들이 어떻게 분포하는지 살펴본다.(midwest_new$ratio)
midwest_new$ratio = midwest_new$asian/midwest$total * 100

hist(midwest_new$ratio)
midwest_new$ratio
#문제 4 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large",  그외에는 "small"를
#부여하는 파생변수를 만들어 본다.(midwest_new$grade)
mean(midwest_new$ratio)
midwest_new$grade = ifelse(midwest_new$ratio > 0.4872462,"large","small")

#문제 5 "large", "small"의 빈도표와 막대 그래프를 만들어 확인해 본다.(table(),qplot())
table(midwest_new$grade)
qplot(midwest_new$grade)
