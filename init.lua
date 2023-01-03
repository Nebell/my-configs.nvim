-- UTF-8
vim.g.encoding = "UTF-8"

-- line number
vim.o.relativenumber = true
vim.o.number = true

-- indent
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4

vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- search
vim.o.hlsearch = true
vim.o.autoread = true
vim.o.incsearch = true

-- cmd line
vim.o.cmdheight = 2

-- autoread
vim.o.autoread = true
vim.bo.autoread = true

-- auto completion
vim.o.wildmenu = true

-- keymap before loading vimspector
vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'

-- plugins
require('plugins')
local keyset = vim.keymap.set

-- theme
require('theme')

-- Terminal
-- vim.g.terminal_key = "<S-T>"
vim.g.floaterm_height = 0.8
vim.g.floaterm_width = 0.8
keyset("i", "<C-T>", "<ESC>:FloatermToggle<CR>", {silent = true})
keyset("n", "<C-T>", ":FloatermToggle<CR>", {silent = true})
keyset("t", "<C-T>", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})

-- Coc
require('coc')

-- Custom
--- shift lines
keyset("i", "<A-DOWN>", "<ESC>ddpi")
keyset("i", "<A-UP>", "<ESC>ddkPi")
keyset("n", "<A-DOWN>", "ddp")
keyset("n", "<A-UP>", "ddkP")

keyset("n", "<C-UP>", "15k")
keyset("n", "<C-K>", "15k")
keyset("n", "<C-J>", "15j")
keyset("n", "<C-DOWN>", "15j")
--- indent
keyset("n", "<TAB>", ">>")
keyset("n", "<S-TAB>", "<<")
keyset("i", "<S-TAB>", "<Esc><<i")
keyset("v", "<TAB>", ">")
keyset("v", "<S-TAB>", "<")

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
    open_on_setup = true,
})
keyset("n", "<C-G>", "<ESC>:NvimTreeToggle<CR>", {silent = true})
keyset("i", "<C-G>", "<ESC>:NvimTreeToggle<CR>i", {silent = true})
keyset("n", "<Leader>loc", "<ESC>:NvimTreeFindFile<CR>", {silent = true})
keyset("i", "<Leader>loc", "<ESC>:NvimTreeFindFile<CR>i", {silent = true})

-- buffer line
vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        diagnostics = {"coc" , "nvim_lsp"},
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
keyset({ "n", "v", "i" }, "<A-Left>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<A-Right>", "<cmd>BufferLineCycleNext<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<A-H>", "<cmd>BufferLineCyclePrev<CR>", {silent = true})
keyset({ "n", "v", "i" }, "<A-L>", "<cmd>BufferLineCycleNext<CR>", {silent = true})

-- fuzzy search
vim.g.Lf_WindowPosition = 'popup'
vim.g.Lf_ShortcutF = '<C-P>'
vim.g.Lf_GtagsAutoGenerate = 0
keyset("n", "<C-F>", ':<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>', {silent = true} )
keyset("n", "<Leader>fl", ':<C-U><C-R>=printf("Leaderf! line %s", "")<CR><CR>', {silent = true} )
keyset("n", "<Leader>fb", ':<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>', {silent = true} )
keyset("n", "<Leader>f", ':<C-U><C-R>=printf("Leaderf self")<CR><CR>', {silent = true} )
keyset("n", "<Leader>fs", ":CocList symbols<CR>", {silent = true})

-- debug
require('debug')
