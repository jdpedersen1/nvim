return {
    {
        'nvim-java/nvim-java',
        lazy = true,
        dependencies = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-refactor',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    },
                },
            },
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local lspconfig = require('lspconfig')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_nvim_lsp.default_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
                vim.keymap.set('n', '<leader>ld', require('telescope.builtin').diagnostics, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end

            require('java').setup()
            lspconfig.jdtls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end,
    },
}
