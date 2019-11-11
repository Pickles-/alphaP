-- Simple debug utility

local Debug = class("Debug")

function Debug:init(enabled)
    self.debug = {
        enabled = enabled,
        rects = {},
    }
end

function Debug:drawRect(rect)
    table.insert(self.debug.rects, rect)
end

function Debug:reset()
    self.debug = {
        enabled = self.debug.enabled,
        rects = {},
    }
end

function Debug:draw(dt)
    if (not self.debug.enabled) then return end
    local r, b, g, a = love.graphics.getColor()
    love.graphics.setColor(255, 0, 0)

    -- Draw rectangles
    for _, value in pairs(self.debug.rects) do
        love.graphics.rectangle("line", value.x, value.y, value.w, value.h)
    end

    love.graphics.setColor(r, b, g, a)

    love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 10, 10)
    love.graphics.print("Mem:  "..collectgarbage('count'), 10, 25)
    love.graphics.print(string.format("Average frame time: %.3f ms", 1000 * love.timer.getAverageDelta()), 10, 40)

    --love.graphics.print("Draw Calls: "..love.graphics.getStats().drawcalls, 10, 45)
    --love.graphics.print("Batched Calls: "..love.graphics.getStats().drawcallsbatched, 10, 60)
end

return Debug
