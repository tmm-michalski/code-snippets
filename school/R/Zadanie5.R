data(chickwts)
View(chickwts)
#brak informacji o rozkladzie, nie ma sigmy
x <- chickwts$weight[chickwts$feed=='soybean']
# poziom istotno�ci = 0.05 = alpha


#H0: mu = 260
#H1: mu > 260

(n <- length(x)) # mala proba
#sprawdzamy czy jest rozklad normalny
#H0: jest normalny
#H1: nie jest normalny
shapiro.test(x)
#p-value shapiro jest wi�ksze ni� alpha, czyli mamy rozk�ad normalny

t.test(x, mu=260, alt='g')

#p-value = 0.8174, nie mamy podstaw by nie wierzy� w H0.

