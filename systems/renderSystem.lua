local renderSystem = tiny.processingSystem(class "RenderSystem")

renderSystem.isDrawSystem = true
renderSystem.filter = tiny.requireAll("draw")

function renderSystem:init(camera)
    self.camera = camera
end

function renderSystem:preProcess(dt)
    self.camera:push()
end

function renderSystem:postProcess(dt)
    self.camera:pop()
end

function renderSystem:process(e, dt)
    if e.draw then
        e:draw(dt)
    end
end

return renderSystem
