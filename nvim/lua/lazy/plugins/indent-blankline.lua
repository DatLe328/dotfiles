-- https://github.com/lukas-reineke/indent-blankline.nvim
-- This is for the line Indent Blankline
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "┊" },
	},
}
