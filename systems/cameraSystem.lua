local cameraSystem = tiny.processingSystem(class "CameraSystem")

cameraSystem.filter = tiny.requireAll("position", "isPlayer")

function cameraSystem:init(camera)
    self.camera = camera
end

function cameraSystem:process(e, dt)
   local  width, height = love.graphics.getDimensions()
   self.camera:setPosition(e.position.x - width / 2, e.position.y - height / 2)
end

return cameraSystem
