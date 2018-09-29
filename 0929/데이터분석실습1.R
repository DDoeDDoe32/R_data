install.packages("foreign")  # foreign 패키지 설치

library(foreign)             # SPSS 파일 로드
library(dplyr)               # 전처리
library(ggplot2)             # 시각화
library(readxl)              # 엑셀 파일 불러오기

# 데이터 불러오기
raw_welfare <- read.spss(file = "./data/12/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)


# 복사본 만들기
welfare <- raw_welfare

head(welfare)
tail(welfare)

