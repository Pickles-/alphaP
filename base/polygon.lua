local Polygon = class("Polygon")

local json = require("lib.json")

function Polygon:init(vertices)
    self.vertices = vertices
end

return Polygon