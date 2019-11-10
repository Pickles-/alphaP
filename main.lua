tiny = require "lib.tiny"
class = require "lib.class"
vector = require "lib.vector"
camera = require "lib.camera"
state = require "lib.state"
require "utils.idGenerator"

drawFilter = tiny.requireAll('isDrawSystem')
updateFilter = tiny.rejectAny('isDrawSystem')

debug = require "utils.debug"

function love.load()
    state.switch("state/ingame")
end

function love.update(dt)
end

function love.draw()
end

function love.keypressed(key)

end
