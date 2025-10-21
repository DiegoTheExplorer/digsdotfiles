return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'clangd', -- C LSP
      'gopls', -- Go LSP
      'pyrefly', -- Python LSP
      'ruff', -- Python LSP (Only used for formatting)
      'rust_analyzer', -- Rust LSP
      'cssls', -- CSS LSP
      'ts_ls', -- Typescript LSP
      'lua_ls', -- Lua LSP
      'angularls', -- AngularJS LSP
      'zls', -- Zig LSP
      'svelte', -- Svelte LSP
      'sqlls', -- SQL LSP

      'stylua', -- Lua formatting
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
