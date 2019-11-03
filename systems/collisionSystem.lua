
local collisionSystem = tiny.processingSystem(class "CollisionSystem")

collisionSystem.filter = tiny.requireAll("hitbox")

function collisionSystem:init()
end

function collisionSystem:process(e, dt)
    
end

return collisionSystem