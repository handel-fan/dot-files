return {

  { "EdenEast/nightfox.nvim" },
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.surround", enabled = true },
  {
    "echasnovski/mini.files",
    enabled = true,
    keys = {
      { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini Files" },
    },
    opts = {
      options = {
        permanent_delete = false,
      },
    },
  },
  { "mfussenegger/nvim-dap-python", enabled = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "Carbonfox",
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier", stop_after_first = true },
        typescriptreact = { "prettier", stop_after_first = true },
      },
    },
  },
}
