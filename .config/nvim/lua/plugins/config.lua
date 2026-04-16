return {
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura" -- or "sioyek", "skim", etc.
      vim.g.vimtex_compiler_method = "latexmk"
    end,
  },
  { "folke/noice.nvim", enabled = false },
  { "EdenEast/nightfox.nvim" },
  { "rcarriga/nvim-notify", enabled = false },
  {
    "nvim-mini/mini.files",
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
    "nvim-mini/mini.surround",
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
      colorscheme = "duskfox",
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
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  { "ggandor/flit.nvim", enabled = false },
  {
    "stevearc/oil.nvim",
    keys = {
      {
        "<leader>o",
        function()
          require("oil").open()
        end,
        desc = "Open Oil",
      },
    },
    opts = {},
  },
  {
    "shrynx/line-numbers.nvim",
    opts = {},
  },
}
