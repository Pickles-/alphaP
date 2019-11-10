local state = {}

function state.switch(statePath)
    package.loaded[statePath] = nil
    local s = require(statePath)
    if s.load then
        s:load()
    end
end

return state
