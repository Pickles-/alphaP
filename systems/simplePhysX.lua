local simplePhysX = tiny.processingSystem(class "simplePhysX")

simplePhysX.filter = tiny.requireAll("platforming")

function simplePhysX:process(e, dt)

    local gravity = e.gravity or 0
    e.platforming.vy = e.platforming.vy + gravity * dt

    local friction = e.friction or 10
    if e.platforming.vx > 0 then
        e.platforming.vx = math.max(0, e.platforming.vx - friction * dt)
    elseif e.platforming.vx < 0 then
        e.platforming.vx = math.min(0, e.platforming.vx + friction * dt)
    end

    e.collider.y = e.collider.y + e.platforming.vy
    e.collider.x = math.max(0, e.collider.x + e.platforming.vx)
end

return simplePhysX
