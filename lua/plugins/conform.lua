return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "Format buffer",
    },
    {
      "<M-S-f>",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = { "n", "v", "i" },
      desc = "Format buffer (Alt+Shift+F)",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Lua
      lua = { "stylua" },

      -- JavaScript/TypeScript
      javascript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },

      -- Python
      python = { "ruff_format", "ruff_organize_imports" },

      -- Web
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },

      -- Data formats
      json = { "prettierd", "prettier", stop_after_first = true },
      jsonc = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },

      -- Shell
      bash = { "shfmt" },
      sh = { "shfmt" },
      zsh = { "shfmt" },

      -- Rust (use LSP formatter - rust-analyzer)
      rust = { "rustfmt", lsp_format = "fallback" },

      -- Fallback for any filetype
      ["_"] = { "trim_whitespace" },
    },

    -- Format on save
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },

    -- Notify on format errors
    notify_on_error = true,
  },
}
