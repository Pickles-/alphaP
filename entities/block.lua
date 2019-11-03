local Block = class("Block")

function Block:init(args)
    self.id = getNextId()

    self.position = {
        x = args.x,
        y = args.y,
    }

    self.collider = require ("base.rectangle")(args.x, args.y, 25, 25)

    self.hitbox = {
        w = 25,
        h = 25,
    }

end

function Block:draw(dt)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.hitbox.h, self.hitbox.w)
end

return Block