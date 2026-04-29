require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls" }

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

vim.lsp.config("kotlin_language_server", {
  on_attach = on_attach,
  capabilities = capabilities,

  root_markers = {
    "settings.gradle",
    "settings.gradle.kts",
    "build.gradle",
    "build.gradle.kts",
    ".git",
  },
})

vim.lsp.config("bright_script", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities
})

vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities
})

vim.lsp.config("vimls", { })

vim.lsp.config("sourcekit", { })

local servers = {
  "kotlin_language_server",
  "bright_script",
  "ts_ls",
  "vimls",
  "sourcekit",
  "pyright",
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
