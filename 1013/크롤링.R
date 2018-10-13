#daum ---------------------------------
install.packages("rvest")
library(rvest)
#영화리뷰페이지의 2페이지에서 페이지번호제외후 복사한다.

url_base<-"https://movie.daum.net/moviedb/grade?movieId=109512&type=netizen&page="
all.reviews <- c()
for(page in 1:20){
  url<-paste(url_base,page,sep="")
  htxt <- read_html(url)
  table <- html_nodes(htxt,'.review_info')
  content <- html_nodes(table,'.desc_review')
  reviews<-html_text(content)
  print(url)
  if(length(reviews)==0){break}#반복문을 빠져나온다.
  all.reviews <- c(all.reviews, reviews) #all.reviews값에누적됨
}


head(all.reviews,20)
#크롤링한 값 파일로 저장
write.table(all.reviews,"./1013/output/daum.txt")
write.csv(all.reviews,file = "./1013/output/daum.csv")


#참고)누적예제========================
all.test <- c()
all.test <- c(all.test,1,2,3)
all.test
all.test <- c(all.test,4,5,6)
all.test
all.test <- c(all.test,7,8,9)
all.test
