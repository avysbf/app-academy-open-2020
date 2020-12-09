def is_prime?(num)
    return false if num < 2
    return true if num == 2
    (2...num).none? {|i| num % i == 0}
end

def nth_prime(n)
    i = 0
    primes_found = 0
    cur_prime = 0
    while primes_found != n
        if is_prime?(i)
            primes_found += 1
            cur_prime = i
            i += 1
        else
            i += 1
        end
    end
    cur_prime
end


def prime_range(min, max)
    (min..max).select {|i| is_prime?(i)}
end