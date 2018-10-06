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
