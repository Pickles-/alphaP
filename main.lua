tiny = require "lib.tiny"
class = require "lib.class"

function love.load()
    _G.world = tiny.world(
        require ("systems.renderSystem")(),
        require ("systems.playerControllerSystem")()
    )
    local ctor = require("entities.player")
    local player1 = ctor({x=50, y=50})
    world:add(player1)
end

function love.update(dt)

end

function love.draw()
    local dt = love.timer.getDelta()
    if world then
        world:update(dt)
    end
end

function love.keypressed(key)

end
