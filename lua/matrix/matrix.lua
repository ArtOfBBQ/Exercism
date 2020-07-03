return function(s)

    local matrix = {}
    local matrix_numbers = {}
  
    -- we'll handle the first row of the matrix separately to find out
    -- where the first linebreak is
    local first_linebreak = s:find("\n") or #s

    for firstrow_num in (s:sub(1, first_linebreak)):gmatch("[0-9]+") do
        matrix_numbers[#matrix_numbers + 1] = tonumber(firstrow_num)
    end

    local nums_per_row = #matrix_numbers
    
    -- we can now throw away first part of the string
    s = s:sub(first_linebreak + 1, #s)

    -- now handle each row from the 2nd to the final row
    for num in s:gmatch("[0-9]+") do matrix_numbers[#matrix_numbers + 1] = tonumber(num) end
    
    function matrix.row(row_requested)
        local return_values = {}

        local offset = nums_per_row * (row_requested - 1)

        for i = offset + 1, offset + nums_per_row do
            return_values[#return_values + 1] = matrix_numbers[i]
        end

        if #return_values > 0 then return return_values else return nil end
    end
  
    function matrix.column(col_requested)
        local return_values = {}

        for i = col_requested, #matrix_numbers, nums_per_row do
            return_values[#return_values + 1] = matrix_numbers[i]
        end

        if #return_values > 0 then return return_values else return nil end
    end
  
    return matrix
  end
