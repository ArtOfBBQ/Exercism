local Anagram = require('anagram')

describe('anagram', function()
  it('no result', function()
    local detector = Anagram:new('diaper')
    local result = detector:match({ 'hello', 'world', 'zombies', 'pants' })
    local expected = {}
    assert.are.same(expected, result)
  end)

  it('no table of candidates passed', function()
    local detector = Anagram:new('diaper')
    assert.has_error(function() detector:match("im not a table!") end)
  end)

  it('detect if two strings are anagrams', function()
    assert.is_true(Anagram.is_anagram("ant", "tan"))
  end)

  it('detect not anagrams', function()
    assert.is_false(Anagram.is_anagram("bibbity", "babbity"))
    assert.is_false(Anagram.is_anagram("eagle", "galea"))
  end)

  it('detects simple anagram', function()
    local detector = Anagram:new('ant')
    local result = detector:match({ 'tan', 'stand', 'at' })
    local expected = { 'tan' }
    assert.are.same(expected, result)
  end)

  it('does not detect false positives', function()
    local detector = Anagram:new('galea')
    local result = detector:match({ 'eagle' })
    local expected = {}
    assert.are.same(expected, result)
  end)

  it('detects multiple anagrams', function()
    local detector = Anagram:new('master')
    local result = detector:match({ 'stream', 'pigeon', 'maters' })
    local expected = { 'stream', 'maters' }
    assert.are.same(expected, result)
  end)

  it('does not detect anagram subsets', function()
    local detector = Anagram:new('good')
    local result = detector:match({'dog', 'goody'})
    local expected = {}
    assert.are.same(expected, result)
  end)

  it('detects anagram', function()
    local detector = Anagram:new('listen')
    local result = detector:match({ 'enlists', 'google', 'inlets', 'banana' })
    local expected = { 'inlets' }
    assert.are.same(expected, result)
  end)

  it('detects multiple anagrams', function()
    local detector = Anagram:new('allergy')
    local result = detector:match({ 'gallery', 'ballerina', 'regally', 'clergy', 'largely', 'leading' })
    local expected = { 'gallery', 'regally', 'largely' }
    assert.are.same(expected, result)
  end)

  it('detects anagrams case-insensitively', function()
    local detector = Anagram:new('Orchestra')
    local result = detector:match({ 'cashregister', 'Carthorse', 'radishes' })
    local expected = { 'Carthorse' }
    assert.are.same(expected, result)
  end)
end)
