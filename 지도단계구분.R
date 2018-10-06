#R-3.5------------------------------------------- 
install.packages("devtools")
devtools::install_github("cardiomoon/ggiraphExtra", force=T)
#--------------------------------------------------

library(ggiraphExtra)
str(USArrests)
head(USArrests)
library(tibble)
crime = rownames_to_column(USArrests, var="state")
crime$state <- tolower(crime$state)

str(crime)

install.packages("maps")
library(maps)
library(ggplot2)
states_map <- map_data("state")
str(states_map)

install.packages("mapproj")
library(mapproj)
ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Murder,    # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map)     # 지도 데이터

ggChoropleth(data = crime,         # 지도에 표현할 데이터
             aes(fill = Murder,    # 색깔로 표현할 변수
                 map_id = state),  # 지역 기준 변수
             map = states_map,     # 지도 데이터
             interactive = T)      # 인터랙티브

#한국 맵
install.packages("stringi")

devtools::install_github("cardiomoon/kormaps2014", force=T)

library(kormaps2014)

str(changeCode(korpop1))
library(dplyr)
#한글 변수명 영문으로 변경
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)z

korpop1
library(ggplot2)

# 단계구분도 만들기
ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill = pop,       # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)        # 인터랙티브

str(changeCode(tbc))
ggChoropleth(data = tbc,           # 지도에 표현할 데이터
             aes(fill = NewPts,    # 색깔로 표현할 변수
                 map_id = code,    # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)      # 인터랙티브

