
local renderSystem = tiny.processingSystem(class "RenderSystem")

renderSystem.filter = tiny.requireAll("draw")

function renderSystem:process(e, dt)
    e.draw()
end

return renderSystem