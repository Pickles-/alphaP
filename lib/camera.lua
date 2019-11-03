local camera = {}
camera.__index = camera

function camera.new()
    local self = setmetatable({}, camera)
    self.x = 0
    self.y = 0
    self.scale = 1
    return self
end

function camera:push()
    love.graphics.push()
    love.graphics.scale(1 / self.scale, 1 / self.scale)
    love.graphics.translate(-self.x, -self.y)
end

function camera:pop()
    love.graphics.pop()
end

function camera:setPosition(x, y)
  self.x = x
  self.y = y
end

function camera:setScale(sc)
    self.scale = self.scale * sc
end

return camera
