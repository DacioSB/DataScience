##########
#Pizza
labs <- paste(1:3, "(", tabelinha[1:3,1], ";", round(tabelinha[1:3,3], 1), "%)", sep = "")
pie(table(tabela$grau_instrucao), labels = labs)
legend(-1.9, -0.8, legend = c("1=Fundamental, 2 = Médio, 3 = Superior"), border = NA, box.col = NA)

##########
#grafico barra de filhos
barplot(
  table(tabela$n_filhos),
  ylab = "freq",
  cex.names = 0.9,
  col = "darkseagreen3",
  border = NA
)
##########
#grafico de dispersao
#par() -> varios graficos... mfrow = c(nrows, ncols) -> uma linha de graficos com 3 graficos (colunas)
#bty -> n (no box), o (complete box)... 7, L, C, U
#yaxt -> nao mostra o eixo y
#text escreve no grafico em cima dos dados-> text(posicao no x, posicao no y, nome das linhas, posicao 3 = above)
#escala do tamanho dos bagulho que vao ser plotados. 1 = default. 1.5 = 150%. 0.5 = 50%. etc.
par(mfrow = c(1,3), pin = c(2,2), mai = c(1, 0.3, 1, 0.3))
tbs<-as.data.frame(cbind(x=0:5,y=c(1,1,1,1,NA,1)),row.names = as.integer(c(4,5,7,3,NA,1)))
plot(tbs, ylim = c(0, 7), pch=17, ylab = NA, bty = "n", yaxt = "n", col = "darkseagreen4", xlab = "(a)")
text(x = tbs$x, y = tbs$y, rownames(tbs), pos = 3)
stripchart(tabela$n_filhos, method = "stack", offset = 1, pch = 17, col = "darkseagreen4", ylim = c(0,7), ylab = NA, xlab = "(b)", cex = 1)
plot(table(tabela$n_filhos),type="p", col="darkblue",pch = 19,bty="n",ylab=NA,xlab="(c)")
#############
#Frequencias n_filhos
#rbind combina um vetor ou matriz ou data frames em por linhas
#t retorna a transposta de x (de uma matriz)
ni<-table(tabela$n_filhos)
tabela_freq_filhos <- rbind(ni, p_fi = 100 * prop.table(ni))
tabela_freq_filhos<- as.data.frame(
  t(cbind(
    tabela_freq_filhos,
    c(sum(tabela_freq_filhos[1,]),sum(tabela_freq_filhos[2,])
    ))),row.names =c(colnames(tabela_freq_filhos),"Total"))
tabela_freq_filhos<-transform(tabela_freq_filhos,p_fi=round(p_fi,digits=2))
tabela_freq_filhos
#####
#Histograma
#right é fechado a esquerda abertoa a direita
#with() aplica uma expressao a um dataset
# `xaxp' A vector of the form `c(x1, x2, n)' giving the coordinates of the extreme tick marks and the number of intervals between tick-marks.
#Ou seja, c(0,24,6) de 0 a 24 de dividido por 6 espaços (4 unidades entre cada espaço)

fig27<-hist(tabela$salario, breaks = seq(4,24,by=4),right=FALSE,probability = TRUE,plot=FALSE)
aux <- with(fig27, 100 * density * diff(breaks))
labs <- paste(round(aux), "%", sep = "")
plot(fig27,
   freq = FALSE, labels = labs,
   ylab = "Densidade de Frequencia",
   xlab = "Salario",
   col = "gray4",
   border = "white",
   xlim = c(0, 24), xaxp = c(0, 24, 6),
   ylim = c(0,.1)
)
#####
#Histograma qtd_filhos
#seq(from, to, by)
#plot é falso pra nao plotar o bagulho. Se for falso, retorna uma lista de breaks e counts e é retornado uma warning
fig28 <- hist(tabela$n_filhos, right = FALSE, breaks = seq(-0.5, 5.5, 1), plot = FALSE)
aux <- with(fig28, 100 * density * diff(breaks)[1])
labs <- paste(round(aux), "%", sep = "")
plot(
  fig28, ylab = "Densidade de Frequencia",
  xlab = "No de Filhos", col = "darkgrey", border = "white",
   yaxt = "n", ylim = c(0,8), labels = labs
)
#####
#Ramos e folhas
#scale = 1 (numero de colunas)
stem(tabela$salario, scale = 2)
tabela$salario

