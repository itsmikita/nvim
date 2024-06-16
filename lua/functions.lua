-- User functions

-- Detect system OS
function detect_os()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "windows"
  elseif vim.loop.os_uname().sysname == "Darwin" then
    return "macos"
  else
    return "linux"
  end
end

-- Detect system settings for dark style
function detect_color_scheme()
  local color_scheme = "default"
  if vim.loop.os_uname().sysname == "Windows_NT" then
    -- We don't know Windows
  elseif vim.loop.os_uname().sysname == "Darwin" then
    local handle = io.popen("osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'")
    local result = handle:read("*a")
    local color_scheme = result:match("true") and "dark" or "default"
  else
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    local result = handle:read("*a")
    local color_scheme = result:match("dark") and "dark" or "default"
  end
  return color_scheme
end

-- Automatically set light/dark theme based on system preferences
function auto_set_theme()
  if detect_color_scheme() == "dark" then
    vim.o.background = "dark"
    vim.cmd("colorscheme ayu")
  else
    vim.o.background = "light"
    vim.cmd("colorscheme ayu")
  end
end

-- Auto-set color scheme based on system dark mode setting
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   -- once = true
--   callback = function()
--     if vim.loop.os_uname().sysname == "Windows_NT" then
--       vim.o.background = "light"
--     elseif vim.loop.os_uname().sysname == "Darwin" then
--       if detect_color_scheme() == "dark" then
--         vim.o.background = "dark"
--       else
--         vim.o.background = "light"
--       end
--     else
--       if detect_color_scheme() == "dark" then
--         vim.o.background = "dark"
--       else
--         vim.o.background = "light"
--       end
--     end
--     vim.cmd("colorscheme ayu")
--   end
-- })
--
