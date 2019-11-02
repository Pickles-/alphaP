
local playerControllerSystem = tiny.processingSystem(class "PlayerControllerSystem")

playerControllerSystem.filter = tiny.requireAll("position", "isPlayer", "movement")

function playerControllerSystem:process(e, dt)
    
    local l, r = love.keyboard.isDown("a"), love.keyboard.isDown("d")
    local u, d = love.keyboard.isDown("w"), love.keyboard.isDown("s")

    if l then
        e.position.x = e.position.x - e.movement.speed
    elseif r then
        e.position.x = e.position.x + e.movement.speed
    end

    if u then
        e.position.y = e.position.y - e.movement.speed
    elseif d then
        e.position.y = e.position.y + e.movement.speed
    end
end

return playerControllerSystem