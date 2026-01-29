return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Enable LSP servers
      vim.lsp.enable('ts_ls')         -- TypeScript/JavaScript
      vim.lsp.enable('pyright')       -- Python
      vim.lsp.enable('html')          -- HTML
      vim.lsp.enable('cssls')         -- CSS
      vim.lsp.enable('bashls')        -- Bash
      vim.lsp.enable('jsonls')        -- JSON
      vim.lsp.enable('rust_analyzer') -- Rust

      -- Optional: Customize specific servers
      vim.lsp.config('rust_analyzer', {
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = { command = 'clippy' },
          },
        },
      })

      -- Keybindings when LSP attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  }
