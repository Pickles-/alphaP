local Polygon = require("base.polygon")
local json = require("lib.json")

local renderSystem = tiny.processingSystem(class "RenderSystem")

renderSystem.isDrawSystem = true
renderSystem.filter = tiny.requireAll("draw")

function renderSystem:process(e, dt)

    if e.draw then
        e:draw(dt)
    end
end

return renderSystem
