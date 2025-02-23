require("mason").setup({
  ui = {
    border = "rounded"
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "html",
    "cssls",
    "ts-ls",
  }
})
