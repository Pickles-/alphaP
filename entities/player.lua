local Player = class("Player")

--init is called in the class library
function Player:init(args)
    
    self.position = {
        x = args.x,
        y = args.y,
    }

    -- hitbox could be based off of the sprite width/height for a simple rectangle
    self.hitbox = {
        h = 25,
        w = 25,
    }

    self.movement = {
        speed = 10
    }

    self.isPlayer = true
end

-- Player sprite would eventually replace getPoly()
-- Entity knows how it needs to draw itself
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