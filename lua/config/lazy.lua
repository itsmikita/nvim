-- LazVim path
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if LazyVim is installed or re-download it
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ 
    "git", 
    "clone", 
    "--filter=blob:none", 
    "https://github.com/folke/lazy.nvim.git", 
    "--branch=stable", 
    lazypath 
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Setup LazyVim
require("lazy").setup({
  spec = {
    -- Add LazyVim
    { "LazyVim/LazyVim",
      -- import LazyVims plugin?
      --import = "lazyvim.plugins"
    },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins (/lua/plugins)
    { import = "plugins" },
  },
  -- Defaults (found in LazyVim config)
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,

    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver

    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    colorscheme = function()
      require("tokyonight").load()
    end,

    -- load the default settings
    defaults = {
      autocmds = true, -- lazyvim.config.autocmds
      keymaps = true, -- lazyvim.config.keymaps
      -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
      -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
    },

    news = {
      -- When enabled, NEWS.md will be shown when changed.
      -- This only contains big new features and breaking changes.
      lazyvim = true,
      -- Same but for Neovim's news.txt
      neovim = false,
    },

    -- icons used by other plugins
    -- stylua: ignore
    icons = {
      misc = {
        dots = "󰇘",
      },
      dap = {
        Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint          = " ",
        BreakpointCondition = " ",
        BreakpointRejected  = { " ", "DiagnosticError" },
        LogPoint            = ".>",
      },
      diagnostics = {
        Error = " ",
        Warn  = " ",
        Hint  = " ",
        Info  = " ",
      },
      git = {
        added    = " ",
        modified = " ",
        removed  = " ",
      },
      kinds = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Codeium       = "󰘦 ",
        Color         = " ",
        Control       = " ",
        Collapsed     = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Copilot       = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = " ",
        Field         = " ",
        File          = " ",
        Folder        = " ",
        Function      = "󰊕 ",
        Interface     = " ",
        Key           = " ",
        Keyword       = " ",
        Method        = "󰊕 ",
        Module        = " ",
        Namespace     = "󰦮 ",
        Null          = " ",
        Number        = "󰎠 ",
        Object        = " ",
        Operator      = " ",
        Package       = " ",
        Property      = " ",
        Reference     = " ",
        Snippet       = " ",
        String        = " ",
        Struct        = "󰆼 ",
        TabNine       = "󰏚 ",
        Text          = " ",
        TypeParameter = " ",
        Unit          = " ",
        Value         = " ",
        Variable      = "󰀫 ",
      },
    },
    ---@type table<string, string[]|boolean>?
    kind_filter = {
      default = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Trait",
      },
      markdown = false,
      help = false,
      -- you can specify a different filter for each filetype
      lua = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        -- "Package", -- remove package since luals uses it for control flow structures
        "Property",
        "Struct",
        "Trait",
      },
    },
  }
  --install = { colorscheme = { "tokyonight", "habamax" } },
  install = { colorscheme = { "base16-ayu-dark", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
