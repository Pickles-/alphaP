local drawBackgroundSystem = tiny.processingSystem(class "drawBackgroundSystem")
drawBackgroundSystem.isDrawSystem = true

function drawBackgroundSystem:init(r, g, b)
    self.r = r
    self.g = g
    self.b = b
end

function drawBackgroundSystem:update(dt)
    love.graphics.setBackgroundColor(self.r / 255, self.g / 255, self.b / 255, 0)
end

return drawBackgroundSystem
