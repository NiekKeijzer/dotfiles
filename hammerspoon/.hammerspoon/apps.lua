local config = require("_config")
local applicationHotkeys = {
  f = "Firefox",
  i = "iTerm",
  s = "Safari",
  w = "Wire"
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(config.hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end
