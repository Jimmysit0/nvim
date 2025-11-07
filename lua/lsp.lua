local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
    })
end

-- connect clangd to .cpp buffers
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.cpp",
    callback = function(args)
        local bufnr = args.buf
        vim.lsp.start({
            name = "clangd",
            cmd = { "clangd" },
            capabilities = capabilities,
            buffer = bufnr,  -- **
            root_dir = vim.fs.dirname(vim.fs.find({".git", "compile_commands.json"}, { upward = true })[1] or vim.api.nvim_buf_get_name(bufnr)),
            on_attach = on_attach,
        })
    end,
})

-- show errors on insert mode
vim.api.nvim_create_autocmd("CursorHoldI", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end
})
