local state = {}

function state.switch(statePath)
    package.loaded[statePath] = nil

    for i, fun in pairs(love) do
        if type(fun) == "function" then
            love[i] = nil
        end
    end

    local s = require(statePath)
    if s.load then
        s:load()
    end
end

return state
