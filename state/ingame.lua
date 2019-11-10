local ingame = {}

local debugEnabled = true

function ingame.load()
    debug:init(debugEnabled)

    local cam = camera:new()
    _G.world = tiny.world(
        require ("systems.renderSystem")(cam),
        require ("systems.cameraSystem")(cam),
        require ("systems.playerControllerSystem")(),
        require ("systems.drawBackgroundSystem")(70, 100, 70, 0),
        require ("systems.collisionSystem")(),
        require ("systems.simplePhysX")(),
        require ("systems.platformingSystem")()
    )
    local ctor = require("entities.player")
    local player1 = ctor({x=50, y=50})

    ctor = require("entities.block")
    width, height = love.graphics.getDimensions()
    local block1 = ctor({x=0, y=height/2, w=width, h=1})
    local block2 = ctor({x=width, y=height/2 - 25, w=width, h=1})
    local block3 = ctor({x=width-550, y=height/2 - 80, w=500, h=25})
    world:add(player1)
    world:add(block1)
    world:add(block2)
    world:add(block3)
end

function love.draw()
    local dt = love.timer.getDelta()
    if world then
        world:update(dt, drawFilter)
    end
    
    debug:draw(dt)
end

function love.update(dt)
    debug:reset()

    if world then
        world:update(dt, updateFilter)
    end
end

return ingame
