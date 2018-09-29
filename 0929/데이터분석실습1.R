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
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  gender= h10_g3,             # 성별
                  birth = h10_g4,               # 태어난 연도
                  marriage = h10_g10,        # 혼인 상태
                  religion = h10_g11,          # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,      # 직종 코드
                  code_region = h10_reg7)  # 지역 코드
class(welfare$gender)
table(welfare$gender)

# 이상치 확인 -> 현재의 데이터는 9는 없다.
table(welfare$gender)

# 이상치 결측 처리-> 만약 존재한다면 ifelse()로 9를 NA로 결측처리한다.
welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)

# 결측치 확인
table(is.na(welfare$gender))


# - 성별 변수의 값이 1,2대신 이해하기 쉽게 male,female로 변경한다.

# 성별 항목 이름 부여
welfare$gender <- ifelse(welfare$gender == 1, "male", "female")

# - 변경된 값을 table(), qplot()로 확인하다.

table(welfare$gender)
qplot(welfare$gender)


class(welfare$income)

summary(welfare$income)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income)  #대다수 차지하는 0~1000까지의 값이 잘 안나옴
qplot(welfare$income) + xlim(0, 1000)

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

income <- table(is.na(welfare$income))

gender_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(gender) %>%
  summarise(mean_income = mean(income))
gender_income

ggplot(data = gender_income, aes(x = gender, y = mean_income)) + geom_col()

class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 이상치 확인->없음
summary(welfare$birth) 

# 결측치 확인->없음
table(is.na(welfare$birth))

# 이상치 결측 처리->없으므로 생략 가능
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>%  #기본데이터에서
  filter(!is.na(income)) %>%    #월급의 결측치가 없는 데이터만
  group_by(age) %>%           #나이별 그룹으로 
  summarise(mean_income = mean(income))  #월급 평균을 구한다.

head(age_income)

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
  ifelse(age <= 59, "middle", "old")))

ageg_income <- welfare %>%   #기본데이터에서
  filter(!is.na(income)) %>%       #월급에서 결측치없이
  group_by(ageg) %>%            #연령대별로
  summarise(mean_income = mean(income)) #평균급여를 생성한다.

ageg_income

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ageg_gender_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, gender) %>%                 #연령대별 및 성별 그룹으로
  summarise(mean_income = mean(income))  #월급 평균을 생성
ageg_gender_income

# ※참고) 소숫점 2자리까지 나오는 방법
ageg_gender_income = welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg,gender) %>% 
  summarise(mean_income=formatC(mean(income), digits = 2, format = "f"))

ageg_gender_income


ggplot(data = ageg_gender_income, aes(x = ageg, y = mean_income, fill = gender)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data = ageg_gender_income, aes(x = ageg, y = mean_income, fill = gender)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))

gender_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, gender) %>%
  summarise(mean_income = mean(income))

gender_age

head(gender_age)

ggplot(data = gender_age, aes(x = age, y = mean_income, col = gender)) + geom_line()


class(welfare$code_job)
table(welfare$code_job)

library(readxl) #엑셀에서 읽어오는 함수가 들어있는 패키지 로등

list_job <- read_excel("./data/12/Koweps_Codebook.xlsx", col_names = T, sheet = 2) #엑셀파일 읽어오기

head(list_job)

dim(list_job)

welfare <- left_join(welfare, list_job, id = "code_job")  #id 기준으로 welfare데이터에 직업 분류를 새로운 열로 조인

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

job_income <- welfare %>%                   
  filter(!is.na(job) & !is.na(income)) %>%         
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

top10

ggplot(data = top10, aes(x = reorder(job,mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()

bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)
bottom10

ggplot(data = bottom10, aes(x = reorder(job, -mean_income), 
  y = mean_income)) +
  geom_col() + 
  coord_flip() + 
  ylim(0, 850)   #하위순위의 월급 평균이 최대100이 안되므로 상위10위비교하기 위해 y축을 지정하였다.

# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & gender == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_male


job_female <- welfare %>%
  filter(!is.na(job) & gender == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)
job_female

# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()

class(welfare$religion)
table(welfare$religion) #종교있음1, 종교없음2, 모름/무응답9

welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)

qplot(welfare$religion)   #그래프로 확인

class(welfare$marriage)
table(welfare$marriage)

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))

table(welfare$group_marriage)

table(is.na(welfare$group_marriage))

qplot(welfare$group_marriage)


religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = formatC(n/tot_group*100, 1,format = "f"))
religion_marriage

# 이혼 추출
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>% 
  select(religion, pct)
divorce

ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(ageg, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))
ageg_marriage

# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>% 
  filter(ageg != "young" & group_marriage == "divorce") %>% 
  select(ageg, pct)
ageg_divorce

ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()

# 연령대, 종교유무, 결혼상태(group_marriage)별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))   #비율
ageg_religion_marriage

# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>% 
  select(ageg, religion, pct)
df_divorce

ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion )) +
  geom_col(position = "dodge")


class(welfare$code_region)
table(welfare$code_region)

# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region

# 지역명 변수 추가 
welfare <- left_join(welfare, list_region, id = "code_region")
welfare %>%
  select(code_region, region) %>%
  head

region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 2))
head(region_ageg)

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()


# 노년층 비율 오름차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == "old") %>%
  arrange(pct)
list_order_old

order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg,       #factor로 변환 및 level지정
  level = c("old", "middle", "young"))

class(region_ageg$ageg)
levels(region_ageg$ageg)
ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)
