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
vim.o.number = true
vim.o.relativenumber = true
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

vim.keymap.set('n', '<F5>', ':w<CR>:!g++ % -O2 -o %:r && ./%:r < %:h/input.txt<CR>', { noremap = true, silent = true })

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
	int a, b, c; cin >> a >> b >> c;
	cout << "The sum of these three numbers is " << a + b + c << "\n";
}
]]

vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*.cpp",
    callback = function()
        vim.api.nvim_put(vim.split(cpp_template, "\n"), "l", true, true)
        vim.cmd("normal! gg") 
    end,
})
