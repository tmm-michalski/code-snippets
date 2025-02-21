# SWD-ID-Lab4-Zestaw-zada�
library(TeachingDemos)
library(MASS)
# Zadanie 1 --------------------------------------------------------------------
# >>> Przyk�ad 5 na Wyk�adzie nr 3



# Zadanie 2 --------------------------------------------------------------------

# H0: mu = 1.20 
# H1: mu > 1.20 (wytrzymalosc butelek przekracza 1.20)

# X - wytrzyma�o�� butelek, X~N(mu,sigma=0.07) >>> z.test()

x <- c(1.36, 1.14, 1.27, 1.15, 1.20, 1.29, 1.27, 1.18, 1.23, 1.36, 1.38, 
       1.37, 1.30, 1.21, 1.33, 1.28, 1.32, 1.29, 1.33, 1.25)

z.test(x, mu=1.20, alt='g', stdev = 0.07)
# g - greater than, l - less, not equal - nothing
#alpha = 0.04
# p-value = 7.052e-07 (jest bardzo bliskie 0), wi�c odrzucamy H0 i przyjmujemy H1.



# Zadanie 3 --------------------------------------------------------------------

# H0: mu = 110
# H1: mu != 110

# X - pr�dko�� przy radarze na autostradzie w km/h, X~N(mu, sigma) >> t.test()

x <- c(106, 115, 99, 109, 122, 119, 104, 125, 107, 111)

t.test(x, mu=110)
# alpha = 0.05
# p-value = 0.5366 > alpha, nie mampy podstaw do odrzucenia H0
# Przyjmujemy, �e �rednia pr�dkko�� przy radarze nie r�ni si� ISTOTNIE od 110km/h.

# Zadanie 13 -------------------------------------------------------------------
data(Loblolly)
View(Loblolly)

x <- Loblolly$height[Loblolly$age==15]
t.test(x, mu=40)


# Zadanie 14 -------------------------------------------------------------------
n <- 500
k <- 226





# Zadanie 4 --------------------------------------------------------------------

data(chickwts)
x <- chickwts$weight[chickwts$feed=='soybean']

# H0: mu = 260 (�rednia waga nie przekracza 260)
# H1: mu > 260 (�rednia waga > 260)

# Jaki test do tej hipotezy dla �redniej?
(n <- length(x)) # n=14 - ma�a pr�ba

# czyli Model 3 dla mu nie jest odpowiedni

# Czy rozk�ad wagi jest normalny?
# test Shapiro-Wilka
# H0: X~normalny
# H1: X nie ma rozk�adu normalnego

shapiro.test(x)
# p-value = 0.5064 > alpha, zatem X ma rozk�ad normalny


t.test(x, mu=260, alt='g')

# p-value = 0.8174 > alpha 
# zatem na poziomie istotno�ci 0.05 nie mamy podstaw do stwierdzenia,
# �e �rednia waga tych kurczak�w przekracza 260




# Zadanie 7 --------------------------------------------------------------------
serwery <- read.csv2('serwery.csv')
names(serwery)

# X - czas wykonania algorytmu na serwerze A
# Y - czas wykonania algorytmu na serwerze B

# H0: mu1 = mu2
# H1: mu1 != mu2

# du�e pr�by, zatem t.test()
x <- serwery$serwerA
y <- serwery$serwerB

t.test(x, y)

boxplot(x,y, col=2:3)


# Zadanie 8 --------------------------------------------------------------------
data(chickwts)
x <- chickwts$weight[chickwts$feed=='casein']
y <- chickwts$weight[chickwts$feed=='soybean']

# sprawdzamy, czy uda si� zastosowa� t.test()
# X~???, Y~??? 
length(x)
length(y) # ma�e pr�by

# H0: rozk�ad jest normalny
# H1: nie jest normalny
shapiro.test(x) # p-value = 0.2592 > alpha=0.05  >>> X~N
shapiro.test(y) # p-value = 0.5064 > alpha=0.05 >>> Y~N

# czyli mo�na zastoswa� t.test :)
# czy wariancje takie same?

# H0: sigma1 = sigma2
# H1: sigma1 != sigma2

var.test(x,y) #  p-value = 0.544 > alpha=0.05 >>> wariancje s� r�wne
# zatem w t.test ustawiamy var.equal=TRUE

t.test(x, y, var.equal = TRUE) # p-value = 0.002869 < alpha >>>> H1
# odp. wagi tych kurczak�w r�ni� si� istotnie

boxplot(x,y, col=4:5)


# Zadanie 9 --------------------------------------------------------------------
# czy jakosc tych partii r�zni sie istotnie?

n1 <- 250; k1 <- 10
n2 <- 300; k2 <- 18

alpha <- 0.02
# p1 - odsetek wadliwych w I partii
# p2 - odsetek wadliwych w II partii

# H0: p1 = p2 (nie)
# H1: p1 != p2 (tak)

prop.test(c(k1,k2), c(n1,n2))
# p-value = 0.3856 > 0.02 >>> pozostajemy przy H0
# odp. jakosc tych partii nie r�zni sie istotnie



# Zadanie 15 -------------------------------------------------------------------
data(iris)
x <- iris$Petal.Length[iris$Species=='virginica']
y <- iris$Petal.Length[iris$Species=='versicolor']

# H0:
# H1:


# ----------------
# Zadania 10, 11, 12 - zadania domowe ;)
# ------------------------------------------------------------------------------
#Kartk�wka 1
library(MASS)

data(crabs)
# View(crabs)
(x <- crabs$CL)
(n <- length(x))
length(x)

#alpha = 0.05
# H0: mu = 35 D�ugo�� pancerza jest taka sama
# H1: mu < 35 D�ugo�� pancerza jest ISTOTNIE ni�sza ni� 35
# Alfa = 0.05

t.test(x, mu=35, alt='less')
shapiro.test(x)
#je�eli to jest powyzej alfy to ma rozklad normalny

# p-value = 1.66e-08 < alpha
# Odrzucamy H1, d�ugosc mancerza jest ISTOTNIE mnijesza niz 35

# t.test -> jest rozk�ad normalny, albo/i pr�ba >25