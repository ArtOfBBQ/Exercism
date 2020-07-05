function is_prime(num, smaller_primes)

    local max_to_check = math.sqrt(num)

    local i = 1
    while (smaller_primes[i] <= max_to_check) do

        if num % smaller_primes[i] == 0 then return false end
        i = i + 1

    end

    return true

end

function get_next_prime(primes_seen)

    if #primes_seen == 0 then return 2 end

    candidate = primes_seen[#primes_seen] + 2

    while is_prime(candidate, primes_seen) == false do

        candidate = candidate + 2

    end

    return candidate

end

return function(n)

    assert(n >= 1, "set n to 1 to get the 1st prime, 2 for the 2nd, etc.")

    local primes_seen = { 2, 3 }

    while (n > #primes_seen) do

        primes_seen[#primes_seen + 1] = get_next_prime(primes_seen)

    end

    return primes_seen[n]

end
