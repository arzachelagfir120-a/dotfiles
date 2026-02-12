-- 1. SETTINGS DASAR
vim.g.mapleader = " " -- Spasi adalah tombol ajaib kita
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" -- Biar bisa copy-paste ke luar nvim
vim.opt.timeoutlen = 300           -- Which-key muncul lebih cepat

-- 2. BOOTSTRAP LAZY.NVIM
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- 3. SETUP PLUGINS
require("lazy").setup({
  -- Tema & Tampilan
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "goolord/alpha-nvim", dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Which-Key (Menu Helper)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  -- Lazygit (Terminal UI Git)
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Telescope (Fuzzy Finder)
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter (Warna kode)
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})

-- 4. AKTIFKAN TEMA & ALPHA
vim.cmd.colorscheme "catppuccin-mocha"
require('alpha').setup(require('alpha.themes.startify').config)
require('lualine').setup { options = { theme = 'catppuccin' } }

-- 5. KEYBINDINGS (Biar Which-key Beraksi)
local wk = require("which-key")

wk.add({
  { "<leader>f", group = "Find (Telescope)" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Cari teks)" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

  { "<leader>g", group = "Git" },
  { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
  
  { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
  { "<leader>w", "<cmd>w<cr>", desc = "Save" },
})

