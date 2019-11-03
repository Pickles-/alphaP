tiny = require "lib.tiny"
class = require "lib.class"
vector = require "lib.vector"
camera = require "lib.camera"
require "utils.idGenerator"

local drawFilter = tiny.requireAll('isDrawSystem')
local updateFilter = tiny.rejectAny('isDrawSystem')

function love.load()
    local cam = camera:new()
    _G.world = tiny.world(
        require ("systems.renderSystem")(cam),
        require ("systems.cameraSystem")(cam),
        require ("systems.playerControllerSystem")(),
        require ("systems.drawBackgroundSystem")(70, 100, 70, 0),
        require ("systems.collisionSystem")()
    )
    local ctor = require("entities.player")
    local player1 = ctor({x=50, y=50})

    ctor = require("entities.block")
    local block1 = ctor({x=150, y=200})
    local block2 = ctor({x=150, y=225})
    local block3 = ctor({x=150, y=250})
    world:add(player1)
    world:add(block1)
    world:add(block2)
    world:add(block3)
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
