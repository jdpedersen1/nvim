return {
    { 'numToStr/Comment.nvim', opts = {} },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
}
