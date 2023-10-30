local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


plugins = {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-ts-autotag',
    { "EdenEast/nightfox.nvim" } -- lazy
    , {"mbbill/undotree"}
}

require("lazy").setup(plugins, opts)


vim.cmd("colorscheme nightfox")

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "cpp", "c", "typescript", "javascript", "python", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>", -- set to `false` to disable one of the mappings
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<c-b>",
    },
  },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.foldmethod='expr'
-- vim.opt.foldexpr='nvim_treesitter#foldexpr()' ---=require'nvim_treesitter'.foldexpr
--vim.opt.nofoldenable=true


vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.g.mapleader = ' '


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
