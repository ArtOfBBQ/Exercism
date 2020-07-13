local alphabet = {
    'A', 'B', 'C', 'D', 'E', 'F' ,'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}

local function get_diamond_letters(final_letter)

    local return_values = {'A'}

    local i = 2
    while return_values[#return_values] ~= final_letter do
        return_values[#return_values + 1] = alphabet[i]
        i = i + 1
    end

    return return_values
end

return function(which)

    local letters = get_diamond_letters(which)
    local diamond_lines = {} -- store each line then table.concat()
    local diamond_width = (#letters * 2) - 1

    -- iterate from start to end of letters, then back to start
    local i = 1
    local step = 1
    while i > 0 do

        -- the number of spaces in between the letters
        local mid_spaces = math.max((i * 2) - 3, 0)

        -- the number of spaces to the left & right of the letters
        local side_spaces = math.floor((diamond_width - mid_spaces - 2) / 2)
        if i == 1 then side_spaces = side_spaces + 1 end

        -- if we're on line 1 (writing 'A'), we don't need a 2nd letter
        local second_letter = ""
        if i ~= 1 then second_letter = letters[i] end

        -- I'm trying to avoid using '..' because of this:
        -- https://www.lua.org/pil/11.6.html
        local cur_line_buffer = {
            string.rep(" ", side_spaces),
            letters[i],
            string.rep(" ", mid_spaces),
            second_letter,
            string.rep(" ", side_spaces),
            "\n" 
        }
        
        diamond_lines[#diamond_lines + 1] = table.concat(cur_line_buffer)

        if i == #letters then step = -1 end
        i = i + step
    end

    return table.concat(diamond_lines)
end
