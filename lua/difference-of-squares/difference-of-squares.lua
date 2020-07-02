local function square_of_sum(n)

    -- we don't need a loop, to sum up the
    -- first n natural numbers, we can use
    -- this shortcut formula instead
    local sum = ( n * (n + 1) ) / 2

    return sum * sum

end

local function sum_of_squares(n)

    if n < 1 then return 0 end
    
    local sum = 1

    -- according ot lua docs i*i is faster than i^2
    for i = 2, n, 1 do
        sum = sum + (i * i)
    end
    
    return sum

end

local function difference_of_squares(n)

    return square_of_sum(n) - sum_of_squares(n)

end

return {
    square_of_sum = square_of_sum,
    sum_of_squares = sum_of_squares,
    difference_of_squares = difference_of_squares
}
