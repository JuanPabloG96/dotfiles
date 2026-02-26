-----------------------------------------------------------
-- BASIC UI
-----------------------------------------------------------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Colors
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = false


-----------------------------------------------------------
-- SCROLL & VIEW
-----------------------------------------------------------

-- Keep cursor centered
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- No visual wrap
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false

-- Smooth updates
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300


-----------------------------------------------------------
-- INDENTATION & TABS
-----------------------------------------------------------

-- Spaces instead of tabs
vim.opt.expandtab = true

-- 2 spaces (puedes cambiar a 4 para C++)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Smart indent
vim.opt.autoindent = true
vim.opt.smartindent = true


-----------------------------------------------------------
-- LINE WIDTH (90% RULE)
-----------------------------------------------------------

-- Visual guide
vim.opt.colorcolumn = ""

-- Auto-adjust textwidth
local function set_textwidth_90()
  vim.opt.textwidth = math.floor(vim.o.columns * 0.9)
end

set_textwidth_90()

vim.api.nvim_create_autocmd("VimResized", {
  callback = set_textwidth_90,
})


-----------------------------------------------------------
-- SEARCH
-----------------------------------------------------------

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true


-----------------------------------------------------------
-- SPLITS & WINDOWS
-----------------------------------------------------------

-- Better split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Transparency support
vim.opt.winblend = 0
vim.opt.pumblend = 0


-----------------------------------------------------------
-- CLIPBOARD
-----------------------------------------------------------

-- System clipboard
vim.opt.clipboard = "unnamedplus"


-----------------------------------------------------------
-- PERFORMANCE
-----------------------------------------------------------

vim.opt.lazyredraw = false
vim.opt.synmaxcol = 240
vim.opt.redrawtime = 1500


-----------------------------------------------------------
-- FILES & BACKUP
-----------------------------------------------------------

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true


-----------------------------------------------------------
-- COMPLETION
-----------------------------------------------------------

vim.opt.completeopt = { "menu", "menuone", "noselect" }


-----------------------------------------------------------
-- MISC
-----------------------------------------------------------

-- Faster key sequences
vim.opt.ttimeoutlen = 10

-- Better command line
vim.opt.cmdheight = 1

-- Hide mode (Noice/Lualine handles it)
vim.opt.showmode = false
