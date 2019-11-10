
local playerControllerSystem = tiny.processingSystem(class "PlayerControllerSystem")

playerControllerSystem.filter = tiny.requireAll("platforming", "isPlayer", "movement")

function playerControllerSystem:process(e, dt)
    
    local l, r = love.keyboard.isDown("a"), love.keyboard.isDown("d")
    local u = love.keyboard.isDown("space")

    if l then
        e.collider.x = e.collider.x - e.movement.speed
    elseif r then
        e.collider.x = e.collider.x + e.movement.speed
    end

    e.platforming.isJumping = u
end

return playerControllerSystem