-- Move windows around on screens
local config = require("_config")

function nextWindow()
  local win = hs.window.focusedWindow();
  if not win then
    return
  end

  win:moveToScreen(win:screen():next())
end

function previousWindow()
  local win = hs.window.focusedWindow();
  if not win then
    return
  end

  win:moveToScreen(win:screen():previous())
end

hs.hotkey.bind(config.shift_hyper, "right", nextWindow)
hs.hotkey.bind(config.shift_hyper, "left", previousWindow)
