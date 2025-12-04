---@type vim.lsp.Config
return {
  cmd = { 'sql-language-server', 'up', '--method', 'stdio', '--debug' },
  filetypes = { 'sql', 'mysql' },
  root_markers = { '.sqllsrc.json' },
  settings = {},
}
