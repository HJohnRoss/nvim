return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED
      harpoon:setup()

      local list = harpoon:list()

      -- Keybindings
      vim.keymap.set('n', '<leader>a', function()
        list:add()
      end, { desc = 'Add file to Harpoon' })

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(list)
      end, { desc = 'Toggle Harpoon quick menu' })

      vim.keymap.set('n', '<C-a>', function()
        list:select(1)
      end, { desc = 'Harpoon file 1' })
      vim.keymap.set('n', '<C-s>', function()
        list:select(2)
      end, { desc = 'Harpoon file 2' })
      vim.keymap.set('n', '<C-d>', function()
        list:select(3)
      end, { desc = 'Harpoon file 3' })
      vim.keymap.set('n', '<C-f>', function()
        list:select(4)
      end, { desc = 'Harpoon file 4' })

      vim.keymap.set('n', '<C-S-P>', function()
        list:prev()
      end, { desc = 'Harpoon previous file' })

      vim.keymap.set('n', '<C-S-N>', function()
        list:next()
      end, { desc = 'Harpoon next file' })
    end,
  },
}
