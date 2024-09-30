return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = 'mfussenegger/nvim-dap',

  config = function(_, opts)
    require('dap-go').setup(opts)

    function OpenDebuggingSidebar()
      local widgets = require 'dap.ui.widgets'
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end

    local keys_opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<F2>', '<cmd> DapToggleBreakpoint <CR>', keys_opts)
    vim.keymap.set('n', '<F5>', '<cmd> DapContinue <CR>', keys_opts)
    vim.keymap.set('n', '<S-F5>', '<cmd> DapTerminate <CR>', keys_opts)
    vim.keymap.set('n', '<F8>', OpenDebuggingSidebar, keys_opts)
  end,
}
