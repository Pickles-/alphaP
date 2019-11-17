local ingame = {}

function ingame:loadBlocks()
    local ctor = require("entities.block")
    local blocks = table.load("state/ingameBlocks.lua")
    for _, b in pairs(blocks) do
        world:add(ctor({x=b.x, y=b.y, w=b.w, h=b.h}))
    end
end

function ingame:loadPlayer()
    local ctor = require("entities.player")
    local player1 = ctor({x=50, y=50})
    world:add(player1)
end

function ingame:enter()
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

    self:loadBlocks()
    self:loadPlayer()
end

function ingame:leave()

end

return ingame
