library(TeachingDemos)
library(MASS)

data(iris)
Viw(iris)
x <- iris$Petal.Width
#H0: mu =  1.5 Szerokosci nie s� istotnie r�ne
#H1: mu != 1.5 Szerokosci s� istotnie r�ne

#alpha = 0.05

t.test(x, mu=1.5)
# p-value = 3.341e-06 < alpha odrzucamy H0. Mo�emy stwierdzi� �e szeroko�� p�atka jest
#istotnie r�na od 1.5