return function(s)

    assert(type(s) == 'string', "Expected string argument, got " .. type(s))

    s = s:lower()

    local chars_seen = {}

    for cur_char in s:gmatch("[a-z]") do

        if chars_seen[cur_char] == nil then
            chars_seen[cur_char] = true
        else
            return false
        end

    end

    return true

end
