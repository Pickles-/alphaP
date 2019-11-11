local simplePhysX = tiny.processingSystem(class "simplePhysX")

simplePhysX.filter = tiny.requireAll("platforming")

function simplePhysX:process(e, dt)

    local gravity = e.gravity or 0
    e.platforming.vy = e.platforming.vy + gravity * dt
    e.platforming.vx = e.platforming.vx / (1 + e.platforming.friction * dt)

    e.collider.y = e.collider.y + e.platforming.vy
    e.collider.x = e.collider.x + e.platforming.vx
end

return simplePhysX
