# 막대차트 데이터 생성
chart_data <- c(305,450, 320, 460, 330, 480, 380, 520) 
names(chart_data) <- c("2014 1분기","2015 1분기","2014 2분기","2015 2분기","2014 3분기","2015 3분기","2014 4분기","2015 4분기")
str(chart_data)
chart_data

# 세로 막대 차트 
barplot(chart_data, ylim=c(0,600),  
        col=rainbow(8), main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

help("barplot")


# 가로축과 세로축 레이블 추가
barplot(chart_data, ylim=c(0,600), ylab="매출액(단위:만원)", xlab="년도별 분기현황",  
        
        col=rainbow(8), main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

#가로 막대 차트
barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        col=rainbow(8), 
        main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        col=rainbow(8),space = 1, cex.names = 0.8,
        main ="2014년도 vs 2015년도 분기별 매출현황 비교") 


# red와 blue 색상 4회 반복
barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        space = 2, cex.names = 0.8, col=rep(c(2, 4),4)) 

# red와 green 색상 4회 반복
barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        space = 2, cex.names = 0.8, col=rep(c("red","green"),4) )


# VADeaths 가져오고, 구조 확인
data(VADeaths)
VADeaths

str(VADeaths)
class(VADeaths)  # 자료구조 확인
mode(VADeaths) #자료형 확인

# 개별차트 그리기
#inset=0.1 등으로 legend의 위치를 이동할 수 있다. 
barplot(VADeaths, beside=T,col=rainbow(5), 
        main="미국 버지니아주 하위계층 사망비율")
legend("topright" ,c("50-54","55-59","60-64","65-69","70-74"), cex=0.8, fill=rainbow(5))

# 누적 차트 그리기
barplot(VADeaths, beside=F,col=rainbow(5))
title(main ="미국 버지니아주 하위계층 사망비율",font.main=4) 
legend("topright", c("50-54","55-59","60-64","65-69","70-74"), cex=0.8, fill=rainbow(5) )

#2018.09.29
# 막대차트 데이터 생성
chart_data <- c(305,450, 320, 460, 330, 480, 380, 520) 
names(chart_data) <- c("2014 1분기","2015 1분기","2014 2분기","2015 2분기","2014 3분기","2015 3분기","2014 4분기","2015 4분기")
str(chart_data)
chart_data

# 세로 막대 차트 
barplot(chart_data, ylim=c(0,600),  
        col=rainbow(8), main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

help("barplot")

# 가로축과 세로축 레이블 추가
barplot(chart_data, ylim=c(0,600), ylab="매출액(단위:만원)", xlab="년도별 분기현황",  
        col=rainbow(8), main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        col=rainbow(8), 
        main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

barplot(chart_data, xlim=c(0,600), horiz=TRUE, 
        xlab="매출액(단위:만원)", ylab="년도별 분기현황",  
        col=rainbow(8),space = 1, cex.names = 0.8,
        main ="2014년도 vs 2015년도 분기별 매출현황 비교") 

# VADeaths 가져오고, 구조 확인
data(VADeaths)
VADeaths

str(VADeaths)
class(VADeaths)  # 자료구조 확인
mode(VADeaths) #자료형 확인


# 개별차트 그리기
#inset=0.1 등으로 legend의 위치를 이동할 수 있다.
barplot(VADeaths, beside=T,col=rainbow(5), 
        main="미국 버지니아주 하위계층 사망비율")
legend("topright" ,c("50-54","55-59","60-64","65-69","70-74"), cex=0.8, fill=rainbow(5))

# 개별차트 그리기
#inset=0.1 등으로 legend의 위치를 이동할 수 있다.
barplot(VADeaths, beside=T,col=rainbow(5), 
        main="미국 버지니아주 하위계층 사망비율")
legend("topright" ,c("50-54","55-59","60-64","65-69","70-74"), cex=0.8, fill=rainbow(5))

par(mfrow=c(1,1)) # 1행 1열 그래프 보기
dotchart(chart_data, color=c("green","red"), lcolor="black", pch=16:17,
         labels=names(chart_data), xlab="매출액",
         main="분기별 판매현황 점 차트 시각화", cex=1.2)

pie(chart_data, labels = names(chart_data), 
    border='blue', col=rainbow(8), cex=1.2) 
title("2014~2015년도 분기별 매출현황")

summary(VADeaths)

data(iris) # iris 데이터 셋 가져오기
names(iris) 
str(iris) 
head(iris)

summary(iris$Sepal.Length)

hist(iris$Sepal.Length, xlab="iris$Sepal.Length",
     col="magenta",
     main="iris 꽃받침 길이 histogram", xlim=c(4.3, 7.9))

summary(iris$Sepal.Width)

hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="mistyrose",
     main="iris 꽃받침 넓이 histogram", xlim=c(2.0, 4.5))

par(mfrow=c(1,2))

hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="green",
     main="iris 꽃받침 넓이 histogram", xlim=c(2.0, 4.5))

# 확률 밀도로 히스토그램 그리기 - 연속형변수의 확률 
hist(iris$Sepal.Width, xlab="iris$Sepal.Width",
     col="mistyrose",freq = F,
     main="iris 꽃받침 넓이 histogram", xlim=c(2.0, 4.5))

# 밀도를 기준으로 line을 그려준다.
lines(density(iris$Sepal.Width), col="red")

price <- runif(10, min=1, max=100) # 1~100사이 10개 난수 발생
plot(price)

par(new=T) # 차트 추가 
line_chart = 1:100  
# 대각선 추가: axes=F, ann=F 속성으로 
# x축과 y축의 눈금과 축 이름 제거
plot(line_chart, type="l", col="red", axes=F, ann=F) 

text(70,80, "대각선 추가", col='blue')

plot(line_chart, type="l", col="red")

