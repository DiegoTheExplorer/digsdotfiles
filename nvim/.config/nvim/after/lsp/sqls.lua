---@type vim.lsp.Config
return {
  cmd = { 'sqls' },
  filetypes = { 'sql', 'mysql' },
  root_markers = { 'config.yml' },
  settings = {},
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
}
