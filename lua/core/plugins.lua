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

require("lazy").setup({
    { "sveltejs/language-tools" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'stevearc/oil.nvim' },
    { "kylechui/nvim-surround", event="VeryLazy" },
    { "epwalsh/obsidian.nvim" },
    {
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
    { "folke/zen-mode.nvim" },
    {
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "BufEnter" },
		config = function()
			-- Turn on LSP, formatting, and linting status and progress information
			require("fidget").setup({
				text = {
					spinner = "dots_negative",
				},
			})
		end,
	},
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "f-person/git-blame.nvim" },
    {
        'Wansmer/serenity.nvim',
        name = 'serenity',
        config = function()
            require('serenity').setup()
        end,
    },
    {
      'Wansmer/langmapper.nvim',
      lazy = false,
      priority = 1, -- High priority is needed if you will use `autoremap()`
      config = function()
        require('langmapper').setup({--[[ your config ]]})
      end,
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "L3MON4D3/LuaSnip" },

	{ "nvim-treesitter/nvim-treesitter" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "axelvc/template-string.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
	{
        "neovim/nvim-lspconfig",
        opt = {
            inlay_hints = { enabled = true },
        }
    },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "williamboman/mason.nvim", build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "numToStr/Comment.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
})
