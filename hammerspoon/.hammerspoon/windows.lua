-- resize windows
local config = require("_config")

hs.loadSpoon("MiroWindowsManager")

spoon.MiroWindowsManager:bindHotkeys({
  up = {config.hyper, "up"},
  right = {config.hyper, "right"},
  down = {config.hyper, "down"},
  left = {config.hyper, "left"},
  fullscreen = {config.hyper, "f"}
})
