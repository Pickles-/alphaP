local simplePhysX = tiny.processingSystem(class "simplePhysX")

simplePhysX.filter = tiny.requireAll("platforming")

function simplePhysX:process(e, dt)

    local gravity = e.gravity or 0
    e.platforming.vy = e.platforming.vy + gravity * dt

    if (not e.platforming.isGrounded) then
        e.collider.y = e.collider.y + e.platforming.vy * dt
    else
        e.platforming.vy = 0
    end
end

return simplePhysX