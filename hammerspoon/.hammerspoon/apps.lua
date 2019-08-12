local config = require("_config")
local applicationHotkeys = {
  i = 'iTerm',
  w = 'Wire'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(config.hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end
