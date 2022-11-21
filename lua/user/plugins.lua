local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "windwp/nvim-autopairs"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  }
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use {
    "kyazdani42/nvim-tree.lua",
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  }
  use "akinsho/nvim-bufferline.lua"
  use { "akinsho/toggleterm.nvim", tag = "*" }
  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {}
    end,
  }
  use "goolord/alpha-nvim"
  use "folke/zen-mode.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
  use "unblevable/quick-scope"
  use {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup {}
    end,
  }

  -- Treesitter
  use "tree-sitter/tree-sitter"
  use "nvim-treesitter/nvim-treesitter"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use "windwp/nvim-ts-autotag"
  use "drybalka/tree-climber.nvim"
  use {
    "abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }, -- or require if not used so far
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-project.nvim"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "RRethy/vim-illuminate"
  use { "glepnir/lspsaga.nvim", branch = "main" }
  use "MunifTanjim/prettier.nvim"

  -- Completions
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  -- use "hrsh7th/cmp-cmdline"
  use "onsails/lspkind.nvim"
  use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

  -- Snipets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  -- DDC completion plugin
  -- use "vim-denops/denops.vim"
  -- use "Shougo/ddc.vim"
  -- use "Shougo/ddc-around"
  -- use "Shougo/ddc-nvim-lsp"
  -- use "Shougo/ddc-converter_remove_overlap"
  -- use "Shougo/pum.vim"
  -- use "LumaKernel/ddc-file"
  -- use "Shougo/ddc-matcher_head"
  -- use "Shougo/ddc-sorter_rank"
end)
