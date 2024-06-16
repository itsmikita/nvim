return {
  "ayu-theme/ayu-vim",
  config = function()
    if vim.loop.os_uname().sysname == "Windows_NT" then
      -- we do not know windows hence light colors
      local ayucolor = "light"
    elseif vim.loop.os_uname().sysname == "Darwin" then
      local handle = io.popen("osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'")
      local result = handle:read("*a")
      handle:close()
      local ayucolor = result:match("true") and "dark" or "light"
    else
      local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
      local result = handle:read("*a")
      handle:close()
      local ayucolor = result:match("dark") and "dark" or "light"
    end
    vim.cmd("colorscheme ayu")
  end
}
