local platformingSystem = tiny.processingSystem(class "platformingSystem")

platformingSystem.filter = tiny.requireAll("platforming")

function platformingSystem:process(e, dt)

    if (e.platforming.isJumping and e.platforming.canJump) then
        e.platforming.vy = -250
        e.platforming.canJump = false
    end
end

return platformingSystem