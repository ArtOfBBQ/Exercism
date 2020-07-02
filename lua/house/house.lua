local house = {}

local sentences = {}

-- each sentence has 2 forms
-- 1 for when it's the very first first sentence in the verse (intro)
-- 1 for when it's in any other position (secondary)
sentences = {{
    intro = 'This is the house that Jack built',
    secondary = 'that lay in the house that Jack built'
}, {
    intro = 'This is the malt',
    secondary = 'that ate the malt'
}, {
    intro = 'This is the rat',
    secondary = 'that killed the rat'
}, {
    intro = 'This is the cat',
    secondary = 'that worried the cat'
}, {
    intro = 'This is the dog',
    secondary = 'that tossed the dog'
}, {
    intro = 'This is the cow with the crumpled horn',
    secondary = 'that milked the cow with the crumpled horn'
}, {
    intro = 'This is the maiden all forlorn',
    secondary = 'that kissed the maiden all forlorn'
}, {
    intro = 'This is the man all tattered and torn',
    secondary = 'that married the man all tattered and torn'
}, {
    intro = 'This is the priest all shaven and shorn',
    secondary = 'that woke the priest all shaven and shorn'
}, {
    intro = 'This is the rooster that crowed in the morn',
    secondary = 'that kept the rooster that crowed in the morn'
}, {
    intro = 'This is the farmer sowing his corn',
    secondary = 'that belonged to the farmer sowing his corn'
}, {
    intro = 'This is the horse and the hound and the horn',
    secondary = ''
}}

house.verse = function(which)

    if which < 1 then return '' end
    if which == 1 then return sentences[which].intro .. '.' end

    -- to avoid '..' operator performance hit
    local stringbuffer = {}
    stringbuffer[which] = sentences[1].secondary .. '.'
    
    -- Our data is in reverse order from what we need.
    -- stringbuffer[1] needs to hold sentences[which],
    -- stringbuffer[2] needs to hold sentences[which-1], and so on.
    for i = which-1, 2, -1 do
        stringbuffer[i] = sentences[which+1-i].secondary
    end

    stringbuffer[1] = sentences[which].intro
    
    return table.concat(stringbuffer, '\n')
end

house.recite = function()

    local returnvalue = house.verse(1)
    
    -- to avoid '..' operator performance hit
    local stringbuffer = {}

    for i = 1, #sentences, 1 do
        stringbuffer[#stringbuffer + 1] = house.verse(i)
    end

    return table.concat(stringbuffer, '\n')
end

return house