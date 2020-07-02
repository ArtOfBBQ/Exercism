local Hamming = {}

function Hamming.compute(a,b)
    
    if #a ~= #b then return -1 end

    local dist = 0
    for i = 1, #a, 1 do
        if a:sub(i, i) ~= b:sub(i, i) then dist = dist + 1 end
    end
    
    return dist

end

return Hamming
