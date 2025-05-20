return {
    {
        'jdpedersen1/poimandres.nvim',
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            require('poimandres').setup {}
        end,
        init = function()
            vim.cmd("colorscheme poimandres")
            vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLine guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])
        end,
    },
    {
        'kdheepak/monochrome.nvim',
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function()
            vim.cmd 'colorscheme monochrome'
            vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLine guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])
        end,
    },
    {
        "stefanvanburen/rams",
        lazy = false,
        priority = 1000,
        enabled = false,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            vim.cmd([[colorscheme rams]])
            vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi SignColumn guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi VertSplit guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLine guibg=NONE ctermbg=NONE ]])
            vim.cmd([[ hi StatusLineNC guibg=NONE ctermbg=NONE ]])
        end,
    },
}
