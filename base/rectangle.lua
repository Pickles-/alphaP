-- Defines a rectangle and important utility methods
local Rectangle = class("Rectangle")

local abs = math.abs

function Rectangle:init(x, y, w, h)
    self.x = x or 0
    self.y = y or 0
    self.w = w or 0
    self.h = h or 0
end

function Rectangle:createCentered(x, y, w, h)
    local r = Rectangle(0, 0, w, h)
    r:setCenter(x, y)
    return r
end

function Rectangle:setCenter(x,y)
    self.x = x - self.w / 2
    self.y = y - self.h / 2
end

function Rectangle:center()
    return vector.new(self.x + self.w / 2, self.y + self.h / 2)
end

function Rectangle:min()
    return vector.new(self.x, self.y)
end

function Rectangle:max()
    return vector.new(self.x + self.w, self.y + self.h)
end

function Rectangle:size()
    return vector.new(self.w, self.h)
end

function Rectangle:minkowskiDiff(other)
    local topLeft = self:min() - other:max()
    local newSize = self:size() + other:size()
    local newLeft = topLeft + (newSize / 2)
    return Rectangle:createCentered(newLeft.x, newLeft.y, newSize.x, newSize.y)
end

function Rectangle:closestPointOnBounds(point)
    local minDist = abs(point.x - self.x)
    local max = self:max()
    local boundsPoint = vector.new(self.x, point.y)

    if abs(max.x - point.x) < minDist then
        minDist = abs(max.x - point.x)
        boundsPoint = vector.new(max.x, point.y)
    end
    
    if abs(max.y - point.y) < minDist then
        minDist = abs(max.y - point.y)
        boundsPoint = vector.new(point.x, max.y)
    end

    if abs(self.y - point.y) < minDist then
        minDist = abs(self.y - point.y)
        boundsPoint = vector.new(point.x, self.y)
    end

    return boundsPoint
end

return Rectangle