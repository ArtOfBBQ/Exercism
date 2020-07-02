return function(s)

    local matrix = {}
    matrix.numbers = {}
  
    -- we'll handle the first row of the matrix separately to find out
    -- where the first linebreak is
    local first_linebreak = s:find("\n")

    for firstrow_num in (s:sub(1, first_linebreak)):gmatch("[0-9]+") do
        matrix.numbers[#matrix.numbers + 1] = tonumber(firstrow_num)
    end

    matrix.nums_per_row = #matrix.numbers
    
    -- we can now throw away first part of the string
    s = s:sub(first_linebreak + 1, #s)

    -- now handle each row from the 2nd to the final row
    for num in s:gmatch("[0-9]+") do matrix.numbers[#matrix.numbers + 1] = tonumber(num) end
    
    function matrix.row(row_requested)
        local return_values = {}

        local offset = matrix.nums_per_row * (row_requested - 1)

        for i = offset + 1, offset + matrix.nums_per_row do
            return_values[#return_values + 1] = matrix.numbers[i]
        end

        return return_values
    end
  
    function matrix.column(col_requested)
        local return_values = {}

        for i = col_requested, #matrix.numbers, matrix.nums_per_row do
            return_values[#return_values + 1] = matrix.numbers[i]
        end

        return return_values
    end
  
    return matrix
  end
