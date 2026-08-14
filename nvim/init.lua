vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

-- Apply colorscheme and actual line number color
vim.cmd("colorscheme bluloco")
vim.cmd([[highlight CursorLineNr guifg=#ff5512 guibg=#0d0d0d gui=bold]])

-- Load aditional configuration
require("config.autocmds")
require("config.keymaps")
require("config.vim-options")
