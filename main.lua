tiny = require "lib.tiny"
class = require "lib.class"
vector = require "lib.vector"
camera = require "lib.camera"
require "utils.idGenerator"

local drawFilter = tiny.requireAll('isDrawSystem')
local updateFilter = tiny.rejectAny('isDrawSystem')

debug = require "utils.debug"

function love.load()
    debug:init()

    local cam = camera:new()
    _G.world = tiny.world(
        require ("systems.renderSystem")(cam),
        require ("systems.cameraSystem")(cam),
        require ("systems.playerControllerSystem")(),
        require ("systems.drawBackgroundSystem")(70, 100, 70, 0),
        require ("systems.collisionSystem")(),
        require ("systems.simplePhysX")()
    )
    local ctor = require("entities.player")
    local player1 = ctor({x=50, y=50})

    ctor = require("entities.block")
    local width, height = love.graphics.getDimensions()
    local floor = ctor({x=0, y=height / 2, w=width, h=50})
    world:add(player1)
    world:add(floor)
end

function love.update(dt)
    debug:reset()

    if world then
        world:update(dt, updateFilter)
    end
end

function love.draw()
    local dt = love.timer.getDelta()
    if world then
        world:update(dt, drawFilter)
    end

    debug:draw(dt)
end

function love.keypressed(key)

end
