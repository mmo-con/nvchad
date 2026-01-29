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

    -- Toggle inlay hints
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    local function toggle_inlay_hints(bufnr, client)
      if not (client and client.server_capabilities and client.server_capabilities.inlayHintProvider) then
        print "no inlay hints available"
        return
      end

      local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
    end

    --- Toggle diagnostics
    vim.g.diagnostics_visible = true
    local function toggle_diagnostics(bufnr, client)
      if vim.g.diagnostics_visible then
        vim.g.diagnostics_visible = false
        vim.diagnostic.enable(false, { bufnr = bufnr })
      else
        vim.g.diagnostics_visible = true
        vim.diagnostic.enable(true, { bufnr = bufnr })
      end
    end

    vim.keymap.set("n", "<leader>di", function()
      toggle_inlay_hints(bufnr, client)
    end, { noremap = true, silent = true, buffer = bufnr, desc = "✨lsp toggle inlay hints" })

    vim.keymap.set("n", "<leader>dd", function()
      toggle_diagnostics(bufnr, client)
    end, { noremap = true, silent = true, buffer = bufnr, desc = "✨lsp toggle diagnostics" })

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

vim.lsp.config("lua_ls", {
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.enable({"clangd", "lua_ls"})

