-- plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- basic stuff
vim.opt.number = true
vim.opt.relativenumber = false
vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.termguicolors = true

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- LSP mappings
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set('n', '<F5>',
  ':w<CR>:!g++ -std=c++17 % -O2 -o %:p:r && %:p:r < %:h/input.txt<CR>',
  { noremap = true, silent = true }
)


vim.o.clipboard = "unnamedplus"

-- .cpp files - competitive programming
local cpp_template = [[
#include <cstdint>
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#define int long long
using namespace std;

int32_t main() {
	ios::sync_with_stdio(0);
	cin.tie(0);
	int t; cin >> t; 
}
]]

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    callback = function(args)
        local bufnr = args.buf
        local lines = vim.split(cpp_template, "\n")
		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        vim.cmd("normal! gg") 
    end,
})
