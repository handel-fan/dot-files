return {

  { "EdenEast/nightfox.nvim" },
  {
    "stevearc/oil.nvim",
    keys = {
      {
        "-",
        "<cmd>Oil<cr>",
        desc = "Open Oil",
      },
    },
  },
  { "rcarriga/nvim-notify", enabled = false },
  { "kylechui/nvim-surround", enabled = false },
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
  {
    "echasnovski/mini.files",
    enabled = true,
    keys = { { "<leader>e", "<cmd>lua MiniFiles.open()<cr>", desc = "Mini Files" } },
    opts = {
      options = {
        permanent_delete = false,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    keys = {
      { "<leader>e", false },
    },
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
  { "ggandor/flit.nvim", enabled = false },
  { "mfussenegger/nvim-dap-python", enabled = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
  {
    "folke/noice.nvim",
    enabled = true,
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
    enabled = true,
  },
}
