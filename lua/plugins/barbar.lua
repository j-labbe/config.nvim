return {
	'romgrk/barbar.nvim',
    lazy = false,
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.

    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    keys = {
	    { '<A-,>', '<Cmd>BufferPrevious<CR>', desc = 'Previous Tab', noremap = true },
	    { '<A-.>', '<Cmd>BufferNext<CR>', desc = 'Next Tab', noremap = true, silent = true },
	    { '<A-1>', '<Cmd>BufferGoto 1<CR>', desc = '1 Tab', noremap = true, silent = true },
	    { '<A-2>', '<Cmd>BufferGoto 2<CR>', desc = '2 Tab', noremap = true, silent = true },
	    { '<A-3>', '<Cmd>BufferGoto 3<CR>', desc = '3 Tab', noremap = true, silent = true },
	    { '<A-4>', '<Cmd>BufferGoto 4<CR>', desc = '4 Tab', noremap = true, silent = true },
	    { '<A-5>', '<Cmd>BufferGoto 5<CR>', desc = '5 Tab', noremap = true, silent = true },
	    { '<A-6>', '<Cmd>BufferGoto 6<CR>', desc = '6 Tab', noremap = true, silent = true },
	    { '<A-7>', '<Cmd>BufferGoto 7<CR>', desc = '7 Tab', noremap = true, silent = true },
	    { '<A-8>', '<Cmd>BufferGoto 8<CR>', desc = '8 Tab', noremap = true, silent = true },
	    { '<A-9>', '<Cmd>BufferGoto 9<CR>', desc = '9 Tab', noremap = true, silent = true }, 
	    { '<A-0>', '<Cmd>BufferLast<CR>', desc = 'Last Tab', noremap = true, silent = true },
	    { '<A-c<', '<Cmd>BufferClose<CR>', desc='Close Tab', noremap = true, silent = true },
    }
}
