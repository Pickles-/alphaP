tiny = require "lib.tiny"
class = require "lib.class"

local drawFilter = tiny.requireAll('isDrawSystem')
local updateFilter = tiny.rejectAny('isDrawSystem')

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
   if world then
        world:update(dt, updateFilter)
    end
end

function love.draw()
    local dt = love.timer.getDelta()
    if world then
        world:update(dt, drawFilter)
    end
end

function love.keypressed(key)

end
