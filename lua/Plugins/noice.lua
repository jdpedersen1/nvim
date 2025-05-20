return {
    {
        'folke/noice.nvim',
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = { enabled = false },
                signature = { enabled = false },
            },
        },
        dependencies = {
            'MunifTanjim/nui.nvim',
            {
                'rcarriga/nvim-notify',
                config = function()
                    require("notify").setup({
                        background_colour = "#000000",
                        fps = 30,
                        icons = {
                            DEBUG = "🛠",
                            ERROR = "💥",
                            INFO = "ℹ",
                            TRACE = "✎",
                            WARN = "⚠",
                        },
                        level = 2,
                        minimum_width = 50,
                        render = "default",
                        stages = "fade_in_slide_out",
                        timeout = 5000,
                        top_down = true,
                    })
                end,
            },
        },
    },
}
