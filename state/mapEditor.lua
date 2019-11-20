local mapEditor = { blocks = {} }

function mapEditor:enter()
    _G.cam = camera:new()
    _G.world = tiny.world(
        require ("systems.renderSystem")(cam),
        require ("systems.cameraSystem")(cam),
        require ("systems.playerControllerSystem")(),
        require ("systems.drawBackgroundSystem")(70, 70, 70, 0),
        require ("systems.collisionSystem")(),
        require ("systems.simplePhysX")(),
        require ("systems.platformingSystem")()
    )
    local ctor = require("entities.block")


    local ctor = require("entities.player")
    player1 = ctor({x=50, y=50})
    world:add(player1)

    local ctor = require("entities.block")
    world:add(ctor({x=0, y=300, w=800, h=1}))
end

function mapEditor:leave()

end

function mapEditor:update(dt)
    if mapEditor.curBlock then
        local b = mapEditor.curBlock
        local x, y = love.mouse.getPosition()

        b.collider.x = x + cam.x
        b.collider.y = y + cam.y

        if love.keyboard.isDown("up") then
            if b.collider.h - 1 > 1 then
                b.collider.h = b.collider.h - 1
            end
        end
        if love.keyboard.isDown("down") then
            b.collider.h = b.collider.h + 1
        end
        if love.keyboard.isDown("left") then
            if b.collider.w - 1 > 1 then
                b.collider.w = b.collider.w - 1
            end
        end
        if love.keyboard.isDown("right") then
            b.collider.w = b.collider.w + 1
        end
    end
end

function mapEditor:keypressed(key)
    if key == "c" then
        local x, y = love.mouse.getPosition()
        local ctor = require("entities.block")

        mapEditor.curBlock = ctor({x=x+cam.x, y=y+cam.y, w=100, h=100, selected=true})
        table.insert(mapEditor.blocks, mapEditor.curBlock)
        world:add(mapEditor.curBlock)
    end

    if key == "delete" then
        world:remove(mapEditor.curBlock)
    end
end

function mapEditor:mousepressed(x, y, button, istouch, presses)
    if mapEditor.curBlock then
        mapEditor.curBlock.selected = nil
        mapEditor.curBlock = nil
    else
        for _, b in pairs(mapEditor.blocks) do
            local dx = x+cam.x
            local dy = y+cam.y
            if dx >= b.collider.x and dx <= b.collider.x + b.collider.w and dy >= b.collider.y and dy <= b.collider.y + b.collider.h then
                mapEditor.curBlock = b
            end
        end
    end
end

return mapEditor
