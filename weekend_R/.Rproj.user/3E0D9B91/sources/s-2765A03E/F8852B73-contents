library(dplyr)

exam = read.csv("GitHub/R_data/data/csv_exam.csv")
exam

# exam에서 class가 1인 경우만 추출하여 출력

exam %>% filter(class == 1)  
# 2반인 경우만 추출
exam %>% filter(class == 2)  
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)

## -------------------------------------------------------------------- ##

# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)

# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)

# 영어 점수가 80점 이상인 경우
exam %>% filter(english >= 80)

# 영어 점수가 80점 이하인 경우
exam %>% filter(english <= 80)

## -------------------------------------------------------------------- ##

# 1반이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)

# 2반이면서 영어 점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)

## -------------------------------------------------------------------- ##

# 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어 점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)

## -------------------------------------------------------------------- ##

# 1, 3, 5 반에 해당되면 추출
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1,3,5))

## 추출한 행으로 데이터 만들기--------------------------------------------------------- ##
class1 <- exam %>% filter(class == 1)  # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2)  # class가 2인 행 추출, class2에 할당
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기

# ※ 혼자서 해보기 ※


# >>> mpg 데이터를 이용해 분석 문제를 해결해 보세요.

# Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다.
# displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 어떤 자동차의 hwy(고속도로 연비)가
# 평균적으로 더 높은지 알아보세요.(filter())
mpg
mpg_a = mpg %>% filter(displ <= 4)
mpg_a

mpg_b = mpg %>% filter(displ >= 5)
head(mpg_b)

mean(mpg_a$hwy)
mean(mpg_b$hwy)

# Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다.
# "audi"와 "toyota" 중 어느 manufacturer(자동차 제조 회사)의 cty(도시 연비)가 평균적으로
# 더 높은지 알아보세요.
mpg_audi = mpg %>% filter(manufacturer=="audi")
head(mpg_audi)

mpg_toyota = mpg %>% filter(manufacturer=="toyota")
head(mpg_toyota)

mean(mpg_audi$cty)
mean(mpg_toyota$cty)

# Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다.
# 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.(filter(),%in%)
mpg_menu = mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
mean(mpg_menu$hwy)


exam %>% select(math)                  # math 추출
exam %>% select(english)               # english 추출
exam %>% select(class, math, english)  # class, math, english 변수 추출
exam %>% select(-math)                 # math 제외
exam %>% select(-math, -english)       # math, english 제외
# - filter()와 select() 조합
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)
# 가독성 있게 줄바꿈
exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출

#일부만 출력
exam %>% 
  select(id, math) %>%    # id, math 추출
  head                    # 앞부분 6행까지 추출

exam %>% 
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출

# ※ 혼자서 해보기 ※

# >>> mpg 데이터를 이용해서 분석 문제를 해결해보세요.

# Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해서 분석에 활용하려고 합니다.
# mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만드세요.
# 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.(select())
mpg_df = mpg %>% select(class,cty)
head(mpg_df)

# Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다.
# 앞에서 추출한 데이터를 이용해서 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중
# 어떤 자동차의 cty(도시 연비)가 더 높은지 알아보세요.(filter())
mpg_suv = mpg_df %>% filter(class=="suv")
mpg_compact = mpg_df %>% filter(class=="compact")
mean(mpg_suv$cty)
mean(mpg_compact$cty)

