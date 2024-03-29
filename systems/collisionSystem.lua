
local collisionSystem = tiny.processingSystem(class "CollisionSystem")

collisionSystem.filter = tiny.requireAll("collider", "platforming", "isMovable")

function collisionSystem:init()
end

function collisionSystem:process(e, dt)
    -- Only objects that can move dynamically will check for collisions
    -- Static objects that have collision info on them can be collided with
    for k, v in pairs(_G.world.entities) do
        if type(v) == "table" then
            if not(e.id == v.id) and v.collider then

                local md = e.collider:minkowskiDiff(v.collider)
                if collisionSystem.checkMd(md) then

                    local sep = md:closestPointOnBounds(vector.new())
                    -- Correct the position by the amount of penetration calculated
                    e.collider.x = e.collider.x - sep.x
                    e.collider.y = e.collider.y - sep.y
                    
                    -- sep.y > 0 = Collision below
                    -- sep.y < 0 = Collision above
                    -- sep.x > 0 = Collision right
                    -- sep.x < 0 = Collision left

                    -- Bounce
                    --if (sep.y > 0) then
                    --    e.platforming.canJump = true
                    --    if (not e.platforming.isJumping) then
                    --        e.platforming.vy = -e.platforming.vy / 2.5
                    --    end
                    --end

                    -- Touch
                    if sep.y > 0 then
                        e.platforming.canJump = true
                        -- Prevent sticking
                        if not e.platforming.isJumping then
                            e.platforming.vy = 0
                        end
                    end

                    -- Bonk
                    if(sep.y < 0) then
                        e.platforming.vy = -e.platforming.vy / 1.5
                    end
                end
            end
        end
    end
end

-- Minkowski Diff check
-- If the calculated MD contains the origin a collision occurred
function collisionSystem.checkMd(md)
    return  (md:min().x <= 0 and
            md:max().x >= 0 and
            md:min().y <= 0 and
            md:max().y >= 0)
end

-- Checks if there is a collision between the two provided "boxes"
function collisionSystem.checkBox(col1, col2)
    return  col1.x < col2.x+col2.w and
            col2.x < col1.x+col1.w and
            col1.y < col2.y+col2.h and
            col2.y < col1.y+col1.h
end

return collisionSystem