-- Simple utility for assigning an instance id to world entities

-- Track the next id
_G.nextId = -1

-- Increment and return the new id
_G.getNextId = function()
    _G.nextId = _G.nextId + 1
    return _G.nextId
end