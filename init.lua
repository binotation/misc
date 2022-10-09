-- $HOME/.config/nvim/init.lua
local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself

    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "hrsh7th/nvim-cmp";
    "sainnhe/everforest";

    {"lervag/vimtex", opt=true};      -- Use braces when passing options
}

cmd "colorscheme everforest"
opt.number = true
opt.showmatch = true
opt.tabstop = 4                       -- width of tab character in spaces
opt.shiftwidth = 4                    -- size of an indent in spaces
