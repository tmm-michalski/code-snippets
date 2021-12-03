def prime_factors(n):
    i = 2
    factors = []
    while i * i <= n:
        if n % i:
            i += 1
        else:
            n //= i
            factors.append(i)
    if n > 1:
        factors.append(n)
    return factors


# Check if alpha is a generator of the multiplicative group Z(n)*.
# Also check how many generators this group has.


def check_generators(alpha, p):
    primes = list(set(prime_factors(p - 1))) # return a set of prime factors
    print(f'p - 1 = {p - 1}')
    print(f'Prime factors of {p - 1} are: {primes}')
    print('i\tp(i)\t---\t\t\tcheck')
    for i in range(len(primes)):
        equals = '=='
        result = (alpha ** int((p-1) / primes[i])) % p != 1
        if result:
            equals = '=/='
        print(f'{i}\t{primes[i]}\t{alpha} * ({p - 1}/{primes[i]}) % {p} {equals} 1\t{result}')

        if not result:
            print(f'{alpha} is not a generator number.')
            break
    # gen_number = (primes[0]**(primes[0] - 1)) * (primes[0] - 1) * (primes[1]**(primes[1] - 1)) * (primes[1] - 1)
    # print(f'Ø({p - 1}) = {primes[0]**(primes[0] - 1)} * {primes[0] - 1} * {primes[1]**(primes[1] - 1)} * {primes[1] - 1} = {gen_number}')


# check_generators(4, 71)


def get_gen_number(number):
    primes = list(set(prime_factors(number)))
    list_of_primes = prime_factors(number)
    result = 1
    e = 0
    for prime in primes:
        result *= prime ** (list_of_primes.count(prime) - 1) * (prime - 1)
        print(f'{prime} ^ ({list_of_primes.count(prime)} - 1) * {prime} - 1')
        e += 1
    print('=', result)

get_gen_number(70)