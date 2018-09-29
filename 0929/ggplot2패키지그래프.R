library(ggplot2)

# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6)

# x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6) + 
  ylim(10, 30)

df <- read.csv("./data/11/example_studentlist.csv")
head(df)
#install.packages("ggplot2")
library(ggplot2)
g1<- ggplot(df, aes(x=weight, y=height))
g1 + geom_point(aes(colour=gender,shape=bloodtype),size=5)

g1 + geom_point(aes(colour=height,shape=gender),size=5)

#alpha로 투명도 조절
g1 + geom_point(aes(colour=height,shape=gender),size=5, alpha=0.6)

g1 + geom_point(aes(colour=gender),size=5) + geom_smooth(method="lm")

g1 + geom_point(aes(colour=gender),size=5) +
  geom_text(aes(label=name),vjust=-1.1, colour="grey35")

getwd()

# ※ 혼자서 해보기
# - mpg 데이터와 midwest 데이터를 이용해서 분석 문제를 해결해 보세요.
# Q1. mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 합니다. 
# x축은 cty, y축은 hwy로 된 산점도를 만들어 보세요.

ggplot(mpg, aes(x=cty, y=hwy)) + geom_point()

# Q2. 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해서 전체 인구와 
# 아시아인 인구 간에 어떤 관계가 있는지 알아보려고 합니다. 
# x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요. 
# 전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하세요.

str(midwest)

midwest = ggplot2::midwest
midwest

ggplot(midwest,aes(x=poptotal,y=popasian)) + 
  geom_point() +
  xlim(0,500000) +
  ylim(0,10000)


# ※ 힌트
# Q1. geom_point()를 이용해 산점도를 만들어 보세요.
# Q2. xlim()과 ylim()을 이용해 조건에 맞게 축을 설정하면 됩니다.

#install.packages("dplyr")
library(dplyr)

mpg = ggplot2::mpg

df_mpg <- mpg %>% 
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm=T))

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

ggplot(data = mpg, aes(x = drv)) + geom_bar()

ggplot(data = mpg, aes(x = hwy)) + geom_bar()


df <- read.csv("./data/11/example_studentlist.csv")
head(df)
#install.packages("ggplot2")
library(ggplot2)
ggplot(df,aes(x=bloodtype)) + geom_bar()

ggplot(df,aes(x=bloodtype,fill=gender)) + geom_bar()

ggplot(df,aes(x=bloodtype,fill=gender)) + geom_bar(position="dodge")

ggplot(df,aes(x=bloodtype,fill=gender)) + geom_bar(position="identity")

# ※ 혼자서 해보기
# - mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# Q1. 어떤 회사에서 생산한 "suv" 차종의 도시 연비가 높은지 알아보려고 합니다.
# "suv" 차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 
# 막대는 연비 가 높은 순으로 정렬하세요.

data_mpg = mpg %>%
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
data_mpg  

ggplot(data_mpg,aes(x=reorder(manufacturer,-mean_cty),y=mean_cty)) + 
  geom_col()

# Q2. 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 합니다. 
# 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.

ggplot(mpg, aes(x=class)) + geom_bar()


# ※ 힌트
# Q1. 우선 그래프로 나타낼 집단별 평균표를 만들어야합니다. 
# filter()로 "suv" 차종만 추출한 후 group_by()와 summarise()로 회사별 cty 평균을 구하고, 
# arrange()와 head()로 상위 5행을 추출하면 됩니다. 
# 이렇게 만든 표를 geom_col()을 이용해 막대 그래프로 표현해 보세요. 
# reorder()를 이용해 정렬 기준이 되는 평균 연비 변수 앞에 - 기호를 붙이면 
# 연비가 높은 순으로 막대를 정렬할 수 있습니다.

# Q2. 빈도 막대 그래프는 요약표를 만드는 절차 없이 원자료를 이용해 만들므로 geom_col() 대신 
# geom_bar()를 사용하면 됩니다.

economics2 <-ggplot2::economics
head(economics2)

ggplot(data=economics2,aes(x=date, y=unemploy)) +
  geom_line()

# ※ 혼자서 해보기
# - economics 데이터를 이용해서 분석 문제를 해결해 보세요.
# Q1. psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다.
# 시간에 따른 개인 저축률의 변화를 나타낸 시계열 그래프를 만들어 보세요.

ggplot(economics2, aes(x=date, y=psavert)) + geom_line()



ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


# ※ 혼자서 해보기
# - mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# Q1. class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 
# 어떻게 다른지 비교해보려고 합니다. 세 차종의 cty를 나타낸 상자 그림을 만들어보세요.

class_mpg = mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
class_mpg

ggplot(class_mpg,aes(x=class,y=cty)) + geom_boxplot()

# ※ 힌트
# - 우선 filter()를 이용해 비교할 세 차종을 추출해야 합니다. 추출한 데이터를 이용해 geom_boxplot()으로
# 상자그림을 만들면 됩니다.


