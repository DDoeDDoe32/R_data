# <실습> 산술연산자 
num1 <- 100 # 피연산자1
num2 <- 20  # 피연산자2
result <- num1 + num2 # 덧셈
result # 120
result <- num1 - num2 # 뺄셈
result # 80
result <- num1 * num2 # 곱셈
result # 2000
result <- num1 / num2 # 나눗셈
result # 5

result <- num1 %% num2 # 나머지 계산
result # 0

result <- num1^2 # 제곱 계산(num1 ** 2)
result # 10000

result <- num1^num2 # 100의 20승
result # 1e+40 -> 1 * 10의 40승과 동일한 결과

# (1) 동등비교 
boolean <- num1 == num2 # 두 변수의 값이 같은지 비교
boolean # FALSE
boolean <- num1 != num2 # 두 변수의 값이 다른지 비교
boolean # TRUE

# (2) 크기비교 
boolean <- num1 > num2 # num1값이 큰지 비교
boolean # TRUE
boolean <- num1 >= num2 # num1값이 크거나 같은지 비교 
boolean # TRUE
boolean <- num1 < num2 # num2 이 큰지 비교
boolean # FALSE
boolean <- num1 <= num2 # num2 이 크거나 같은지 비교
boolean # FALSE


# - 논리연산의 배타적 논리합은 두논리값이 상반되는 경우는 TRUE, 같으면 FALSE값을 반환한다. 
# <실습> 논리연산자
logical <- num1 >= 50 & num2 <=10 # 두 관계식이 같은지 판단 
logical # FALSE
logical <- num1 >= 50 | num2 <=10 # 두 관계식 중 하나라도 같은지 판단
logical # TRUE

logical <- num1 >= 50 # 관계식 판단
logical # TRUE
logical <- !(num1 >= 50) # 괄호 안의 관계식 판단 결과에 대한 부정
logical # FALSE

x <- TRUE; y <- FALSE
xor(x,y) # [1] TRUE
x <- TRUE; y <- TRUE
xor(x,y) # FALSE

x = 10; y=5
z = x*y
if(x*y > 40){
  cat("x*y의 결과는 40이상입니다.\n")
  cat("x*y=",z,"\n")
  print(z)
} else {
  cat("x*y의 결과는 40미마만입니다 x*y=",z,"\n")
}

score = scan()
score

if(score >= 90){  # 조건식1
  result="A학점"  # 조건식1 참
}else if(score >=80){ # 조건식2
  result="B학점"  # 조건식1 거짓, 조건식2 참 
}else if(score >=70){
  result="C학점"
}else if(score >=60){
  result="D학점"
}else{
  result="F학점"
}  
cat("당신의 학점은 ",result)  # 당신의 학점은  B학점
print(result)

# ifelse(조건, 참, 거짓) - 3항 연산자 기능

score <- c(78, 95, 85, 65)
score
ifelse(score>=80, "우수","노력") #우수

excel = read.csv("data/data/04/excel.csv",header = T)
q1 = excel$q1
q1

ifelse(q1>=3,sqrt(q1),q1)
ifelse(q1>=2 & q1<=4, q1^2,q1)
