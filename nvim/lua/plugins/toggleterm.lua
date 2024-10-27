return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-j>]], -- Open terminal with Ctrl + j

            vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {})
		})
	end,
}
