local Point = require("base.point")
local Polygon = require("base.polygon")

local Player = class("Player")

--init is called in the class library
function Player:init(args)
    
    self.position = {
        x = args.x,
        y = args.y,
    }

    self.movement = {
        speed = 10
    }

    self.isPlayer = true
end

function Player:draw(dt)
    love.graphics.polygon("line", self:getPoly())
end

function Player:getPoly()
    return {
        self.position.x, self.position.y,
        self.position.x + 25, self.position.y,
        self.position.x + 25, self.position.y + 25,
        self.position.x, self.position.y + 25
    }
end

return Player