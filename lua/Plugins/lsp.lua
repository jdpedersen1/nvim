return {
    {
        "williamboman/mason.nvim",
        lazy = true,
        config = function()
            require("mason").setup({
                ui = {
                    check_outdated_packages_on_open = false,
                    border = "rounded",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = true,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" }, -- Changed tsserver to ts_ls
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            local lspconfig = require('lspconfig')
            local cmp_nvim_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Configure diagnostics
            vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            -- Auto-show diagnostics on CursorHold
            vim.o.updatetime = 300
            vim.api.nvim_create_autocmd("CursorHold", {
                callback = function()
                    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
                end,
            })

            -- LSP keybindings
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

            -- Setup LSP servers
            lspconfig.ts_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
        end,
    },
    { 'folke/neodev.nvim', opts = {} },
}
