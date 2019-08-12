local config = require("_config")

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end

  if doReload then
    hs.reload()
  end
end

hs.hotkey.bind(config.shift_hyper, "R", hs.reload)
hs.hotkey.bind(config.shift_hyper, "L", hs.caffeinate.lockScreen)

if config.reloadConfig == true then
  configDirectory = os.getenv("HOME") .. "/.hammerspoon/"
  print(string.format("Watching %s for changes", configDirectory))
  hs.pathwatcher.new(configDirectory, reloadConfig):start()
  hs.alert.show("Hammerspoon config reloaded")
end
