require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.diagnostic.config({
    virtual_text = true,
})

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config('denols', {
    root_markers = { "deno.json", "deno.jsonc" },
})

vim.lsp.config('ts_ls', {
    root_markers = { "package.json" },
})

vim.lsp.enable({
    "lua_ls",
})
