local Block = class("Block")

function Block:init(args)
    self.id = getNextId()

    self.collider = require ("base.rectangle")(args.x, args.y, args.w, args.h)
    self.block = true
    self.selected = args.selected
end

function Block:draw(dt)
    love.graphics.rectangle("fill", self.collider.x, self.collider.y, self.collider.w, self.collider.h)
end

return Block
