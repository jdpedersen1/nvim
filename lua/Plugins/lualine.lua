return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" },
        config = function()
            require("lualine").setup({
                icons_enabled = true,
                theme = 'onedark',
                sections = {
                    lualine_c = { 'filename' },
                    lualine_x = {
                        {
                            'diagnostics',
                            sources = { 'nvim_lsp' },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                            on_click = function()
                                vim.diagnostic.setloclist()
                            end,
                        },
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            --color = { fg = "#ff9e64" },
                        },
                    },
                },
            })
        end,
    },
}
