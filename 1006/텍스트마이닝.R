install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(KoNLP)
useNIADic()

txt <- readLines("./data/14/hiphop.txt")
head(txt)

library(stringr)

# 특수문제 제거
txt <- str_replace_all(txt, "\\W", " ")

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

# 가사에서 명사추출
nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
head(df_word)
# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
head(df_word)

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

#빈도순으로 정렬한 후 상위 20개 단어를 추출한다.
top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top_20

# 패키지 설치
install.packages("wordcloud")

# 패키지 로드
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8,"Dark2")  # Dark2 색상 목록에서 8개 색상 추출

wordcloud(words = df_word$word,  # 단어
          freq = df_word$freq,   # 빈도
          min.freq = 2,          # 최소 단어 빈도
          max.words = 200,       # 표현 단어 수
          random.order = F,      # 고빈도 단어 중앙 배치
          rot.per = .1,          # 회전 단어 비율
          scale = c(4, 0.3),     # 단어 크기 범위
          colors = pal)          # 색깔 목록

pal <- brewer.pal(9,"Blues")[5:9]  # 색상 목록 생성

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 2,            # 최소 단어 빈도
          max.words = 200,         # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치
          rot.per = .1,            # 회전 단어 비율
          scale = c(4, 0.3),       # 단어 크기 범위
          colors = pal)            # 색상 목록


# 데이터 로드
twitter <- read.csv("./data/14/twitter.csv",
                    header = T,
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8")

# 변수명 수정
twitter <- rename(twitter,
                  no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

# 특수문자 제거
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")

head(twitter$tw)


# 트윗에서 명사추출
nouns <- extractNoun(twitter$tw)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)


# 두 글자 이상 단어만 추출
df_word <- filter(df_word, nchar(word) >= 2)

# 상위 20개 추출
top20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top20

library(ggplot2)

order <- arrange(top20, freq)$word               # 빈도 순서 변수 생성

ggplot(data = top20, aes(x = word, y = freq)) +  
  ylim(0, 2500) +
  geom_col() + 
  coord_flip() +
  scale_x_discrete(limit = order) +              # 빈도 순서 변수 기준 막대 정렬
  geom_text(aes(label = freq), hjust = -0.3)     # 빈도 표시

pal <- brewer.pal(8,"Dark2")       # 색상 목록 생성

wordcloud(words = df_word$word,    # 단어
          freq = df_word$freq,     # 빈도
          min.freq = 10,           # 최소 단어 빈도
          max.words = 200,         # 표현 단어 수
          random.order = F,        # 고빈도 단어 중앙 배치(출력되는 순서를 임의로 지정)
          rot.per = .1,            # 회전 단어 비율
          scale = c(6, 0.2),       # 단어 크기 범위
          colors = pal)            # 색상 목록

# 색상 정보
brewer.pal.info

par(mfrow=c(1, 3))
display.brewer.all(type="div")
display.brewer.all(type="seq")
display.brewer.all(type="qual")


# (3) 검색엔진을 통한 빅데이터 주제 검색 결과에 대한 텍스트 마이닝
# 1) 패키지 설치 및 데이터 읽어오기
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("stringr")

# 패키지 로드
library(KoNLP)
library(dplyr)
library(wordcloud)
library(stringr)
library(RColorBrewer)

useNIADic()

txt <- file("./data/14/bigdata.txt",encoding="utf-8")
text <- readLines(txt)
close(txt)

# 2)데이터 정제하기

text <- str_replace_all(text, "\\W", " ")

nouns <- extractNoun(text)
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 세 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 3)

top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)
top_20

pal <- brewer.pal(9,"Set1")  # Set1 색상 목록에서 9개 색상 추출

wordcloud(words = df_word$word,  # 단어
          freq = df_word$freq,   # 빈도
          min.freq = 1,          # 최소 단어 빈도
          max.words = 200,       # 표현 단어 수
          random.order = F,      # 고빈도 단어 중앙 배치
          rot.per = .1,          # 회전 단어 비율
          scale = c(4, 0.3),     # 단어 크기 범위
          colors = pal)          # 색깔 목록


# (1) 코리아 헤럴드의 경제 부분 기사 텍스트 마이닝
# 1) 데이터 준비 및 패키지 설치
# Install
install.packages("tm")  # for text mining
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("wordcloud")
library("RColorBrewer")
text <- readLines("./data/14/kor.txt")

# 2) 데이터 정제 
class(text)

#벡터이므로 VectorSource( ) 함수 사용함
#Dataframe 의 경우 DataframeSource( ) 함수 씀.
#데이터를 tm 패키지가 처리할 수 있는 형태인 Corpus (말뭉치) 형태로 변환
docs <- Corpus(VectorSource(text))

#공백제거
docs <- tm_map(docs, stripWhitespace)

# Convert the text to lower case(소문자변경-사전에 있는 내용과 비교하기 위해)
docs <- tm_map(docs, tolower)
# Remove numbers(숫자제거)
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords(뛰어쓰기와 시제 제거 )
docs <- tm_map(docs, removeWords, stopwords("english"))

# Remove punctuations(구두점제거)
docs <- tm_map(docs, removePunctuation)

#term document matrix를 만든다.
dtm <- TermDocumentMatrix(docs)

dtm

m <- as.matrix(dtm)
head(m)

#term document matrix의 결과를  행으로 합해서 내림차순으로 정렬
v <- sort(rowSums(m),decreasing=TRUE) 
v

d <- data.frame(word = names(v),freq=v)

# 3) 워드 클라우드로 시각화 

wordcloud(words = d$word,
          freq = d$freq,
          min.freq = 1,
          max.words=200,
          random.order=FALSE,
          rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))
