local json = require("lib.json")

local Player = class("Player")

--init is called in the class library
function Player:init(args)
    self.id = getNextId()

    self.collider = require ("base.rectangle")(args.x, args.y, 25, 35)

    self.movement = {
        speed = 5,
    }

    self.platforming = {
        isGrounded = false,
        isJumping = false,
        vx = 0, vy = 0,
        canJump = false,
    }
    self.gravity = 500

    self.isPlayer = true
    self.isMovable = true
end

-- Player sprite would eventually replace getPoly()
-- Entity knows how it needs to draw itself
function Player:draw(dt)
    love.graphics.polygon("line", self:getPoly())
end

-- This is temporary
function Player:getPoly()
    return {
        self.collider.x, self.collider.y,
        self.collider.x + self.collider.w, self.collider.y,
        self.collider.x + self.collider.w, self.collider.y + self.collider.h,
        self.collider.x, self.collider.y + self.collider.h
    }
end

return Player