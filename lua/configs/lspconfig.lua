require("nvchad.configs.lspconfig").defaults()

-- local servers = { "html", "cssls" }

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

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

local servers = {
  "kotlin_language_server"
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
