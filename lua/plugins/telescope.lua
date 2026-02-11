return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<C-t>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Grep file contents" },
  },
  config = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules/.*",
          "%.lock",
          "package%-lock%.json",
          "yarn%.lock",
          "pnpm%-lock%.yaml",
          "%.min%.js",
          "%.min%.css",
          "%.map",
          "dist/.*",
          "build/.*",
          "%.git/.*",
        },
        previewer = true,
        preview = {
          treesitter = true,
        },
      },
    }
    require("telescope").load_extension("fzf")
  end,
}
