-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    --@type snacks.Config
    opts = {},
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    config = function()
      require('typescript-tools').setup {
        settings = {
          expose_as_code_action = 'all',
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
        },
      }
    end,
  },
  {
    'https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git',
    -- Activate when a file is created/opened
    event = { 'BufReadPre', 'BufNewFile' },
    -- Activate when a supported filetype is open
    ft = { 'go', 'javascript', 'python', 'ruby', 'javascriptreact', 'typescript', 'typescriptreact', 'css' },
    cond = function()
      -- Only activate if token is present in environment variable.
      -- Remove this line to use the interactive workflow.
      return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ''
    end,
    opts = {
      statusline = {
        -- Hook into the built-in statusline to indicate the status
        -- of the GitLab Duo Code Suggestions integration
        enabled = true,
      },
      code_suggestions = {
        auto_filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css' },
        ghost_text = {
          enabled = true,
          toggle_enabled = '<C-h>',
          accept_suggestion = '<C-y>',
          clear_suggestion = '<C-k>',
          stream = true,
        },
      },
    },
    config = function()
      vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')
    end,
  },
}
