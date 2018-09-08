exam = read.csv("data/csv_exam.csv")

exam[] # 조건 없이 전체 데이터 출력

exam[1,] # 1행 추출

exam[2,] # 2행 추출

exam[exam$class==1 & exam$math>=50,]

# 영어점수가 90점 미만이거나 과학점수가 50점 미만
exam[exam$english < 90 | exam$science < 50,]

exam[,1] # 첫 번째 열 추출

exam[,2] # 두 번째 열 추출


exam[1,3] # 행, 변수 모두 인덱스

exam[5,"english"]

english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

df_midterm$english  #df_midterm의 english컬럼 조회

mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math)     # df_midterm의 math로 평균 산출

m <- matrix( c(1,"hong",150,
               2, "lee", 250,
               3, "kim", 300) ,
             3 ,by=T) # 행우선, 3개 리스트 생성

memp = data.frame(m)

memp

install.packages("readxl")
library(readxl)

df_exam = read_excel("data/data/03/excel_exam.xlsx")
s
df_exam_novar <- read_excel("data/data/03/excel_exam_novar.xlsx")
df_exam_novar

df_exam_sheet <- read_excel("data/data/03/excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

df_csv_exam <- read.csv("data/data/03/csv_exam.csv")
df_csv_exam

#데이터프레임에 데이터 생성한다.
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm  #내용확인

write.csv(df_midterm, file = "./output/df_midterm.csv") #CSV파일로 저장

save(df_midterm,file="output/df_midterm2.rda")
rm(df_midterm)
df_midterm
load("output/df_midterm2.rda")
df_midterm

txtemp = read.table("data/data/03/emp.txt",head = T, sep="")
txtemp
str(txtemp)

ncol(txtemp)
nrow(txtemp)

summary(txtemp)

library(help=datasets)

data()

quakes

head(quakes, n=10)

tail(quakes, n=6)

# 데이터 세트 구조 보기
names(quakes)

str(quakes)

dim(quakes)

# 데이터 세트 요약 보기
summary(quakes)

summary(quakes$mag)

# 데이터 세트 저장하고 읽기
write.table(quakes, "./output/quakes.txt", sep=",")

x <- read.csv("./output/quakes.txt", header=T)
x

x <- read.csv(file.choose(), header=T)

# 혼자해보기
# Q1 data.frame()과 c()조합해서 표의 내용을 데이터 프레임으로 만들어 출력하기
fruit = c('사과','딸기','수박')
price = c(1800,1500,3000)
sales.rate = c(24,38,13)
df = data.frame(fruit,price,sales.rate)
df
# Q2 위에서 만든 데이터 프레임을 이용해 과일가격 평균, 판매량 평균 구하기
mean(df$price)
mean(df$sales.rate)

# Q3. Data를 대상으로 apply()를 적용하여 행/열 방향으로 조건에 맞게 통계량을 구하시오.
# 조건1) 3개의 점수를 과목별(kor,eng,mat) c()함수를 이용하여 만든후 데이터프레임(Data)을 생성한다.
kor <- c(93,83,90)
eng <- c(70,85,75)
mat <- c(86,92,88)
Data <- data.frame(kor=kor, eng=eng, mat=mat)
Data
# 조건2) 행/열 방향으로 max() 함수를 적용하여 최대값을 구하시오. apply(데이터프레임,행/열(1/2),함수)
apply(Data,1,max)
apply(Data,2,max)
# 조건3) 행/열 방향으로 mean() 함수를 적용하여 평균 구하기 소숫점 2자리까지
# 표현하시오. 힌트 : round(data, 자릿수)
round(apply(Data,1,mean),2)
round(apply(Data,2,mean),2)

