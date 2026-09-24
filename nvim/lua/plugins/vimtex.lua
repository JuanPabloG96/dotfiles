return {
    "lervag/vimtex",
    lazy = false,

    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"

        vim.g.vimtex_compiler_latexmk = {
            engine = "-xelatex",
            callback = 1,
            continuous = 1,
            options = {
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end,
}
