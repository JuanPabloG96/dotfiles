return {
    {
        "NvChad/nvim-colorizer.lua",

        config = function()
            require("colorizer").setup({
                user_default_options = {
                    tailwind = true,
                },
            })
        end,
    },

    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        lazy = true,
    },
}
