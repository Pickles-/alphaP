local state = {}

function state.switch(statePath)
    local s = require(statePath)
    if s.load then
        s:load()
    end
end

return state
