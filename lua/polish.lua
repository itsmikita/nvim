-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- Clipboard
-- Use the System Clipboard for all operations
vim.o.clipboard = "unnamedplus"
-- Map Ctrl+C to copy to the System Clipboard in VISUAL mode
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })
-- Map Ctrl+V to paste from System Clipboard in NORMAL mode
vim.api.nvim_set_keymap("n", "<C-v>", '"+p', { noremap = true, silent = true })
-- Map Ctrl+V to paste from System Clipboard in INSERT mode
vim.api.nvim_set_keymap("i", "<C-v>", '<C-r>+', { noremap = true, silent = true })


-- Global config for Tabs
-- Number of spaces to use in a <Tab>
vim.o.tabstop = 2
-- Number of spaces to use for each step of auto indent
vim.o.shiftwidth = 2
-- Use spaces instead of tabs
vim.o.expandtab = true
-- Make backspace delete spaces instead
vim.o.softtabstop = 2
-- Enable smart indenting
vim.o.smartindent = true

-- To configure Tabs per file type:
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.smartindent = true
  end
})

-- Set cursor styles
vim.opt.guicursor = {
  "n:block-Cursor",
  "i-c:block-CursorInsert",
  "v:block-CursorVisual",
  "r:block-CursorReplace"
}
vim.cmd [[
  highlight Cusror guifg=#000000 guibg=#FFFFFF
  highlight CusrorInsert guifg=#FFFFFF guibg=#317BF6
  highlight CursorVisual guifg=NONE guibg=#9BC8FA
  highlight CusrorReplace guifg=NONE guibg=#EDFA93
]]

-- Auto-switch color scheme
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
  callback = function()
    local handle
    local result
    local darkmode
    local osname = vim.loop.os_uname().sysname
    if osname == "Linux" then
      handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
      result = handle:read("*a")
      handle:close()
      darkmode = result:match("dark") and true or false
    elseif osname == "Darwin" then
      handle = io.popen("osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode'")     
      result = handle:read("*a")
      handle:close()
      darkmode = result:match("true") and true or false
    elseif osname == "Windows_NT" then
      handle = io.popen("powershell.exe -Command \"$theme = Get-ItemPropertyValue -Path 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize' -Name 'AppsUseLightTheme'; if ($theme -eq 0) { Write-Output 'dark' } else { Write-Output 'light' }\"")
      result = handle:read("*a")
      handle:close()
      darkmode = result:match("dark") and true or false
    else
      darkmode = false
    end
    if darkmode then
      vim.o.background = "dark"
      vim.cmd("colorscheme ayu")
    else
      vim.o.background = "light"
      vim.cmd("colorscheme astrolight")
    end
  end
})

