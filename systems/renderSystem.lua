
local renderSystem = tiny.processingSystem(class "RenderSystem")

renderSystem.isDrawSystem = true
renderSystem.filter = tiny.requireAll("polygon")

function renderSystem:process(e, dt)
    love.graphics.polygon("line", e.polygon)
end

return renderSystem
