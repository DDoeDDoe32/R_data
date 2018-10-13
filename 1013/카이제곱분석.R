data <- read.csv("data/22/cleanDescriptive.csv", header=TRUE) 
data # 확인

head(data) # 변수 확인

x <- data$level2 # 리코딩 변수 이용
y <- data$pass2 # 리코딩 변수 이용
x; y # 부모학력수준(x) -> 자녀대학진학여부(y) 

#데이터프레임 생성 
result <- data.frame(Level=x, Pass=y) # 데이터 프레임 생성 - 데이터 묶음
dim(result) # 차원보기
head(result)

# 교차분할표 작성   
table(result) # 빈도보기
install.packages("gmodels") # gmodels 패키지 설치
library(gmodels) # CrossTable() 함수 사용
install.packages("ggplot2") # diamonds 데이터 셋 사용을 위한 패키지 설치
library(ggplot2)



# 3) 패키지를 이용한 교차 분할표 생성
CrossTable(x=diamonds$color, y=diamonds$cut) 

# [실습] 패키지를 이용한 부모 학력 수준과 자녀 대학진학 여부 교차 분할표 작성 
x <- data$level2
y <- data$pass2

CrossTable(x, y)

# 교차테이블에 카이검정 적용 
CrossTable(x=diamonds$color, y=diamonds$cut, chisq = T)
data <- textConnection(
  "스포츠음료종류  관측도수
  1   41
  2   30
  3   51
  4   71
  5   61
  ")
x <- read.table(data, header=T)
x # 스포츠음료종류 관측도수

# [실습] 패키지를 이용한 부모 학력 수준과 자녀 대학진학 여부 교차 분할표 작성  
data <- read.csv("data/22/cleanDescriptive.csv", header=TRUE)
data # 확인
head(data) # 변수 확인
x <- data$level2
y <- data$pass2
CrossTable(x, y)

# 교차테이블에 카이검정 적용 
CrossTable(x, y, chisq = T)

#[실습] 동질성 검정
data <- read.csv("data/22/homogenity.csv", header=TRUE) 
head(data) 

# method와 survery 변수만 서브셋 생성
data <- subset(data, !is.na(survey), c(method, survey)) 
data



# 2. 변수리코딩 - 코딩 변경
# 교육방법2 필드 추가
data$method2[data$method==1] <- "방법1" 
data$method2[data$method==2] <- "방법2"
data$method2[data$method==3] <- "방법3"



# 만족도2 필드 추가
data$survey2[data$survey==1] <- "1.매우만족"
data$survey2[data$survey==2] <- "2.만족"
data$survey2[data$survey==3] <- "3.보통"
data$survey2[data$survey==4] <- "4.불만족"
data$survey2[data$survey==5] <- "5.매우불만족"

table(data$method2, data$survey2)  # 교차표 생성 -> table(행,열)

chisq.test(data$method2, data$survey2) 


car_cor <- cor(mtcars)  # 상관행렬 생성

round(car_cor, 2)       # 소수점 셋째 자리에서 반올림해서 출력

install.packages("corrplot")
library(corrplot)

corrplot(car_cor)

corrplot(car_cor, method = "number")


#[실습]
product <- read.csv("data/23/product.csv", header=TRUE) 
str(product) # 'data.frame':  264 obs. of  3 variables:

y = product$제품_만족도 # 종속변수
x = product$제품_적절성 # 독립변수
df <- data.frame(x, y)



# 회귀모델 생성 
result.lm <- lm(formula=y ~ x, data=df)
summary(result.lm)

result <- read.csv("./data/23/mytelecom.csv",header = T)
View(result)

result2 <- lm(churn ~ tenure + income + age + gender, data = result)
summary(result2)
