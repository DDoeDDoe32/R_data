treat = read.csv('data2/treat.csv', fileEncoding='euc-kr')
## 옵션 fileEncoding='euc-kr' : csv 파일 인코딩이 'euc-kr'임을 지정
str(treat)

## 5개 변수, 200만 관측치
# factor( ) 형식으로 변환
## 숫자처럼 보이지만 범주형 변수인 gender, MONTH를 factor 형식으로 변환
treat$gender = factor(treat$gender)
levels(treat$gender)
levels(treat$gender) = c('1_남', '2_여')
## 수준을 1, 2에서 조금 더 명확한 값으로 변경
treat$MONTH = factor(treat$MONTH)
str(treat)

# 월별 진료건수 계산
table(treat$MONTH)
round( table(treat$MONTH) / 1000 )
## 천건 단위로 변환후 소수점 반올림

# 막대그래프 그리기(월별 진료건수)
barplot( round( table(treat$MONTH) / 1000 ) ,xlab ="진료월",ylab="진료건수") 
# AGE, gender 두변수의 교차표 만들기
## 성-연령대별 진료건수 분포 확인
t_AGE_gender = table(treat$AGE, treat$gender)

round( prop.table(t_AGE_gender, 1) ,  2)  #행백분율
round( prop.table(t_AGE_gender, 2) ,  2)  #열백분율

# DSBJT, gender의 교차표 만들기
## 성별 진료과목 분포 확인 
t_DSBJT_gender = table(treat$DSBJT, treat$gender)

# heatmap( ) 함수를 활용한 열지도 그리기  
heatmap(t_DSBJT_gender, 
        col=colorRampPalette(c('white', 'dodgerblue'))(100),
        scale='none', Rowv=NA, Colv=NA, cexRow=1.5, cexCol=1.5)


## 옵션 설명 :
## col=colorRampPalette(c('white', 'dodgerblue'))(100) 
## colorRampPalette( ) 함수를 활용하여 흰색부터 파랑색까지 100개 그라데이션색 생성
## scale='none'
## heatmap( ) 함수는 기본적으로 교차표의 행표준화 결과를 시각화
## 해당 옵션으로 행표준화 대신 원본 교차표로 시각화
## Rowv=NA, Colv=NA
## 열지도 작성시 덴드로그램(Dendrogram) 제외

#교차표 대신, 행 백분율을 넣어서 진료과목별 성비율을 그린다.
heatmap(prop.table(t_DSBJT_gender,1), 
        col=colorRampPalette(c('white', 'red'))(100),
        scale='none', Rowv=NA, Colv=NA, cexRow=1.5, cexCol=1.5)
# 데이터 부분 선택(내과)
internal = subset(treat, DSBJT=='내과')

# MAIN_SICK, AGE 교차표 생성
## 연령대별 주상병 확인
t_MS_AGE = table(internal$MAIN_SICK, internal$AGE)
dim(t_MS_AGE)

#주상병별 진료건수를 구하기 위해 AGE별 행 합계를 계산한다.
rowSums(t_MS_AGE)

#주상병별 진료건수가 2만건이상인 연령대별 주상병의 열지도를 그린다.
t_MS_AGE2 = t_MS_AGE[rowSums(t_MS_AGE)> 20000, ]
heatmap(t_MS_AGE2, 
        col=colorRampPalette(c('white', 'red'))(100),
        scale='none', Rowv=NA, Colv=NA, cexRow=1.5, cexCol=1.5)

#주상병별 진료건수가 1만건이상인 연령대별 주상병의 열지도를 그린다.
t_MS_AGE2 = t_MS_AGE[rowSums(t_MS_AGE)> 10000, ]
heatmap(t_MS_AGE2, 
        col=colorRampPalette(c('white', 'red'))(100),
        scale='none', Rowv=NA, Colv=NA, cexRow=1.5, cexCol=1.5)


heights = read.csv('data2/heights.csv')
head(heights)
nrow(heights) #행의 수
summary(heights) 
boxplot(heights)

# 아들키 히스토그램
hist(heights$son)
# 산점도 그리기
plot(heights, pch=16, col=rgb(0.2, 0.2, 0.7, 0.5))

## heigths의 첫번째 변수(father, 아빠키)를 x축, 
## 두번째 변수(son, 아들키)를 y축 좌표로 활용하여 점 찍음
## 옵션 pch=16 : 각 번호마다 점 모양이 다름
## 옵션 col=   : 점 색깔을 지정
## 함수 rgb(R, G, B, A) : 빨강, 초록, 파랑의 비율을 0~1사이값으로 넣어 색상지정
## 알파(A)값을 지정하여 투명한 색깔 지정가능(0.5 -> 점 두개가 겹쳐야 온전한 색)

# 평균 기준 보조선 추가 
abline( v= mean(heights$father), lty=2 )
## 아빠키 평균에서 수직선("v"ertical) 추가
abline( h= mean(heights$son), lty=2 )
## 아들키 평균에서 수평선("h"orizontal) 추가
## 옵션 lty=2 : 선 모양(line type) 변경(1:실선, 2:점선, ...)