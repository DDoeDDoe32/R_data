df<- read.csv("./data/17/example_studentlist.csv")
df

#subset()조건으로 변수 선택
subset(df, subset=(height>170))
subset(df, select = c(name,height), subset=(height>180))
subset(df, select = c(-height,-weight))

#변수명 바꾸기
colnames(df)
colnames(df)[6]<-"blood"
colnames(df)

#merge():서로 다른 순서의 데이터를 병합할때 사용,단 길이는 같아야 함
omit <- read.csv("./data/17/omit.csv")
omit

df <- merge(df, omit, by="name")
df

df <- read.csv("./data/17/example_studentlist.csv")
head(df)

freq <- table(df$bloodtype)  #혈액형변수의 빈도수
freq

pfreq <- prop.table(freq)  #상대도수
pfreq

table <- rbind(freq,pfreq)  #빈도수아래에 상대도수 붙임
table

table <- addmargins(table, margin=2)  #합계도 추가 1:열의합 2:행의합
table


head(df)

cut <- cut(df$height, breaks=4) #수치형데이터를 구간으로 나눈다
cut

fcut <- table(cut) #빈도수를 구한다.
fcut

pfcut<- prop.table(fcut) # 상대도수 구한다.

rcut <- rbind(fcut, pfcut) # 도수와 상대도수를 병합한다.
rcut

ccut <- cumsum(rcut[1,])  #누적상대도수 추가
ccut

total<- rbind(rcut, ccut)  #누적상대도수를 기존 도수,상대도수 아래 붙인다.
total

rownames(total) <- c("도수","상대도수","누적도수")  #행의 이름을 한글로 바꾼다.
total

total<- addmargins(total, margin=2)  #margin=2: 행의합
total


#분할표
ct <- table(df$gender,df$bloodtype) #도수 분할표
ct

addmargins(ct) #행과 열의 합


pct <- prop.table(ct)  #밀도(상대도수,비율) 분할표
pct

addmargins(pct) #행과 열의 합


pct2 <- prop.table(ct,margin = 1) #행으로 비율계산

pct2

addmargins(pct2,margin=2) #행으로의 상대도수 합


pct2 <- prop.table(ct,margin = 2) #열로 비율계산
pct2

addmargins(pct2,margin = 1)#열로 상대도수의 합


install.packages("hflights")
library(hflights)
str(hflights)

#dest 도착지점 변수를 살펴본다.
countOfDest = table(hflights$Dest)
countOfDest

#명목형 변수 갯수 세기
length(countOfDest)

#비행기가 가장적게 도착한 공항과 가장 많이 도착한 공항 확인하기
range(countOfDest)

#최소값과 최대값을 가지는 이름 알기 (오거스터 리저널공항,댈러스 공항)
countOfDest[countOfDest==1]
countOfDest[countOfDest==9820]


#6000회수가 넘은 공항찾기
selectedDest <- countOfDest[countOfDest>6000]
selectedDest

#6000회가 넘는 공항들의 전체 합계구하기
addmargins(selectedDest, margin=1)


#막대 그래프로 그려보기
barplot(selectedDest)


#2018 / 10 / 13

df <- read.csv("./data/17/example_cancer.csv")

str(df)



#연령대별 도수구하기

degreeOfAge <- table(cut(df$age,breaks=(1:11)*10))

degreeOfAge



#열값의 이름을 바꾼다.

rownames(degreeOfAge) <- c("10s","20s","30s","40s","50s","60s","70s","80s","90s","100s")

degreeOfAge



#시각화-ggplot2는 위에 만든 도수분포표와 상관없이 알아서 연령대별로 그림을 그려준다.
#ggthemes는 좀더 그림을 보기 좋게 그려준다.

library(ggplot2)
install.packages("ggthemes")

library(ggthemes)

ggplot(data=df,aes(x=age)) + geom_freqpoly(binwidth=10,size=1.4, colour="orange") + theme_wsj()

#속도가 빠른 data.table 패키지 사용
install.packages("data.table")

library(data.table)
library(ggplot2)

#read.csv()보다 빠른 fread()로 데이터 읽어온다
df<- fread("./data/17/example_coffee.csv", header=T,stringsAsFactors = T,data.table = F)
str(df)

#필요한 데이터로 정제한다.
df <- subset(df, select=c(-adress, -adressBystreet,-dateOfclosure,-startdateOfcessation,-duedateOfcessation,-dateOfreOpen, -zip))

str(df)

#이데이터의 최초로 등록된 커피숍연도 찾기
range(df$yearOfStart, na.rm=T)

#1964년 최초의 커피숍에 대한 정보 확인하기
subset(df, subset=(yearOfStart ==1964))

#운영중인 오래된 커피숍을 찾아본다.
dffilter <- subset(df,subset = (stateOfbusiness == '운영중'))
range(dffilter$yearOfStart, na.rm=T)

subset(dffilter, subset=(yearOfStart==1967))

#해마다 오픈한 커피숍 개수 찾기
table(df$yearOfStart)

#막대 그래프 그리기
qplot(yearOfStart, data=df, geom="bar")

#영업상태 및 연도에 따른 분활표 생성
freq <- table(df$stateOfbusiness, df$yearOfStart)
freq

#1997년도 이상 데이터만 저장
#which()-값이 벡터중 어디있는지 알려준다.
#which.max() 벡터의 마지막 위치값을 알려준다.
which(colnames(freq)=='1997')
which.max(colnames(freq))

#1997~2014까지 데이터만 저장
freq <- freq[,c(30:47)]
freq

#비율을 구한다.margin=2;열로 비율 구
pfreq <- prop.table(freq,margin = 2)
pfreq

#새로운 데이터프레임으로 자료를 모은다.
newdf <- data.frame(colnames(freq),freq[1,],freq[2,],pfreq[1,],pfreq[2,])

newdf

#행과 열의 이름을 정리한다.
rownames(newdf)<-NULL
newdf
colnames(newdf)<-c("Time","Open","Close","Popen","Pclose")
newdf

#라인그래프로 그리기
ggplot(newdf, aes(x=factor(Time),y=Close, group=1)) +
  geom_line(colour="steelblue1",size=1) +
  geom_point(colour="steelblue", size=3) +
  geom_line(aes(y=Open),colour="tomato2", size=1) +
  geom_point(aes(y=Open),colour="red",size=6) +
  theme_bw()


