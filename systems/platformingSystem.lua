local platformingSystem = tiny.processingSystem(class "platformingSystem")

platformingSystem.filter = tiny.requireAll("platforming")

function platformingSystem:process(e, dt)

    if e.platforming.direction then
        if e.platforming.direction == -1 then
            e.platforming.vx = -5
        elseif e.platforming.direction == 1 then
            e.platforming.vx = 5
        end
    end

    if (e.platforming.isJumping and e.platforming.canJump) then
        e.platforming.vy = -5
        e.platforming.canJump = false
    end
end

return platformingSystem
