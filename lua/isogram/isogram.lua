return function(s)

    if type(s) ~= 'string' then error("Expected string argument, got: " .. type(s)) end
    
    s = s:lower()

    local chars_seen = {}

    for i = 1, #s do

        local cur_char = s:sub(i, i)

        if chars_seen[cur_char] == nil or cur_char == "-" or cur_char == " " then
            chars_seen[cur_char] = true
        else
            return false
        end
    end

    return true

end
