local Anagram = {}

function Anagram.is_anagram(a, b)

    assert(type(a) == "string", "expected string, got" .. type(a))
    assert(type(b) == "string", "expected string, got" .. type(b))

    if #a ~= #b then return false end
    a = string.lower(a)
    b = string.lower(b)

    local chars_seen = {}

    for cur_char in a:gmatch("[a-z]") do
        if chars_seen[cur_char] == nil then
            chars_seen[cur_char] = 1
        else
            chars_seen[cur_char] = chars_seen[cur_char] + 1
        end
    end

    for cur_char in b:gmatch("[a-z]") do
        if chars_seen[cur_char] == nil or
           chars_seen[cur_char] == 0 then
            return false
        else
            chars_seen[cur_char] = chars_seen[cur_char] - 1
        end
    end

    return true
end

function Anagram.get_anagrams(subject, candidates)

    assert(
        type(candidates)=="table",
        "expected candidates in table, got " .. type(candidates))

    return_values = {}

    for i = 1, #candidates do
        if Anagram.is_anagram(subject, candidates[i]) then
            return_values[#return_values + 1] = candidates[i]
        end
    end

    return return_values

end

function Anagram.new(_, subject)

    local detector = {}
    assert(
        type(subject) == "string",
        "Expected string got" .. type(subject))
    detector.subject = subject

    function detector.match(_, candidates)
        return Anagram.get_anagrams(detector.subject, candidates)
    end

    return detector
end

return Anagram
