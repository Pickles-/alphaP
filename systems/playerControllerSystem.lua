
local playerControllerSystem = tiny.processingSystem(class "PlayerControllerSystem")

playerControllerSystem.filter = tiny.requireAll("position", "isPlayer", "movement", "polygon")

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

    e.polygon = {
        e.position.x , e.position.y,
        e.position.x + 25, e.position.y,
        e.position.x + 25, e.position.y + 25,
        e.position.x, e.position.y + 25,
    }
end

return playerControllerSystem