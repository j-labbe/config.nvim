return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<C-t>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  },
  config = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = { "node_modules/.*" },
        previewer = true,
        preview = {
          treesitter = true,
        },
      },
    }
  end,
}
