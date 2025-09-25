return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    {
      "nvim-telescope/telescope.nvim",
      branch = "main",
      dependencies = {
        "nvim-lua/plenary.nvim"
      }
    },
  },
  lazy = false,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>" },
  },

  config = function()
    require('venv-selector').setup{
      name = '.venv'
    }
  end,
}
