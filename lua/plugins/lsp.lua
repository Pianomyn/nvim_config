-- LSP Installer
local status_installer, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_installer then
    return
end

local lspconfig = require("lspconfig")

lsp_installer.setup {
    ensure_installed = {"pyright", "tsserver", "eslint"},
}
    

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local lspconfig = require("lspconfig")


lspconfig["pyright"].setup{
    on_attach= on_attach,
    capabilities = capabilities
}
lspconfig["tsserver"].setup{
    on_attach= on_attach,
    capabilities = capabilities
}
lspconfig["html"].setup{
    on_attach= on_attach,
    capabilities = capabilities
}

-- LSP Diagnostic Toggler
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
require("toggle_lsp_diagnostics").init({ start_on = true, underline = false })
