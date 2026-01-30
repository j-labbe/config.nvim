return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup {}

    -- Install missing parsers on startup (async)
    local wanted = { "javascript", "typescript", "python", "html", "css", "bash", "json", "rust", "lua" }
    local installed = ts.get_installed()
    local installed_set = {}
    for _, p in ipairs(installed) do installed_set[p] = true end

    local to_install = {}
    for _, p in ipairs(wanted) do
      if not installed_set[p] then
        table.insert(to_install, p)
      end
    end
    if #to_install > 0 then
      ts.install(to_install)
    end

    -- Enable treesitter highlighting for all buffers
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
