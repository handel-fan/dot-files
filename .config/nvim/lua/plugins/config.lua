return {

  { "EdenEast/nightfox.nvim" },
  { "rcarriga/nvim-notify", enabled = false },
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
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ga",
        delete = "gzd", -- Delete surrounding
        find = "gff", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    enabled = true,
  },
  { "mfussenegger/nvim-dap-python", enabled = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
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
