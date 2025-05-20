                                                                                                                    
-- /home/jake/.config/nvim/after/plugin/lsp.lua
-- LSP configuration for Neovim

-- Load required modules
local lspconfig = require('lspconfig')
local mason_lspconfig = require('mason-lspconfig')

-- Setup neodev for enhanced Lua development
require('neodev').setup {}

-- Define on_attach function for LSP keybindings and settings
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer-local keymappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Setup CMP capabilities for autocompletion
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure mason-lspconfig to manage LSP servers
mason_lspconfig.setup {
  -- List of servers to ensure are installed
  ensure_installed = {
    'pyright',    -- Python
    -- 'tsserver',   -- TypeScript/JavaScript
    'lua_ls',     -- Lua
    -- 'jdtls',      -- Java
    'bashls',     -- Bash
    'dockerls',   -- Dockerfile
    'jsonls',     -- JSON
    'terraformls', -- Terraform
    'gopls',      -- Go
    'elixirls',   -- Elixir
    -- 'erlangls',   -- Erlang
  },
  -- Handlers for automatic server setup
  handlers = {
    -- Default handler for most servers
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
    -- Custom handler for lua_ls
    ['lua_ls'] = function()
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }, -- Recognize vim global
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true), -- Include Neovim runtime
            },
            telemetry = { enable = false },
          },
        },
      }
    end,
    -- Custom handler for jdtls (Java)
    ['jdtls'] = function()
      lspconfig.jdtls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        -- Additional settings for nvim-java if needed
        settings = {
          java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
          },
        },
      }
    end,
  },
}
