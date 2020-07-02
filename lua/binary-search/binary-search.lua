return function(array, target)

    if #array == 0 then return -1 end


    -- this keeps track of the chunk inside our array that we
    -- haven't searched yet.
    --
    -- if our array has 8 elements and
    -- chunk_start = 1 and chunk_end = 4, it means we've
    -- already established the target we're looking for
    -- isn't in index 5, 6, 7, or 8.
    local chunk_start = 1
    local chunk_end = #array

    
    while chunk_start ~= chunk_end do
        -- we'll check the element in the middle of our chunk
        local i = math.floor((chunk_start + chunk_end) / 2)
        local candidate = array[i]

        if candidate == target then
            return i
        elseif candidate > target then
            chunk_end = i - 1 
        else -- candidate must be < target
            chunk_start = i + 1
        end
    end

    -- chunk_start must now be the same as chunk_end,
    -- and we've never checked that position
    if array[chunk_start] == target then return chunk_start end

    -- we didn't find the target anywhere
    return -1

end
