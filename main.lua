tiny = require "lib.tiny"
class = require "lib.class"
vector = require "lib.vector"
camera = require "lib.camera"
gamestate = require "lib.gamestate"
require "lib.savetable"
require "utils.idGenerator"

local ingame = require "state.ingame"

drawFilter = tiny.requireAll('isDrawSystem')
updateFilter = tiny.rejectAny('isDrawSystem')

debug = require "utils.debug"
local debugEnabled = true

function love.load()
    debug:init(debugEnabled)

    gamestate.registerEvents()
    gamestate.switch(ingame)
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
