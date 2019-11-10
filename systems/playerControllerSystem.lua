
local playerControllerSystem = tiny.processingSystem(class "PlayerControllerSystem")

playerControllerSystem.filter = tiny.requireAll("platforming", "isPlayer", "movement")

function playerControllerSystem:process(e, dt)

    local l = love.keyboard.isDown("a") or love.keyboard.isDown("left")
    local r = love.keyboard.isDown("d") or love.keyboard.isDown("right")
    local jump = love.keyboard.isDown("space")

    if l then
        -- e.collider.x = e.collider.x - e.movement.speed
        e.platforming.direction = -1
    elseif r then
        e.platforming.direction = 1
        -- e.collider.x = e.collider.x + e.movement.speed
    else
        e.platforming.direction = 0
    end

    e.platforming.isJumping = jump

    if love.keyboard.isDown("r") then
        state.switch("state/ingame")
    end
end

return playerControllerSystem
