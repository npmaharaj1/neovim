return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua", "ast-grep" },
        python = { "isort", "black", "ast-grep" },
        java = { "ast-grep" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    })
  end
}
