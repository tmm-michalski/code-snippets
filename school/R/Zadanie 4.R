# H0 mu = .45
# H1 my > .45

n <- 500 #os�b
k <- 226 #zag�osowali

# alpha 0.05, duza proba

binom.test(k, n, p=0.45, alt='greater')

# p-value = 0.4815 > alphy wi�c H0 zostaje. Na poziomie istotno�ci nie mo�emy stwierdzi�
# �e frekwencja jest > .45