local json = require("lib.json")

local Player = class("Player")


--init is called in the class library
function Player:init(args)
    self.id = getNextId()

    self.collider = require ("base.rectangle")(args.x, args.y, 25, 25)

    self.movement = {
        speed = 5,
        vx = 0,
        vy = 0,
    }

    self.isPlayer = true
    self.isMovable = true
end

-- Player sprite would eventually replace getPoly()
-- Entity knows how it needs to draw itself
function Player:draw(dt)
    debug:drawRect({x = self.collider.x, y = self.collider.y, w = self.collider.w + 25, h = self.collider.h + 25})
    love.graphics.polygon("line", self:getPoly())
end

function Player:getPoly()
    return {
        self.collider.x, self.collider.y,
        self.collider.x + self.collider.w, self.collider.y,
        self.collider.x + self.collider.w, self.collider.y + self.collider.h,
        self.collider.x, self.collider.y + self.collider.h
    }
end

return Player