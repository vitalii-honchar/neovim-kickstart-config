return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap', -- (optional) only if you use `gopher.dap`
  },
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
  config = function(_, opts)
    require('gopher').setup(opts)

    local keys_opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>gj', '<cmd> GoTagAdd json <CR>', keys_opts)
  end,
  opts = {},
}
