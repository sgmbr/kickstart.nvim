-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  -- Tried to make it closed by default but doesn't work so commented out until I figure it out
  -- Taken from https://github.com/wulymammoth/dotfiles/blob/5a1ae64e23c7585a7175dc9de9314e1cda4de654/nvim/.config/nvim/lua/plugins/neotree.lua
  -- init = function()
  --   vim.g.neotree = {
  --     auto_close = true,
  --     auto_open = false,
  --     auto_update = true,
  --     update_to_buf_dir = true,
  --   }
  -- end,
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
