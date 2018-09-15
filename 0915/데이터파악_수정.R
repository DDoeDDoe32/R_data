df_raw <- data.frame(var1 = c(1, 2, 1),   #두개의 변수로 구성된 데이터 프레임 생성
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")  # dplyr 설치

library(dplyr)                # dplyr 로드

df_new <- df_raw         # 복사본 생성
df_new                       # 출력
df_new <- rename(df_new, v2 = var2)  # var2를 v2로 수정

df_new                  #var2를 v2로 수정된 데이터 출력
df_raw                  #변경전 원본데이터 출력

# 혼자 해보기
# Q1 ggplot2 패키지 mpg데이터 불러와서 복사본 만들기
mpg_new = as.data.frame(ggplot2::mpg)
mpg_new2 = mpg_new
mpg_new2

# Q2 복사본 데이터를 이용해서 cty를 city로, hwy를 highway로 수정하기
str(mpg_new2)
mpg_new2 = rename(mpg_new2, city=cty, highway=hwy)
str(mpg_new2)

# Q3 데이터 일부를 출력해 변수명이 바뀌었는지 확인해 본다.
head(mpg_new2)

#파생변수 만들기
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
df$var_sum <- df$var1 + df$var2       # var_sum 파생변수 생성
df

df$var_mean <- (df$var1 + df$var2)/2  # var_mean 파생변수 생성
df
