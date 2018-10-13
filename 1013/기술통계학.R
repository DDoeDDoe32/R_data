counts <- table(mtcars$cyl, mtcars$gear)
counts

barplot(counts, col=c("blue","red","yellow"),legend=rownames(counts),xlab="Number of Gears")

b<- c(2,4,5,7,12,14,16)

pie(b, main="My PieChart",
    col=rainbow(length(b)),
    labels = c("Mon","Tue","Wed","Thu","Tri","Sat","Sun"))

install.packages("plotrix") 
library(plotrix)

slices <- c(10,12,4,16,8)

lbls<- c("US","UK","Australia","Germary","France")
#3차원 파이 차트

pie3D(slices,
      labels=lbls,
      explode=0.1, #조각간격
      main="Pie Chart of Countries")

radial.pie(slices,labels=lbls, radlab = T)


boxplot(mtcars$hp, ylab="HOrse Power") 
f<-fivenum(mtcars$hp) #다섯-숫자요약(최솟,최댓,중앙,제1사분위,제3사분위)

text(rep(1.3,5),f,labels=c("최솟값","제1사분위수","중앙값","제3사분위수","최대값"))

A <- c(100, 200, 300, 500, 1400)
B <- c(400, 500, 500, 500, 600)

mean(A); mean(B)

range(A)
range(B)
max(A) - min(A)     #  diff(range(A)) 와 같은 결과
max(B) - min(B)     #  diff(range(B)) 와 같은 결과

# 개별 관찰값과 평균과의 차이에 대한 평균(편차)
height <- c(164, 166, 168, 170, 172, 174, 176)
( height.m <- mean( height ) )
( height.dev <- height - height.m )
sum( height.dev )

# 편차 제곱의 평균(분산)
( height.dev2 <- height.dev ^ 2 ) #편차의 제곱
sum( height.dev ^ 2 ) / length( height.dev ) #편차 제곱의 평균(분산) 
mean( height.dev ^ 2 ) #편차 제곱의 평균(분산)

# 표준편차(분산의 제곱근)
sqrt( mean( height.dev ^ 2 ) ) #분산의 제곱근 (표준편차)

# R 함수를 이용한 분산과 표준편차
var( height )
sd( height )

# 데이터에 결측치가 포함되어 있을 경우 R의 NA에 대응시킬 값을 지정한다.
# 기본값은 "NA"로, "na"로 저장된 문자열들은 R의 NA로 저장된다. - na.strings="na"
ranicafe <- read.csv("./data/20/cafedata.csv", header=T, na.strings="na", stringsAsFactors=FALSE )
ranicafe <- na.omit(ranicafe)
str(ranicafe)


# 변동계수
rc <- ranicafe$Coffees
rj <- ranicafe$Juices
( rc.m <- mean( rc ) )
( rc.sd <- sd( rc ) )
( rj.m <- mean( rj ))
( rj.sd <- sd( rj ) )
( rc.cv <- round( rc.sd / rc.m, 3) )
( rj.cv <- round( rj.sd / rj.m, 3) )

data <- read.csv("data/20/descriptive.csv", header=TRUE)
head(data) # 데이터셋 확인

# 데이터 특성 보기
dim(data) # 행(300)과 열(8) 정보 - 차원보기
length(data) # 열(8) 길이
length(data$survey) #survey 컬럼의 관찰치 
str(data) # 데이터 구조보기 -> 데이터 종류,행/열,data
str(data$survey) 

# 데이터 특성(최소,최대,평균,분위수,노이즈-NA) 제공
summary(data)  
length(data$gender)
summary(data$gender) # 최소,최대,중위수,평균-의미없음
table(data$gender) # 각 성별 빈도수 - outlier 확인-> 0, 5

# 이상치(outlier) 제거 
data <- subset(data,data$gender == 1 | data$gender == 2) # 성별 outlier 제거
x <- table(data$gender) # 성별에 대한 빈도수 저장
x # outlier 제거 확인
barplot(x) # 범주형(명목/서열척도) 시각화 -> 막대차트

# 구성비율 계산 
prop.table(x) # 비율 계산 : 0< x <1 사이의 값
y <-  prop.table(x)
round(y*100, 2) #백분율 적용(소수점 2자리)


length(data$level) # 학력수준 - 서열
summary(data$level) # 명목척도와 함께 의미없음
table(data$level)  # 빈도분석 - 의미있음

# [실습] 학력 수준(level) 변수의 빈도수 시각화
x1 <- table(data$level) # 각 학력수준에 빈도수 저장
barplot(x1) # 명목/서열척도 -> 막대차트


# 만족도(survey) 변수 대상 요약통계량 구하기
survey <- data$survey
survey

summary(survey) # 만족도(5점 척도)인 경우 의미 있음 -> 2.6(평균이상)

x1<-table(survey) # 빈도수
x1
hist(survey) # 등간척도 시각화 -> 히스토그림


#생활비(cost)변수 대상 요약 통계량 구하기
length(data$cost)
summary(data$cost) # 요약통계량 - 의미있음(mean) - 8.784

# 데이터 정제[결측치 제거]
data <- subset(data,data$cost >= 2 & data$cost <= 10) # 총점기준
data
x <- data$cost
mean(x) 

#평균이 극단치에 영향을 받는 경우 - 중위수(median) 대체
median(x) # 5.4  


# 생활비(cost) 변수 대상 대표값 구하기 
mean(x)      #평균
median(x)   #중위수
sort(x) # 오름차순 
sort(x, decreasing=T) # 내림차순  

# 생활비(cost) 변수 대상 사분위수 구하기 
quantile(x, 1/4)   #1사분위수 - 누적백분율25%
quantile(x, 2/4)   #2사분위수 - 누적백분율50%
quantile(x, 3/4)   #3사분위수 - 누적백분율75%
quantile(x, 4/4)   #4사분위수 - 누적백분율100%

# 생활비(cost) 변수의 최빈수 구하기 
length(x)
x.t <- table(x)   #빈도수
x.t
max(table(x))    #최빈수(18)

x.m <- rbind(x.t)   # 1행은 x의 변량, 2행은 빈도수

x.m
class(x.m)
str(x.m)
which(x.m[1, ] == 18) #최빈수의 위치값과 x값을 알려준다.

x.df <- as.data.frame(x.m) #데이터 프레임으로 변환
which(x.df[1, ] == 18)  #최빈수의 위치값
x.df[1, 19]                 #최빈수값 확인
attributes(x.df)           #타입과 name값 확인
names(x.df[19])          #최빈수위치의 이름 확인(x값)

var(x) # 분산
sd(x) # 표준편차는 분산의 양의 제곱근
sqrt(var(x))
