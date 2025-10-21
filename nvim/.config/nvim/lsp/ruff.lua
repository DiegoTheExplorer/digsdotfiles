--@type vim.lsp.Config
return {
  filetypes = { 'python' },
  init_options = {
    settings = {
      lint = {
        enable = false,
      },
    },
  },
}
