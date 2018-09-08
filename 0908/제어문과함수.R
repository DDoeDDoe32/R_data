# <실습> 산술연산자 
num1 <- 100 # 피연산자1
num2 <- 20  # 피연산자2
result <- num1 + num2 # 덧셈
result # 120
result <- num1 - num2 # 뺄셈
result # 80
result <- num1 * num2 # 곱셈
result # 2000
result <- num1 / num2 # 나눗셈
result # 5

result <- num1 %% num2 # 나머지 계산
result # 0

result <- num1^2 # 제곱 계산(num1 ** 2)
result # 10000

result <- num1^num2 # 100의 20승
result # 1e+40 -> 1 * 10의 40승과 동일한 결과

# (1) 동등비교 
boolean <- num1 == num2 # 두 변수의 값이 같은지 비교
boolean # FALSE
boolean <- num1 != num2 # 두 변수의 값이 다른지 비교
boolean # TRUE

# (2) 크기비교 
boolean <- num1 > num2 # num1값이 큰지 비교
boolean # TRUE
boolean <- num1 >= num2 # num1값이 크거나 같은지 비교 
boolean # TRUE
boolean <- num1 < num2 # num2 이 큰지 비교
boolean # FALSE
boolean <- num1 <= num2 # num2 이 크거나 같은지 비교
boolean # FALSE


# - 논리연산의 배타적 논리합은 두논리값이 상반되는 경우는 TRUE, 같으면 FALSE값을 반환한다. 
# <실습> 논리연산자
logical <- num1 >= 50 & num2 <=10 # 두 관계식이 같은지 판단 
logical # FALSE
logical <- num1 >= 50 | num2 <=10 # 두 관계식 중 하나라도 같은지 판단
logical # TRUE

logical <- num1 >= 50 # 관계식 판단
logical # TRUE
logical <- !(num1 >= 50) # 괄호 안의 관계식 판단 결과에 대한 부정
logical # FALSE

x <- TRUE; y <- FALSE
xor(x,y) # [1] TRUE
x <- TRUE; y <- TRUE
xor(x,y) # FALSE

x = 10; y=5
z = x*y
if(x*y > 40){
  cat("x*y의 결과는 40이상입니다.\n")
  cat("x*y=",z,"\n")
  print(z)
} else {
  cat("x*y의 결과는 40미마만입니다 x*y=",z,"\n")
}

score = scan()
score

if(score >= 90){  # 조건식1
  result="A학점"  # 조건식1 참
}else if(score >=80){ # 조건식2
  result="B학점"  # 조건식1 거짓, 조건식2 참 
}else if(score >=70){
  result="C학점"
}else if(score >=60){
  result="D학점"
}else{
  result="F학점"
}  
cat("당신의 학점은 ",result)  # 당신의 학점은  B학점
print(result)

# ifelse(조건, 참, 거짓) - 3항 연산자 기능

score <- c(78, 95, 85, 65)
score
ifelse(score>=80, "우수","노력") #우수

excel = read.csv("data/data/04/excel.csv",header = T)
q1 = excel$q1
q1

ifelse(q1>=3,sqrt(q1),q1)
ifelse(q1>=2 & q1<=4, q1^2,q1)

excel <- read.csv("data/data/04/excel.csv", header = T)
q1 <- excel$q1             # q1 변수값 추출
q1
ifelse(q1>=3, sqrt(q1), q1)  # 3보다 큰 경우 sqrt() 함수 적용

excel <- read.csv("data/04/excel.csv", header = T)
q1 <- excel$q1             # q1 변수값 추출
q1
ifelse(q1>=2 & q1<=4, q1^2, q1)   #1과 5만 출력, 나머지(2~4) 지수승

switch("name", id="hong", pwd="1234",age=105, name="홍길동") 

# 벡터에서 사용-> index값 리턴
name <- c("kim","lee","choi","park")
which(name=="choi") # 3

# 데이터프레임에서 사용
no <- c(1:5)
name <-c("홍길동","이순신","강감찬","유관순","김유신")
score <- c(85,78,89,90,74)

exam <- data.frame(학번=no,이름=name,성적=score)
exam
which(exam$이름=="유관순") 


i <- c(1:10)
i #  1  2  3  4  5  6  7  8  9 10
d <- numeric() # 빈 vector(숫자)
for(n in i){ # 10회 반복
  print(n * 10) # 계산식(numeric만 가능) 출력
  print(n)
  d[n] <- n * 2 # d[1] = 2, ..... d[10]=20
}
d # 2  4  6  8 10 12 14 16 18 20

for(n in i) {
  if(n%%2 != 0) 
    print(n)
}

for(n in i) {
  if(n%%2 == 0)
    next
  else
    print(n)
}

# 벡터 데이터 사용 예
score = c(85, 95, 98)
name = c('홍길동', '이순신', '강감찬')

i <- 1         # 첨자로 사용되는 변수
for (s in score) {
  cat(name[i], " -> ", s, "\n")
  i <- i + 1   
} 

i = 1
for(s in score)
{
  cat(name[i],"->",s,"\n")
  i = i+1
}

i=0
while(i<10)
{
  i = i+1
  print(i)
}

f1 <- function(){
  cat("매개변수가 없는 함수")
}

f1() # 함수 호출 

f2 = function(x){
  cat("x의 값=",x,"\n")
}
f2(100)
f2('홍')


f3 <- function(x, y){
  add <- x + y # 덧셈 
  return(add) # 결과 반환 
}

add <- f3(10, 20)
add

test <- read.csv("data/data/04/test.csv", header=TRUE)
test

head(test)
summary(test)
table(test$A)
max(test$A)
min(test$A)

length(test)
data_pro <- function(x){
  
  for (idx in 1 : length(x)){
    cat(idx,'번째 칼럼의 빈도분석 결과')
    print(table(x[idx]))
    cat('\n')
  }
  for (idx in 1 : length(x)){
    f <- table(x[idx])
    cat(idx,'번째 칼럼의 최댓값/최솟값\n')
    cat("max =", max(f), "min =", min(f), '\n')
  }
}

data_pro(test) #함수 호출

# 분산과 표준편차를 구하는 함수 정의
x <- c(7, 5, 12, 9, 15, 6) # x 변량 생성 
var_sd <- function(x) {
  var <-  sum( (x-mean(x))^2 ) / (length(x) - 1) # 표본분산 
  sd <- sqrt(var)  # 표본 표준편차 
  cat('표본분산 : ', var, '\n')
  cat('표본 표준편차 :', sd)
}
var_sd(x)

#결측치 데이터 처리 함수
na <- function(x){
  #1차 : NA 제거 
  print(x)
  print( mean(x, na.rm = T) )
  
  #2차 : NA를 0으로 대체  
  data = ifelse(!is.na(x), x, 0) # NA이면 0으로 대체
  print(data)
  print(mean(data))
  
  # 3차 : NA를 평균으로 대체 
  data2 = ifelse(!is.na(x), x, round(mean(x, na.rm=TRUE), 2) ) # 평균으로 대체 
  print(data2)
  print(mean(data2))
}
x <- c(7, 5, 12, 9, 15, 6, NA) # x 변량 생성
mean(data)
na(data) #함수 호출

# Q1. 다음 조건에 맞게 client 데이터프레임을 생성하고, 조건에 맞게 처리하시오.
# <vector 준비>
name <-c("유관순","홍길동","이순신","신사임당")
gender <- c("F","M","M","F")
price <-c(50,65,45,75)

# 조건1) 다음 3개 벡터 객체를 이용하여 client 데이터프레임을 생성하시오.
client = data.frame(name,gender,price)
client
# 조건2) price 변수의 값이 65만원 이상이면 문자열 "Best", 65만원 미만이면 문자열
# "Normal"을 변수 result에 추가하시오. 힌트) ifelse() 함수 이용
client$result = ifelse(df$price>=65,"Best","Normal")
client$result
# 조건3) result 변수를 대상으로 빈도수를 구하시오. 
table(client$result)

num <- scan()
name = scan(what=character)

df = data.frame() #빈 데이터프레임 생성
df = edit(df) # 데이터 편집기
df

student  <- read.table(file="data/data/05/student.txt")
student

names(student) <- c('번호', '이름', '키', '몸무게')
student

# [실습] 컬럼명이 있는 파일 불러오기
student1  <- read.table(file="data/data/05/student1.txt", header=TRUE)
student1

# [실습] 탐색기를 통해서 파일 선택하기
student1  <- read.table(file.choose(), header=TRUE)

# [실습] 구분자가 있는 경우(세미콜론, 탭)
student2  <- read.table(file="data/data/05/student2.txt", sep=";", header=TRUE) 
student2

student2  <- read.table(file="data/data/05/student2.txt", sep="\t", header=TRUE)
student2

# [실습]  결측치를 처리하여 파일 불러오기
student3 <- read.table(file="data/data/05/student3.txt", sep=" ", header=TRUE, na.strings=c("-","&")) # 문자열 -> NA 처리 
student3

install.packages("xlsx")   # xlsx 패키지 설치 
library(xlsx) # 로딩

# [실습] 엑셀 파일 가져오기
studentex <- read.xlsx(file.choose(), 
                       sheetIndex=1, encoding="UTF-8")

studentex

install.packages("RSADBE")
library(RSADBE)               # 패키지를 메모리에 로드
data(Severity_Counts)          # Severity_Counts 데이터 셋 가져오기
sink("./output/severity.txt")             # 저장할 파일 open
severity <- Severity_Counts   # 데이터 셋을 변수에 저장  
severity                       # 콘솔에 출력되지 않고 파일에 저장
sink() # 오픈된 파일 close

# ./data/05/studentexcel.xlsx 파일선택
studentx <- read.xlsx(file.choose(), sheetIndex=1, encoding="UTF-8") 
# 단계 2 : 기본속성으로 저장 - 행 이름과 따옴표가 붙는다.
write.table(studentx, "output/stdt.txt")    # 행 번호와 따옴표 출력
# 단계 3 : ‘row.names=FALSE’ 속성을 이용하여 행 이름 제거하여 저장한다.
write.table(studentx, "output/stdt2.txt", row.names=FALSE)  # 행 번호 제거
# 단계 4 : ‘quote=FALSE’ 속성을 이용하여 따옴표를 제거하여 저장한다.
write.table(studentx, "output/stdt3.txt", row.names=FALSE, quote=FALSE) 

# studentexcel.xlsx 파일 선택
st.df <- read.xlsx(file.choose(), sheetIndex=1, encoding="UTF-8")
st.df
write.xlsx(st.df, "output/studentx.xlsx") # excel형식으로 저장

# [실습] 문자열 추출하기
install.packages("stringr")  # 패키지 설치
library(stringr) # 메모리 로딩

# 형식) str_extract('문자열', '정규표현식')
str_extract("홍길동35이순신45유관순25", "[1-9]{2}") # "12" -> 연속된 숫자2개 추출(첫번째)
str_extract_all("홍길동35이순신45유관순25", "[0-9]{2}") # "12" "33" -> 모두

# [실습] 반복수를 지정하여 영문자 추출 
string <- 'hongkildong105lee1002you25강감찬2005'
str_extract_all(string, '[a-z]{3}')  
str_extract_all(string, '[a-z]{3,}') 
str_extract_all(string, '[a-z]{3,5}') 
# 특정 단어 추출 
str_extract_all(string, '유관순')

# [실습] 한글, 영문자, 숫자 추출하기
str_extract_all(string, 'hong') 
str_extract_all(string, '25') 
str_extract_all(string, '[가-하]{3}') 
str_extract_all(string, '[a-z]{3}') 
str_extract_all(string, '[0-9]{4}')

# [실습] 한글, 영문자, 숫자를 제외한 나머지 추출하기
str_extract_all(string, '[^a-z]')  #영문자 제외한 나머지 추출
str_extract_all(string, '[^a-z]{4}') #영문자를 제외한 연속된 4개 추출
str_extract_all(string, '[^가-하]{5}')  #한글을 제외한 나머지 연속된 5개 추출
str_extract_all(string, '[^0-9]{3}')   # 숫자를 제외한 나머지 연속된 3개 추출

jumin <- '123456-3234567'
str_extract_all(jumin, '[0-9]{6}-[1234][0-9]{6}') #[1234] -1,2,3,4중 하나의 숫자 
str_extract_all(jumin, '\\d{6}-[1234]\\d{6}')

# [실습] 지정된 길이의 단어 추출하기
name <- '홍길동1234,이순신5678,강감찬1012'
str_extract_all(name, '\\w{7,}') #7자이상 단어(숫자포함)만 추출 

# [실습] 문자열 길이 구하기 
string <- 'hongkild105lee1002you25강감찬2005'
len <- str_length(string) # 29


# [실습] 문자열 위치(index) 구하기 
string <- 'hongkild105lee1002you25강감찬2005'
str_locate(string, '강감찬') 


# ② 부분 문자열 만들기
# - 문자열 객체의 시작과 끝 위치를 지정하여 부분 문자열을 만들수 있다.

# [실습] 부분 문자열
string_sub <- str_sub(string, 1, len-7)
string_sub

string_sub <- str_sub(string, 1, 23)
string_sub


# ③ 대/소문자 변경하기

# [실습] 대문자, 소문자 변경하기 
str_to_upper(string_sub)
str_to_lower(string_sub)


# ④ 문자열 교체, 결합, 분리

# [실습] 문자열 교체하기 
string_rep <- str_replace(string_sub, 'hongkd105', '홍길동35,')
string_rep <- str_replace(string_sub, 'leess1002', '이순신45,')
string_rep <- str_replace(string_sub, 'you25', '유관순25,')
string_rep


# [실습] 문자열 결합하기 
string_c <- str_c(string_rep, '강감찬55')
string_c


# [실습] 문자열 분리하기
string_sp <- str_split(string_c, ',')
string_sp

# [실습] 문자열 합치기 
string_vec <- c('홍길동35', '이순신45', '유관순25', '강감찬55')
string_vec

string_join <- paste(string_vec, collapse = ',')
string_join

# ※ 혼자해보기 ※

# Q1. 다음의 Data2 객체를 대상으로 조건에 맞게 정규표현식을 적용하여 문자열을
# 처리하시오. 
Data2 <- c("2017-02-05 수입3000원", "2017-02-06 수입4500원", "2017-02-07수입2500원")
library(stringr)
# 조건1) 날짜별 수입을 다음과 같이 출력하시오. str_extract_all(문자열, 정규표현식)
# 출력 결과) "3000원" "4500원" "2500원"
str_extract_all(Data2, '[0-9]{4}[가-하]') # "12" "33" -> 모두


# 조건2) 위 벡터에서 연속하여 2개 이상 나오는 모든 숫자를 제거하시오. str_replace_all(문자열,정규표현식,"")
# 출력 결과) "-- 수입원" "-- 수입원" "-- 수입원"
str_replace_all(Data2,'[0-9]{2,}',"")


# 조건3) 위 벡터에서 -를 /로 치환하시오. 출력 결과) "2017/02/05 수입3000원" "2017/02/06 수입4500원" "2017/02/07
# 수입2500원" 
str_replace_all(Data2,'-',"/")

# 조건4) 모든 원소를 쉼표(,)에 의해서 하나의 문자열로 합치시오. paste(문자열, collapse=",")
# 출력 결과) "2017-02-05 수입3000원,2017-02-06 수입4500원,2017-02-07
# 수입2500원"
paste(Data2, collapse=",")

16/3

16 %/% 3
16 %% 3

rep(10, 3)

rep( c('A','B'), 3 )
## c('A','B') 를 3번 반복

rep( c('A','B'), c(3,2) )
## 각각 'A'를 3번 ,'B'를 2번 반복

paste0( 'A', '+',1, '등급')

paste('2학년', c('1반','2반','3반'), sep='-')

paste(1:4, '학기', sep='')
## 공백없이 글자를 붙이는 방법 1

paste0(1:4, '학기')
## 공백없이 글자를 붙이는 방법 2(1과 결과는 동일)

substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 10, 13)
## 10번째~13번째 글자 추출

substr('가A나B다C', 3, 4)
## 한글과 영어 모두 1칸으로 계산

1:5 >= 3
## 1~5까지의 숫자모두 3과 비교한다.

y = 1:5 >= 3
## 논리연산의 결과를 y로 저장  
y  

y+1
## TRUE는 1, FALSE는 0으로 계산

v1=1:10

v1 %in% c(3,7,9)

v2 = c("서울","인천","부산","경기","강원","대전","대구","제주","광주","울산")

v2 %in% c("부산", "대구")

rbind(c("A","B","C"), c("x","y","z"))

cbind(c("A","B","C"), c("x","y","z"))

## UTF-8을 많이 사용하는 추세이지만 이미 EUC-KR로 만들어졌기 때문에
subway = read.csv('data/data2/subway.csv', fileEncoding='euc-kr')
## 서울시 1~4호선 12월 역별 시간대별 지하철 승차하 인원 집계데이터
## 자료 출처 : 공공데이터포탈(data.go.kr)

## 옵션 fileEncoding='euc-kr' : csv 파일 인코딩이 'euc-kr'임을 지정
head(subway)

View(subway)
## 스크립트 창에 데이터 탭이 추가 됨
## 오른쪽 위 환경창에서 데이터 이름 클릭 시 동일한 작업 실행

demo = read.csv('data/data2/gender_age.csv')

demo

str(demo)

demo$Gender
## 이건 그냥 숫자

factor(demo$Gender)
## factor 형식(R에서 범주형 변수를 다루는 형식)으로 바꿔 "출력"

demo$Gender = factor(demo$Gender)
## demo$Gender를 불러와 factor 형식으로 바꾼 뒤, demo$Gender를 업데이트

str(demo)

paste0(demo$Gender,  "_", demo$Age, "대")

demo$Group = paste0(demo$Gender,  "_", demo$Age, "대")
## 변수를 추가  

str(demo)

demo$Age == 30
## 논리 연산

which( demo$Age == 30 )

which(demo$Age==30 & demo$Gender=='1_남자')
## 두 조건을 모두 만족하는 관측치 선택 

# (18)names()함수로 변수 이름 확인하고 바꾸기

names(subway)
## 저장되어 있는 변수이름 확인

c("Station", "Date", "InOut", paste0("H", 5:25))
## 새로운 변수이름 만들기 

names(subway) = c("Station","Date","InOut",paste0("H", 5:25))
## "names(subway)" 뒤에 "="을 붙이고 새로운 이름을 넣어 업데이트

names(subway)


# (27) subset() 함수로 부분 데이터 선택하기

subdata1 = subset(subway, Station %in% c("강남(222)", "명동(424)"))
## 2호선 강남역과 4호선 명동역 데이터만 선택

str(subdata1)
## 일치하는 124개 관측치로 만들어진 데이터

subdata2 = subset(subway, Station %in% c("강남(222)", "명동(424)") 
                  & Date=="2016-12-24")
## 위의 조건에 날짜 조건(12월 24일)을 추가

str(subdata2)
## 일치하는 4개 관측치로 만들어진 데이터

subdata2

subdata3 = subset(subway, Station %in% c("강남(222)", "명동(424)") 
                  & Date=="2016-12-24", select=c(Station, InOut, H23, H24, H25))

subdata3


