return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "elixir",
                    "erlang",
                    "heex",
                    "eex",
                    "java",
                    "kotlin",
                    "jq",
                    "dockerfile",
                    "json",
                    "html",
                    "terraform",
                    "go",
                    "tsx",
                    "bash",
                    "ruby",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = "<C-CR>",
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },
}
