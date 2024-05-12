-- custom keybinds
local key = {
    home = { "H" },
    install = { "T", "t" },
    update = { "A", "a" },
    sync = { "S" },
    clean = { "X", "x" },
    check = { "C", "c" },
    log = { "L", "l" },
    restore = { "R", "r" },
    profile = { "P" },
    debug = { "D" },
    help = { "?" },
    build = { "nil", "gb" }
}

local function load_lazy_keymap()
    local command = require("lazy.view.config").commands
    for key, value in pairs(key) do
        for idx, k in ipairs(value) do
            if idx == 1 and k ~= "nil" then
                command[key].key = k
            elseif idx == 2 then
                command[key].key_plugin = k
            end
        end
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "git@github.com:folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

load_lazy_keymap()

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
git = {
        -- defaults for the `Lazy log` command
        -- log = { "--since=3 days ago" }, -- show commits from the last 3 days
        log = { "-8" }, -- show the last 8 commits
        timeout = 60, -- kill processes that take more than 2 minutes
        url_format = "git@github.com:%s.git",
        -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
        -- then set the below to false. This should work, but is NOT supported and will
        -- increase downloads a lot.
        filter = true,
    },
  lockfile = vim.fn.stdpath("data") .. '/lazy-lock.json',
  install = { colorscheme = { "tokyonight", "habamax" } },
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
