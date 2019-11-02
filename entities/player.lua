local vector = require("lib.vector")

local Player = class("Player")

--init is called in the class library
function Player:init(args)
    
    self.position = {
        x = args.x,
        y = args.y,
    }

    self.movement = {
        speed = 10
    }

    self.isPlayer = true

    self.draw = function()
        love.graphics.rectangle("line", self.position.x, self.position.y, 25, 25)
    end
end

return Player