---@type vim.lsp.Config
return {
  cmd = { '~/.zvm/bin/zls' },
  filetypes = { 'zig', 'zir' },
  root_markers = { 'zls.json', 'build.zig', '.git' },
  workspace_required = false,
}
