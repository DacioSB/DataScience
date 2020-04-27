1+2
5%%2
#######
char <- "Hello World!"
#pra saber qual o type da variavel
class(char)
######
#Não é permitido tipos diferentes na function combine()
issaew <- c("A", "BC", "CDE")
class(issaew)
issaew
#Os elementos dos vetores podem ter nomes
names(issaew) <- c("1 Letra", "Duas letras", "Três letras")
issaew
######
v1 <- c(1, 3, 5)
v2 <- c(0, 2, 4)
v1 + v2
sum(v1)
#podemos tambem usar outras funções em vetores
#Standard Deviation(desvio padrao) (quando o desvio é baixo, indica que os dados estão mais proximos da media)
#desvio padrao é a raiz quadrada da variancia
sd(v1)
var(v1)
#######
v1 <- c(1,2,3)
v2 <- c(10,20,2)
v1 < v2
########
#Posso pegar items pelo index passando um vector de index
v2[c(2, 3)]
#O slice[pega:pega]
v1 <- c(1,2,3,4,5,6,7,8,9,10)
v1[6:9]
#chamando nao pelo index mas pelo nome
names(v1) <- c("a", "b", "c", "d", "e", "f", "g", "h", "j", "l")
v1["b"]
#comparacao dentro do proprio [index]
v1[v1 >= 5]
class(v1)
#######
#Abrindo o helper
help(vector)
summary(v1)
######
#exercises
stock <- c(23, 27, 23, 21, 34)
names(stock) <- c("Mon", "Tues", "Weds", "Thur", "Fri")
stock
mean(stock)
over23 <- stock > 23
over23
over23 <- c(stock[stock > 23])
over23
#max nao me da o dia
max(stock)
#Agora vai me dar o dia
maximum <- stock == max(stock)
maximum
class(maximum)
stock[maximum]
