local Debug = class("Debug")

function Debug:init() 
    self.debug = {
        rects = {},
    }
end

function Debug:drawRect(rect)
    table.insert(self.debug.rects, rect)
end

function Debug:reset()
    self.debug = {
        rects = {},
    }
end

function Debug:draw(dt)
    local r, b, g, a = love.graphics.getColor()
    love.graphics.setColor(255, 0, 0)

    for _, value in pairs(self.debug.rects) do
        love.graphics.rectangle("line", value.x, value.y, value.w, value.h)
    end

    love.graphics.setColor(r, b, g, a)
end

return Debug