local nvchadconfig = require "nvchad.configs.lspconfig"

local on_attach = nvchadconfig.on_attach
local on_init = nvchadconfig.on_init
local capabilities = nvchadconfig.capabilities

vim.diagnostic.config {
  virtual_text = {
    spacing = 2,
    source = "if_many",
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
}

vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    vim.lsp.inlay_hint.enable(true)
    on_attach(client, bufnr)
  end,
  on_init = on_init,
  capabilities = capabilities,
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
  cmd = {
    "clangd",
    "--clang-tidy",
    "--completion-style=detailed",
    "--background-index",
    "--offset-encoding=utf-8",
  },
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
})

vim.lsp.enable "clangd"
