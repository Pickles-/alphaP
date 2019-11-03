tiny = require "lib.tiny"
class = require "lib.class"
camera = require "lib.camera"

local drawFilter = tiny.requireAll('isDrawSystem')
local updateFilter = tiny.rejectAny('isDrawSystem')

function love.load()
    local cam = camera:new()
    _G.world = tiny.world(
        require ("systems.renderSystem")(cam),
        require ("systems.cameraSystem")(cam),
        require ("systems.playerControllerSystem")(),
        require ("systems.drawBackgroundSystem")(70, 100, 70, 0)
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
