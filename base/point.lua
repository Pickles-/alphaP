-- Represents cartesian coordinates
local Point = class("Point")

function Point:init(x, y)
    self.x = x
    self.y = y
end

return Point