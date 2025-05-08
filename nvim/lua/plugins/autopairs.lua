return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local npairs = require('nvim-autopairs')
      npairs.setup({
        check_ts = true, -- Habilita Treesitter para mejorar el emparejamiento
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = '<M-e>',
          chars = { '{', '[', '(', '"', "'" },
          pattern = string.gsub([[ [%'%)%>%]%)%}%,] ]], "%s+", ""),
          end_key = '$',
          keys = 'qwertyuiopzxcvbnmasdfghjkl',
          check_comma = true,
          highlight = 'Search',
          highlight_grey = 'Comment'
        },
      })
      -- Integración con nvim-cmp para autocompletar paréntesis y comillas
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
  }
}
