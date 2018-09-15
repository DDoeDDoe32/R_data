#결측치가 포함된 데이터 생성

df <- data.frame(gender = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))

df

is.na(df)               # 결측치 확인
table(is.na(df))        # 결측치 빈도 출력
table(is.na(df$gender))    # gender 결측치 빈도 출력
table(is.na(df$score))      # score 결측치 빈도 출력

#결측치가 포함된 데이터는 함수 적용시 연산되지 못하고 NA값 출력한다.
mean(df$score)  # 평균 산출
sum(df$score)   # 합계 산출

mean(df$score, na.rm = T)  # 평균 산출
sum(df$score, na.rm = T)   # 합계 산출

#결측치 제거
library(dplyr)                # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거

#결측치가 제거되면 함수가 적용된다.
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출

#성별및 점수의 결측치 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(gender))  # score, gender 결측치 제거
df_nomiss                                                # 출력

#na.omit()를 이용하면 결측치가 있는행을 한번에 제거할 수 있다.
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출
df_nomiss2                     # 출력

# - 함수 자체에 결측치 제외 기능(na.rm)이 있는경우는 그기능을 사용하여 함수를 적용한다.
# 결측치 제외 기능이 없을시에는 fillter()로 결측지를 제거한다.

df
mean(df$score, na.rm = T)  # 결측치 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출

exam <- read.csv("../data/csv_exam.csv")  # 데이터 불러오기
exam[c(3, 8, 15), "math"] <- NA   # 3, 8, 15행의 math에 NA 할당
exam

exam %>% summarise(mean_math = mean(math))  # math 평균 산출

# math 결측치 제외하고 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  

exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출

# - 결측치를 제거 하는 대신 다른 값으로 대체할 수 있다.
mean(exam$math, na.rm = T) # 결측치 제외하고 math 평균 산출
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
table(is.na(exam$math))                               # 결측치 빈도표 생성
exam                                                  # 출력
mean(exam$math)                                       # math 평균 산출

# ※혼자서 해보기※
# - mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# - mpg 데이터 원본에는결측치가 없습니다. 
# - 우선 mpg 데이터를 불러와 몇 개의 값을 결측치로 만들겠습니다. 
# - 아래 코드를 실행하면 다섯 행의 hwy 변수에 NA가 할당됩니다.

mpg <- as.data.frame(ggplot2::mpg)           # mpg 데이터 불러오기
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA  # NA 할당하기

# - 결측치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요.
# Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 합니다. 
# 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 합니다. 
# drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 
# 어떤 구동방식의 hwy 평균이 높은지 알아보세요. 하나의 dplyr 구문으로 만들어야 합니다.
mpg %>%
  filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))


# >>> 힌트
# Q1. 빈도표를 만드는 table()과 결측치를 확인하는 is.na()를 조합해 보세요.
# Q2. filter()와 is.na()를 조합해 결측치를 제외하고, 집단별 평균을 구하는 코드를 %>%로 연결하면 됩니다.

#이상치 제거
outlier <- data.frame(gender = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

table(outlier$gender)
table(outlier$score)

# gender가 3이면 NA 할당
outlier$gender <- ifelse(outlier$gender == 3, NA, outlier$gender)
outlier

# score가 5보다 크면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

outlier %>% 
  filter(!is.na(gender) & !is.na(score)) %>%
  group_by(gender) %>%
  summarise(mean_score = mean(score))

boxplot(mpg$hwy) #위 상자그림과 같다.

boxplot(mpg$hwy)$stats

# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)

# 결측치 확인
table(is.na(mpg$hwy))  

#결측치 제외하고  drv그룹별 평균값출력

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

# ---------------------------------------------------------------------------------------------
#   ※ 혼자서 해보기 ※
# - mpg 데이터를 이용해서 분석 문제를 해결해 보세요.
# - 우선 mpg 데이터를 불러와서 일부러 이상치를 만들겠습니다. 
# - drv(구동방식) 변수의 값은 4(사륜구동), f(전륜구동), r(후륜구동) 세 종류로 되어있습니다.
# - 몇 개의 행에 존재할 수 없는 값 k를 할당하겠습니다. 
# - cty(도시 연비) 변수도 몇 개의 행에 극단적으로 크거나 작은 값을 할당하겠습니다.

mpg <- as.data.frame(ggplot2::mpg)                  # mpg 데이터 불러오기
mpg[c(10, 14, 58, 93), "drv"] <- "k"                # drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)  # cty 이상치 할당

# - 이상치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요.
# - 구동방식별로 도시 연비가 다른지 알아보려고 합니다. 
# - 분석을 하려면 우선 두 변수에 이상치가 있는지 확인하려고 합니다.
# Q1. drv에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 다음 이상치가 사라졌는지 확인하세요. 
# 결측 처리 할 때는 %in% 기호를 활용하세요.
table(mpg$drv)
mpg$drv = ifelse(mpg$drv %in% c("4","f","r"),mpg$drv,NA)

# Q2. 상자 그림을 이용해서 cty에 이상치가 있는지 확인하세요. 
# 상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 다시 상자 그림을 만들어 
# 이상치가 사라졌는지 확인하세요.
boxplot(mpg$cty)$stats
mpg$cty=ifelse(mpg$cty<9 | mpg$cty>26, NA, mpg$cty)

# Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 
# 이상치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보세요. 
# 하나의 dplyr 구문으로 만들어야 합니다.
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(mean_cty=mean(cty, na.rm=T))
  

# >>> 힌트
# Q1. drv가 정상적인 값이면 원래 값을 유지하고 그렇지 않으면 NA를 부여하는 코드를 작성하면 됩니다. 
# 정상적인 값이 여러 개 있으니 %in%와 c()를 조합해 코드를 간결하게 만들어 보세요.

# Q2. 상자 그림을 만들 때 사용하는 다섯 가지 통계치를 출력해 정상 범위의 기준을 찾으세요.
# 그런 다음 filter()를 이용해 cty가 이 범위를 벗어날 경우 NA를 부여하면 이상치가 결측 처리 됩니다.

# Q3. filter()를 이용해 drv와 cty가 모두 결측치가 아닌 데이터를 추출한 후 집단별 평균을 구하면 됩니다.
# ---------------------------------------------------------------------------------------------
