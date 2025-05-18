-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        -- your cmp config here
      }
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' }, -- make sure cmp is loaded first
    config = function()
      local npairs = require 'nvim-autopairs'
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'

      npairs.setup {}

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
