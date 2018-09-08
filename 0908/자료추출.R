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
s
